From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3] ARM: dts: sun7i: Add BCM53125 switch nodes to the lamobo-r1 board
Date: Mon, 27 Jun 2016 17:45:56 -0700
Message-ID: <1467074756-8402-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Now that we have a proper binding for Ethernet switches hanging off
different buses, and a driver for the BCM53125 switch, add its Device
Tree as a child MDIO node, at MDIO address 30 (Broadcom pseudo-PHY
address) and describe the ports layout of the Lamobo R1 board.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts | 60 +++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
index 5ee43d8bf174..fbca93406e1b 100644
--- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
+++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
@@ -110,13 +110,67 @@
 &gmac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac_pins_rgmii_a>;
-	phy = <&phy1>;
 	phy-mode = "rgmii";
 	phy-supply = <&reg_gmac_3v3>;
 	status = "okay";
 
-	phy1: ethernet-phy@1 {
-		reg = <1>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		switch: ethernet-switch@1e {
+			compatible = "brcm,bcm53125";
+			reg = <30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port0: port@0 {
+					reg = <0>;
+					label = "lan2";
+				};
+
+				port1: port@1 {
+					reg = <1>;
+					label = "lan3";
+				};
+
+				port2: port@2 {
+					reg = <2>;
+					label = "lan4";
+				};
+
+				port3: port@3 {
+					reg = <3>;
+					label = "wan";
+				};
+
+				port4: port@4 {
+					reg = <4>;
+					label = "lan1";
+				};
+
+				port8: port@8 {
+					reg = <8>;
+					label = "cpu";
+					ethernet = <&gmac>;
+					phy-mode = "rgmii";
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+					};
+				};
+			};
+		};
 	};
 };
 
-- 
2.7.4
