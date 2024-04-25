vendor := $(srctree)/$(src)

ifneq "$(wildcard $(vendor)/xiaomi)" ""
	subdir-y += xiaomi
else ifneq "$(wildcard $(vendor)/qcom)" ""
	subdir-y += qcom
endif
