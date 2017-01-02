From: Anurup M <anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 00/10] perf: arm64: Support for Hisilicon SoC Hardware event counters
Date: Mon,  2 Jan 2017 01:47:52 -0500
Message-ID: <1483339672-23778-1-git-send-email-anurup.m@huawei.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Provide Support for Hisilicon SoC(HiP05/06/07) Hardware event counters.
The Hisilicon SoC HiP0x series has many uncore or non-CPU performance
events and counters units.

This patch series is implemented refering to arm-cci, Intel/AMD uncore and
also the cavium thunderX and xgene uncore pmu patches.
This v3 version has addressed the review comments of v1 and v2 versions.

Support for Hisilicon L3 cache(L3C) and Misclennaneous nodes(MN) hardware
events and counters are added in this implementation.

The Hisilicon uncore PMUs can be found under /sys/bus/event_source/devices.
The counters are exported via sysfs in the corresponding events files
under the PMU directory so the perf tool can list the event names.

ToDo:
1) The counter overflow handling is currently unsupported in this
   patch series.
2) ACPI support.

Version history
---------------
v3
--
- Fix review comments of v2 version.
- Handle event groups. Do not allow group of mixed PMUs.
- Use hip0x prefix in compatible names and hisi- prefix in
  added device properties.
- Fix all sparse and gcc W=1 warnings.

v2
--
- Fix review comments of v1 version.
- Move djtag driver to drivers/perf/hisilicon.
- Have separate PMU instance for each L3 cache banks.
- Modify device properties in DTS as per review comments.
- Handle hardware version difference.
- Change compatible names of djtag so use prefix hisi-
  and remove chip version as driver only depend on djtag
  hw version.
- use devm_kzalloc.
- Remove DDRC changes in this series. As the DDRC PMU doesnot
  depend on djtag it will be send separately.

v1
--
-Initial version with support for L3C, MN and DDRC event counters
-Djtag driver is used to access registers of L3 cache and MN.

Anurup M (7):
  arm64: MAINTAINERS: hisi: Add hisilicon SoC PMU support
  dt-bindings: perf: hisi: Add Devicetree bindings for Hisilicon SoC PMU
  Documentation: perf: hisi: Documentation for HiP05/06/07 PMU event
    counting.
  perf: hisi: Update Kconfig for Hisilicon PMU support
  perf: hisi: Add support for Hisilicon SoC event counters
  perf: hisi: Add sysfs attributes for L3 cache(L3C) PMU
  dts: arm64: hip06: Add Hisilicon SoC PMU support

Shaokun Zhang (1):
  perf: hisi: Miscellanous node(MN) event counting in perf

Tan Xiaojun (2):
  dt-bindings: hisi: Add Hisilicon HiP05/06/07 Djtag dts bindings
  drivers: perf: hisi: Add support for Hisilicon Djtag driver

 .../devicetree/bindings/arm/hisilicon/djtag.txt    |  66 ++
 .../devicetree/bindings/arm/hisilicon/pmu.txt      | 100 +++
 Documentation/perf/hisi-pmu.txt                    |  75 +++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |  72 ++
 drivers/perf/Kconfig                               |   8 +
 drivers/perf/Makefile                              |   1 +
 drivers/perf/hisilicon/Makefile                    |   1 +
 drivers/perf/hisilicon/djtag.c                     | 731 +++++++++++++++++++++
 drivers/perf/hisilicon/djtag.h                     |  39 ++
 drivers/perf/hisilicon/hisi_uncore_l3c.c           | 609 +++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_mn.c            | 501 ++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_pmu.c           | 365 ++++++++++
 drivers/perf/hisilicon/hisi_uncore_pmu.h           | 127 ++++
 14 files changed, 2704 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/djtag.txt
 create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/pmu.txt
 create mode 100644 Documentation/perf/hisi-pmu.txt
 create mode 100644 drivers/perf/hisilicon/Makefile
 create mode 100644 drivers/perf/hisilicon/djtag.c
 create mode 100644 drivers/perf/hisilicon/djtag.h
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_l3c.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_pmu.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_pmu.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
