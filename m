From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 0/2] reset: Add Broadcom STB SW_INIT reset controller driver
Date: Tue, 15 Jan 2019 10:44:04 -0800
Message-ID: <20190115184406.3164-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

This patch series adds support for the Broadcom STB reset controller
using SW_INIT-style registers which have one or more banks of 32
reset lines and separate CLEAR/SET/STATUS registers.

Thanks!

Changes in v2:

- utilize SW_INIT_BIT() in status callback
- removed unused members of private structure
- confirmed maximum reset duration with designers
- renamed binding to brcm,brcmstb-reset.txt


Florian Fainelli (2):
  dt-bindings: reset: Add document for Broadcom STB reset controller
  reset: Add Broadcom STB SW_INIT reset controller driver

 .../bindings/reset/brcm,brcmstb-reset.txt     |  27 ++++
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-brcmstb.c                 | 130 ++++++++++++++++++
 4 files changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,brcmstb-reset.txt
 create mode 100644 drivers/reset/reset-brcmstb.c

-- 
2.17.1
