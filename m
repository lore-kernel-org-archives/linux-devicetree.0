From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/6] MCPM backend for Exynos5420
Date: Sat, 26 Apr 2014 21:35:42 +0530
Message-ID: <1398528348-21214-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is v3 of the series adding MCPM backend support for SMP secondary boot
and core switching on Samsung's Exynos5420. The patches are based on the mcpm
support added for Exynos5420 in the Chromium kernel repository here:
https://chromium.googlesource.com/chromiumos/third_party/kernel-next/+/chromeos-3.8

This patchset depends on:
- ARM: EXYNOS: Map SYSRAM address through DT
(http://www.spinics.net/lists/arm-kernel/msg323011.html)

The patches have been prepared on linux-next(20140424) and tested on SMDK5420
EVT1 using the "/dev/b.L_switcher" user interface. Secondary core bring-up has
also been tested on an Exynos5420-based chromebook.

Changes since v2:
Addressed the following comments from Nicolas Pitre and Daniel Lezcano
	- Added generic common (cluster) configuration functions to pm.c
	  which may be used by other subsystems.
	- Removed unused "cpumask" variable in mcpm code.
	- Re-worked exynos_power_down_finish() referencing the tc2_pm code.
	- Removed the status checks in core and cluster power functions. We
	  just set the power control bit and do not check the previous state
	  anymore.
	- Removed incorrect jiffies timeout usage in path where IRQs are
	  disabled.

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

NOTE:
- Have added Leela Krishna's generic cpu power control function series
  as part of this patchset.
- There is no change in the patch "ARM: dts: exynos5420: add CCI node"
  and "arm: exynos: Add /dev/bL_status user interface on Exynos5420"
  from v2.
- I have tested with and without the erratum 799270 workaround and both
  work fine. I have kept the erratum fix for the time being.

Abhilash Kesavan (3):
  arm: exynos: Add generic cluster power control functions
  arm: exynos: Add MCPM call-back functions
  arm: exynos: Add /dev/bL_status user interface on Exynos5420

Andrew Bresticker (1):
  ARM: dts: exynos5420: add CCI node

Leela Krishna Amudala (2):
  ARM: EXYNOS: Add generic cpu power control functions for all exynos
    based SoCs
  ARM: EXYNOS: use generic exynos cpu power control functions

 arch/arm/boot/dts/exynos5420.dtsi  |  27 +++
 arch/arm/mach-exynos/Kconfig       |   8 +
 arch/arm/mach-exynos/Makefile      |   2 +
 arch/arm/mach-exynos/common.h      |   6 +
 arch/arm/mach-exynos/mcpm-exynos.c | 385 +++++++++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/platsmp.c     |   9 +-
 arch/arm/mach-exynos/pm.c          |  66 +++++++
 arch/arm/mach-exynos/regs-pmu.h    |  15 ++
 8 files changed, 512 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/mach-exynos/mcpm-exynos.c

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
