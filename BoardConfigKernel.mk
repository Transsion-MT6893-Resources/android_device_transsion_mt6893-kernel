#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

KERNEL_PATH := device/transsion/mt6893-kernel

# DTB
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/$(PRODUCT_DEVICE)/dtb

# DTBO
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/$(PRODUCT_DEVICE)/dtbo.img

# Kernel
TARGET_NO_KERNEL_OVERRIDE := true
LOCAL_KERNEL := $(KERNEL_PATH)/Image.gz
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

# Kernel modules
DLKM_MODULES_PATH := $(KERNEL_PATH)/$(PRODUCT_DEVICE)/modules/vendor_dlkm
RAMDISK_MODULES_PATH := $(KERNEL_PATH)/$(PRODUCT_DEVICE)/modules/vendor_ramdisk

BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(DLKM_MODULES_PATH)/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(patsubst %,$(DLKM_MODULES_PATH)/%,$(shell cat $(DLKM_MODULES_PATH)/modules.load))

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(RAMDISK_MODULES_PATH)/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(patsubst %,$(RAMDISK_MODULES_PATH)/%,$(shell cat $(RAMDISK_MODULES_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD  := $(patsubst %,$(RAMDISK_MODULES_PATH)/%,$(shell cat $(RAMDISK_MODULES_PATH)/modules.load.recovery))

# Workaround to make lineage's soong generator work
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers
