ARCHS = arm64
TARGET = appletv:clang
FINALPACKAGE = 1
SYSROOT = $(THEOS)/sdks/AppleTVOS12.4.sdk
THEOS_DEVICE_IP = 192.168.1.211
INSTALL_TARGET_PROCESSES = TVSystemMenuService 

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AppearanceSveaModule

AppearanceSveaModule_FILES = iKASveaDarkModeModule.mm
AppearanceSveaModule_INSTALL_PATH = /Library/TVSystemMenuModules
AppearanceSveaModule_FRAMEWORKS = UIKit
AppearanceSveaModule_PRIVATE_FRAMEWORKS = TVSystemMenuUI PineBoardServices
AppearanceSveaModule_CFLAGS = -fobjc-arc  -F. -I.
AppearanceSveaModule_LDFLAGS +=  -F. -I.

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/TVSystemMenuModules$(ECHO_END)
	
