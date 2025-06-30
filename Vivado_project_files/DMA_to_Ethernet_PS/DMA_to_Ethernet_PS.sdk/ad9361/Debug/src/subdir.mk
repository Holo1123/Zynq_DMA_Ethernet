################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/ad9361.c \
../src/ad9361_api.c \
../src/ad9361_conv.c \
../src/main.c \
../src/platform.c \
../src/util.c 

OBJS += \
./src/ad9361.o \
./src/ad9361_api.o \
./src/ad9361_conv.o \
./src/main.o \
./src/platform.o \
./src/util.o 

C_DEPS += \
./src/ad9361.d \
./src/ad9361_api.d \
./src/ad9361_conv.d \
./src/main.d \
./src/platform.d \
./src/util.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../ad9361_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


