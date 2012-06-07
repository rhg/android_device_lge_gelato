# Release name
PRODUCT_RELEASE_NAME := OptimusSlider

TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)
$(call inherit-product, vendor/cm/config/cdma.mk)

#include qcom opensource features
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)

# Inherit device configuration
$(call inherit-product, device/lge/gelato/full_gelato.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := gelato
PRODUCT_NAME := cm_gelato
PRODUCT_BRAND := Virgin_Mobile
PRODUCT_MODEL := VM710
PROUDCT_MANUFACTURER := LGE
PRODUCT_CHARACTERISTICS := phone

RODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_ID=GWK74 \
	PRODUCT_NAME=${PRODUCT_MODEL} \
	BUILD_DISPLAY_ID="GWK74 $(shell date +%m%d%Y)" \
	BUILD_FINGERPRINT=google/soju/crespo:4.0.3/GWK74/185293:user/release-keys \
	PRIVATE_BUILD_DESC="soju-user 4.0.3 GWK74 185293 release-keys" \
	BUILD_NUMBER=${DATE}
	TARGET_BUILD_TYPE=user
