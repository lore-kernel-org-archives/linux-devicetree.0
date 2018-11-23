From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 07/12] dt-bindings: PCI: aardvark: describe the clocks property
Date: Fri, 23 Nov 2018 15:18:26 +0100
Message-ID: <20181123141831.8214-8-miquel.raynal@bootlin.com>
References: <20181123141831.8214-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181123141831.8214-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Describe the missing gated clock feeding the PCIe IP.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/pci/aardvark-pci.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/aardvark-pci.txt b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
index 252934237138..c275c3e39cde 100644
--- a/Documentation/devicetree/bindings/pci/aardvark-pci.txt
+++ b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
@@ -12,6 +12,7 @@ contain the following properties:
  - #size-cells: set to <2>
  - device_type: set to "pci"
  - ranges: ranges for the PCI memory and I/O regions
+ - clocks: the clock feeding the IP
  - #interrupt-cells: set to <1>
  - msi-controller: indicates that the PCIe controller can itself
    handle MSI interrupts
@@ -41,6 +42,7 @@ Example:
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x00 0xff>;
+		clocks = <&sb_periph_clk 13>;
 		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <1>;
 		msi-controller;
-- 
2.19.1
