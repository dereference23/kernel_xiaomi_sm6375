ifeq ($(CONFIG_BUILD_ARM64_DT_OVERLAY),y)
dtbo-$(CONFIG_ARCH_BLAIR) += veux-overlay.dtbo
veux-overlay.dtbo-base := veux.dtb
dtbo-$(CONFIG_ARCH_BLAIR) += peux-overlay.dtbo
peux-overlay.dtbo-base := peux.dtb
else
dtb-$(CONFIG_ARCH_BLAIR) += veux.dtb
dtb-$(CONFIG_ARCH_BLAIR) += peux.dtb
endif
