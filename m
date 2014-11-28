From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/7] ARM: hisi: enable HiP01 SoC
Date: Fri, 28 Nov 2014 02:15:43 +0000
Message-ID: <1417140950-67103-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, obh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series patch enable Hisilicon HiP01 SoC. The HiP01 SoC series
chip is designed for networking product, it integrates a rich peripheral
interfaces to support network applications and supports both one 
core or dual cores and quad cores. The core is Cortex A9. 

Wang Long (7):
  ARM: debug: add HiP01 debug uart
  ARM: hisi: enable HiP01 SoC
  ARM: dts: Add hip01-ca9x2 dts file
  ARM: config: enable ARCH_HIP01
  ARM: hisi: add a common smp_prepares_cpus function
  ARM: hisi: rename secondary_startup function
  ARM: hisi: enable smp for HiP01

 .../bindings/arm/hisilicon/hisilicon.txt           |  25 +++++
 arch/arm/Kconfig.debug                             |  10 ++
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/hip01-ca9x2.dts                  |  52 ++++++++++
 arch/arm/boot/dts/hip01.dtsi                       | 110 +++++++++++++++++++++
 arch/arm/configs/hisi_defconfig                    |   1 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 arch/arm/mach-hisi/Kconfig                         |   8 ++
 arch/arm/mach-hisi/core.h                          |   5 +-
 arch/arm/mach-hisi/headsmp.S                       |   2 +-
 arch/arm/mach-hisi/hisilicon.c                     |  10 ++
 arch/arm/mach-hisi/hotplug.c                       |  31 ++++++
 arch/arm/mach-hisi/platsmp.c                       |  56 ++++++++++-
 13 files changed, 307 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/hip01-ca9x2.dts
 create mode 100644 arch/arm/boot/dts/hip01.dtsi

-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
