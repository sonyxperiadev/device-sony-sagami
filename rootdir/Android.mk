LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := fstab.$(TARGET_DEVICE)
LOCAL_SRC_FILES := vendor/etc/fstab.sagami
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ramdisk-fstab.$(TARGET_DEVICE)
LOCAL_SRC_FILES := vendor/etc/fstab.sagami
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := fstab.$(TARGET_DEVICE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := init.sagami
LOCAL_SRC_FILES := vendor/etc/init/init.sagami.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := init.sagami.pwr
LOCAL_SRC_FILES := vendor/etc/init/init.sagami.pwr.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ueventd
LOCAL_SRC_FILES := vendor/ueventd.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)
include $(BUILD_PREBUILT)

ifeq ($(USE_SENSOR_MULTI_HAL),true)
include $(CLEAR_VARS)
LOCAL_MODULE := hals.conf
LOCAL_SRC_FILES := vendor/etc/sensors/hals.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/sensors
include $(BUILD_PREBUILT)
endif

include $(CLEAR_VARS)
LOCAL_MODULE := sns_reg_config
LOCAL_SRC_FILES := vendor/etc/sensors/sns_reg_config
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/sensors
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := model1.dat
LOCAL_SRC_FILES := vendor/etc/cvp/v2.0/facedetection/model1.dat
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/cvp/v2.0/facedetection/
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := model2.dat
LOCAL_SRC_FILES := vendor/etc/cvp/v2.1/facedetection/model2.dat
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/cvp/v2.1/facedetection/
include $(BUILD_PREBUILT)
