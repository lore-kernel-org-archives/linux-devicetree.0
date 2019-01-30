From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 0/3] SMSC USB333x ULPI USB PHY Support
Date: Wed, 30 Jan 2019 16:50:20 +0100
Message-ID: <20190130155023.4495-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the SMSC USB333x ULPI USB PHY.

The USB333x usually does not require particular configuration as it
implements generic registers described in the ULPI specification.

However, specific use cases require tweaking some bits. In our case,
VBUS is not connected to anything so the internal EXTVBUS signal has to
be routed to assert VbusValid. 

Paul Kocialkowski (3):
  dt-bindings: phy: Add bindings for the SMSC USB333x ULPI USB PHY
  phy: Add support for the SMSC USB333x ULPI USB PHY
  MAINTAINERS: Add entry for the SMSC USB333x ULPI USB PHY

 .../devicetree/bindings/phy/smsc-usb333x.txt  |  50 +++
 MAINTAINERS                                   |   6 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/smsc/Kconfig                      |  11 +
 drivers/phy/smsc/Makefile                     |   2 +
 drivers/phy/smsc/phy-usb333x.c                | 301 ++++++++++++++++++
 7 files changed, 372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/smsc-usb333x.txt
 create mode 100644 drivers/phy/smsc/Kconfig
 create mode 100644 drivers/phy/smsc/Makefile
 create mode 100644 drivers/phy/smsc/phy-usb333x.c

-- 
2.20.1
