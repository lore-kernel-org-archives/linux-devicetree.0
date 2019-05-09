Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 05/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC LCD interface
Date: Thu,  9 May 2019 17:58:22 +0200
Message-Id: <20190509155834.22838-6-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support according the SMARC Spec 1.1 [1] and provided schematics.
Only the backlight and the i2c was tested due to the lack of hardware.

[1] https://sget.org/standards/smarc

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index b96684ff92e8..577048f96f22 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -70,6 +70,28 @@
 		vin-supply = <&reg_smarc_suppy>;
 	};
 
+	reg_smarc_lcdbklt: regulator-smarc-lcdbklt {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lcdbklt_en>;
+		regulator-name = "LCD_BKLT_EN";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio1 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_smarc_lcdvdd: regulator-smarc-lcdvdd {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lcdvdd_en>;
+		regulator-name = "LCD_VDD_EN";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_smarc_rtc: regulator-smarc-rtc {
 		compatible = "regulator-fixed";
 		regulator-name = "V_IN_RTC_BATT";
@@ -89,6 +111,41 @@
 		regulator-boot-on;
 	};
 
+	lcd: lcd {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "fsl,imx-parallel-display";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lcd>;
+		status = "disabled";
+
+		port@0 {
+			reg = <0>;
+
+			lcd_in: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lcd_out: endpoint {
+			};
+		};
+	};
+
+	lcd_backlight: lcd-backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm4 0 5000000>;
+		pwm-names = "LCD_BKLT_PWM";
+
+		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
+		default-brightness-level = <4>;
+
+		power-supply = <&reg_smarc_lcdbklt>;
+		status = "disabled";
+	};
+
 	i2c_intern: i2c-gpio-intern {
 		compatible = "i2c-gpio";
 		pinctrl-names = "default";
@@ -99,6 +156,18 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+	i2c_lcd: i2c-gpio-lcd {
+		compatible = "i2c-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c_gpio_lcd>;
+		sda-gpios = <&gpio1 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio1 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>; /* ~100 kHz */
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabld";
+	};
 };
 
 /* CAN0 */
@@ -308,6 +377,13 @@
 		>;
 	};
 
+	pinctrl_i2c_gpio_lcd: i2c-gpiolcdgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__GPIO1_IO19 0x1b0b0 /* SCL */
+			MX6QDL_PAD_SD1_DAT3__GPIO1_IO21 0x1b0b0 /* SDA */
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
@@ -315,6 +391,52 @@
 		>;
 	};
 
+	pinctrl_lcd: lcdgrp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00  0x100f1
+			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01  0x100f1
+			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02  0x100f1
+			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03  0x100f1
+			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04  0x100f1
+			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05  0x100f1
+			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06  0x100f1
+			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07  0x100f1
+			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08  0x100f1
+			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09  0x100f1
+			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10 0x100f1
+			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11 0x100f1
+			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12 0x100f1
+			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13 0x100f1
+			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14 0x100f1
+			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15 0x100f1
+			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16 0x100f1
+			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17 0x100f1
+			MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18 0x100f1
+			MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19 0x100f1
+			MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20 0x100f1
+			MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21 0x100f1
+			MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22 0x100f1
+			MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23 0x100f1
+
+			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x100f1
+			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x100f1 /* DE */
+			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x100f1 /* HSYNC */
+			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x100f1 /* VSYNC */
+		>;
+	};
+
+	pinctrl_lcdbklt_en: lcdbkltengrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT0__GPIO1_IO16	0x1b0b1
+		>;
+	};
+
+	pinctrl_lcdvdd_en: lcdvddengrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT1__GPIO1_IO17 0x1b0b0
+		>;
+	};
+
 	pinctrl_pcie: pciegrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D18__GPIO3_IO18	0x1b0b0 /* PCI_A_PRSNT# */
@@ -323,6 +445,12 @@
 		>;
 	};
 
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__PWM4_OUT 0x1b0b1
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA 0x1b0b1
@@ -402,6 +530,12 @@
 	reset-gpio = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 };
 
+/* LCD_BKLT_PWM */
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+};
+
 /* SER0 */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.20.1
