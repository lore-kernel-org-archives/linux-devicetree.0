From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 0/2] ZII RAVE platform driver
Date: Tue, 18 Jul 2017 10:56:02 -0700
Message-ID: <20170718175604.11735-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This patch series is v2 of the driver for supervisory processor found
on RAVE series of devices from ZII. Supervisory processor is a PIC
microcontroller connected to various electrical subsystems on RAVE
devices whose firmware implements protocol to command/qery them.

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

[v1] lkml.kernel.org/r/r/20170710170449.4544-1-andrew.smirnov@gmail.com


Andrey Smirnov (2):
  platform: Add driver for RAVE Supervisory Processor
  dt-bindings: mfd: Add bindings for ZII RAVE devices

 .../devicetree/bindings/mfd/zii,rave-sp.txt        |   39 +
 drivers/mfd/Makefile                               |    1 +
 drivers/platform/Kconfig                           |    2 +
 drivers/platform/Makefile                          |    1 +
 drivers/platform/rave/Kconfig                      |   26 +
 drivers/platform/rave/Makefile                     |    1 +
 drivers/platform/rave/rave-sp.c                    | 1083 ++++++++++++++++++++
 include/linux/rave-sp.h                            |   54 +
 8 files changed, 1207 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
 create mode 100644 drivers/platform/rave/Kconfig
 create mode 100644 drivers/platform/rave/Makefile
 create mode 100644 drivers/platform/rave/rave-sp.c
 create mode 100644 include/linux/rave-sp.h

-- 
2.13.3
