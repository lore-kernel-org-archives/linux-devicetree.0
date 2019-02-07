From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v2 1/6] dt-bindings: phy: Armada 38x common phy
 bindings
Date: Thu, 07 Feb 2019 16:19:05 +0000
Message-ID: <E1grmOH-0000Ly-IB@rmk-PC.armlinux.org.uk>
References: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add the Marvell Armada 38x common phy bindings.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../bindings/phy/phy-armada38x-comphy.txt          | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt b/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
new file mode 100644
index 000000000000..ad49e5c01334
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
@@ -0,0 +1,40 @@
+mvebu armada 38x comphy driver
+------------------------------
+
+This comphy controller can be found on Marvell Armada 38x. It provides a
+number of shared PHYs used by various interfaces (network, sata, usb,
+PCIe...).
+
+Required properties:
+
+- compatible: should be "marvell,armada-380-comphy"
+- reg: should contain the comphy register location and length.
+- #address-cells: should be 1.
+- #size-cells: should be 0.
+
+A sub-node is required for each comphy lane provided by the comphy.
+
+Required properties (child nodes):
+
+- reg: comphy lane number.
+- #phy-cells : from the generic phy bindings, must be 1. Defines the
+               input port to use for a given comphy lane.
+
+Example:
+
+	comphy: phy@18300 {
+		compatible = "marvell,armada-380-comphy";
+		reg = <0x18300 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpm_comphy0: phy@0 {
+			reg = <0>;
+			#phy-cells = <1>;
+		};
+
+		cpm_comphy1: phy@1 {
+			reg = <1>;
+			#phy-cells = <1>;
+		};
+	};
-- 
2.7.4
