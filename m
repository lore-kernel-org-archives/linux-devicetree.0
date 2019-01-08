From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 11/15] dt-bindings: PCI: aardvark: Describe the reset-gpios property
Date: Tue,  8 Jan 2019 17:24:36 +0100
Message-ID: <20190108162441.5278-12-miquel.raynal@bootlin.com>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108162441.5278-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

A GPIO might be used to reset the PCI IP. Describe the property needed
in this case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/aardvark-pci.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/aardvark-pci.txt b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
index 8b7f048705ec..b47d6d608ae1 100644
--- a/Documentation/devicetree/bindings/pci/aardvark-pci.txt
+++ b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
@@ -27,6 +27,8 @@ The following are optional properties:
  - pinctrl-names: must be "default".
  - pinctrl-0: pin control group to be used to mux the PCIe endpoint card
    reset line so that it will be automatically driven by the PCIe IP.
+ - reset-gpios: GPIO to reset the device (alternative to the above
+   entries that represent a pin controlled by the PCI IP itself).
 
 In addition, the Device Tree describing an Aardvark PCIe controller
 must include a sub-node that describes the legacy interrupt controller
-- 
2.19.1
