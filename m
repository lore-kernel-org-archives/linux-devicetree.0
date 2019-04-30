Return-Path: <SRS0=HRCn=TA=renesas.com=prvs=40235708d9=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 6/7] ARM: dts: r7s9210-rza2mevb: Add Ethernet support
Date: Tue, 30 Apr 2019 08:23:08 -0500
Message-ID: <20190430132309.12473-7-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The RZ/A2M EVB sub board has 2 Ethernet jacks on it.

Set switch SW6_4	to ON to use Ethernet Ch-0
Set switch SW6_5	to ON to use Ethernet Ch-1

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 42005acb848c..df69746244fe 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -62,6 +62,34 @@
 		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
 			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
 	};
+
+	eth0_pins: eth0 {
+		pinmux = <RZA2_PINMUX(PORTE, 0, 7)>, /* REF50CK0 */
+			 <RZA2_PINMUX(PORT6, 1, 7)>, /* RMMI0_TXDEN */
+			 <RZA2_PINMUX(PORT6, 2, 7)>, /* RMII0_TXD0 */
+			 <RZA2_PINMUX(PORT6, 3, 7)>, /* RMII0_TXD1 */
+			 <RZA2_PINMUX(PORTE, 4, 7)>, /* RMII0_CRSDV */
+			 <RZA2_PINMUX(PORTE, 1, 7)>, /* RMII0_RXD0 */
+			 <RZA2_PINMUX(PORTE, 2, 7)>, /* RMII0_RXD1 */
+			 <RZA2_PINMUX(PORTE, 3, 7)>, /* RMII0_RXER */
+			 <RZA2_PINMUX(PORTE, 5, 1)>, /* ET0_MDC */
+			 <RZA2_PINMUX(PORTE, 6, 1)>, /* ET0_MDIO */
+			 <RZA2_PINMUX(PORTL, 0, 5)>; /* IRQ4 */
+	};
+
+	eth1_pins: eth1 {
+		pinmux = <RZA2_PINMUX(PORTK, 3, 7)>, /* REF50CK1 */
+			 <RZA2_PINMUX(PORTK, 0, 7)>, /* RMMI1_TXDEN */
+			 <RZA2_PINMUX(PORTK, 1, 7)>, /* RMII1_TXD0 */
+			 <RZA2_PINMUX(PORTK, 2, 7)>, /* RMII1_TXD1 */
+			 <RZA2_PINMUX(PORT3, 2, 7)>, /* RMII1_CRSDV */
+			 <RZA2_PINMUX(PORTK, 4, 7)>, /* RMII1_RXD0 */
+			 <RZA2_PINMUX(PORT3, 5, 7)>, /* RMII1_RXD1 */
+			 <RZA2_PINMUX(PORT3, 1, 7)>, /* RMII1_RXER */
+			 <RZA2_PINMUX(PORT3, 3, 1)>, /* ET1_MDC */
+			 <RZA2_PINMUX(PORT3, 4, 1)>, /* ET1_MDIO */
+			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
+	};
 };
 
 /* High resolution System tick timers */
@@ -80,3 +108,25 @@
 
 	status = "okay";
 };
+
+&ether0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth0_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&ether1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth1_pins>;
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@1 {
+		reg = <0>;
+	};
+};
-- 
2.16.1
