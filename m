From: Anurup M <anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RESEND PATCH v1 00/11] perf: arm64: Support for Hisilicon SoC Hardware event counters
Date: Thu,  3 Nov 2016 01:41:56 -0400
Message-ID: <1478151727-20250-1-git-send-email-anurup.m@huawei.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

[Resending after adding maintainers in --to]

Provide Support for Hisilicon SoC(Hip05/06/07) Hardware event counters.
The Hisilicon SoC Hip0x series has many uncore or non-CPU performance
events and counters units.

This initial patch series is implemented refering to arm-cci, Intel/AMD uncore and
also the cavium thunderX and xgene uncore pmu patches.

Support for Hisilicon L3 cache(L3C), MN and DDR hardware events and
counters are added in this implementation.

The Hisilicon uncore PMUs can be found under /sys/bus/event_source/devices.
The counters are exported via sysfs in the corresponding events files
under the PMU directory so the perf tool can list the event names.

ToDo:
	1) The counter overflow handling is currently unsupported in this
	   patch series.
	2) ACPI support.

Anurup M (8):
  arm64: MAINTAINERS: hisi: Add hisilicon SoC PMU support
  Documentation: perf: hisi: Documentation for HIP05/06/07 PMU event
    counting.
  dt-bindings: perf: hisi: Add Devicetree bindings for Hisilicon SoC PMU
  perf: hisi: Update Kconfig for Hisilicon PMU support
  perf: hisi: Add support for Hisilicon SoC event counters
  perf: hisi: Add sysfs attributes for L3 cache(L3C) PMU
  perf: hisi: Support for Hisilicon DDRC PMU.
  dts: arm64: hip06: Add Hisilicon SoC PMU support

Shaokun Zhang (1):
  perf: hisi: Miscellanous node(MN) event counting in perf

Tan Xiaojun (2):
  dt-bindings: hisi: Add Hisilicon HiP05/06/07 Sysctrl and Djtag dts
    bindings
  drivers: soc: hisi: Add support for Hisilicon Djtag driver

 .../bindings/arm/hisilicon/hisilicon.txt           |  82 +++
 .../devicetree/bindings/arm/hisilicon/pmu.txt      | 127 ++++
 Documentation/perf/hisi-pmu.txt                    |  80 +++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           | 116 ++++
 drivers/perf/Kconfig                               |   9 +
 drivers/perf/Makefile                              |   1 +
 drivers/perf/hisilicon/Makefile                    |   1 +
 drivers/perf/hisilicon/hisi_uncore_ddrc.c          | 444 ++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_ddrc.h          |  73 +++
 drivers/perf/hisilicon/hisi_uncore_l3c.c           | 628 ++++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_l3c.h           |  67 +++
 drivers/perf/hisilicon/hisi_uncore_mn.c            | 571 ++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_mn.h            |  68 +++
 drivers/perf/hisilicon/hisi_uncore_pmu.c           | 371 ++++++++++++
 drivers/perf/hisilicon/hisi_uncore_pmu.h           | 130 +++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/hisilicon/Kconfig                      |  12 +
 drivers/soc/hisilicon/Makefile                     |   1 +
 drivers/soc/hisilicon/djtag.c                      | 639 +++++++++++++++++++++
 include/linux/soc/hisilicon/djtag.h                |  38 ++
 22 files changed, 3470 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/pmu.txt
 create mode 100644 Documentation/perf/hisi-pmu.txt
 create mode 100644 drivers/perf/hisilicon/Makefile
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_ddrc.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_ddrc.h
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_l3c.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_l3c.h
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn.h
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_pmu.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_pmu.h
 create mode 100644 drivers/soc/hisilicon/Kconfig
 create mode 100644 drivers/soc/hisilicon/Makefile
 create mode 100644 drivers/soc/hisilicon/djtag.c
 create mode 100644 include/linux/soc/hisilicon/djtag.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
