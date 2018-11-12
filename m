From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [RFC PATCH 1/6] dt-bindings: phy: Armada 38x common phy bindings
Date: Mon, 12 Nov 2018 12:30:47 +0000
Message-ID: <E1gMBMd-00089D-2Q@rmk-PC.armlinux.org.uk>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181112122933.GD30658@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
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
