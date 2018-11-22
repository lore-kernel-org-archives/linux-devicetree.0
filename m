From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/6] Add Armada 3700 COMPHY support
Date: Thu, 22 Nov 2018 22:04:14 +0100
Message-ID: <20181122210420.14861-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>
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


Miquel Raynal (6):
  phy: enumerate SATA PHY mode
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
 include/linux/phy/phy.h                       |   1 +
 7 files changed, 377 insertions(+), 13 deletions(-)
 create mode 100644 drivers/phy/marvell/phy-mvebu-a3700-comphy.c

-- 
2.19.1
