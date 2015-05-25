From: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: [PATCH v3 0/6] Watchdog: introduce ARM SBSA watchdog driver
Date: Mon, 25 May 2015 18:03:07 +0800
Message-ID: <1432548193-19569-1-git-send-email-fu.wei@linaro.org>
References: <=fu.wei@linaro.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <=fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This patchset:
    (1)Introduce Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
    for FDT info of SBSA Generic Watchdog, and give two examples of
    adding SBSA Generic Watchdog device node into the dts files:
    foundation-v8.dts and amd-seattle-soc.dtsi.

    (2)Introduce "pretimeout" into the watchdog framework, and update
    Documentation/watchdog/watchdog-kernel-api.txt to introduce:
        (1)the new elements in the watchdog_device and watchdog_ops struct;
        (2)the new API "watchdog_init_timeouts".

    (3)Introduce ARM SBSA watchdog driver:
        a.Use linux kernel watchdog framework;
        b.Work with FDT on ARM64;
        c.Use "pretimeout" in watchdog framework;
        d.In first timeout, do panic to save system context;
        e.Support getting timeout and pretimeout from parameter and FDT
          at the driver init stage.

    (4)Parse SBSA Generic Watchdog Structure in GTDT table of ACPI,
    and create a platform device with that information.
    This platform device can be used by This Watchdog driver.

This patchset has been tested with watchdog daemon
(ACPI/FDT, module/build-in) on the following platforms:
    (1)ARM Foundation v8 model
    (2)AMD Seattle B0

Changelog:
v3: Delete "export arch_timer_get_rate" patch.
    Driver back to use arch_timer_get_cntfrq.
    Improve watchdog_init_timeouts function and update relevant documentation.
    Improve watchdog_timeout_invalid and watchdog_pretimeout_invalid.
    Improve foundation-v8.dts: delete the unnecessary tag of device node.
    Remove "ARM64 || COMPILE_TEST" from Kconfig.
    Add comments in arch/arm64/kernel/acpi.c
    Fix typoes and incorrect comments.

v2: Improve watchdog-kernel-api.txt documentation for pretimeout support.
    Export "arch_timer_get_rate" in arm_arch_timer.c.
    Add watchdog_init_timeouts API for pretimeout support in framework.
    Improve suspend and resume foundation in driver
    Improve timeout/pretimeout values init code in driver.
    Delete unnecessary items of the sbsa_gwdt struct and #define.
    Delete all unnecessary debug info in driver.
    Fix 64bit division bug.
    Use the arch_timer interface to get watchdog clock rate.
    Add MODULE_DEVICE_TABLE for platform device id.
    Fix typoes.

v1: The first version upstream patchset to linux mailing list.

Fu Wei (6):
  Documentation: add sbsa-gwdt.txt documentation
  ARM64: add SBSA Generic Watchdog device node in foundation-v8.dts
  ARM64: add SBSA Generic Watchdog device node in amd-seattle-soc.dtsi
  Watchdog: introdouce "pretimeout" into framework
  Watchdog: introduce ARM SBSA watchdog driver
  ACPI: import watchdog info of GTDT into platform device

 .../devicetree/bindings/watchdog/sbsa-gwdt.txt     |  36 ++
 Documentation/watchdog/watchdog-kernel-api.txt     |  47 +-
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi       |  11 +
 arch/arm64/boot/dts/arm/foundation-v8.dts          |  10 +
 arch/arm64/kernel/acpi.c                           | 145 +++++++
 drivers/watchdog/Kconfig                           |  11 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/sbsa_gwdt.c                       | 474 +++++++++++++++++++++
 drivers/watchdog/watchdog_core.c                   |  95 +++--
 drivers/watchdog/watchdog_dev.c                    |  50 +++
 include/linux/watchdog.h                           |  33 +-
 11 files changed, 880 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
 create mode 100644 drivers/watchdog/sbsa_gwdt.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
