From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v6 0/2] ZII RAVE platform driver
Date: Mon, 28 Aug 2017 09:31:29 -0700
Message-ID: <20170828163131.24815-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cphealy@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This patch series is v6 of the driver for supervisory processor found
on RAVE series of devices from ZII. Supervisory processor is a PIC
microcontroller connected to various electrical subsystems on RAVE
devices whose firmware implements protocol to command/qery them.

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

NOTE:

 * The driver for "zii,rave-sp-watchdog" exists, but I haven't
   submitted it yet, becuase I wanted to make sure that API exposed by
   this MFD is acceptable and doesn't need drastic changes.

 * This driver is dependent on crc_ccitt_false() introduced in
   2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next'

Feedback is greatly appreciated!

Thanks,
Andrey Smirnov

[v5] lkml.kernel.org/r/20170728142704.11156-1-andrew.smirnov@gmail.com
[v4] lkml.kernel.org/r/20170725184450.13171-1-andrew.smirnov@gmail.com
[v3] lkml.kernel.org/r/20170724150915.4824-1-andrew.smirnov@gmail.com
[v2] lkml.kernel.org/r/20170718175604.11735-1-andrew.smirnov@gmail.com
[v1] lkml.kernel.org/r/20170710170449.4544-1-andrew.smirnov@gmail.com

Andrey Smirnov (2):
  platform: Add driver for RAVE Supervisory Processor
  dt-bindings: mfd: Add bindings for ZII RAVE devices

 Documentation/ABI/testing/sysfs-platform-rave-sp   |   35 +
 .../devicetree/bindings/mfd/zii,rave-sp.txt        |   39 +
 drivers/platform/Kconfig                           |    2 +
 drivers/platform/Makefile                          |    1 +
 drivers/platform/rave/Kconfig                      |   26 +
 drivers/platform/rave/Makefile                     |    1 +
 drivers/platform/rave/rave-sp.c                    | 1190 ++++++++++++++++++++
 include/linux/rave-sp.h                            |   54 +
 8 files changed, 1348 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-rave-sp
 create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
 create mode 100644 drivers/platform/rave/Kconfig
 create mode 100644 drivers/platform/rave/Makefile
 create mode 100644 drivers/platform/rave/rave-sp.c
 create mode 100644 include/linux/rave-sp.h

-- 
2.13.5
