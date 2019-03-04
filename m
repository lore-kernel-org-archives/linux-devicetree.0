From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 4/6] ARM: dts: tq imx7 common board support
Date: Mon,  4 Mar 2019 17:56:28 +0100
Message-ID: <20190304165630.18225-5-bruno.thomsen@gmail.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190304165630.18225-1-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, bruno.thomsen@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

This adds TQMa7 and MBa7 board support.
TQMa7 can be mounted with either i.MX7 Solo or Dual.
All TQMa7 board variants can be mounted in MBa7 carrier board.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 arch/arm/boot/dts/imx7-mba7.dtsi  | 586 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7-tqma7.dtsi | 232 ++++++++++++
 2 files changed, 818 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7-mba7.dtsi
 create mode 100644 arch/arm/boot/dts/imx7-tqma7.dtsi

diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi b/arch/arm/boot/dts/imx7-mba7.dtsi
new file mode 100644
index 000000000000..5c3862590f00
--- /dev/null
+++ b/arch/arm/boot/dts/imx7-mba7.dtsi
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Device Tree Include file for TQ Systems MBa7 carrier board.
+ *
+ * Copyright (C) 2016 TQ Systems GmbH
+ * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (C) 2019 Bruno Thomsen <bruno.thomsen@gmail.com>
+ *
+ * Note: This file does not include nodes for all peripheral devices.
+ * As device driver coverage increases additional nodes can be added.
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	beeper {
+		compatible = "gpio-beeper";
+		gpios = <&gpioexp 0 GPIO_ACTIVE_HIGH>;
+	};
+
+	chosen {
+		bootargs="ttymxc5,115200";
+		linux,stdout-path = &uart6;
+		stdout-path = &uart6;
+	};
+
+	gpio_buttons: gpio_keys {
+		compatible = "gpio-keys";
+
+		button-0 {
+			/* #SWITCH_A */
+			label = "S11";
+			linux,code = <KEY_1>;
+			gpios = <&gpioexp 13 GPIO_ACTIVE_LOW>;
+		};
+
+		button-1 {
+			/* #SWITCH_B */
+			label = "S12";
+			linux,code = <KEY_2>;
+			gpios = <&gpioexp 14 GPIO_ACTIVE_LOW>;
+		};
+
+		button-2 {
+			/* #SWITCH_C */
+			label = "S13";
+			linux,code = <KEY_3>;
+			gpios = <&gpioexp 15 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		status = "okay";
+
+		led1 {
+			label = "led1";
+			gpios = <&gpioexp 8 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		led2 {
+			label = "led2";
+			gpios = <&gpioexp 9 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_sd1_vmmc: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "VCC3V3_SD1";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
+		reg_fec1_pwdn: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "PWDN_FEC1";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_fec2_pwdn: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "PWDN_FEC2";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			gpio = <&gpio2 31 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usb_otg1_vbus: regulator@3 {
+			compatible = "regulator-fixed";
+			reg = <3>;
+			regulator-name = "VBUS_USBOTG1";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usb_otg2_vbus: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+			regulator-name = "VBUS_USBOTG2";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_mpcie_1v5: regulator@5 {
+			compatible = "regulator-fixed";
+			reg = <5>;
+			regulator-name = "VCC1V5_MPCIE";
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <1500000>;
+			gpio = <&gpioexp 12 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-always-on;
+		};
+
+		reg_mpcie_3v3: regulator@6 {
+			compatible = "regulator-fixed";
+			reg = <6>;
+			regulator-name = "VCC3V3_MPCIE";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpioexp 10 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-always-on;
+		};
+
+		reg_mba_12v0: regulator@7 {
+			compatible = "regulator-fixed";
+			reg = <7>;
+			regulator-name = "VCC12V0_MBA7";
+			regulator-min-microvolt = <12000000>;
+			regulator-max-microvolt = <12000000>;
+			gpio = <&gpioexp 11 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_lvds_transmitter: regulator@8 {
+			compatible = "regulator-fixed";
+			reg = <8>;
+			regulator-name = "#SHTDN_LVDS";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpioexp 1 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_vref_1v8: regulator@9 {
+			compatible = "regulator-fixed";
+			reg = <9>;
+			regulator-name = "VCC1V8_REF";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			vin-supply = <&sw2_reg>;
+		};
+
+		reg_audio_3v3: regulator@a {
+			compatible = "regulator-fixed";
+			reg = <0xa>;
+			regulator-name = "VCC3V3_AUDIO";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&adc2 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	fsl,spi-num-chipselects = <3>;
+	cs-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>, <&gpio4 1 GPIO_ACTIVE_LOW>,
+		   <&gpio4 2 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	fsl,spi-num-chipselects = <1>;
+	status = "okay";
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>;
+	phy-mode = "rgmii-id";
+	phy-reset-gpios = <&gpio7 15 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <1>;
+	phy-reset-delay = <1>;
+	phy-supply = <&reg_fec1_pwdn>;
+	phy-handle = <&ethphy1_0>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1_0: ethernet-phy1@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			/* LED1: Link/Activity, LED2: Error */
+			ti,led-function = <0x0db0>;
+			/* Active low, LED1 and LED2 driven by phy */
+			ti,led-ctrl = <0x1001>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&i2c1 {
+	sensor1: lm75@49 {
+		compatible = "lm75";
+		reg = <0x49>;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	codec: tlv320aic32x4@18 {
+		compatible = "ti,tlv320aic32x4";
+		reg = <0x18>;
+		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_CLK>;
+		clock-names = "mclk";
+		ldoin-supply = <&reg_audio_3v3>;
+		iov-supply = <&reg_audio_3v3>;
+	};
+
+	gpioexp: pca9555@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpioexp>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio7>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_mba7_1>;
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX7D_PAD_ECSPI1_MISO__ECSPI1_MISO		0x7c
+			MX7D_PAD_ECSPI1_MOSI__ECSPI1_MOSI		0x74
+			MX7D_PAD_ECSPI1_SCLK__ECSPI1_SCLK		0x74
+			MX7D_PAD_UART1_RX_DATA__GPIO4_IO0		0x74
+			MX7D_PAD_UART1_TX_DATA__GPIO4_IO1		0x74
+			MX7D_PAD_UART2_RX_DATA__GPIO4_IO2		0x74
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX7D_PAD_ECSPI2_MISO__ECSPI2_MISO		0x7c
+			MX7D_PAD_ECSPI2_MOSI__ECSPI2_MOSI		0x74
+			MX7D_PAD_ECSPI2_SCLK__ECSPI2_SCLK		0x74
+			MX7D_PAD_ECSPI2_SS0__ECSPI2_SS0			0x74
+		>;
+	};
+
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO10__ENET1_MDIO			0x02
+			MX7D_PAD_GPIO1_IO11__ENET1_MDC			0x00
+
+			MX7D_PAD_ENET1_RGMII_TXC__ENET1_RGMII_TXC	0x71
+			MX7D_PAD_ENET1_RGMII_TD0__ENET1_RGMII_TD0	0x71
+			MX7D_PAD_ENET1_RGMII_TD1__ENET1_RGMII_TD1	0x71
+			MX7D_PAD_ENET1_RGMII_TD2__ENET1_RGMII_TD2	0x71
+			MX7D_PAD_ENET1_RGMII_TD3__ENET1_RGMII_TD3	0x71
+			MX7D_PAD_ENET1_RGMII_TX_CTL__ENET1_RGMII_TX_CTL	0x71
+			MX7D_PAD_ENET1_RGMII_RXC__ENET1_RGMII_RXC	0x79
+			MX7D_PAD_ENET1_RGMII_RD0__ENET1_RGMII_RD0	0x79
+			MX7D_PAD_ENET1_RGMII_RD1__ENET1_RGMII_RD1	0x79
+			MX7D_PAD_ENET1_RGMII_RD2__ENET1_RGMII_RD2	0x79
+			MX7D_PAD_ENET1_RGMII_RD3__ENET1_RGMII_RD3	0x79
+			MX7D_PAD_ENET1_RGMII_RX_CTL__ENET1_RGMII_RX_CTL	0x79
+
+			/* Reset: SION, 100kPU, SRE_FAST, DSE_X1 */
+			MX7D_PAD_ENET1_COL__GPIO7_IO15		0x40000070
+
+			/* INT/PWDN: SION, 100kPU, HYS, SRE_FAST, DSE_X1 */
+			MX7D_PAD_GPIO1_IO09__GPIO1_IO9		0x40000078
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO12__FLEXCAN1_RX	0x5a
+			MX7D_PAD_GPIO1_IO13__FLEXCAN1_TX	0x52
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO14__FLEXCAN2_RX	0x5a
+			MX7D_PAD_GPIO1_IO15__FLEXCAN2_TX	0x52
+		>;
+	};
+
+	pinctrl_hog_mba7_1: hogmba71grp {
+		fsl,pins = <
+			/* Limitation: WDOG2_B / WDOG2_RESET not usable */
+			MX7D_PAD_ENET1_RX_CLK__GPIO7_IO13	0x4000007c
+			MX7D_PAD_ENET1_CRS__GPIO7_IO14		0x40000074
+			/* #BOOT_EN */
+			MX7D_PAD_UART2_TX_DATA__GPIO4_IO3	0x40000010
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX7D_PAD_I2C2_SCL__I2C2_SCL		0x40000078
+			MX7D_PAD_I2C2_SDA__I2C2_SDA		0x40000078
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX7D_PAD_I2C3_SCL__I2C3_SCL		0x40000078
+			MX7D_PAD_I2C3_SDA__I2C3_SDA		0x40000078
+		>;
+	};
+
+
+	pinctrl_gpioexp: pca95550grp {
+		fsl,pins = <
+			MX7D_PAD_ENET1_TX_CLK__GPIO7_IO12	0x78
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX7D_PAD_UART3_RX_DATA__UART3_DCE_RX	0x7e
+			MX7D_PAD_UART3_TX_DATA__UART3_DCE_TX	0x76
+			MX7D_PAD_UART3_CTS_B__UART3_DCE_CTS	0x76
+			MX7D_PAD_UART3_RTS_B__UART3_DCE_RTS	0x7e
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX7D_PAD_SAI2_TX_SYNC__UART4_DCE_RX	0x7e
+			MX7D_PAD_SAI2_TX_BCLK__UART4_DCE_TX	0x76
+			MX7D_PAD_SAI2_RX_DATA__UART4_DCE_CTS	0x76
+			MX7D_PAD_SAI2_TX_DATA__UART4_DCE_RTS	0x7e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX7D_PAD_I2C4_SCL__UART5_DCE_RX		0x7e
+			MX7D_PAD_I2C4_SDA__UART5_DCE_TX		0x76
+		>;
+	};
+
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_DATA08__UART6_DCE_RX	0x7d
+			MX7D_PAD_EPDC_DATA09__UART6_DCE_TX	0x75
+			MX7D_PAD_EPDC_DATA11__UART6_DCE_CTS	0x75
+			MX7D_PAD_EPDC_DATA10__UART6_DCE_RTS	0x7d
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_DATA12__UART7_DCE_RX	0x7e
+			MX7D_PAD_EPDC_DATA13__UART7_DCE_TX	0x76
+			MX7D_PAD_EPDC_DATA15__UART7_DCE_CTS	0x76
+			/* Limitation: RTS is not connected */
+			MX7D_PAD_EPDC_DATA14__UART7_DCE_RTS	0x7e
+		>;
+	};
+
+	pinctrl_usdhc1_gpio: usdhc1grp_gpio {
+		fsl,pins = <
+			/* WP */
+			MX7D_PAD_SD1_WP__GPIO5_IO1		0x7c
+			/* CD */
+			MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x7c
+			/* VSELECT */
+			MX7D_PAD_GPIO1_IO08__SD1_VSELECT	0x59
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX7D_PAD_SD1_CMD__SD1_CMD		0x5e
+			MX7D_PAD_SD1_CLK__SD1_CLK		0x57
+			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5e
+			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5e
+			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5e
+			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
+		fsl,pins = <
+			MX7D_PAD_SD1_CMD__SD1_CMD		0x5a
+			MX7D_PAD_SD1_CLK__SD1_CLK		0x57
+			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5a
+			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5a
+			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5a
+			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5a
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1grp_200mhz {
+		fsl,pins = <
+			MX7D_PAD_SD1_CMD__SD1_CMD		0x5b
+			MX7D_PAD_SD1_CLK__SD1_CLK		0x57
+			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5b
+			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5b
+			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5b
+			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5b
+		>;
+	};
+};
+
+&iomuxc_lpsr {
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			/* LCD_CONTRAST */
+			MX7D_PAD_LPSR_GPIO1_IO01__PWM1_OUT	0x50
+		>;
+	};
+
+	pinctrl_usbotg1: usbotg1grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__USB_OTG1_OC	0x5c
+			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x59
+		>;
+	};
+
+	pinctrl_wdog1: wdog1grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B	0x30
+		>;
+	};
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	assigned-clocks = <&clks IMX7D_UART3_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	assigned-clocks = <&clks IMX7D_UART4_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	status = "okay";
+};
+
+&uart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	assigned-clocks = <&clks IMX7D_UART5_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	status = "okay";
+};
+
+&uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	assigned-clocks = <&clks IMX7D_UART6_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	status = "okay";
+};
+
+&uart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	assigned-clocks = <&clks IMX7D_UART7_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	fsl,uart-has-rtscts;
+	status = "okay";
+};
+
+&usbh {
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg1>;
+	vbus-supply = <&reg_usb_otg1_vbus>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
+	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	bus-width = <4>;
+	no-1-8-v;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog1>;
+	fsl,wdog_b;
+};
diff --git a/arch/arm/boot/dts/imx7-tqma7.dtsi b/arch/arm/boot/dts/imx7-tqma7.dtsi
new file mode 100644
index 000000000000..98a395e64556
--- /dev/null
+++ b/arch/arm/boot/dts/imx7-tqma7.dtsi
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Device Tree Include file for TQ Systems TQMa7x boards with full mounted PCB.
+ *
+ * Copyright (C) 2016 TQ Systems GmbH
+ * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (C) 2019 Bruno Thomsen <bruno.thomsen@gmail.com>
+ */
+
+/ {
+	memory@80000000 {
+		device_type = "memory";
+		/* 512 MB - default configuration */
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&cpu0 {
+	arm-supply = <&sw1a_reg>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	pmic: pfuze3000@8 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic1>;
+		compatible = "fsl,pfuze3000";
+		reg = <0x08>;
+
+		regulators {
+			sw1a_reg: sw1a {
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			/* use sw1c_reg to align with pfuze100/pfuze200 */
+			sw1c_reg: sw1b {
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1475000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			sw2_reg: sw2 {
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw3a_reg: sw3 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1650000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			swbst_reg: swbst {
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5150000>;
+			};
+
+			snvs_reg: vsnvs {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vref_reg: vrefddr {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen1_reg: vldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen2_reg: vldo2 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1550000>;
+				regulator-always-on;
+			};
+
+			vgen3_reg: vccsd {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen4_reg: v33 {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen5_reg: vldo3 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen6_reg: vldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
+
+	/* NXP SE97BTP with temperature sensor + eeprom */
+	sensor0: jc42@1e {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1e>;
+		status = "okay";
+	};
+
+	/* ST M24C64 */
+	eeprom0: m24c64@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		status = "okay";
+	};
+
+	eeprom1: 24c02@56 {
+		compatible = "atmel,24c02";
+		reg = <0x56>;
+		pagesize = <16>;
+		status = "okay";
+	};
+
+	rtc1: ds1339@68 {
+		compatible = "ds1339";
+		reg = <0x68>;
+	};
+};
+
+&iomuxc {
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX7D_PAD_I2C1_SDA__I2C1_SDA	0x40000078
+			MX7D_PAD_I2C1_SCL__I2C1_SCL	0x40000078
+		>;
+	};
+
+	pinctrl_pmic1: pmic1grp {
+		fsl,pins = <
+			MX7D_PAD_SD2_RESET_B__GPIO5_IO11	0x4000005C
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
+			MX7D_PAD_SD3_CLK__SD3_CLK		0x56
+			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x59
+			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x59
+			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x59
+			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x59
+			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x59
+			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x59
+			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59
+			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
+			MX7D_PAD_SD3_STROBE__SD3_STROBE		0x19
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
+		fsl,pins = <
+			MX7D_PAD_SD3_CMD__SD3_CMD               0x5a
+			MX7D_PAD_SD3_CLK__SD3_CLK               0x51
+			MX7D_PAD_SD3_DATA0__SD3_DATA0           0x5a
+			MX7D_PAD_SD3_DATA1__SD3_DATA1           0x5a
+			MX7D_PAD_SD3_DATA2__SD3_DATA2           0x5a
+			MX7D_PAD_SD3_DATA3__SD3_DATA3           0x5a
+			MX7D_PAD_SD3_DATA4__SD3_DATA4           0x5a
+			MX7D_PAD_SD3_DATA5__SD3_DATA5           0x5a
+			MX7D_PAD_SD3_DATA6__SD3_DATA6           0x5a
+			MX7D_PAD_SD3_DATA7__SD3_DATA7           0x5a
+			MX7D_PAD_SD3_STROBE__SD3_STROBE         0x1a
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3grp_200mhz {
+		fsl,pins = <
+			MX7D_PAD_SD3_CMD__SD3_CMD               0x5b
+			MX7D_PAD_SD3_CLK__SD3_CLK               0x51
+			MX7D_PAD_SD3_DATA0__SD3_DATA0           0x5b
+			MX7D_PAD_SD3_DATA1__SD3_DATA1           0x5b
+			MX7D_PAD_SD3_DATA2__SD3_DATA2           0x5b
+			MX7D_PAD_SD3_DATA3__SD3_DATA3           0x5b
+			MX7D_PAD_SD3_DATA4__SD3_DATA4           0x5b
+			MX7D_PAD_SD3_DATA5__SD3_DATA5           0x5b
+			MX7D_PAD_SD3_DATA6__SD3_DATA6           0x5b
+			MX7D_PAD_SD3_DATA7__SD3_DATA7           0x5b
+			MX7D_PAD_SD3_STROBE__SD3_STROBE         0x1b
+		>;
+	};
+};
+
+&sdma {
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	assigned-clocks = <&clks IMX7D_USDHC3_ROOT_CLK>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <8>;
+	non-removable;
+	vmmc-supply = <&vgen4_reg>;
+	vqmmc-supply = <&sw2_reg>;
+	status = "okay";
+};
+
+&wdog1 {
+	status = "okay";
+};
-- 
2.20.1
