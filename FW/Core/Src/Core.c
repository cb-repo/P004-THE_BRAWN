
#include "Core.h"
#include "GPIO.h"
#include "CLK.h"
#include "US.h"
#include "stm32l0xx_hal_cortex.h"

/*
 * PRIVATE DEFINITIONS
 */

#define _CORE_GET_RST_FLAGS()	(RCC->CSR)

#ifdef STM32L0
#define _PWR_REGULATOR_MASK		 (PWR_CR_PDDS | PWR_CR_LPSDSR)

#if   (CLK_SYSCLK_FREQ <=  4194304)
#define CORE_VOLTAGE_RANGE		PWR_REGULATOR_VOLTAGE_SCALE3 // 1V2 core
#elif (CLK_SYSCLK_FREQ <= 16000000)
#define CORE_VOLTAGE_RANGE		PWR_REGULATOR_VOLTAGE_SCALE2 // 1V5 core
#else
#define CORE_VOLTAGE_RANGE		PWR_REGULATOR_VOLTAGE_SCALE1 // 1V8 core
#endif

#endif
#ifdef STM32F0
#define _PWR_REGULATOR_MASK		 PWR_CR_LPDS
#endif

#define CORE_SYSTICK_FREQ	1000
#define MS_PER_SYSTICK		(1000 / CORE_SYSTICK_FREQ)

/*
 * PRIVATE TYPES
 */

/*
 * PRIVATE PROTOTYPES
 */

static void CORE_InitGPIO(void);
static void CORE_InitSysTick(void);

/*
 * PRIVATE VARIABLES
 */

#ifdef CORE_USE_TICK_IRQ
static VoidFunction_t gTickCallback;
#endif

volatile uint32_t gTicks = 0;

/*
 * PUBLIC FUNCTIONS
 */

void CORE_Init(void)
{
#if defined(STM32L0)
	__HAL_FLASH_PREREAD_BUFFER_ENABLE();

#elif defined(STM32F0)
	__HAL_FLASH_PREFETCH_BUFFER_ENABLE();
#endif
	__HAL_RCC_SYSCFG_CLK_ENABLE();
	__HAL_RCC_PWR_CLK_ENABLE();
#ifdef STM32L0
#ifndef USB_ENABLE
	// This seems to disrupt USB. Future investigation needed.
	SET_BIT(PWR->CR, PWR_CR_ULP | PWR_CR_FWU); // Enable Ultra low power mode & Fast wakeup
#endif
	__HAL_PWR_VOLTAGESCALING_CONFIG(CORE_VOLTAGE_RANGE);
#endif

	CLK_InitSYSCLK();
	CORE_InitSysTick();
	CORE_InitGPIO();
#ifdef	US_ENABLE
	US_Init();
#endif
}

void __attribute__ ((noinline)) CORE_Idle(void)
{
	// The push and pop of this function protects r0 from being clobbered during interrupt.
	// I do not understand why this is not preserved by the IRQ's push/pop.
	// If this function is inlined - then the usually pushed registers can get clobbered when returning from WFI.

	// As long as systick is on, this will at least return each millisecond.
	__WFI();
}


void CORE_Stop(void)
{
	// The tick may break the WFI if it occurs at the wrong time.
	HAL_SuspendTick();

	// Select the low power regulator
	MODIFY_REG(PWR->CR, _PWR_REGULATOR_MASK, PWR_LOWPOWERREGULATOR_ON);
	// WFI, but with the SLEEPDEEP bit set.
	SET_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP_Msk);
	__WFI();
	CLEAR_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP_Msk);
	MODIFY_REG(PWR->CR, _PWR_REGULATOR_MASK, PWR_MAINREGULATOR_ON);

	// SYSCLK is defaulted to HSI on boot
	CLK_InitSYSCLK();
	HAL_ResumeTick();
}

void CORE_Delay(uint32_t ms)
{
	ms += MS_PER_SYSTICK; // Add to guarantee a minimum delay
	uint32_t start = CORE_GetTick();
	while (CORE_GetTick() - start < ms)
	{
		CORE_Idle();
	}
}

void CORE_Reset(void)
{
	NVIC_SystemReset();
}

#ifdef CORE_USE_TICK_IRQ
void CORE_OnTick(VoidFunction_t callback)
{
	gTickCallback = callback;
}
#endif

CORE_ResetSource_t CORE_GetResetSource(void)
{
	uint32_t csr = _CORE_GET_RST_FLAGS();
	CORE_ResetSource_t src;
    if (csr & RCC_CSR_LPWRRSTF)
    {
    	src = CORE_ResetSource_Standby;
    }
    else if (csr & (RCC_CSR_WWDGRSTF | RCC_CSR_IWDGRSTF))
    {
    	// Join both watchdog sources together.
        src = CORE_ResetSource_Watchdog;
    }
    else if (csr & (RCC_CSR_SFTRSTF | RCC_CSR_OBLRSTF))
    {
    	// Joining Option byte load rst and software rst for now.
    	src = CORE_ResetSource_Software;
    }
    else if (csr & RCC_CSR_PORRSTF)
    {
    	src = CORE_ResetSource_PowerOn;
    }
    else if (csr & RCC_CSR_PINRSTF)
    {
    	src = CORE_ResetSource_Pin;
    }
    else
    {
        src = CORE_ResetSource_UNKNOWN;
    }
    // Flags will persist unless cleared
    __HAL_RCC_CLEAR_RESET_FLAGS();
    return src;
}

/*
 * PRIVATE FUNCTIONS
 */

void CORE_InitSysTick(void)
{
	HAL_SYSTICK_Config(CLK_GetHCLKFreq() / CORE_SYSTICK_FREQ);
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

void CORE_InitGPIO(void)
{
	__HAL_RCC_GPIOA_CLK_ENABLE();
#ifdef DEBUG
	// SWCLK and SWDIO on PA13, PA14
	GPIO_Deinit(GPIOA, GPIO_PIN_All & ~(GPIO_PIN_13 | GPIO_PIN_14));
#else
	GPIO_Deinit(GPIOA, GPIO_PIN_All);
#endif

	__HAL_RCC_GPIOB_CLK_ENABLE();
	GPIO_Deinit(GPIOB, GPIO_PIN_All);

	__HAL_RCC_GPIOC_CLK_ENABLE();
	GPIO_Deinit(GPIOC, GPIO_PIN_All);

#if defined(GPIOD)
	__HAL_RCC_GPIOD_CLK_ENABLE();
	GPIO_Deinit(GPIOD, GPIO_PIN_All);
#endif
}

/*
 * CALLBACK FUNCTIONS
 */

uint32_t HAL_GetTick(void)
{
	return gTicks;
}

/*
 * INTERRUPT ROUTINES
 */

void SysTick_Handler(void)
{
	gTicks += MS_PER_SYSTICK;

#ifdef CORE_USE_TICK_IRQ
	if (gTickCallback != NULL)
	{
		gTickCallback();
	}
#endif
}

