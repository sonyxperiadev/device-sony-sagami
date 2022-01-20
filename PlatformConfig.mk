# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
# Switch to Cortex-A77 when it becomes available!
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
# Switch to Cortex-A77 when it becomes available!
TARGET_2ND_CPU_VARIANT_RUNTIME := generic

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=1d84000.ufshc
BOARD_KERNEL_CMDLINE += swiotlb=2048
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += console=null

# Serial console
#BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0xa90000

TARGET_RECOVERY_WIPE := $(PLATFORM_COMMON_PATH)/rootdir/recovery.wipe
TARGET_RECOVERY_FSTAB ?= $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/fstab.sagami

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy_platform

# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_JOURNAL_SIZE := 0
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := 4096

# Also build product image
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_JOURNAL_SIZE := 0
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := 4096

# Build system_ext image
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

# This platform has a metadata partition: declare this
# to create a mount point for it
BOARD_USES_METADATA_PARTITION := true

BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH ?= external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM ?= SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

TARGET_NO_RECOVERY := true

# https://source.android.com/devices/bootloader/partitions/generic-boot#combinations, "Launch device without recovery partition":
BOARD_USES_RECOVERY_AS_BOOT :=
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# https://source.android.com/devices/bootloader/partitions/vendor-boot-partitions#build-support
# >= 3 is required for (and turns on) PRODUCT_BUILD_VENDOR_BOOT_IMAGE
BOARD_BOOT_HEADER_VERSION := 3
BOARD_RAMDISK_USE_LZ4 := true
# AOSP does not propagate the header version
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Build vendor_boot with `--dtb $(PRODUCT_OUT)/dtb.img` (generated from BOARD_PREBUILT_DTBIMAGE_DIR in KernelConfig.mk)
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# DTBO partition definitions
TARGET_NEEDS_DTBOIMAGE ?= true

include device/sony/common/CommonConfig.mk
