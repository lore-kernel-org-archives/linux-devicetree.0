From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2] arm64: dts: imx8mn-ddr4-evk: Enable GPIO LED
Date: Tue,  3 Sep 2019 09:27:57 -0400
Message-ID: <1567517277-30919-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com, jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
List-Id: devicetree@vger.kernel.org

i.MX8MN DDR4 EVK board has a GPIO LED to indicate status,
add support for it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- Mention color in the label.
---
 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
index b698061..bf1c097 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
@@ -15,6 +15,18 @@
 		stdout-path = &uart2;
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_led>;
+
+		status {
+			label = "yellow:status";
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -54,6 +66,12 @@
 		>;
 	};
 
+	pinctrl_gpio_led: gpioledgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
-- 
2.7.4
