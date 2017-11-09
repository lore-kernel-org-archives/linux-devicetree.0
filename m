From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v12 0/5] ZII RAVE platform driver
Date: Thu,  9 Nov 2017 08:05:51 -0800
Message-ID: <20171109160556.17018-1-andrew.smirnov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This patch series is v12 of the driver for supervisory processor found
on RAVE series of devices from ZII. Supervisory processor is a PIC
microcontroller connected to various electrical subsystems on RAVE
devices whose firmware implements protocol to command/qery them.

NOTE:

 * This driver dependends on crc_ccitt_false(), added by
   2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next', the patch
   was pulled in by Andrew Morton and is currently avaiting users, so
   this series might have to go in through Andrew's tree

Changes since [v11]:

    - Fix incorrect include in rave-sp-wdt.c as uncoverd by kernel
      test robot

Changes since [v10]:

    - Collected Acked-by from Rob and Reviewed-by from Guenter

    - Incorporated watchdog driver feedback from Gunter and Johan

    - Incorporated Johan's feedback for the rest of the code

Changes since [v9]:

    - Converted watchdog driver to use watchdog_active() instead of
      watchdog_hw_running() and replaced WARN_ON with a regular error
      message as per feedback from Guenter

    - Changed rave_sp_wdt_start() to set WDOG_HW_RUNNING only if
      communicating with hardware was sucessful

    - Collected Reviewd-by from Sebastian (for serdev related patches)

    - Collected Acked-by from Rob (for watchdog DT bindings)

Changes since [v8]:

    - Driver moved from drivers/platform to drivers/mfd

    - Collected Reviewed-by from Guenter (for patches 1, 2 and 3)

    - Incorporated feedback from Guenter into watchdog driver

    - Incorporated feedback from Rob into watchdog DT bindings

    - Removed struct rave_sp_rsp_status, which was a leftover from v5
      -> v6 code removal.

    - Fixed minor problems reported by checkpatch

Changes since [v7]:

    - Added watchdog driver to the patchset, so it would be easier to
      understand how parent/children drivers are tied together

    - Added serdev patches to implement devm_serdev_device_open() and make .remove optional

    - "Added" missing serdev_device_close() by converting the driver
      to use devm_serdev_device_open()

    - Converted the driver to use devm_of_platform_populate()

    - Removed needless dependency on MFD_CORE

    - Removed dependency on SERIAL_DEV_CTRL_TTYPORT

Changes since [v6]:

    - Patch 2/2 has been applied by Lee so it is no longer a part of the series

    - Removed all sysfs and debugfs attribute to reduce the scope of
      the driver propsed for inclusion. This is not a critical to have
      feature and can be added/discussed later.

Changes since [v5]:

    - Fixed a build break, introduced by a last minute change in [v5]

    - Moved majority of attributes that were exposed over sysfs to debugfs

    - Document remaining sysfs attributes in Documentation/ABI/testing/sysfs-platform-rave-sp

Changes since [v4]:

    - Replaced usage of DEVICE_ATTR with DEVICE_ATTR_RW

    - Fixed a number of warnings produces by sparse tool

    - Incorporated event more feedback from Andy Shevchenko

    - Collected Reviewed-by from Andy

Changes since [v3]:

    - Re-collected lost Acked-by from Rob

    - Incorporated further feedback from Andy Shevchenko

    - Dropped useless change (stray newline) to drivers/mfd/Makefile

Changes since [v2]:

    - Fixed swapped command codes in rave_sp_common_get_boot_source()
      and rave_sp_common_set_boot_source() revealed by further testing
      of the code

    - Incorporated feedback from Andy Shevchenko

Changes since [v1]:

    - Updated wording in DT-bindings as per Rob's request.

    - Collected Rob's Acked-by for patch 2/2

Feedback is greatly appreciated!

Thanks,
Andrey Smirnov

[v11] lkml.kernel.org/r/20171106152935.16920-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v10] lkml.kernel.org/r/20171031163656.24552-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v9] lkml.kernel.org/r/20171025190421.18415-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v8] lkml.kernel.org/r/20171018170136.12347-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v7] lkml.kernel.org/r/20171013061321.31252-2-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v6] lkml.kernel.org/r/20170828163131.24815-2-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v5] lkml.kernel.org/r/20170728142704.11156-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v4] lkml.kernel.org/r/20170725184450.13171-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v3] lkml.kernel.org/r/20170724150915.4824-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v2] lkml.kernel.org/r/20170718175604.11735-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v1] lkml.kernel.org/r/20170710170449.4544-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

Andrey Smirnov (5):
  serdev: Make .remove in struct serdev_device_driver optional
  serdev: Introduce devm_serdev_device_open()
  mfd: Add driver for RAVE Supervisory Processor
  watchdog: Add RAVE SP watchdog driver
  dt-bindings: watchdog: Add bindings for RAVE SP watchdog driver

 .../bindings/watchdog/zii,rave-sp-wdt.txt          |  39 ++
 Documentation/driver-model/devres.txt              |   3 +
 drivers/mfd/Kconfig                                |   9 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/rave-sp.c                              | 660 +++++++++++++++++++++
 drivers/tty/serdev/core.c                          |  31 +-
 drivers/watchdog/Kconfig                           |   7 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/rave-sp-wdt.c                     | 357 +++++++++++
 include/linux/mfd/rave-sp.h                        |  56 ++
 include/linux/serdev.h                             |   1 +
 11 files changed, 1164 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
 create mode 100644 drivers/mfd/rave-sp.c
 create mode 100644 drivers/watchdog/rave-sp-wdt.c
 create mode 100644 include/linux/mfd/rave-sp.h

-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
