PRODUCT_AAPT_CONFIG := normal mdpi 
PRODUCT_AAPT_PREF_CONFIG := mdpi 

# XXX
SUB_MODEL := LGL55C
ifeq ($(SUB_MODEL),LGL55C)
	BT_FIRMWARE = BCM4330B1_002.001.003.0221.0269.hcd
endif

# XXX: should be full_base_telephony?
$(call inherit-product, build/target/product/full_base_telephony.mk)

$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)
$(call inherit-product-if-exists, vendor/lge/gelato/gelato-vendor.mk)

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Use dalvik parameters for a 512 MB device
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

#PRODUCT_INSTALL_PACKAGE := vendor/google/gapps

DEVICE_PACKAGE_OVERLAYS += device/lge/gelato/overlay

# XXX: this is non-standard
LOCAL_KERNEL_DIR := device/lge/gelato/kernels/rhg135/$(SUB_MODEL)
LOCAL_KERNEL_MODULES := librasdioif.ko tun.ko wireless.ko cifs.ko
	

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL_DIR)/zImage:kernel

PRODUCT_COPY_FILES += \
    $(foreach f,$(LOCAL_KERNEL_MODULES),$(LOCAL_KERNEL_DIR)/$(f):system/lib/modules/$(f)) \
    

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/init.qcom.sh:root/init.qcom.sh \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/init.gelato.rc:root/init.gelato.rc \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/initlogo.rle:root/initlogo.rle \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/ueventd.gelato.rc:root/ueventd.gelato.rc \

# BT startup
PRODUCT_COPY_FILES += vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# Keylayouts
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/usr/keylayout/gelato_keypad.kl:system/usr/keylayout/gelato_keypad.kl \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/usr/keychars/gelato_keypad.kcm.bin:system/usr/keychars/gelato_keypad.kcm.bin

# configs
#PRODUCT_COPY_FILES += vendor/lge/gelato/proprietary/$(SUB_MODEL)/media_profiles.xml:system/etc/media_profiles.xml 
PRODUCT_COPY_FILES += vendor/lge/gelato/proprietary/$(SUB_MODEL)/default.prop:root/default.prop 
#PRODUCT_COPY_FILES += vendor/lge/gelato/proprietary/$(SUB_MODEL)/adreno_config.txt:system/etc/adreno_config.txt 	

# Drew's init stuff
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/08dalvik:system/etc/init.d/08dalvik \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/87calibration:system/etc/init.d/87calibration \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/95zipalign:system/etc/init.d/95zipalign \
#    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.d/96tweak:system/etc/init.d/96tweak \

#PRODUCT_COPY_FILES += \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/profile:system/etc/profile \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/spn-conf.xml:system/etc/spn-conf.xml \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/init.gelato.usb.rc:system/etc/init.thunderc.usb.rc \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/init.d/05mountext:system/etc/init.d/05mountext \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd \

#WIFI
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/dhcpcd:system/bin/dhcpcd
    
# OFFLINE CHARGING
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/bootimages/opening_01.rle:root/bootimages/opening_01.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_notenough.rle:root/chargerimages/battery_notenough.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/sbin/bootlogo:root/sbin/bootlogo \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/sbin/chargerlogo:root/sbin/chargerlogo \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/sbin/ftm_power:root/sbin/ftm_power \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/bootimages/opening_02.rle:root/bootimages/opening_02.rle \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/bootimages/opening_03.rle:root/bootimages/opening_03.rle \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/bootimages/opening_04.rle:root/bootimages/opening_04.rle \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/bootimages/opening_05.rle:root/bootimages/opening_05.rle \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/bootimages/opening_06.rle:root/bootimages/opening_06.rle \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/bootimages/opening_07.rle:root/bootimages/opening_07.rle \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/bootimages/opening_08.rle:root/bootimages/opening_08.rle \

# Offmode charging
RODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/rmt_storage/rmt_storage:root/sbin/rmt_storage
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Backlight
#PRODUCT_COPY_FILES += \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/tsdown:system/bin/tsdown \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/ami306d:system/bin/ami306d \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/hw/sensors.lge_gelato.so:system/lib/hw/sensors.lge_gelato.so
    
# 3D
#Use qcom's ICS libs
PRODUCT_COPY_FILES += \
    vendor/qcom/binary/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    vendor/qcom/binary/system/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    vendor/qcom/binary/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/qcom/binary/system/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    vendor/qcom/binary/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/qcom/binary/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/qcom/binary/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/qcom/binary/system/lib/libC2D2.so:system/lib/libC2D2.so \
    vendor/qcom/binary/system/lib/libOpenVG.so:system/lib/libOpenVG.so \
    vendor/qcom/binary/system/lib/libgsl.so:system/lib/libgsl.so \
    vendor/qcom/binary/system/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    vendor/qcom/binary/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/qcom/binary/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 
    
# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libcamera.so:obj/lib/libcamera.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libcamera.so:system/lib/libcamera.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libmmjpeg.so:obj/lib/libmmjpeg.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liboemcamera.so:obj/lib/liboemcamera.so
    
# Wifi
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/wl:system/bin/wl \
    

# SD Card
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libaudioeq.so:system/lib/libaudioeq.so
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
	
# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/port-bridge:system/bin/port-bridge \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/qmuxd:system/bin/qmuxd \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/rmt_storage:system/bin/rmt_storage \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/wiperiface:system/bin/wiperiface \

# Unknown (needed or not?)
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/cnd:system/bin/cnd \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/e2fsck:system/bin/e2fsck

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=160 \
    persist.sys.use_16bpp_alpha

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/bin/rild:system/bin/rild \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libidl.so:system/lib/libidl.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libnv.so:obj/lib/libnv.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liboncrpc.so:obj/lib/liboncrpc.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libril.so:system/lib/libril.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libril.so:obj/lib/libril.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libwmsts.so:system/lib/libwmsts.so
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libdll.so:system/lib/libdll.so \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liblgdrm.so:system/lib/liblgdrm.so \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/liblgeat.so:system/lib/liblgeat.so \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxEvrcHwDec.so:system/lib/libOmxEvrcHwDec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxOn2Dec.so:system/lib/libOmxOn2Dec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxQcelpHwDec.so:system/lib/libOmxQcelpHwDec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/etc/firmware/$(BT_FIRMWARE):system/etc/firmware/$(BT_FIRMWARE)
    
# IDC file
#PRODUCT_COPY_FILES += \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/usr/idc/touch_mcs6000.idc:system/usr/idc/touch_mcs6000.idc\
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Apps
#PRODUCT_COPY_FILES += \
#    vendor/lge/gelato/proprietary/$(SUB_MODEL)/system/apps/LauncherPro.apk:system/app/LauncherPro.apk

CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)
