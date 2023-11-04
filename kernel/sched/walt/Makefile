# SPDX-License-Identifier: GPL-2.0
obj-$(CONFIG_SCHED_WALT) += walt.o sched_avg.o qc_vas.o core_ctl.o trace.o
ifeq ($(CONFIG_SCHED_WALT_ORIG),y)
obj-$(CONFIG_SCHED_WALT) += boost.o
obj-$(CONFIG_CPU_FREQ) += cpu-boost.o
endif
