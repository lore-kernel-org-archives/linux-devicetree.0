From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/3] MCPM backend for Exynos5420
Date: Tue, 22 Apr 2014 11:46:29 +0530
Message-ID: <1398147389-2987-1-git-send-email-a.kesavan@samsung.com>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1397239311-27717-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is v2 of the series adding MCPM backend support for SMP secondary boot
and core switching on Samsung's Exynos5420. The patches are based on the mcpm
support added for Exynos5420 in the Chromium kernel repository here:
https://chromium.googlesource.com/chromiumos/third_party/kernel-next/+/chromeos-3.8

This patchset depends on:
- ARM: EXYNOS5: Add PMU settings for exynos5420
(https://patchwork.kernel.org/patch/3896471/)
- ARM: EXYNOS: Map SYSRAM address through DT
(http://www.spinics.net/lists/arm-kernel/msg323011.html)
- ARM: bL_switcher: fix validation check before its activation
(http://www.spinics.net/lists/arm-kernel/msg323274.html)

The patches have been prepared on Kgene's for-next branch and tested on SMDK5420
EVT1 using the "/dev/b.L_switcher" user interface. Patches have also been tested
on linux-next(20140417).

Changes since v1:
Addressed the following comments from Dave Martin and Nicolas Pitre:
	- Fixed help text for EXYNOS5420_MCPM symbol.
	- Removed mcpm-exynos-setup.S file and added similar code from tc2_pm.c.
	- Changed the spinlock name from "bl_lock" to "exynos_mcpm_lock".
	- Removed snoop enable/disable calls due to possible cpuidle issue and
	  not having numbers proving a significant power savings. Dropped the
	  "drivers/bus: arm-cci: Add common control interface for ACE ports"
	  patch from v1 as it was no longer needed.
	- Created a macro for exynos-specific v7_exit_coherency_flush which
	  handles an erratum. This was done to prevent duplication of code.
	- Removed "outer_flush_all" call.
	- Removed redundant dsb in power_down function.
	- Removed unnecessary initialization of global variables to zero.
	- Split the /dev/bL_status debug interface into another patch.
	- Fixed error handling in exynos_mcpm_init().
	- Called mcpm_smp_set_ops directly from exynos_mcpm_init().
	- Added a TODO for supporting cluster down on exynos5420.

There is no change in the patch " ARM: dts: exynos5420: add CCI node" from v1.

Abhilash Kesavan (2):
  arm: exynos: Add MCPM call-back functions
  arm: exynos: Add /dev/bL_status user interface on Exynos5420

Andrew Bresticker (1):
  ARM: dts: exynos5420: add CCI node

 arch/arm/boot/dts/exynos5420.dtsi  |   27 +++
 arch/arm/mach-exynos/Kconfig       |    8 +
 arch/arm/mach-exynos/Makefile      |    2 +
 arch/arm/mach-exynos/mcpm-exynos.c |  409 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h    |    2 +
 5 files changed, 448 insertions(+)
 create mode 100644 arch/arm/mach-exynos/mcpm-exynos.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
