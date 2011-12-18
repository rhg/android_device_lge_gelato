# Copyright (C) 2011 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#

# Camera
# PRODUCT_PACKAGES := \
#	Camera

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/lge/thunderc/device.mk)
$(call inherit-product, device/lge/thunderc/modules.mk)
$(call inherit-product, device/lge/thunderc/extract-files.sh
# Also get non-open-source files if available
$(call inherit-product-if-exists, vendor/lge/thunderc/device-vendor.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := thunderc
PRODUCT_DEVICE := thunderc
PRODUCT_BRAND := lge
PRODUCT_MODEL := VM670
