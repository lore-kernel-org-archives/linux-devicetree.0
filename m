From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 0/2] ZII RAVE platform driver
Date: Mon, 10 Jul 2017 10:04:47 -0700
Message-ID: <20170710170449.4544-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This patch series is a driver for supervisory processor found on RAVE
series of devices from ZII. Supervisory processor is a PIC
microcontroller connected to various electrical subsystems on RAVE
devices whose firmware implements protocol to command/qery them.

I originally submitted this driver to MFD sybsystemd[mfdv1], but it
was suggested I add this driver to platform tree instead.

I suspect "bindings/mfd" is not the right place for bindings
information, but I wasn't sure if I should create "bindings/platform"
or "bindings/rave" to place that file into, so I left things as they
originally were hoping to fix this in next version of the patchset.

NOTE:

 * The driver for "zii,rave-sp-watchdog" exists, but I haven't
   submitted it yet, becuase I wanted to make sure that API exposed by
   this MFD is acceptable and doesn't need drastic changes.

 * This driver is dependent on crc_ccitt_false() introduced in
   2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next'

Feedback is greatly appreciated!

Thanks,
Andrey Smirnov

[mfdv1] lkml.kernel.org/r/20170606180643.14258-1-andrew.smirnov@gmail.com

Andrey Smirnov (2):
  platform: Add driver for RAVE Supervisory Processor
  dt-bindings: mfd: Add bindings for ZII RAVE devices

 .../devicetree/bindings/mfd/zii,rave-sp.txt        |   40 +
 drivers/mfd/Makefile                               |    1 +
 drivers/platform/Kconfig                           |    2 +
 drivers/platform/Makefile                          |    1 +
 drivers/platform/rave/Kconfig                      |   26 +
 drivers/platform/rave/Makefile                     |    1 +
 drivers/platform/rave/rave-sp.c                    | 1083 ++++++++++++++++++++
 include/linux/rave-sp.h                            |   54 +
 8 files changed, 1208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
 create mode 100644 drivers/platform/rave/Kconfig
 create mode 100644 drivers/platform/rave/Makefile
 create mode 100644 drivers/platform/rave/rave-sp.c
 create mode 100644 include/linux/rave-sp.h

-- 
2.9.4
