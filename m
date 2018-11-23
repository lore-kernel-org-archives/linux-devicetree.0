From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/12] Bring suspend to RAM support to PCIe Aardvark driver
Date: Fri, 23 Nov 2018 15:18:19 +0100
Message-ID: <20181123141831.8214-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hello,

As part of an effort to bring suspend to RAM support to Armada 3700
SoCs (main target: ESPRESSObin), this series handles the work around
the PCIe IP.

First, more configuration is done in the 'setup' helper as inspired
from the U-Boot driver. This is needed to entirely initialize the IP
during future resume operation (patch 1).

Then, reset GPIO, PHY and clock support are introduced (patch 2-4). As
current device trees do not provide the corresponding properties, not
finding one of these properties is not an error and just produces a
warning. However, if the property is present, an error during PHY
initialization will fail the probe of the driver.

Note: To be sure the clock will be resumed before this driver, a first
series adding links between clocks and consumers has been submitted,
see [1].

Patch 5 adds suspend/resume hooks, re-using all the above.

Finally, bindings and device trees are updated to reflect the hardware
(patch 6-12). While the clock depends on the SoC, the reset GPIO and
the PHY depends on the board so the clock is added in the
armada-37xx.dtsi file while the two other properties are added in
armada-3720-espressobin.dts.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2018-November/614527.html

Thanks,
Miquèl


Miquel Raynal (12):
  PCI: aardvark: configure more registers in the configuration helper
  PCI: aardvark: add reset GPIO support
  PCI: aardvark: add PHY support
  PCI: aardvark: add clock support
  PCI: aardvark: add suspend to RAM support
  dt-bindings: PCI: aardvark: describe the reset-gpios property
  dt-bindings: PCI: aardvark: describe the clocks property
  dt-bindings: PCI: aardvark: describe the PHY property
  ARM64: dts: marvell: armada-37xx: declare PCIe reset pin
  ARM64: dts: marvell: armada-3720-espressobin: declare PCIe reset GPIO
  ARM64: dts: marvell: armada-37xx: declare PCIe clock
  ARM64: dts: marvell: armada-3720-espressobin: declare PCIe PHY

 .../devicetree/bindings/pci/aardvark-pci.txt  |   9 +
 .../dts/marvell/armada-3720-espressobin.dts   |   4 +
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |   5 +
 drivers/pci/controller/pci-aardvark.c         | 214 ++++++++++++++++++
 4 files changed, 232 insertions(+)

-- 
2.19.1
