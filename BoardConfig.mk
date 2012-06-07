# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

include vendor/lge/thunderc/BoardConfigVendor.mk

#Device Information
TARGET_ARCH := arm
TARGET_PROVIDES_INIT_TARGET_RC := true

#Platform
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

#CPU
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp

#Boot and Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := thunderc
TARGET_OTA_ASSERT_DEVICE := thunderc

#Camera
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
# This is needed by libcamera.so 
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true 

#Audio & Bluetooth
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_AUDIO_LEGACY := false
BOARD_COMBO_DEVICE_SUPPORTED := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

#FM Radio
BOARD_FM_DEVICE := bcm4325
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

#Wifi
BOARD_WPA_SUPPLICANT_DRIVER     := WEXT
BOARD_WLAN_DEVICE               := bcm4325
WPA_SUPPLICANT_VERSION          := VER_0_6_X
HOSTAPD_VERSION                 := VER_0_6_X
WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/wireless.ko"
WIFI_DRIVER_MODULE_ARG          := "firmware_path=/etc/wl/rtecdc.bin nvram_path=/etc/wl/nvram.txt config_path=/data/misc/wifi/config"
WIFI_DRIVER_MODULE_NAME         := wireless
WIFI_DRIVER_FW_STA_PATH         := "/system/etc/wl/rtecdc.bin"
WIFI_DRIVER_FW_AP_PATH          := "/system/etc/wl/rtecdc-apsta.bin"
WIFI_DRIVER_HAS_LGE_SOFTAP      := true
BOARD_WEXT_NO_COMBO_SCAN        := true

# Kernel
#TARGET_KERNEL_SOURCE := kernel/lge/thunderc
#TARGET_KERNEL_CONFIG := chaos_defconfig
TARGET_PREBUILT_KERNEL := device/lge/thunderc/kernels/BobZ/zImage
TARGET_SPECIFIC_HEADER_PATH := device/lge/thunderc/include
BOARD_KERNEL_CMDLINE := mem=471M console=ttyMSM2,115200n8 androidboot.hardware=thunderc
BOARD_KERNEL_BASE := 0x12200000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00700000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00700000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0a480000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0b2e0000
BOARD_FLASH_BLOCK_SIZE := 131072

#Qualcomm Related
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_CDMA_NETWORK := true

#GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := thunderc
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

#JIT
WITH_JIT := true
JS_ENGINE := v8
HTTP := chrome
ENABLE_JSC_JIT := true

#Enable OpenGL Hardware Acceleration
#msm7x27: no support for overlay, bypass, or c2d
BOARD_EGL_CFG := vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USE_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_GENLOCK := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

#TouchScreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

#Mass Storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_CUSTOM_USB_CONTROLLER := ../../vendor/lge/thunderc/proprietary/$(SUB_MODEL)/UsbController.cpp
BOARD_UMS_LUNFILE := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/vold/179:1
BOARD_SDEXT_DEVICE := /dev/block/vold/179:2

#ICS settings
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27 -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DMISSING_GRALLOC_BUFFERS -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DUSE_LGE_ALS_DUMMY

#Skia
BOARD_USE_SKIA_LCDTEXT := true

#Misc
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_CUSTOM_BRCM_PATCHRAM_PLUS := ../../../vendor/lge/thunderc/proprietary/$(SUB_MODEL)/brcm_patchram_plus.c

#OFFLINE CHARGING
BOARD_GLOBAL_CFLAGS += -DCHARGERMODE_CMDLINE_NAME='"lge.reboot"' -DCHARGERMODE_CMDLINE_VALUE='"pwroff"'
BOARD_USES_RECOVERY_CHARGEMODE := false
BOARD_CUSTOM_GRAPHICS := ../../../device/lge/thunderc/recovery/graphics.c

