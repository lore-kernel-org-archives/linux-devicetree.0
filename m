From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2] ARM: dts: imx6sl-evk: add missing GPIO iomux setting
Date: Sat, 14 Jul 2018 09:53:58 +0800
Message-ID: <1531533238-8816-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On i.MX6SL EVK board, the MX6SL_PAD_KEY_ROW5 pin is
used as lcd 3v3 regulator control pin, need to make
sure MX6SL_PAD_KEY_ROW5 is muxed as GPIO function
for controlling lcd 3v3 regulator.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
change since V1:
	using a separate pin group for lcd regulator instead of putting gpio pin in hog group.
 arch/arm/boot/dts/imx6sl-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sl-evk.dts b/arch/arm/boot/dts/imx6sl-evk.dts
index 50bdc65..046cfab 100644
--- a/arch/arm/boot/dts/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/imx6sl-evk.dts
@@ -77,6 +77,8 @@
 
 	reg_lcd_3v3: regulator-lcd-3v3 {
 		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_lcd_3v3>;
 		regulator-name = "lcd-3v3";
 		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
@@ -410,6 +412,12 @@
 			>;
 		};
 
+		pinctrl_reg_lcd_3v3: reglcd3v3grp {
+			fsl,pins = <
+				MX6SL_PAD_KEY_ROW5__GPIO4_IO03    0x17059
+			>;
+		};
+
 		pinctrl_uart1: uart1grp {
 			fsl,pins = <
 				MX6SL_PAD_UART1_RXD__UART1_RX_DATA	0x1b0b1
-- 
2.7.4
