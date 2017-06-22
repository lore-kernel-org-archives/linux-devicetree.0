From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v6 8/8] arm: dts: genmai: Add ethernet pin group
Date: Thu, 22 Jun 2017 16:54:36 +0200
Message-ID: <1498143276-7976-9-git-send-email-jacopo+renesas@jmondi.org>
References: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, aisheng.dong@nxp.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pin configuration subnode for ETHER ethernet controller.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 8e6157b..4d0b68c 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -62,6 +62,28 @@
 		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
 		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
 	};
+
+	ether_pins: ether {
+		/* Ethernet on Ports 1,2,3,5 */
+		pinmux = <RZA1_PINMUX(1, 14, 4)>,/* P1_14 = ET_COL  */
+			 <RZA1_PINMUX(5, 9, 2)>, /* P5_9 = ET_MDC   */
+			 <RZA1_PINMUX(3, 3, 2)>, /* P3_3 = ET_MDIO */
+			 <RZA1_PINMUX(3, 4, 2)>, /* P3_4 = ET_RXCLK */
+			 <RZA1_PINMUX(3, 5, 2)>, /* P3_5 = ET_RXER  */
+			 <RZA1_PINMUX(3, 6, 2)>, /* P3_6 = ET_RXDV  */
+			 <RZA1_PINMUX(2, 0, 2)>, /* P2_0 = ET_TXCLK */
+			 <RZA1_PINMUX(2, 1, 2)>, /* P2_1 = ET_TXER  */
+			 <RZA1_PINMUX(2, 2, 2)>, /* P2_2 = ET_TXEN  */
+			 <RZA1_PINMUX(2, 3, 2)>, /* P2_3 = ET_CRS   */
+			 <RZA1_PINMUX(2, 4, 2)>, /* P2_4 = ET_TXD0  */
+			 <RZA1_PINMUX(2, 5, 2)>, /* P2_5 = ET_TXD1  */
+			 <RZA1_PINMUX(2, 6, 2)>, /* P2_6 = ET_TXD2  */
+			 <RZA1_PINMUX(2, 7, 2)>, /* P2_7 = ET_TXD3  */
+			 <RZA1_PINMUX(2, 8, 2)>, /* P2_8 = ET_RXD0  */
+			 <RZA1_PINMUX(2, 9, 2)>, /* P2_9 = ET_RXD1  */
+			 <RZA1_PINMUX(2, 10, 2)>,/* P2_10 = ET_RXD2 */
+			 <RZA1_PINMUX(2, 11, 2)>;/* P2_11 = ET_RXD3 */
+	};
 };
 
 &extal_clk {
@@ -80,6 +102,19 @@
 	status = "okay";
 };
 
+&ether {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ether_pins>;
+
+	status = "okay";
+
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
 &i2c2 {
 	status = "okay";
 	clock-frequency = <400000>;
-- 
2.7.4
