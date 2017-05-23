# $Id$

# define the processor, linker file and project name
PROCESSOR = 18f4620
LKR_FILE  = $(MIOS_PATH)/etc/lkr/p$(PROCESSOR).lkr
PROJECT   = project

# list of objects that should be created and linked
OBJS = mios_wrapper.o app_lcd.o main.o midi.o lfo.o eg.o map.o aout.o bankstick.o

# include pathes (more will be added by .mk files)
GPASM_INCLUDE =
SDCC_INCLUDE  =

# optional defines that should be passed to GPASM/SDCC
GPASM_DEFINES = -DDEBUG_MODE=0
SDCC_DEFINES  = -DDEBUG_MODE=0

# pass parameters to MIOS wrapper
MIOS_WRAPPER_DEFINES = -DSTACK_HEAD=0x37f -DSTACK_IRQ_HEAD=0x33f

# directories and files that should be part of the distribution (release) package
# more will be added by *.mk files
DIST = ./


# include the common.mk file
include $(MIOS_PATH)/include/makefile/common.mk

# include application specific driver (select app_lcd/dummy if MIOS internal driver used)
include $(MIOS_PATH)/modules/app_lcd/dummy/app_lcd.mk

# include AOUT driver
# interface types: MBHP_AOUT=1, MBHP_AOUT_LC=2, MBHP_AOUT_NG=3
AOUT_DEFINES += -DAOUT_INTERFACE_TYPE=1
include $(MIOS_PATH)/modules/aout/aout.mk
