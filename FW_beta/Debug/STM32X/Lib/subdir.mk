################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../STM32X/Lib/ADC.c \
../STM32X/Lib/CAN.c \
../STM32X/Lib/CLK.c \
../STM32X/Lib/COMP.c \
../STM32X/Lib/Core.c \
../STM32X/Lib/EEPROM.c \
../STM32X/Lib/FLASH.c \
../STM32X/Lib/GPIO.c \
../STM32X/Lib/TIM.c \
../STM32X/Lib/UART.c \
../STM32X/Lib/US.c \
../STM32X/Lib/USB.c 

OBJS += \
./STM32X/Lib/ADC.o \
./STM32X/Lib/CAN.o \
./STM32X/Lib/CLK.o \
./STM32X/Lib/COMP.o \
./STM32X/Lib/Core.o \
./STM32X/Lib/EEPROM.o \
./STM32X/Lib/FLASH.o \
./STM32X/Lib/GPIO.o \
./STM32X/Lib/TIM.o \
./STM32X/Lib/UART.o \
./STM32X/Lib/US.o \
./STM32X/Lib/USB.o 

C_DEPS += \
./STM32X/Lib/ADC.d \
./STM32X/Lib/CAN.d \
./STM32X/Lib/CLK.d \
./STM32X/Lib/COMP.d \
./STM32X/Lib/Core.d \
./STM32X/Lib/EEPROM.d \
./STM32X/Lib/FLASH.d \
./STM32X/Lib/GPIO.d \
./STM32X/Lib/TIM.d \
./STM32X/Lib/UART.d \
./STM32X/Lib/US.d \
./STM32X/Lib/USB.d 


# Each subdirectory must supply rules for building sources it contributes
STM32X/Lib/ADC.o: ../STM32X/Lib/ADC.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/ADC.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/CAN.o: ../STM32X/Lib/CAN.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/CAN.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/CLK.o: ../STM32X/Lib/CLK.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/CLK.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/COMP.o: ../STM32X/Lib/COMP.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/COMP.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/Core.o: ../STM32X/Lib/Core.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/Core.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/EEPROM.o: ../STM32X/Lib/EEPROM.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/EEPROM.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/FLASH.o: ../STM32X/Lib/FLASH.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/FLASH.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/GPIO.o: ../STM32X/Lib/GPIO.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/GPIO.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/TIM.o: ../STM32X/Lib/TIM.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/TIM.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/UART.o: ../STM32X/Lib/UART.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/UART.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/US.o: ../STM32X/Lib/US.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/US.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
STM32X/Lib/USB.o: ../STM32X/Lib/USB.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L010x4 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../STM32X/Lib -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"STM32X/Lib/USB.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

