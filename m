From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH v2 1/2] ARM: dts: imx6: Add support for Toradex Apalis iMX6Q/D SoM
Date: Tue,  5 Jan 2016 17:39:01 +0100
Message-ID: <1452011942-11940-2-git-send-email-marcel.ziswiler@toradex.com>
References: <1452011942-11940-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452011942-11940-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lucas Stach <l.stach@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stefan Agner <stefan@agner.ch>, Joshua Clayton <stillcompiling@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

=46rom: Petr =C5=A0tetiar <ynezz@true.cz>

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

Changes in v2:
- clarify exact Apalis iMX6Q/D SoM type in cover letter
- clarify exact Apalis iMX6Q/D module type and Ixora carrier board in m=
odel
  node
- got rid of obsolete mmc aliases
- working SGTL5000 audio/sound integration
- working STMPE811 touch screen controller integration
- integrated review feedback from Lucas
- left and even added some more comments as I don't see why putting any
  explanatory comments in dts' should be such a bad thing to do
- completely got rid of the memory node as that is something typically =
filled
  in by the boot loader e.g. U-Boot
- without the regulators simple-bus it no longer boots
- even though we supposedly shipped a few hundred V1.0a modules drop DC=
E UART
  support for now and simplify file layout
- replaced obsolete no-1-8-v by mainline supported voltage-ranges =3D <=
3300 3300>
  usdhc property and yes card detects are indeed active low (;-p)
- integrated review feedback from Stefan
- fixed Ethernet PHY reset & interrupt (requires Micrel PHY driver to b=
e
  enabled)
- fixed HDMI DDC (requires GPIO-based bitbanging I2C to be enabled)
- fixed SPDIF

 arch/arm/boot/dts/imx6qdl-apalis.dtsi | 1040 +++++++++++++++++++++++++=
++++++++
 1 file changed, 1040 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6qdl-apalis.dtsi

diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/=
imx6qdl-apalis.dtsi
new file mode 100644
index 0000000..6104e2e
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -0,0 +1,1040 @@
+/*
+ * Copyright 2014-2016 Toradex AG
+ * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2011 Linaro Ltd.
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model =3D "Toradex Apalis iMX6Q/D Module";
+	compatible =3D "toradex,apalis_imx6q", "fsl,imx6q";
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm4 0 5000000>;
+		status =3D "disabled";
+	};
+
+	/* DDC_I2C: I2C2_SDA/SCL on MXM3 205/207 */
+	i2cddc: i2c@0 {
+		compatible =3D "i2c-gpio";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_i2c_ddc>;
+		gpios =3D <&gpio3 16 GPIO_ACTIVE_HIGH /* sda */
+			 &gpio2 30 GPIO_ACTIVE_HIGH /* scl */
+			>;
+		i2c-gpio,delay-us =3D <2>;	/* ~100 kHz */
+		status =3D "okay";
+	};
+
+	regulators {
+		compatible =3D "simple-bus";
+
+		reg_1p8v: 1p8v {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "1P8V";
+			regulator-min-microvolt =3D <1800000>;
+			regulator-max-microvolt =3D <1800000>;
+			regulator-always-on;
+		};
+
+		reg_2p5v: 2p5v {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "2P5V";
+			regulator-min-microvolt =3D <2500000>;
+			regulator-max-microvolt =3D <2500000>;
+			regulator-always-on;
+		};
+
+		reg_3p3v: 3p3v {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "3P3V";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			regulator-always-on;
+		};
+
+		reg_usb_otg_vbus: usb_otg_vbus {
+			compatible =3D "regulator-fixed";
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_regulator_usbotg_pwr>;
+			regulator-name =3D "usb_otg_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			status =3D "disabled";
+		};
+
+		/* on module usb hub */
+		reg_usb_host_vbus_hub: usb_host_vbus_hub {
+			compatible =3D "regulator-fixed";
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_regulator_usbhub_pwr>;
+			regulator-name =3D "usb_host_vbus_hub";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&gpio3 28 GPIO_ACTIVE_HIGH>;
+			startup-delay-us =3D <2000>;
+			enable-active-high;
+			status =3D "okay";
+		};
+
+		reg_usb_host_vbus: usb_host_vbus {
+			compatible =3D "regulator-fixed";
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_regulator_usbh_pwr>;
+			regulator-name =3D "usb_host_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D  <&gpio1 0 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply =3D <&reg_usb_host_vbus_hub>;
+			status =3D "disabled";
+		};
+	};
+
+	sound {
+		compatible =3D "fsl,imx-audio-sgtl5000";
+		model =3D "imx6q-apalis-sgtl5000";
+		ssi-controller =3D <&ssi1>;
+		audio-codec =3D <&codec>;
+		audio-routing =3D
+			"LINE_IN", "Line In Jack",
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+		mux-int-port =3D <1>;
+		mux-ext-port =3D <4>;
+	};
+
+	sound_spdif: sound-spdif {
+		compatible =3D "fsl,imx-audio-spdif";
+		model =3D "imx-spdif";
+		spdif-controller =3D <&spdif>;
+		spdif-in;
+		spdif-out;
+		status =3D "disabled";
+	};
+};
+
+&audmux {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_audmux &pinctrl_audmux_mclk>;
+	status =3D "okay";
+};
+
+/* Apalis SPI1 */
+&ecspi1 {
+	fsl,spi-num-chipselects =3D <1>;
+	cs-gpios =3D <&gpio5 25 GPIO_ACTIVE_HIGH>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_ecspi1 &pinctrl_spi_cs1>;
+	status =3D "disabled";
+};
+
+/* Apalis SPI2 */
+&ecspi2 {
+	fsl,spi-num-chipselects =3D <1>;
+	cs-gpios =3D <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_spi_cs2>;
+	status =3D "disabled";
+};
+
+&fec {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_enet &pinctrl_enet_ctrl>;
+	phy-mode =3D "rgmii";
+	phy-handle =3D <&ethphy>;
+	phy-reset-duration =3D <10>;
+	phy-reset-gpios =3D <&gpio1 25 GPIO_ACTIVE_LOW>;
+	status =3D "okay";
+
+	mdio {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		ethphy: ethernet-phy@7 {
+			interrupt-parent =3D <&gpio1>;
+			interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>;
+			reg =3D <7>;
+		};
+	};
+};
+
+&can1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan1>;
+	status =3D "disabled";
+};
+
+&can2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan2>;
+	status =3D "disabled";
+};
+
+&hdmi {
+	ddc-i2c-bus =3D <&i2cddc>;
+	status =3D "okay";
+};
+
+/*
+ * GEN1_I2C: I2C1_SDA/SCL on MXM3 209/211 (e.g. RTC on carrier
+ * board)
+ */
+&i2c1 {
+	clock-frequency =3D <100000>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c1>;
+	status =3D "disabled";
+};
+
+&i2c2 {
+	clock-frequency =3D <100000>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c2>;
+	status =3D "okay";
+
+	pmic: pfuze100@08 {
+		compatible =3D "fsl,pfuze100";
+		reg =3D <0x08>;
+
+		regulators {
+			sw1a_reg: sw1ab {
+				regulator-min-microvolt =3D <300000>;
+				regulator-max-microvolt =3D <1875000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay =3D <6250>;
+			};
+
+			sw1c_reg: sw1c {
+				regulator-min-microvolt =3D <300000>;
+				regulator-max-microvolt =3D <1875000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay =3D <6250>;
+			};
+
+			sw3a_reg: sw3a {
+				regulator-min-microvolt =3D <400000>;
+				regulator-max-microvolt =3D <1975000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			swbst_reg: swbst {
+				regulator-min-microvolt =3D <5000000>;
+				regulator-max-microvolt =3D <5150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			snvs_reg: vsnvs {
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <3000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vref_reg: vrefddr {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen1_reg: vgen1 {
+				regulator-min-microvolt =3D <800000>;
+				regulator-max-microvolt =3D <1550000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen2_reg: vgen2 {
+				regulator-min-microvolt =3D <800000>;
+				regulator-max-microvolt =3D <1550000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen3_reg: vgen3 {
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen4_reg: vgen4 {
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen5_reg: vgen5 {
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen6_reg: vgen6 {
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	codec: sgtl5000@0a {
+		compatible =3D "fsl,sgtl5000";
+		reg =3D <0x0a>;
+		clocks =3D <&clks 201>;
+		VDDA-supply =3D <&reg_2p5v>;
+		VDDIO-supply =3D <&reg_3p3v>;
+	};
+
+	/* STMPE811 touch screen controller */
+	stmpe811@41 {
+		compatible =3D "st,stmpe811";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_touch_int>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		reg =3D <0x41>;
+		interrupts =3D <10 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent =3D <&gpio4>;
+		interrupt-controller;
+		id =3D <0>;
+		blocks =3D <0x5>;
+		irq-trigger =3D <0x1>;
+		stmpe_touchscreen {
+			compatible =3D "st,stmpe-ts";
+			reg =3D <0>;
+			/* 3.25 MHz ADC clock speed */
+			st,adc-freq =3D <1>;
+			/* 8 sample average control */
+			st,ave-ctrl =3D <3>;
+			/* 7 length fractional part in z */
+			st,fraction-z =3D <7>;
+			/*
+			 * 50 mA typical 80 mA max touchscreen drivers
+			 * current limit value
+			 */
+			st,i-drive =3D <1>;
+			/* 12-bit ADC */
+			st,mod-12b =3D <1>;
+			/* internal ADC reference */
+			st,ref-sel =3D <0>;
+			/* ADC converstion time: 80 clocks */
+			st,sample-time =3D <4>;
+			/* 1 ms panel driver settling time */
+			st,settling =3D <3>;
+			/* 5 ms touch detect interrupt delay */
+			st,touch-det-delay =3D <5>;
+		};
+	};
+};
+
+/*
+ * GEN2_I2C, CAM: I2C3_SDA/SCL on MXM3 201/203 (unused)
+ */
+&i2c3 {
+	clock-frequency =3D <100000>;
+	pinctrl-names =3D "default", "recovery";
+	pinctrl-0 =3D <&pinctrl_i2c3>;
+	pinctrl-1 =3D <&pinctrl_i2c3_recovery>;
+	scl-gpios =3D <&gpio3 17 GPIO_ACTIVE_HIGH>;
+	sda-gpios =3D <&gpio3 18 GPIO_ACTIVE_HIGH>;
+	status =3D "disabled";
+};
+
+/* PAD Ctrl values for common settings */
+/*
+ * (PAD_CTL_HYS | PAD_CTL_PUS_100K_UP | PAD_CTL_PUE | PAD_CTL_PKE |
+ *  PAD_CTL_SPEED_MED | PAD_CTL_DSE_40ohm)
+ */
+#define PAD_CTRL_HYS_PU 0x1b0b0
+
+/*
+ * (PAD_CTL_HYS | PAD_CTL_PUE | PAD_CTL_PKE | PAD_CTL_SPEED_MED |
+ *  PAD_CTL_DSE_40ohm)
+ */
+#define PAD_CTRL_HYS_PD 0x130b0
+
+/*
+ * (PAD_CTL_PUS_22K_UP | PAD_CTL_PUE | PAD_CTL_PKE | PAD_CTL_SPEED_LOW=
 |
+ *  PAD_CTL_DSE_80ohm)
+ */
+#define PAD_CTRL_PU_22k 0x0f058
+
+&iomuxc {
+	ecspi {
+		pinctrl_ecspi1: ecspi1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_CSI0_DAT6__ECSPI1_MISO 0x100b1
+				MX6QDL_PAD_CSI0_DAT5__ECSPI1_MOSI 0x100b1
+				MX6QDL_PAD_CSI0_DAT4__ECSPI1_SCLK 0x100b1
+			>;
+		};
+		pinctrl_ecspi2: ecspi2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_OE__ECSPI2_MISO 0x100b1
+				MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI 0x100b1
+				MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK 0x100b1
+			>;
+		};
+		pinctrl_spi_cs1: spi_cs1 {
+			fsl,pins =3D <
+				/* SPI1 cs */
+				MX6QDL_PAD_CSI0_DAT7__GPIO5_IO25	0x000b1
+			>;
+		};
+		pinctrl_spi_cs2: spi_cs2 {
+			fsl,pins =3D <
+				/* SPI2 cs */
+				MX6QDL_PAD_EIM_RW__GPIO2_IO26		0x000b1
+			>;
+		};
+	};
+
+	flexcan {
+		pinctrl_flexcan1: flexcan1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_7__FLEXCAN1_TX 0x1b0b0
+				MX6QDL_PAD_GPIO_8__FLEXCAN1_RX 0x1b0b0
+			>;
+		};
+		pinctrl_flexcan2: flexcan2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX 0x1b0b0
+				MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX 0x1b0b0
+			>;
+		};
+	};
+
+	gpio {
+		pinctrl_apalis_gpio1: apalis_gpio1 {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_D4__GPIO2_IO04 PAD_CTRL_HYS_PD
+			>;
+		};
+		pinctrl_apalis_gpio2: apalis_gpio2 {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_D5__GPIO2_IO05 PAD_CTRL_HYS_PD
+			>;
+		};
+		pinctrl_apalis_gpio3: apalis_gpio3 {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_D6__GPIO2_IO06 PAD_CTRL_HYS_PD
+			>;
+		};
+		pinctrl_apalis_gpio4: apalis_gpio4 {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_D7__GPIO2_IO07 PAD_CTRL_HYS_PD
+			>;
+		};
+		pinctrl_apalis_gpio5: apalis_gpio5 {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_RB0__GPIO6_IO10 PAD_CTRL_HYS_PD
+			>;
+		};
+		pinctrl_apalis_gpio6: apalis_gpio6 {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09
+						PAD_CTRL_HYS_PD
+			>;
+		};
+		pinctrl_apalis_gpio7: apalis_gpio7 {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_2__GPIO1_IO02 PAD_CTRL_HYS_PD
+			>;
+		};
+		pinctrl_apalis_gpio8: apalis_gpio8 {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_6__GPIO1_IO06 PAD_CTRL_HYS_PD
+			>;
+		};
+		pinctrl_gpio_keys: gpio_keys {
+			fsl,pins =3D <
+				/* Power Button */
+				MX6QDL_PAD_GPIO_4__GPIO1_IO04 PAD_CTRL_HYS_PU
+			>;
+		};
+	};
+
+	hdmi {
+		pinctrl_hdmi_cec: hdmicecgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
+			>;
+		};
+	};
+
+	i2c {
+		pinctrl_i2c_ddc: i2c_ddc {
+			fsl,pins =3D <
+				/* DDC bitbang */
+				MX6QDL_PAD_EIM_EB2__GPIO2_IO30 PAD_CTRL_HYS_PU
+				MX6QDL_PAD_EIM_D16__GPIO3_IO16 PAD_CTRL_HYS_PU
+			>;
+		};
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_CSI0_DAT8__I2C1_SDA 0x4001b8b1
+				MX6QDL_PAD_CSI0_DAT9__I2C1_SCL 0x4001b8b1
+			>;
+		};
+		pinctrl_i2c3: i2c3grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D17__I2C3_SCL 0x4001b8b1
+				MX6QDL_PAD_EIM_D18__I2C3_SDA 0x4001b8b1
+			>;
+		};
+		pinctrl_i2c3_recovery: i2c3-recoverygrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D17__GPIO3_IO17 0x4001b8b1
+				MX6QDL_PAD_EIM_D18__GPIO3_IO18 0x4001b8b1
+			>;
+		};
+	};
+
+	/* pins used on module */
+	imx6q-apalis {
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_reset_moci &pinctrl_emmc_reset>;
+		pinctrl_audmux: audmuxgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_DISP0_DAT20__AUD4_TXC	0x130b0
+				MX6QDL_PAD_DISP0_DAT21__AUD4_TXD	0x130b0
+				MX6QDL_PAD_DISP0_DAT22__AUD4_TXFS	0x130b0
+				MX6QDL_PAD_DISP0_DAT23__AUD4_RXD	0x130b0
+			>;
+		};
+		pinctrl_audmux_mclk: audmux_mclk {
+			fsl,pins =3D <
+				/* SGTL5000 sys_mclk */
+				MX6QDL_PAD_GPIO_5__CCM_CLKO1 0x130b0
+			>;
+		};
+		pinctrl_emmc_reset: emmc_reset {
+			fsl,pins =3D <
+				/* eMMC reset, leave it alone */
+				MX6QDL_PAD_SD3_RST__GPIO7_IO08 PAD_CTRL_PU_22k
+			>;
+		};
+		pinctrl_enet: enetgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x100b0
+				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x100b0
+				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x100b0
+				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x100b0
+				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x100b0
+				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x100b0
+				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x100b0
+				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x100b0
+				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x100b0
+				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b0b0
+				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b0b0
+				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b0b0
+				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b0b0
+				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b0b0
+				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b0b0
+			>;
+		};
+		pinctrl_enet_ctrl: enet_ctrlgrp {
+			fsl,pins =3D <
+				/* Ethernet PHY reset */
+				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25	0x000b0
+				/* Ethernet PHY interrupt */
+				MX6QDL_PAD_ENET_TXD0__GPIO1_IO30	0x000b1
+			>;
+		};
+		pinctrl_i2c2: i2c2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
+				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
+			>;
+		};
+		pinctrl_ipu2_vdac: ipu2vdacgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_DI0_DISP_CLK__IPU2_DI0_DISP_CLK 0xd1
+				MX6QDL_PAD_DI0_PIN15__IPU2_DI0_PIN15       0xd1
+				MX6QDL_PAD_DI0_PIN2__IPU2_DI0_PIN02        0xd1
+				MX6QDL_PAD_DI0_PIN3__IPU2_DI0_PIN03        0xd1
+				MX6QDL_PAD_DISP0_DAT0__IPU2_DISP0_DATA00   0xf9
+				MX6QDL_PAD_DISP0_DAT1__IPU2_DISP0_DATA01   0xf9
+				MX6QDL_PAD_DISP0_DAT2__IPU2_DISP0_DATA02   0xf9
+				MX6QDL_PAD_DISP0_DAT3__IPU2_DISP0_DATA03   0xf9
+				MX6QDL_PAD_DISP0_DAT4__IPU2_DISP0_DATA04   0xf9
+				MX6QDL_PAD_DISP0_DAT5__IPU2_DISP0_DATA05   0xf9
+				MX6QDL_PAD_DISP0_DAT6__IPU2_DISP0_DATA06   0xf9
+				MX6QDL_PAD_DISP0_DAT7__IPU2_DISP0_DATA07   0xf9
+				MX6QDL_PAD_DISP0_DAT8__IPU2_DISP0_DATA08   0xf9
+				MX6QDL_PAD_DISP0_DAT9__IPU2_DISP0_DATA09   0xf9
+				MX6QDL_PAD_DISP0_DAT10__IPU2_DISP0_DATA10  0xf9
+				MX6QDL_PAD_DISP0_DAT11__IPU2_DISP0_DATA11  0xf9
+				MX6QDL_PAD_DISP0_DAT12__IPU2_DISP0_DATA12  0xf9
+				MX6QDL_PAD_DISP0_DAT13__IPU2_DISP0_DATA13  0xf9
+				MX6QDL_PAD_DISP0_DAT14__IPU2_DISP0_DATA14  0xf9
+				MX6QDL_PAD_DISP0_DAT15__IPU2_DISP0_DATA15  0xf9
+			>;
+		};
+		pinctrl_regulator_usbhub_pwr: gpio_regulator_usbhub_pwr {
+			fsl,pins =3D <
+				/* USBH_HUB_EN */
+				MX6QDL_PAD_EIM_D28__GPIO3_IO28 PAD_CTRL_PU_22k
+			>;
+		};
+		pinctrl_reset_moci: gpio_reset_moci {
+			fsl,pins =3D <
+				/* RESET_MOCI control */
+				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28
+						PAD_CTRL_PU_22k
+			>;
+		};
+		pinctrl_touch_int: touch_intgrp {
+			fsl,pins =3D <
+				/* STMPE811 interrupt */
+				MX6QDL_PAD_KEY_COL2__GPIO4_IO10 PAD_CTRL_HYS_PU
+			>;
+		};
+		pinctrl_usdhc3: usdhc3grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD3_CMD__SD3_CMD    0x17059
+				MX6QDL_PAD_SD3_CLK__SD3_CLK    0x10059
+				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x17059
+				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x17059
+				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x17059
+				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x17059
+				MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x17059
+				MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x17059
+				MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x17059
+				MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x17059
+			>;
+		};
+		pinctrl_usdhc3_100mhz: usdhc3grp-100mhz { /* 100Mhz */
+			fsl,pins =3D <
+				MX6QDL_PAD_SD3_CMD__SD3_CMD 0x170B9
+				MX6QDL_PAD_SD3_CLK__SD3_CLK 0x100B9
+				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x170B9
+				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x170B9
+				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x170B9
+				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x170B9
+				MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x170B9
+				MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x170B9
+				MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x170B9
+				MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x170B9
+			>;
+		};
+		pinctrl_usdhc3_200mhz: usdhc3grp-200mhz { /* 200Mhz */
+			fsl,pins =3D <
+				MX6QDL_PAD_SD3_CMD__SD3_CMD 0x170F9
+				MX6QDL_PAD_SD3_CLK__SD3_CLK 0x100F9
+				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x170F9
+				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x170F9
+				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x170F9
+				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x170F9
+				MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x170F9
+				MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x170F9
+				MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x170F9
+				MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x170F9
+			>;
+		};
+	};
+
+	ipu1 {
+		pinctrl_ipu1_lcdif: ipu1lcdifgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_A16__IPU1_DI1_DISP_CLK	0x61
+				/* DE */
+				MX6QDL_PAD_EIM_DA10__IPU1_DI1_PIN15	0x61
+				/* HSync */
+				MX6QDL_PAD_EIM_DA11__IPU1_DI1_PIN02	0x61
+				/* VSync */
+				MX6QDL_PAD_EIM_DA12__IPU1_DI1_PIN03	0x61
+				MX6QDL_PAD_EIM_DA9__IPU1_DISP1_DATA00	0x61
+				MX6QDL_PAD_EIM_DA8__IPU1_DISP1_DATA01	0x61
+				MX6QDL_PAD_EIM_DA7__IPU1_DISP1_DATA02	0x61
+				MX6QDL_PAD_EIM_DA6__IPU1_DISP1_DATA03	0x61
+				MX6QDL_PAD_EIM_DA5__IPU1_DISP1_DATA04	0x61
+				MX6QDL_PAD_EIM_DA4__IPU1_DISP1_DATA05	0x61
+				MX6QDL_PAD_EIM_DA3__IPU1_DISP1_DATA06	0x61
+				MX6QDL_PAD_EIM_DA2__IPU1_DISP1_DATA07	0x61
+				MX6QDL_PAD_EIM_DA1__IPU1_DISP1_DATA08	0x61
+				MX6QDL_PAD_EIM_DA0__IPU1_DISP1_DATA09	0x61
+				MX6QDL_PAD_EIM_EB1__IPU1_DISP1_DATA10	0x61
+				MX6QDL_PAD_EIM_EB0__IPU1_DISP1_DATA11	0x61
+				MX6QDL_PAD_EIM_A17__IPU1_DISP1_DATA12	0x61
+				MX6QDL_PAD_EIM_A18__IPU1_DISP1_DATA13	0x61
+				MX6QDL_PAD_EIM_A19__IPU1_DISP1_DATA14	0x61
+				MX6QDL_PAD_EIM_A20__IPU1_DISP1_DATA15	0x61
+				MX6QDL_PAD_EIM_A21__IPU1_DISP1_DATA16	0x61
+				MX6QDL_PAD_EIM_A22__IPU1_DISP1_DATA17	0x61
+				MX6QDL_PAD_EIM_A23__IPU1_DISP1_DATA18	0x61
+				MX6QDL_PAD_EIM_A24__IPU1_DISP1_DATA19	0x61
+				MX6QDL_PAD_EIM_D31__IPU1_DISP1_DATA20	0x61
+				MX6QDL_PAD_EIM_D30__IPU1_DISP1_DATA21	0x61
+				MX6QDL_PAD_EIM_D26__IPU1_DISP1_DATA22	0x61
+				MX6QDL_PAD_EIM_D27__IPU1_DISP1_DATA23	0x61
+			>;
+		};
+		pinctrl_cam_mclk: cam_mclk {
+			fsl,pins =3D <
+				/* CAM sys_mclk */
+				MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x00b0
+			>;
+		};
+		pinctrl_ipu1_csi0: ipu1csi0grp { /* parallel camera */
+			fsl,pins =3D <
+				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12  0xb0b1
+				MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13  0xb0b1
+				MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14  0xb0b1
+				MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15  0xb0b1
+				MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16  0xb0b1
+				MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17  0xb0b1
+				MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18  0xb0b1
+				MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19  0xb0b1
+				MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK 0xb0b1
+				MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC    0xb0b1
+				MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC   0xb0b1
+			>;
+		};
+	};
+
+	pwm {
+		pinctrl_pwm1: pwm1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_9__PWM1_OUT 0x1b0b1
+			>;
+		};
+		pinctrl_pwm2: pwm2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_1__PWM2_OUT 0x1b0b1
+			>;
+		};
+		pinctrl_pwm3: pwm3grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD4_DAT1__PWM3_OUT 0x1b0b1
+			>;
+		};
+		pinctrl_pwm4: pwm4grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD4_DAT2__PWM4_OUT 0x1b0b1
+			>;
+		};
+	};
+
+	spdif {
+		pinctrl_spdif: spdifgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_16__SPDIF_IN  0x1b0b0
+				MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x1b0b0
+			>;
+		};
+	};
+
+	uart1 {
+		pinctrl_uart1_dce: uart1-dcegrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA 0x1b0b1
+				MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA 0x1b0b1
+			>;
+		};
+
+		/* DTE mode */
+		pinctrl_uart1_dte: uart1-dtegrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_CSI0_DAT10__UART1_RX_DATA 0x1b0b1
+				MX6QDL_PAD_CSI0_DAT11__UART1_TX_DATA 0x1b0b1
+				MX6QDL_PAD_EIM_D19__UART1_RTS_B 0x1b0b1
+				MX6QDL_PAD_EIM_D20__UART1_CTS_B 0x1b0b1
+			>;
+		};
+
+		/* Additional DTR, DSR, DCD */
+		pinctrl_uart1_ctrl: uart1-ctrlgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D23__UART1_DCD_B 0x1b0b0
+				MX6QDL_PAD_EIM_D24__UART1_DTR_B 0x1b0b0
+				MX6QDL_PAD_EIM_D25__UART1_DSR_B 0x1b0b0
+			>;
+		};
+	};
+
+	uart2 {
+		pinctrl_uart2_dce: uart2-dcegrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+			>;
+		};
+
+		/* DTE mode */
+		pinctrl_uart2_dte: uart2grp-dte {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD4_DAT4__UART2_TX_DATA	0x1b0b1
+				MX6QDL_PAD_SD4_DAT7__UART2_RX_DATA	0x1b0b1
+				MX6QDL_PAD_SD4_DAT6__UART2_RTS_B	0x1b0b1
+				MX6QDL_PAD_SD4_DAT5__UART2_CTS_B	0x1b0b1
+			>;
+		};
+	};
+
+	uart4 {
+		pinctrl_uart4_dce: uart4-dcegrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_COL0__UART4_TX_DATA 0x1b0b1
+				MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA 0x1b0b1
+			>;
+		};
+
+		/* DTE mode */
+		pinctrl_uart4_dte: uart4-dtegrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_COL0__UART4_RX_DATA 0x1b0b1
+				MX6QDL_PAD_KEY_ROW0__UART4_TX_DATA 0x1b0b1
+			>;
+		};
+	};
+
+	uart5 {
+		pinctrl_uart5_dce: uart5-dcegrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_COL1__UART5_TX_DATA 0x1b0b1
+				MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA 0x1b0b1
+			>;
+		};
+
+		/* DTE mode */
+		pinctrl_uart5_dte: uart5-dtegrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_COL1__UART5_RX_DATA 0x1b0b1
+				MX6QDL_PAD_KEY_ROW1__UART5_TX_DATA 0x1b0b1
+			>;
+		};
+	};
+
+	usbh {
+		pinctrl_regulator_usbh_pwr: gpio_regulator_usbh_pwr {
+			fsl,pins =3D <
+				/* USBH_EN */
+				MX6QDL_PAD_GPIO_0__GPIO1_IO00 PAD_CTRL_PU_22k
+			>;
+		};
+	};
+
+	usbotg {
+		pinctrl_usbotg: usbotggrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID 0x17059
+			>;
+		};
+		pinctrl_regulator_usbotg_pwr: gpio_regulator_usbotg_pwr {
+			fsl,pins =3D <
+				/* USBO power en */
+				MX6QDL_PAD_EIM_D22__GPIO3_IO22 PAD_CTRL_PU_22k
+			>;
+		};
+	};
+
+	usdhc {
+		pinctrl_mmc_cd: gpio_mmc_cd {
+			fsl,pins =3D <
+				 /* MMC1 CD */
+				MX6QDL_PAD_DI0_PIN4__GPIO4_IO20 0x000b0
+			>;
+		};
+		pinctrl_sd_cd: gpio_sd_cd {
+			fsl,pins =3D <
+				/* SD1 CD */
+				MX6QDL_PAD_NANDF_CS1__GPIO6_IO14 0x000b0
+			>;
+		};
+		pinctrl_usdhc1: usdhc1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD1_CMD__SD1_CMD    0x17071
+				MX6QDL_PAD_SD1_CLK__SD1_CLK    0x10071
+				MX6QDL_PAD_SD1_DAT0__SD1_DATA0 0x17071
+				MX6QDL_PAD_SD1_DAT1__SD1_DATA1 0x17071
+				MX6QDL_PAD_SD1_DAT2__SD1_DATA2 0x17071
+				MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17071
+				MX6QDL_PAD_NANDF_D0__SD1_DATA4 0x17071
+				MX6QDL_PAD_NANDF_D1__SD1_DATA5 0x17071
+				MX6QDL_PAD_NANDF_D2__SD1_DATA6 0x17071
+				MX6QDL_PAD_NANDF_D3__SD1_DATA7 0x17071
+			>;
+		};
+		pinctrl_usdhc2: usdhc2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD2_CMD__SD2_CMD    0x17071
+				MX6QDL_PAD_SD2_CLK__SD2_CLK    0x10071
+				MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x17071
+				MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x17071
+				MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x17071
+				MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x17071
+			>;
+		};
+	};
+};
+
+&ldb {
+	status =3D "okay";
+};
+
+&pwm1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm1>;
+	status =3D "disabled";
+};
+
+&pwm2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm2>;
+	status =3D "disabled";
+};
+
+&pwm3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm3>;
+	status =3D "disabled";
+};
+
+&pwm4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm4>;
+	status =3D "disabled";
+};
+
+&spdif {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_spdif>;
+	status =3D "disabled";
+};
+
+&ssi1 {
+	fsl,mode =3D "i2s-slave";
+	status =3D "okay";
+};
+
+&uart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1_dte &pinctrl_uart1_ctrl>;
+	fsl,dte-mode;
+	fsl,uart-has-rtscts;
+	status =3D "disabled";
+};
+
+&uart2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart2_dte>;
+	fsl,dte-mode;
+	fsl,uart-has-rtscts;
+	status =3D "disabled";
+};
+
+&uart4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart4_dte>;
+	fsl,dte-mode;
+	status =3D "disabled";
+};
+
+&uart5 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart5_dte>;
+	fsl,dte-mode;
+	status =3D "disabled";
+};
+
+&usbh1 {
+	vbus-supply =3D <&reg_usb_host_vbus>;
+	status =3D "disabled";
+};
+
+&usbotg {
+	vbus-supply =3D <&reg_usb_otg_vbus>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usbotg>;
+	disable-over-current;
+	status =3D "disabled";
+};
+
+/* MMC1 */
+&usdhc1 {
+	label =3D "MMC1";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc1 &pinctrl_mmc_cd>;
+	cd-gpios =3D <&gpio4 20 GPIO_ACTIVE_LOW>;
+	vmmc-supply =3D <&reg_3p3v>;
+	bus-width =3D <8>;
+	voltage-ranges =3D <3300 3300>;
+	status =3D "disabled";
+};
+
+/* SD1 */
+&usdhc2 {
+	label =3D "SD1";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc2 &pinctrl_sd_cd>;
+	cd-gpios =3D <&gpio6 14 GPIO_ACTIVE_LOW>;
+	vmmc-supply =3D <&reg_3p3v>;
+	bus-width =3D <4>;
+	voltage-ranges =3D <3300 3300>;
+	status =3D "disabled";
+};
+
+/* eMMC */
+&usdhc3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc3>;
+	vmmc-supply =3D <&reg_3p3v>;
+	bus-width =3D <8>;
+	voltage-ranges =3D <3300 3300>;
+	non-removable;
+	status =3D "okay";
+};
+
+&weim {
+	status =3D "disabled"; /* weim signals not accessible on i.MX6 */
+};
--=20
2.5.0
