From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 10/15] dt-bindings: PCI: aardvark: Describe the PCIe endpoint card reset pins
Date: Tue,  8 Jan 2019 17:24:35 +0100
Message-ID: <20190108162441.5278-11-miquel.raynal@bootlin.com>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

A line might be used by the PCIe IP to reset the endpoint card upon:
  - platform reset,
  - hot reset,
  - link failure.

Describe the properties needed in this case (optional).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/pci/aardvark-pci.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/aardvark-pci.txt b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
index a440f182ccf8..8b7f048705ec 100644
--- a/Documentation/devicetree/bindings/pci/aardvark-pci.txt
+++ b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
@@ -24,6 +24,9 @@ contain the following properties:
 The following are optional properties:
 
  - phys: the PCIe PHY handle
+ - pinctrl-names: must be "default".
+ - pinctrl-0: pin control group to be used to mux the PCIe endpoint card
+   reset line so that it will be automatically driven by the PCIe IP.
 
 In addition, the Device Tree describing an Aardvark PCIe controller
 must include a sub-node that describes the legacy interrupt controller
@@ -55,6 +58,8 @@ Example:
 				<0 0 0 3 &pcie_intc 2>,
 				<0 0 0 4 &pcie_intc 3>;
 		phys = <&comphy1 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_card_reset_pins &pcie_clkreq_pins>;
 		pcie_intc: interrupt-controller {
 			interrupt-controller;
 			#interrupt-cells = <1>;
-- 
2.19.1
