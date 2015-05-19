#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-PIC24FJ64GB004_PIM.mk)" "nbproject/Makefile-local-PIC24FJ64GB004_PIM.mk"
include nbproject/Makefile-local-PIC24FJ64GB004_PIM.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=PIC24FJ64GB004_PIM
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/mplab.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/mplab.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/exp16/pic24fj64gb004_pim/system.c ../src/app_host_hid_keyboard.c ../src/main.c ../src/usb_config.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/adc.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/buttons.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/lcd.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/leds.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/timer_1ms.c ../../../../../../framework/usb/src/usb_hal_pic24.c ../../../../../../framework/usb/src/usb_host.c ../../../../../../framework/usb/src/usb_host_hid.c ../../../../../../framework/usb/src/usb_host_hid_parser.c ../../../../../../framework/fileio/src/fileio.c ../../../../../../framework/driver/fileio/src/sd_spi.c ../../../../../../framework/driver/spi/src/drv_spi_16bit.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/621193660/system.o ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/usb_config.o ${OBJECTDIR}/_ext/17349277/adc.o ${OBJECTDIR}/_ext/17349277/buttons.o ${OBJECTDIR}/_ext/17349277/lcd.o ${OBJECTDIR}/_ext/17349277/leds.o ${OBJECTDIR}/_ext/17349277/timer_1ms.o ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o ${OBJECTDIR}/_ext/838585624/usb_host.o ${OBJECTDIR}/_ext/838585624/usb_host_hid.o ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o ${OBJECTDIR}/_ext/1706142600/fileio.o ${OBJECTDIR}/_ext/691844211/sd_spi.o ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/621193660/system.o.d ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/usb_config.o.d ${OBJECTDIR}/_ext/17349277/adc.o.d ${OBJECTDIR}/_ext/17349277/buttons.o.d ${OBJECTDIR}/_ext/17349277/lcd.o.d ${OBJECTDIR}/_ext/17349277/leds.o.d ${OBJECTDIR}/_ext/17349277/timer_1ms.o.d ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o.d ${OBJECTDIR}/_ext/838585624/usb_host.o.d ${OBJECTDIR}/_ext/838585624/usb_host_hid.o.d ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o.d ${OBJECTDIR}/_ext/1706142600/fileio.o.d ${OBJECTDIR}/_ext/691844211/sd_spi.o.d ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/621193660/system.o ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/usb_config.o ${OBJECTDIR}/_ext/17349277/adc.o ${OBJECTDIR}/_ext/17349277/buttons.o ${OBJECTDIR}/_ext/17349277/lcd.o ${OBJECTDIR}/_ext/17349277/leds.o ${OBJECTDIR}/_ext/17349277/timer_1ms.o ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o ${OBJECTDIR}/_ext/838585624/usb_host.o ${OBJECTDIR}/_ext/838585624/usb_host_hid.o ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o ${OBJECTDIR}/_ext/1706142600/fileio.o ${OBJECTDIR}/_ext/691844211/sd_spi.o ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o

# Source Files
SOURCEFILES=../src/system_config/exp16/pic24fj64gb004_pim/system.c ../src/app_host_hid_keyboard.c ../src/main.c ../src/usb_config.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/adc.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/buttons.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/lcd.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/leds.c ../../../../../../bsp/exp16/pic24fj64gb004_pim/timer_1ms.c ../../../../../../framework/usb/src/usb_hal_pic24.c ../../../../../../framework/usb/src/usb_host.c ../../../../../../framework/usb/src/usb_host_hid.c ../../../../../../framework/usb/src/usb_host_hid_parser.c ../../../../../../framework/fileio/src/fileio.c ../../../../../../framework/driver/fileio/src/sd_spi.c ../../../../../../framework/driver/spi/src/drv_spi_16bit.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-PIC24FJ64GB004_PIM.mk dist/${CND_CONF}/${IMAGE_TYPE}/mplab.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/621193660/system.o: ../src/system_config/exp16/pic24fj64gb004_pim/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/621193660" 
	@${RM} ${OBJECTDIR}/_ext/621193660/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/621193660/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/system_config/exp16/pic24fj64gb004_pim/system.c  -o ${OBJECTDIR}/_ext/621193660/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/621193660/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/621193660/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o: ../src/app_host_hid_keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/main.c  -o ${OBJECTDIR}/_ext/1360937237/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/usb_config.o: ../src/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/usb_config.c  -o ${OBJECTDIR}/_ext/1360937237/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/usb_config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/adc.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/adc.c  -o ${OBJECTDIR}/_ext/17349277/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/buttons.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/buttons.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/buttons.c  -o ${OBJECTDIR}/_ext/17349277/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/buttons.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/buttons.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/lcd.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/lcd.c  -o ${OBJECTDIR}/_ext/17349277/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/lcd.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/lcd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/leds.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/leds.c  -o ${OBJECTDIR}/_ext/17349277/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/leds.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/leds.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/timer_1ms.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/timer_1ms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/timer_1ms.c  -o ${OBJECTDIR}/_ext/17349277/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/timer_1ms.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/timer_1ms.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o: ../../../../../../framework/usb/src/usb_hal_pic24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_hal_pic24.c  -o ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_host.o: ../../../../../../framework/usb/src/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_host.c  -o ${OBJECTDIR}/_ext/838585624/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_host.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_host_hid.o: ../../../../../../framework/usb/src/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_host_hid.c  -o ${OBJECTDIR}/_ext/838585624/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_host_hid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_host_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o: ../../../../../../framework/usb/src/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1706142600/fileio.o: ../../../../../../framework/fileio/src/fileio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1706142600" 
	@${RM} ${OBJECTDIR}/_ext/1706142600/fileio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706142600/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/fileio/src/fileio.c  -o ${OBJECTDIR}/_ext/1706142600/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1706142600/fileio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/1706142600/fileio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/691844211/sd_spi.o: ../../../../../../framework/driver/fileio/src/sd_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/691844211" 
	@${RM} ${OBJECTDIR}/_ext/691844211/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/691844211/sd_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/driver/fileio/src/sd_spi.c  -o ${OBJECTDIR}/_ext/691844211/sd_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/691844211/sd_spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/691844211/sd_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o: ../../../../../../framework/driver/spi/src/drv_spi_16bit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/368788181" 
	@${RM} ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o.d 
	@${RM} ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/driver/spi/src/drv_spi_16bit.c  -o ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/621193660/system.o: ../src/system_config/exp16/pic24fj64gb004_pim/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/621193660" 
	@${RM} ${OBJECTDIR}/_ext/621193660/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/621193660/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/system_config/exp16/pic24fj64gb004_pim/system.c  -o ${OBJECTDIR}/_ext/621193660/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/621193660/system.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/621193660/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o: ../src/app_host_hid_keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app_host_hid_keyboard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/main.c  -o ${OBJECTDIR}/_ext/1360937237/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/usb_config.o: ../src/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/usb_config.c  -o ${OBJECTDIR}/_ext/1360937237/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/usb_config.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/adc.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/adc.c  -o ${OBJECTDIR}/_ext/17349277/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/adc.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/buttons.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/buttons.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/buttons.c  -o ${OBJECTDIR}/_ext/17349277/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/buttons.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/buttons.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/lcd.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/lcd.c  -o ${OBJECTDIR}/_ext/17349277/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/lcd.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/lcd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/leds.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/leds.c  -o ${OBJECTDIR}/_ext/17349277/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/leds.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/leds.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/17349277/timer_1ms.o: ../../../../../../bsp/exp16/pic24fj64gb004_pim/timer_1ms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/17349277" 
	@${RM} ${OBJECTDIR}/_ext/17349277/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/_ext/17349277/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb004_pim/timer_1ms.c  -o ${OBJECTDIR}/_ext/17349277/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/17349277/timer_1ms.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/17349277/timer_1ms.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o: ../../../../../../framework/usb/src/usb_hal_pic24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_hal_pic24.c  -o ${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_hal_pic24.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_host.o: ../../../../../../framework/usb/src/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_host.c  -o ${OBJECTDIR}/_ext/838585624/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_host.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_host_hid.o: ../../../../../../framework/usb/src/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_host_hid.c  -o ${OBJECTDIR}/_ext/838585624/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_host_hid.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_host_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o: ../../../../../../framework/usb/src/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_host_hid_parser.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1706142600/fileio.o: ../../../../../../framework/fileio/src/fileio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1706142600" 
	@${RM} ${OBJECTDIR}/_ext/1706142600/fileio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706142600/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/fileio/src/fileio.c  -o ${OBJECTDIR}/_ext/1706142600/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1706142600/fileio.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/1706142600/fileio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/691844211/sd_spi.o: ../../../../../../framework/driver/fileio/src/sd_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/691844211" 
	@${RM} ${OBJECTDIR}/_ext/691844211/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/691844211/sd_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/driver/fileio/src/sd_spi.c  -o ${OBJECTDIR}/_ext/691844211/sd_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/691844211/sd_spi.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/691844211/sd_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o: ../../../../../../framework/driver/spi/src/drv_spi_16bit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/368788181" 
	@${RM} ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o.d 
	@${RM} ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/driver/spi/src/drv_spi_16bit.c  -o ${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o.d"        -g -omf=elf -fno-short-double -O1 -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb004_pim" -I"../src/system_config/exp16/pic24fj64gb004_pim" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/_ext/368788181/drv_spi_16bit.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/mplab.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/mplab.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="map.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/mplab.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/mplab.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="map.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/mplab.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/PIC24FJ64GB004_PIM
	${RM} -r dist/PIC24FJ64GB004_PIM

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
