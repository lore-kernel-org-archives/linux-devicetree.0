From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 10/10] arm: dts: genmai: Add ethernet pin group
Date: Thu, 27 Apr 2017 10:19:54 +0200
Message-ID: <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pin configuration subnode for ETHER ethernet controller.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index f7c512e..328f4c9 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -63,6 +63,34 @@
 		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
 		bi-directional;
 	};
+
+	ether_pins: ether {
+		pins {
+			/* Ethernet on Ports 1,2,3,5 */
+			pinmux = <RZA1_PINMUX(1, 14, 4)>,/* P1_14 = ET_COL  */
+				 <RZA1_PINMUX(5, 9, 2)>, /* P5_9 = ET_MDC   */
+				 <RZA1_PINMUX(3, 4, 2)>, /* P3_4 = ET_RXCLK */
+				 <RZA1_PINMUX(3, 5, 2)>, /* P3_5 = ET_RXER  */
+				 <RZA1_PINMUX(3, 6, 2)>, /* P3_6 = ET_RXDV  */
+				 <RZA1_PINMUX(2, 0, 2)>, /* P2_0 = ET_TXCLK */
+				 <RZA1_PINMUX(2, 1, 2)>, /* P2_1 = ET_TXER  */
+				 <RZA1_PINMUX(2, 2, 2)>, /* P2_2 = ET_TXEN  */
+				 <RZA1_PINMUX(2, 3, 2)>, /* P2_3 = ET_CRS   */
+				 <RZA1_PINMUX(2, 4, 2)>, /* P2_4 = ET_TXD0  */
+				 <RZA1_PINMUX(2, 5, 2)>, /* P2_5 = ET_TXD1  */
+				 <RZA1_PINMUX(2, 6, 2)>, /* P2_6 = ET_TXD2  */
+				 <RZA1_PINMUX(2, 7, 2)>, /* P2_7 = ET_TXD3  */
+				 <RZA1_PINMUX(2, 8, 2)>, /* P2_8 = ET_RXD0  */
+				 <RZA1_PINMUX(2, 9, 2)>, /* P2_9 = ET_RXD1  */
+				 <RZA1_PINMUX(2, 10, 2)>,/* P2_10 = ET_RXD2 */
+				 <RZA1_PINMUX(2, 11, 2)>;/* P2_11 = ET_RXD3 */
+		};
+
+		pins_bidir {
+			pinmux = <RZA1_PINMUX(3, 3, 2)>;/* P3_3 = ET_MDIO  */
+			bi-directional;
+		};
+	};
 };
 
 &extal_clk {
@@ -77,6 +105,19 @@
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

