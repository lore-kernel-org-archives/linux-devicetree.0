From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH] ARM: dts: add support for Ka-Ro TX51
Date: Thu, 12 Jun 2014 15:09:44 +0200
Message-ID: <1402578584-12640-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for Ka-Ro electronics i.MX51 based TX51 modules

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/Makefile       |    1 +
 arch/arm/boot/dts/imx51-tx51.dts |  620 ++++++++++++++++++++++++++++++=
++++++++
 2 files changed, 621 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx51-tx51.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0f1e8be..8dd4dbc 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -177,6 +177,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
 	imx51-babbage.dtb \
 	imx51-digi-connectcore-jsk.dtb \
 	imx51-eukrea-mbimxsd51-baseboard.dtb \
+	imx51-tx51.dtb \
 	imx53-ard.dtb \
 	imx53-m53evk.dtb \
 	imx53-mba53.dtb \
diff --git a/arch/arm/boot/dts/imx51-tx51.dts b/arch/arm/boot/dts/imx51=
-tx51.dts
new file mode 100644
index 0000000..9ae7758
--- /dev/null
+++ b/arch/arm/boot/dts/imx51-tx51.dts
@@ -0,0 +1,620 @@
+/*
+ * Copyright 2012-2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+#include "imx51.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	model =3D "Ka-Ro electronics TX51 module";
+	compatible =3D "karo,tx51", "fsl,imx51";
+
+	aliases {
+		backlight =3D &backlight;
+		display =3D &display;
+		i2c1 =3D &i2c_gpio;
+		usbotg =3D &usbotg;
+	};
+
+	chosen {
+		stdout-path =3D &uart1;
+	};
+
+	backlight: pwm-backlight {
+		compatible =3D "pwm-backlight";
+
+		pwms =3D <&pwm1 0 500000 PWM_POLARITY_INVERTED>;
+		power-supply =3D <&reg_3v3>;
+		brightness-levels =3D <
+			  0  1  2  3  4  5  6  7  8  9
+			 10 11 12 13 14 15 16 17 18 19
+			 20 21 22 23 24 25 26 27 28 29
+			 30 31 32 33 34 35 36 37 38 39
+			 40 41 42 43 44 45 46 47 48 49
+			 50 51 52 53 54 55 56 57 58 59
+			 60 61 62 63 64 65 66 67 68 69
+			 70 71 72 73 74 75 76 77 78 79
+			 80 81 82 83 84 85 86 87 88 89
+			 90 91 92 93 94 95 96 97 98 99
+			100
+		>;
+		default-brightness-level =3D <50>;
+	};
+
+	clocks {
+		ckih1 {
+			clock-frequency =3D <0>;
+		};
+
+		mclk: clock@0 {
+			compatible =3D "fixed-clock";
+			reg =3D <0>;
+			#clock-cells =3D <0>;
+			clock-frequency =3D <27000000>;
+		};
+
+		clk_26M: clock@1 {
+			compatible =3D "fixed-clock";
+			reg =3D <1>;
+			#clock-cells =3D <0>;
+			clock-frequency =3D <26000000>;
+			gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		interface-pix-fmt =3D "rgb24";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_ipu_disp0>;
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu_di0_disp0>;
+			};
+		};
+
+		display-timings {
+			VGA {
+				clock-frequency =3D <25200000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <48>;
+				hsync-len =3D <96>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <31>;
+				vsync-len =3D <2>;
+				vfront-porch =3D <12>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ETV570 {
+				clock-frequency =3D <25200000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <114>;
+				hsync-len =3D <30>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <32>;
+				vsync-len =3D <3>;
+				vfront-porch =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ET0350 {
+				clock-frequency =3D <6413760>;
+				hactive =3D <320>;
+				vactive =3D <240>;
+				hback-porch =3D <34>;
+				hsync-len =3D <34>;
+				hfront-porch =3D <20>;
+				vback-porch =3D <15>;
+				vsync-len =3D <3>;
+				vfront-porch =3D <4>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ET0430 {
+				clock-frequency =3D <9009000>;
+				hactive =3D <480>;
+				vactive =3D <272>;
+				hback-porch =3D <2>;
+				hsync-len =3D <41>;
+				hfront-porch =3D <2>;
+				vback-porch =3D <2>;
+				vsync-len =3D <10>;
+				vfront-porch =3D <2>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+
+			ET0500 {
+				clock-frequency =3D <33264000>;
+				hactive =3D <800>;
+				vactive =3D <480>;
+				hback-porch =3D <88>;
+				hsync-len =3D <128>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <33>;
+				vsync-len =3D <2>;
+				vfront-porch =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ET0700 { /* same as ET0500 */
+				clock-frequency =3D <33264000>;
+				hactive =3D <800>;
+				vactive =3D <480>;
+				hback-porch =3D <88>;
+				hsync-len =3D <128>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <33>;
+				vsync-len =3D <2>;
+				vfront-porch =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			ETQ570 {
+				clock-frequency =3D <6596040>;
+				hactive =3D <320>;
+				vactive =3D <240>;
+				hback-porch =3D <38>;
+				hsync-len =3D <30>;
+				hfront-porch =3D <30>;
+				vback-porch =3D <16>;
+				vsync-len =3D <3>;
+				vfront-porch =3D <4>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+		};
+	};
+
+	i2c_gpio: i2c-gpio {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		compatible =3D "i2c-gpio";
+		gpios =3D <&gpio4 17 0
+			 &gpio4 16 0>;
+		clock-frequency =3D <400000>;
+
+		rtc1: ds1339@68 {
+			compatible =3D "dallas,ds1339";
+			reg =3D <0x68>;
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_stk5led>;
+
+		user {
+			label =3D "Heartbeat";
+			gpios =3D <&gpio4 10 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+
+	regulators {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		reg_2v5: regulator@0 {
+			compatible =3D "regulator-fixed";
+			reg =3D <0>;
+			regulator-name =3D "2V5";
+			regulator-min-microvolt =3D <2500000>;
+			regulator-max-microvolt =3D <2500000>;
+			regulator-always-on;
+		};
+
+		reg_3v3: regulator@1 {
+			compatible =3D "regulator-fixed";
+			reg =3D <1>;
+			regulator-name =3D "3V3";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			regulator-always-on;
+		};
+
+		reg_etn_phy: regulator@2 {
+			compatible =3D "regulator-fixed";
+			reg =3D <2>;
+			regulator-name =3D "ETN PHY Power";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio1 3 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		reg_lcd_pwr: regulator@5 {
+			compatible =3D "regulator-fixed";
+			reg =3D <5>;
+			regulator-name =3D "LCD POWER";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio4 14 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		reg_lcd_reset: regulator@6 {
+			compatible =3D "regulator-fixed";
+			reg =3D <6>;
+			regulator-name =3D "LCD RESET";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_lcd_reset>;
+			gpio =3D <&gpio4 13 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+	};
+
+	sound {
+		compatible =3D "karo,tx51-audio-sgtl5000", "fsl,imx-sgtl5000";
+		model =3D "tx53-audio-sgtl5000";
+		ssi-controller =3D <&ssi1>;
+		audio-codec =3D <&sgtl5000>;
+		audio-routing =3D
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+		/* '1' based port numbers according to datasheet names */
+		mux-int-port =3D <1>;
+		mux-ext-port =3D <3>;
+		sysclk =3D <26000000>;
+	};
+
+	usbphy {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		compatible =3D "simple-bus";
+
+		usbh1phy: usbh1phy@0 {
+			compatible =3D "usb-nop-xceiv";
+			reg =3D <0>;
+			clocks =3D <&clk_26M>;
+			clock-names =3D "main_clk";
+		};
+	};
+};
+
+&audmux {
+	status =3D "okay";
+};
+
+&fec {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_fec>;
+	phy-mode =3D "mii";
+//	phy-reset-gpios =3D <&gpio2 14 GPIO_ACTIVE_LOW>;
+	phy-handle =3D <&phy0>;
+	mac-address =3D [000000000000]; /* will be set by U-Boot */
+	status =3D "okay";
+
+	phy0: ethernet-phy@0 {
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <18 0>;
+		device_type =3D "ethernet-phy";
+	};
+};
+
+&ipu {
+	status =3D "okay";
+};
+
+&i2c2 {
+	status =3D "okay";
+
+	sgtl5000: sgtl5000@0a {
+		compatible =3D "fsl,sgtl5000";
+		reg =3D <0x0a>;
+		clocks =3D <&mclk>;
+		VDDA-supply =3D <&reg_2v5>;
+		VDDIO-supply =3D <&reg_3v3>;
+	};
+
+	polytouch: edt-ft5x06@38 {
+		compatible =3D "edt,edt-ft5x06";
+		reg =3D <0x38>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_edt_ft5x06>;
+		interrupt-parent =3D <&gpio1>;
+		interrupts =3D <5 0>;
+		reset-gpios =3D <&gpio4 15 GPIO_ACTIVE_LOW>;
+		wake-gpios =3D <&gpio4 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	touchscreen: tsc2007@48 {
+		compatible =3D "ti,tsc2007";
+		reg =3D <0x48>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_tsc2007>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <3 0>;
+		gpios =3D <&gpio3 3 GPIO_ACTIVE_LOW>;
+		ti,x-plate-ohms =3D <660>;
+		linux,wakeup;
+	};
+};
+
+&iomuxc {
+	imx51-tx51 {
+		pinctrl_hog: hoggrp {
+			fsl,pins =3D <
+				MX51_PAD_GPIO1_7__GPIO1_7	0x20e0	/* 26MHz osc enable */
+			>;
+		};
+
+		pinctrl_edt_ft5x06: edt-ft5x056grp {
+			fsl,pins =3D <
+				MX51_PAD_GPIO1_5__GPIO1_5	0x20e0	/* Interrupt */
+				MX51_PAD_CSI2_PIXCLK__GPIO4_15	0x20e0	/* Reset */
+				MX51_PAD_CSI2_D12__GPIO4_9	0x20e0	/* Wake */
+			>;
+		};
+
+		pinctrl_fec: fecgrp {
+			fsl,pins =3D <
+				MX51_PAD_EIM_A20__GPIO2_14	0x20e4	/* PHY reset */
+				MX51_PAD_GPIO1_3__GPIO1_3	0x20e4	/* PHY power */
+				MX51_PAD_NANDF_CS3__FEC_MDC	0x2004
+				MX51_PAD_EIM_EB2__FEC_MDIO	0x0005
+				MX51_PAD_NANDF_RB3__FEC_RX_CLK	0x2000
+				MX51_PAD_NANDF_D11__FEC_RX_DV	0x2000
+				MX51_PAD_NANDF_D9__FEC_RDATA0	0x2000
+				MX51_PAD_EIM_EB3__FEC_RDATA1	0x0001
+				MX51_PAD_EIM_CS2__FEC_RDATA2	0x0001
+				MX51_PAD_EIM_CS3__FEC_RDATA3	0x0001
+				MX51_PAD_EIM_CS4__FEC_RX_ER	0x0001
+				MX51_PAD_NANDF_RDY_INT__FEC_TX_CLK 0x2000
+				MX51_PAD_NANDF_CS7__FEC_TX_EN	0x2004
+				MX51_PAD_NANDF_D8__FEC_TDATA0	0x2004
+				MX51_PAD_NANDF_CS4__FEC_TDATA1	0x2004
+				MX51_PAD_NANDF_CS5__FEC_TDATA2	0x2004
+				MX51_PAD_NANDF_CS6__FEC_TDATA3	0x2004
+				MX51_PAD_NANDF_RB2__FEC_COL	0x2000
+				MX51_PAD_EIM_CS5__FEC_CRS	0x0005
+				MX51_PAD_NANDF_CS2__GPIO3_18	0x20e4
+			>;
+		};
+
+		pinctrl_fec_gpio: fec-gpiogrp {
+			fsl,pins =3D <
+				MX51_PAD_EIM_A20__GPIO2_14	0x20e4	/* PHY reset */
+				MX51_PAD_GPIO1_3__GPIO1_3	0x20e4	/* PHY power */
+				MX51_PAD_NANDF_RB3__GPIO3_11	0x20e4	/* RX_CLK/REGOFF */
+				MX51_PAD_NANDF_D9__GPIO3_31	0x20e4	/* RXD0/Mode0 */
+				MX51_PAD_EIM_EB3__GPIO2_23	0x20e4	/* RXD1/Mode1 */
+				MX51_PAD_EIM_CS2__GPIO2_27	0x20e4	/* RXD2/Mode2 */
+				MX51_PAD_EIM_CS3__GPIO2_28	0x20e4	/* RXD3/nINTSEL */
+				MX51_PAD_NANDF_RB2__GPIO3_10	0x20e4	/* COL/RMII/CRSDV */
+				MX51_PAD_EIM_CS5__GPIO2_30	0x20e4	/* CRS/PHYAD4 */
+			>;
+		};
+
+		pinctrl_ipu_disp0: ipu-disp0grp {
+			fsl,pins =3D <
+			>;
+		};
+
+		pinctrl_kpp_2: kppgrp-2 {
+			fsl,pins =3D <
+				MX51_PAD_KEY_ROW0__KEY_ROW0	0xe0
+				MX51_PAD_KEY_ROW1__KEY_ROW1	0xe0
+				MX51_PAD_KEY_ROW2__KEY_ROW2	0xe0
+				MX51_PAD_KEY_ROW3__KEY_ROW3	0xe0
+				MX51_PAD_KEY_COL0__KEY_COL0	0xe8
+				MX51_PAD_KEY_COL1__KEY_COL1	0xe8
+				MX51_PAD_KEY_COL2__KEY_COL2	0xe8
+				MX51_PAD_KEY_COL3__KEY_COL3	0xe8
+				MX51_PAD_KEY_COL4__KEY_COL4	0xe8
+				MX51_PAD_KEY_COL5__KEY_COL5	0xe8
+			>;
+		};
+
+		pinctrl_lcd_pwr: lcd-pwrgrp {
+			fsl,pins =3D <
+				MX51_PAD_CSI2_HSYNC__GPIO4_14	0x04
+			>;
+		};
+
+		pinctrl_lcd_reset: lcd-resetgrp {
+			fsl,pins =3D <
+				MX51_PAD_CSI2_VSYNC__GPIO4_13	0x04
+			>;
+		};
+
+		pinctrl_pwm1: pwm1grp {
+			fsl,pins =3D <
+				MX51_PAD_GPIO1_2__PWM1_PWMO	0x0f4
+			>;
+		};
+
+		pinctrl_stk5led: stk5ledgrp {
+			fsl,pins =3D <
+				MX51_PAD_CSI2_D13__GPIO4_10	0x20e4
+			>;
+		};
+
+		pinctrl_tsc2007: tsc2007grp {
+			fsl,pins =3D <
+				MX51_PAD_DI1_D0_CS__GPIO3_3	0xc0	/* Interrupt */
+			>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <
+				MX51_PAD_UART1_RXD__UART1_RXD	0x1c1
+				MX51_PAD_UART1_TXD__UART1_TXD	0x1c5
+				MX51_PAD_UART1_RTS__UART1_RTS	0x1c1
+				MX51_PAD_UART1_CTS__UART1_CTS	0x1c5
+			>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins =3D <
+				MX51_PAD_UART2_RXD__UART2_RXD	0x1c1
+				MX51_PAD_UART2_TXD__UART2_TXD	0x1c5
+				MX51_PAD_EIM_D26__UART2_RTS	0x1c1
+				MX51_PAD_EIM_D25__UART2_CTS	0x1c5
+			>;
+		};
+
+		pinctrl_uart3: uart3grp {
+			fsl,pins =3D <
+				MX51_PAD_UART3_RXD__UART3_RXD	0x1c1
+				MX51_PAD_UART3_TXD__UART3_TXD	0x1c5
+				MX51_PAD_EIM_D18__UART3_RTS	0x1c1
+				MX51_PAD_EIM_D17__UART3_CTS	0x1c5
+			>;
+		};
+	};
+};
+
+&ipu_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&kpp {
+	status =3D "okay";
+
+	linux,keymap =3D <	/* sample keymap */
+		MATRIX_KEY(0, 0, KEY_POWER)
+		MATRIX_KEY(0, 1, KEY_KP0)
+		MATRIX_KEY(0, 2, KEY_KP1)
+		MATRIX_KEY(0, 3, KEY_KP2)
+		MATRIX_KEY(1, 0, KEY_KP3)
+		MATRIX_KEY(1, 1, KEY_KP4)
+		MATRIX_KEY(1, 2, KEY_KP5)
+		MATRIX_KEY(1, 3, KEY_KP6)
+		MATRIX_KEY(2, 0, KEY_KP7)
+		MATRIX_KEY(2, 1, KEY_KP8)
+		MATRIX_KEY(2, 2, KEY_KP9)
+	>;
+};
+
+&esdhc1 {
+	cd-gpios =3D <&gpio3 8 GPIO_ACTIVE_LOW>;
+	fsl,wp-controller;
+	status =3D "okay";
+};
+
+&esdhc2 {
+	cd-gpios =3D <&gpio3 6 GPIO_ACTIVE_LOW>;
+	fsl,wp-controller;
+	status =3D "okay";
+};
+
+&pwm1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm1>;
+};
+
+&ecspi1 {
+	fsl,spi-num-chipselects =3D <2>;
+	cs-gpios =3D <&gpio4 24 GPIO_ACTIVE_LOW &gpio4 25 GPIO_ACTIVE_LOW>;
+	status =3D "okay";
+
+	spidev0: spi@0 {
+		compatible =3D "spidev";
+		reg =3D <0>;
+		spi-max-frequency =3D <54000000>;
+	};
+
+	spidev1: spi@1 {
+		compatible =3D "spidev";
+		reg =3D <1>;
+		spi-max-frequency =3D <54000000>;
+	};
+};
+
+&ssi1 {
+	fsl,mode =3D "i2s-slave";
+	codec-handle =3D <&sgtl5000>;
+	status =3D "okay";
+};
+
+&ssi2 {
+	status =3D "disabled";
+};
+
+&uart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&uart2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart2>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&uart3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart3>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&usbh1 {
+	phy_type =3D "ulpi";
+	fsl,usbphy =3D <&usbh1phy>;
+	ignore-overcurrent;
+	enable-wakeup;
+	status =3D "okay";
+};
+
+&usbotg {
+	ignore-overcurrent;
+	enable-wakeup;
+	phy_type =3D "utmi_wide";
+	status =3D "okay";
+};
+
+&nfc {
+	nand-bus-width =3D <8>;
+	nand-ecc-mode =3D "hw";
+	nand-on-flash-bbt;
+	status =3D "okay";
+};
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
