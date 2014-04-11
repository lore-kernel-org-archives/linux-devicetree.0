From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/5] MCPM backend for Exynos5420
Date: Fri, 11 Apr 2014 23:31:46 +0530
Message-ID: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds the MCPM backend support for SMP secondary boot and core
switching on Samsung's Exynos5420. The patches are based on the mcpm
support added for Exynos5420 in the Chromium kernel repository here:
https://chromium.googlesource.com/chromiumos/third_party/kernel-next/+/chromeos-3.8

This patchset depends on:
ARM: EXYNOS5: Add PMU settings for exynos5420
(https://patchwork.kernel.org/patch/3896471/)

The patches have been prepared on Kgene's for-next branch and tested on
SMDK5420 EVT1 using the "/dev/b.L_switcher" user interface.

Abhilash Kesavan (2):
  ARM: EXYNOS5420: Add IO mapping for non-secure SYSRAM
  arm: exynos: Add MCPM call-back functions

Andrew Bresticker (3):
  ARM: bL_switcher: Don't enable bL switcher on systems without CCI
  drivers/bus: arm-cci: Add common control interface for ACE ports
  ARM: dts: exynos5420: add CCI node

 arch/arm/boot/dts/exynos5420.dtsi        |   27 ++
 arch/arm/common/bL_switcher.c            |   12 +
 arch/arm/mach-exynos/Kconfig             |    9 +
 arch/arm/mach-exynos/Makefile            |    2 +
 arch/arm/mach-exynos/common.h            |    1 +
 arch/arm/mach-exynos/exynos.c            |   12 +
 arch/arm/mach-exynos/include/mach/map.h  |    1 +
 arch/arm/mach-exynos/mcpm-exynos-setup.S |   35 +++
 arch/arm/mach-exynos/mcpm-exynos.c       |  444 ++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/platsmp.c           |   19 ++
 arch/arm/mach-exynos/regs-pmu.h          |    2 +
 drivers/bus/arm-cci.c                    |   13 +-
 include/linux/arm-cci.h                  |    7 +-
 13 files changed, 576 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/mach-exynos/mcpm-exynos-setup.S
 create mode 100644 arch/arm/mach-exynos/mcpm-exynos.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
