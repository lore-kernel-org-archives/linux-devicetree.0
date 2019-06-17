Return-Path: <SRS0=bp0t=UQ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 3/3] ARM: dts: imx6qdl-kontron-samx6i: add Kontron SMARC SoM Support
Date: Mon, 17 Jun 2019 18:14:32 +0200
Message-Id: <20190617161432.32268-4-m.felsch@pengutronix.de>
In-Reply-To: <20190617161432.32268-1-m.felsch@pengutronix.de>
References: <20190617161432.32268-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, Gilles.Buloz@kontron.com, frieder.schrempf@kontron.de, thomas.schaefer@kontron.com, Stefan.Nickl@kontron.com, Michael.Brunner@kontron.com, kernel@pengutronix.de, festevam@gmail.com, plaes@plaes.org, Michael Grzeschik <m.grzeschik@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

From: Michael Grzeschik <m.grzeschik@pengutronix.de>

The patch adds the following interfaces according the SMARC Spec 1.1
[1] and provided schematics:
 - SMARC SPI0/1
   Note: Since Kontron still uses silicon revisions below 1.3 they have
         add a spi-nor to implement Workaround #1 of erratum ERR006282.
 - SMARC SDIO
 - SMARC LCD
 - SMARC HDMI
 - SMARC Management pins
   Note: Kontron don't route all of these pins to the i.MX6, some are
         routed to the SoM CPLD.
 - SMARC GPIO
 - SMARC CSI Camera
   Note: As specified in [1] the data lanes are shared to cover the
         csi and the parallel case. The case depends on the baseboard so
         muxing the data lanes is not part of this patch.
 - SMARC I2S
 - SMARC Watchdog
   Note: The watchdog output pin is routed to the CPLD and the SMARC
         header. The CPLD performs a reset after a 30s timeout so we
         need to enable the watchdog per default.
 - SMARC module eeprom

Due to the lack of hardware not all of these interfaces are tesetd.

[1] https://sget.org/standards/smarc

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- rename patch title
- squash patch 3-17
- drop fsl,spi-num-chipselects property
- make use of GPIO_ACTIVE_HIGH
- s/boot-flash/spi-flash/
- add phandles for spi-flash and eeprom so we can add partitions node
  later on.
- spi-nor: reorder node properties

 arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi  |  12 +
 arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi   |  36 ++
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 394 ++++++++++++++++++
 3 files changed, 442 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi

diff --git a/arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi
new file mode 100644
index 000000000000..a864fdbd5f16
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-kontron-samx6i.dtsi"
+
+/ {
+	model = "Kontron SMARC sAMX6i Dual-Lite/Solo";
+	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi
new file mode 100644
index 000000000000..2618eccfe50d
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#include "imx6q.dtsi"
+#include "imx6qdl-kontron-samx6i.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Kontron SMARC sAMX6i Quad/Dual";
+	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
+};
+
+/* Quad/Dual SoMs have 3 chip-select signals */
+&ecspi4 {
+	fsl,spi-num-chipselects = <3>;
+	cs-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>,
+		   <&gpio3 29 GPIO_ACTIVE_HIGH>,
+		   <&gpio3 25 GPIO_ACTIVE_HIGH>;
+};
+
+&pinctrl_ecspi4 {
+	fsl,pins = <
+		MX6QDL_PAD_EIM_D21__ECSPI4_SCLK 0x100b1
+		MX6QDL_PAD_EIM_D28__ECSPI4_MOSI 0x100b1
+		MX6QDL_PAD_EIM_D22__ECSPI4_MISO 0x100b1
+
+		/* SPI4_IMX_CS2# - connected to internal flash */
+		MX6QDL_PAD_EIM_D24__GPIO3_IO24 0x1b0b0
+		/* SPI4_IMX_CS0# - connected to SMARC SPI0_CS0# */
+		MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x1b0b0
+		/* SPI4_CS3# - connected to  SMARC SPI0_CS1# */
+		MX6QDL_PAD_EIM_D25__GPIO3_IO25 0x1b0b0
+	>;
+};
diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index 12b12490792c..81c7ebb4b3fb 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/fsl-imx-audmux.h>
 
 / {
 	reg_1p0v_s0: regulator-1p0v-s0 {
@@ -70,6 +71,28 @@
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
@@ -89,6 +112,41 @@
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
@@ -99,6 +157,76 @@
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
+
+	i2c_cam: i2c-gpio-cam {
+		compatible = "i2c-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c_gpio_cam>;
+		sda-gpios = <&gpio4 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio1 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>; /* ~100 kHz */
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabld";
+	};
+};
+
+/* I2S0, I2S1 */
+&audmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_audmux>;
+
+	audmux_ssi1 {
+		fsl,audmux-port = <MX51_AUDMUX_PORT1_SSI0>;
+		fsl,port-config = <
+			(IMX_AUDMUX_V2_PTCR_TFSEL(MX51_AUDMUX_PORT3) |
+			 IMX_AUDMUX_V2_PTCR_TCSEL(MX51_AUDMUX_PORT3) |
+			 IMX_AUDMUX_V2_PTCR_SYN    |
+			 IMX_AUDMUX_V2_PTCR_TFSDIR |
+			 IMX_AUDMUX_V2_PTCR_TCLKDIR)
+			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT3)
+		>;
+	};
+
+	audmux_adu3 {
+		fsl,audmux-port = <MX51_AUDMUX_PORT3>;
+		fsl,port-config = <
+			IMX_AUDMUX_V2_PTCR_SYN
+			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT1_SSI0)
+		>;
+	};
+
+	audmux_ssi2 {
+		fsl,audmux-port = <MX51_AUDMUX_PORT2_SSI1>;
+		fsl,port-config = <
+			(IMX_AUDMUX_V2_PTCR_TFSEL(MX51_AUDMUX_PORT4) |
+			 IMX_AUDMUX_V2_PTCR_TCSEL(MX51_AUDMUX_PORT4) |
+			 IMX_AUDMUX_V2_PTCR_SYN    |
+			 IMX_AUDMUX_V2_PTCR_TFSDIR |
+			 IMX_AUDMUX_V2_PTCR_TCLKDIR)
+			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT4)
+		>;
+	};
+
+	audmux_adu4 {
+		fsl,audmux-port = <MX51_AUDMUX_PORT4>;
+		fsl,port-config = <
+			IMX_AUDMUX_V2_PTCR_SYN
+			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT2_SSI1)
+		>;
+	};
 };
 
 /* CAN0 */
@@ -113,6 +241,30 @@
 	pinctrl-0 = <&pinctrl_flexcan2>;
 };
 
+/* SPI1 */
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>,
+		   <&gpio2 27 GPIO_ACTIVE_HIGH>;
+};
+
+/* SPI0 */
+&ecspi4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi4>;
+	cs-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>,
+		   <&gpio3 29 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	/* default boot source: workaround #1 for errata ERR006282 */
+	smarc_flash: spi-flash@0 {
+		compatible = "winbond,w25q16dw", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 /* GBE */
 &fec {
 	pinctrl-names = "default";
@@ -236,14 +388,79 @@
 	};
 };
 
+/* I2C_GP */
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+};
+
+/* HDMI_CTRL */
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+};
+
 /* I2C_PM */
 &i2c3 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	smarc_eeprom: eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
 };
 
 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mgmt_gpios &pinctrl_gpio>;
+
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+
+			MX6QDL_PAD_DISP0_DAT20__AUD4_TXC	0x130b0
+			MX6QDL_PAD_DISP0_DAT21__AUD4_TXD	0x130b0
+			MX6QDL_PAD_DISP0_DAT22__AUD4_TXFS	0x130b0
+			MX6QDL_PAD_DISP0_DAT23__AUD4_RXD	0x130b0
+
+			/* AUDIO MCLK */
+			MX6QDL_PAD_NANDF_CS2__CCM_CLKO2		0x000b0
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK 0x100b1
+			MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI 0x100b1
+			MX6QDL_PAD_EIM_OE__ECSPI2_MISO  0x100b1
+
+			MX6QDL_PAD_EIM_RW__GPIO2_IO26  0x1b0b0 /* CS0 */
+			MX6QDL_PAD_EIM_LBA__GPIO2_IO27 0x1b0b0 /* CS1 */
+		>;
+	};
+
+	pinctrl_ecspi4: ecspi4grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__ECSPI4_SCLK 0x100b1
+			MX6QDL_PAD_EIM_D28__ECSPI4_MOSI 0x100b1
+			MX6QDL_PAD_EIM_D22__ECSPI4_MISO 0x100b1
+
+			/* SPI_IMX_CS2# - connected to internal flash */
+			MX6QDL_PAD_EIM_D24__GPIO3_IO24 0x1b0b0
+			/* SPI_IMX_CS0# - connected to SMARC SPI0_CS0# */
+			MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x1b0b0
+		>;
+	};
+
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_7__FLEXCAN1_TX 0x1b0b0
@@ -258,6 +475,23 @@
 		>;
 	};
 
+	pinctrl_gpio: gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_DA0__GPIO3_IO00	0x1b0b0	/* GPIO0 / CAM0_PWR# */
+			MX6QDL_PAD_EIM_DA1__GPIO3_IO01	0x1b0b0 /* GPIO1 / CAM1_PWR# */
+			MX6QDL_PAD_EIM_DA2__GPIO3_IO02	0x1b0b0 /* GPIO2 / CAM0_RST# */
+			MX6QDL_PAD_EIM_DA3__GPIO3_IO03	0x1b0b0 /* GPIO3 / CAM1_RST# */
+			MX6QDL_PAD_EIM_DA4__GPIO3_IO04	0x1b0b0 /* GPIO4 / HDA_RST#  */
+			MX6QDL_PAD_EIM_DA5__GPIO3_IO05	0x1b0b0 /* GPIO5 / PWM_OUT   */
+			MX6QDL_PAD_EIM_DA6__GPIO3_IO06	0x1b0b0 /* GPIO6 / TACHIN    */
+			MX6QDL_PAD_EIM_DA7__GPIO3_IO07	0x1b0b0 /* GPIO7 / PCAM_FLD  */
+			MX6QDL_PAD_EIM_DA8__GPIO3_IO08	0x1b0b0 /* GPIO8 / CAN0_ERR# */
+			MX6QDL_PAD_EIM_DA9__GPIO3_IO09	0x1b0b0 /* GPIO9 / CAN1_ERR# */
+			MX6QDL_PAD_EIM_DA10__GPIO3_IO10	0x1b0b0 /* GPIO10            */
+			MX6QDL_PAD_EIM_DA11__GPIO3_IO11	0x1b0b0 /* GPIO11            */
+		>;
+	};
+
 	pinctrl_enet: enetgrp {
 		fsl,pins = <
 			MX6QDL_PAD_RGMII_TXC__RGMII_TXC       0x1b0b0
@@ -280,6 +514,13 @@
 		>;
 	};
 
+	pinctrl_i2c_gpio_cam: i2c-gpiocamgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06	0x1b0b0 /* SCL */
+			MX6QDL_PAD_KEY_COL2__GPIO4_IO10	0x1b0b0 /* SDA */
+		>;
+	};
+
 	pinctrl_i2c_gpio_intern: i2c-gpiointerngrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_TXD0__GPIO1_IO30  0x1b0b0 /* SCL */
@@ -287,6 +528,27 @@
 		>;
 	};
 
+	pinctrl_i2c_gpio_lcd: i2c-gpiolcdgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT2__GPIO1_IO19 0x1b0b0 /* SCL */
+			MX6QDL_PAD_SD1_DAT3__GPIO1_IO21 0x1b0b0 /* SDA */
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA		0x4001b8b1
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
@@ -294,6 +556,72 @@
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
+	pinctrl_mipi_csi: mipi-csigrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_MCLK__CCM_CLKO1	0x000b0	/* CSI0/1 MCLK */
+		>;
+	};
+
+	pinctrl_mgmt_gpios: mgmt-gpiosgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_WAIT__GPIO5_IO00		0x1b0b0	/* LID#           */
+			MX6QDL_PAD_SD3_DAT7__GPIO6_IO17		0x1b0b0	/* SLEEP#         */
+			MX6QDL_PAD_GPIO_17__GPIO7_IO12		0x1b0b0	/* CHARGING#      */
+			MX6QDL_PAD_GPIO_0__GPIO1_IO00		0x1b0b0	/* CHARGER_PRSNT# */
+			MX6QDL_PAD_SD1_CLK__GPIO1_IO20		0x1b0b0	/* CARRIER_STBY#  */
+			MX6QDL_PAD_DI0_PIN4__GPIO4_IO20		0x1b0b0	/* BATLOW#        */
+			MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x1b0b0	/* TEST#          */
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1b0b0	/* VDD_IO_SEL_D#  */
+			MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x1b0b0 /* POWER_BTN#     */
+		>;
+	};
+
 	pinctrl_pcie: pciegrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D18__GPIO3_IO18	0x1b0b0 /* PCI_A_PRSNT# */
@@ -302,6 +630,12 @@
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
@@ -343,6 +677,21 @@
 		>;
 	};
 
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CLK__SD3_CLK 0x17059
+			MX6QDL_PAD_SD3_CMD__SD3_CMD 0x17059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x17059
+
+			MX6QDL_PAD_NANDF_CS1__GPIO6_IO14 0x1b0b0 /* CD */
+			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26 0x1b0b0 /* WP */
+			MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x1b0b0 /* PWR_EN */
+		>;
+	};
+
 	pinctrl_usdhc4: usdhc4grp {
 		fsl,pins = <
 			MX6QDL_PAD_SD4_CLK__SD4_CLK 0x17059
@@ -357,6 +706,17 @@
 			MX6QDL_PAD_SD4_DAT7__SD4_DATA7 0x17059
 		>;
 	};
+
+	pinctrl_wdog1: wdog1rp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_9__WDOG1_B	0x1b0b0
+		>;
+	};
+};
+
+&mipi_csi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mipi_csi>;
 };
 
 &pcie {
@@ -366,6 +726,24 @@
 	reset-gpio = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 };
 
+/* LCD_BKLT_PWM */
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+};
+
+&reg_arm {
+	vin-supply = <&reg_v_core_s0>;
+};
+
+&reg_pu {
+	vin-supply = <&reg_vddsoc_s0>;
+};
+
+&reg_soc {
+	vin-supply = <&reg_vddsoc_s0>;
+};
+
 /* SER0 */
 &uart1 {
 	pinctrl-names = "default";
@@ -407,6 +785,15 @@
 	vbus-supply = <&reg_5p0v_s0>;
 };
 
+/* SDIO */
+&usdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	cd-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+	no-1-8-v;
+};
+
 /* SDMMC */
 &usdhc4 {
 	/* Internal eMMC, optional on some boards */
@@ -419,3 +806,10 @@
 	vmmc-supply = <&reg_3p3v_s0>;
 	vqmmc-supply = <&reg_1p8v_s0>;
 };
+
+&wdog1 {
+	/* CPLD is feeded by watchdog (hardwired) */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog1>;
+	status = "okay";
+};
-- 
2.20.1
