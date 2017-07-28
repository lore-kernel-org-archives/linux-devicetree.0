From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/2] ZII RAVE platform driver
Date: Fri, 28 Jul 2017 07:27:02 -0700
Message-ID: <20170728142704.11156-1-andrew.smirnov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Greg,

I am not sure if you are the right person to send these to, if you are
not, please let me know who would be the appropriate recepient and sorry for the noise.

Thanks!


The orginal conver letter text follows:

Hi everyone,

This patch series is v4 of the driver for supervisory processor found
on RAVE series of devices from ZII. Supervisory processor is a PIC
microcontroller connected to various electrical subsystems on RAVE
devices whose firmware implements protocol to command/qery them.

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

[v4] lkml.kernel.org/r/20170725184450.13171-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v3] lkml.kernel.org/r/20170724150915.4824-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v2] lkml.kernel.org/r/20170718175604.11735-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
[v1] lkml.kernel.org/r/20170710170449.4544-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Andrey Smirnov (2):
  platform: Add driver for RAVE Supervisory Processor
  dt-bindings: mfd: Add bindings for ZII RAVE devices

 .../devicetree/bindings/mfd/zii,rave-sp.txt        |   39 +
 drivers/platform/Kconfig                           |    2 +
 drivers/platform/Makefile                          |    1 +
 drivers/platform/rave/Kconfig                      |   26 +
 drivers/platform/rave/Makefile                     |    1 +
 drivers/platform/rave/rave-sp.c                    | 1127 ++++++++++++++++++++
 include/linux/rave-sp.h                            |   54 +
 7 files changed, 1250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
 create mode 100644 drivers/platform/rave/Kconfig
 create mode 100644 drivers/platform/rave/Makefile
 create mode 100644 drivers/platform/rave/rave-sp.c
 create mode 100644 include/linux/rave-sp.h

-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
