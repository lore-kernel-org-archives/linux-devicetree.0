From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/8] Add Armada 3700 COMPHY support
Date: Fri, 30 Nov 2018 15:47:35 +0100
Message-ID: <20181130144743.675-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds a new driver to support Armada 3700 COMPHY IP.
The series has been tested on an ESPRESSObin with SATA, PCIe
and USB3 host. For this purpose, patch 1 enumerates the SATA PHY
mode. The SGMII PHY mode that is supported by the IP has been written
(uses SMC calls anyway) but could not be tested on this platform.

Three series will follow to add PHY support (or at least a PHY nodes
in the A3700/ESPRESSObin device trees) to the MVEBU AHCI driver, the
Aardvark PCI controller driver and the MVEBU xHCI driver. All this is
needed in order to achieve suspend to RAM on this platform.

Thanks,
Miquèl


Changes since v1:
=================
* Fix wrong check in ->xlate().
* Apply the same fix to the cp110 comphy driver from which the a3700
  driver is based.
* Added credit to Gregorz Jaszczyk for his work.
* Added Suggested-by tag to the patch adding the COMPHY DT node.


Grzegorz Jaszczyk (1):
  phy: enumerate SATA PHY mode

Miquel Raynal (7):
  phy: mvebu-cp110-comphy: fix spelling in structure name
  phy: mvebu-cp110-comphy: fix port check in ->xlate()
  phy: add A3700 COMPHY support
  dt-bindings: phy: mvebu-comphy: extend the file to describe a3700
    bindings
  MAINTAINERS: phy: add entry for Armada 3700 COMPHY driver
  ARM64: dts: marvell: armada-37xx: fix SATA node scope
  ARM64: dts: marvell: armada-37xx: declare the COMPHY node

 .../bindings/phy/phy-mvebu-comphy.txt         |  65 ++++-
 MAINTAINERS                                   |   6 +
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |  31 +-
 drivers/phy/marvell/Kconfig                   |  10 +
 drivers/phy/marvell/Makefile                  |   1 +
 drivers/phy/marvell/phy-mvebu-a3700-comphy.c  | 276 ++++++++++++++++++
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c  |   8 +-
 include/linux/phy/phy.h                       |   1 +
 8 files changed, 381 insertions(+), 17 deletions(-)
 create mode 100644 drivers/phy/marvell/phy-mvebu-a3700-comphy.c

-- 
2.19.1
