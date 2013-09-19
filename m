From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH RESEND] ARM: dts: tx28: restructure and update DTS file
Date: Thu, 19 Sep 2013 08:59:50 +0200
Message-ID: <1379573990-27556-5-git-send-email-LW@KARO-electronics.de>
References: <1379573990-27556-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379573990-27556-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the Ka-Ro TX28 DTS file.

- add Copyright header
- use label references for better readability
- sort the entries alphabetically
- add some aliases used by U-Boot to modify the DT data

This patch requires the patch "ARM: dts: mxs: add pinctrl header files"
to be applied.

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/imx28-tx28.dts |  720 ++++++++++++++++++++++++++++++=
+++-----
 1 files changed, 637 insertions(+), 83 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28=
-tx28.dts
index 37be532..b7c79fb 100644
--- a/arch/arm/boot/dts/imx28-tx28.dts
+++ b/arch/arm/boot/dts/imx28-tx28.dts
@@ -1,106 +1,139 @@
+/*
+ * Copyright 2012 Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+ * Copyright 2013 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
 /dts-v1/;
-/include/ "imx28.dtsi"
+#include "imx28.dtsi"
+#include <dt-bindings/gpio/gpio.h>
=20
 / {
 	model =3D "Ka-Ro electronics TX28 module";
 	compatible =3D "karo,tx28", "fsl,imx28";
=20
+	aliases {
+		can0 =3D &can0;
+		can1 =3D &can1;
+		display =3D &display;
+		ds1339 =3D &ds1339;
+		gpio5 =3D &gpio5;
+		stk5led =3D &user_led;
+		usbotg =3D &usb0;
+		lcdif =3D &lcdif;
+		lcdif_24bit_pins =3D &lcdif_24bit_pins_a;
+		lcdif_23bit_pins =3D &tx28_lcdif_23bit_pins;
+	};
+
 	memory {
-		reg =3D <0x40000000 0x08000000>;
-	};
-
-	apb@80000000 {
-		apbh@80000000 {
-			ssp0: ssp@80010000 {
-				compatible =3D "fsl,imx28-mmc";
-				pinctrl-names =3D "default";
-				pinctrl-0 =3D <&mmc0_4bit_pins_a
-					     &mmc0_cd_cfg
-					     &mmc0_sck_cfg>;
-				bus-width =3D <4>;
-				status =3D "okay";
-			};
+		reg =3D <0 0>; /* will be filled in by U-Boot */
+	};
=20
-			pinctrl@80018000 {
-				pinctrl-names =3D "default";
-				pinctrl-0 =3D <&hog_pins_a>;
-
-				hog_pins_a: hog@0 {
-					reg =3D <0>;
-					fsl,pinmux-ids =3D <
-						0x40a3 /* MX28_PAD_ENET0_RXD3__GPIO_4_10 */
-					>;
-					fsl,drive-strength =3D <0>;
-					fsl,voltage =3D <1>;
-					fsl,pull-up =3D <0>;
-				};
-
-				mac0_pins_gpio: mac0-gpio-mode@0 {
-					reg =3D <0>;
-					fsl,pinmux-ids =3D <
-						0x4003 /* MX28_PAD_ENET0_MDC__GPIO_4_0 */
-						0x4013 /* MX28_PAD_ENET0_MDIO__GPIO_4_1 */
-						0x4023 /* MX28_PAD_ENET0_RX_EN__GPIO_4_2 */
-						0x4033 /* MX28_PAD_ENET0_RXD0__GPIO_4_3 */
-						0x4043 /* MX28_PAD_ENET0_RXD1__GPIO_4_4 */
-						0x4063 /* MX28_PAD_ENET0_TX_EN__GPIO_4_6 */
-						0x4073 /* MX28_PAD_ENET0_TXD0__GPIO_4_7 */
-						0x4083 /* MX28_PAD_ENET0_TXD1__GPIO_4_8 */
-						0x4103 /* MX28_PAD_ENET_CLK__GPIO_4_16 */
-					>;
-					fsl,drive-strength =3D <0>;
-					fsl,voltage =3D <1>;
-					fsl,pull-up =3D <0>;
-				};
-			};
+	onewire@0 {
+		compatible =3D "w1-gpio";
+		gpios =3D <&gpio2 7 0>;
+		status =3D "disabled";
+	};
+
+	regulators {
+		compatible =3D "simple-bus";
+
+		reg_usb0_vbus: usb0_vbus {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "usb0_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&gpio0 18 0>;
+			enable-active-high;
 		};
=20
-		apbx@80040000 {
-			i2c0: i2c@80058000 {
-				pinctrl-names =3D "default";
-				pinctrl-0 =3D <&i2c0_pins_a>;
-				status =3D "okay";
+		reg_usb1_vbus: usb1_vbus {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "usb1_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&gpio3 27 0>;
+			enable-active-high;
+		};
=20
-				ds1339: rtc@68 {
-					compatible =3D "mxim,ds1339";
-					reg =3D <0x68>;
-				};
-			};
+		reg_2p5v: 2p5v {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "2P5V";
+			regulator-min-microvolt =3D <2500000>;
+			regulator-max-microvolt =3D <2500000>;
+			regulator-always-on;
+		};
=20
-			pwm: pwm@80064000 {
-				pinctrl-names =3D "default";
-				pinctrl-0 =3D <&pwm0_pins_a>;
-				status =3D "okay";
-			};
+		reg_3p3v: 3p3v {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "3P3V";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			regulator-always-on;
+		};
=20
-			duart: serial@80074000 {
-				pinctrl-names =3D "default";
-				pinctrl-0 =3D <&duart_4pins_a>;
-				status =3D "okay";
-			};
+		reg_can_xcvr: can-xcvr {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "CAN XCVR";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio1 0 0>;
+			enable-active-low;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&tx28_flexcan_xcvr_pins>;
+		};
=20
-			auart1: serial@8006c000 {
-				pinctrl-names =3D "default";
-				pinctrl-0 =3D <&auart1_pins_a>;
-				status =3D "okay";
-			};
+		reg_lcd: lcd-power {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "LCD POWER";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio1 31 0>;
+			enable-active-high;
+		};
+
+		reg_lcd_reset: lcd-reset {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "LCD RESET";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio3 30 0>;
+			startup-delay-us =3D <300000>;
+			enable-active-high;
+			regulator-always-on;
+			regulator-boot-on;
 		};
 	};
=20
-	ahb@80080000 {
-		mac0: ethernet@800f0000 {
-			phy-mode =3D "rmii";
-			pinctrl-names =3D "default", "gpio_mode";
-			pinctrl-0 =3D <&mac0_pins_a>;
-			pinctrl-1 =3D <&mac0_pins_gpio>;
-			status =3D "okay";
+	clocks {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		mclk: codec_clock {
+			compatible =3D "fixed-clock";
+			reg =3D <0>;
+			#clock-cells =3D <0>;
+			clock-frequency =3D <27000000>;
 		};
 	};
=20
+	sound {
+		compatible =3D "fsl,imx28-tx28-sgtl5000",
+			     "fsl,mxs-audio-sgtl5000";
+		model =3D "imx28-tx28-sgtl5000";
+		saif-controllers =3D <&saif0 &saif1>;
+		audio-codec =3D <&sgtl5000>;
+	};
+
 	leds {
 		compatible =3D "gpio-leds";
=20
-		user {
+		user_led: user {
 			label =3D "Heartbeat";
 			gpios =3D <&gpio4 10 0>;
 			linux,default-trigger =3D "heartbeat";
@@ -109,8 +142,529 @@
=20
 	backlight {
 		compatible =3D "pwm-backlight";
-		pwms =3D <&pwm 0 5000000>;
-		brightness-levels =3D <0 4 8 16 32 64 128 255>;
-		default-brightness-level =3D <6>;
+		pwms =3D <&pwm 0 500000>;
+		/*
+		 * a silly way to create a 1:1 relationship between the
+		 * PWM value and the actual duty cycle
+		 */
+		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
+				     10 11 12 13 14 15 16 17 18 19
+				     20 21 22 23 24 25 26 27 28 29
+				     30 31 32 33 34 35 36 37 38 39
+				     40 41 42 43 44 45 46 47 48 49
+				     50 51 52 53 54 55 56 57 58 59
+				     60 61 62 63 64 65 66 67 68 69
+				     70 71 72 73 74 75 76 77 78 79
+				     80 81 82 83 84 85 86 87 88 89
+				     90 91 92 93 94 95 96 97 98 99
+				    100>;
+		default-brightness-level =3D <50>;
+	};
+
+	matrix_keypad: matrix-keypad@0 {
+		compatible =3D "gpio-matrix-keypad";
+		col-gpios =3D <
+			&gpio5 0 0
+			&gpio5 1 0
+			&gpio5 2 0
+			&gpio5 3 0
+		>;
+
+		row-gpios =3D <
+			&gpio5 4 0
+			&gpio5 5 0
+			&gpio5 6 0
+			&gpio5 7 0
+		>;
+
+		/* sample keymap */
+		linux,keymap =3D <
+			0x00000074 /* row 0, col 0, KEY_POWER */
+			0x00010052 /* row 0, col 1, KEY_KP0 */
+			0x0002004f /* row 0, col 2, KEY_KP1 */
+			0x00030050 /* row 0, col 3, KEY_KP2 */
+			0x01000051 /* row 1, col 0, KEY_KP3 */
+			0x0101004b /* row 1, col 1, KEY_KP4 */
+			0x0102004c /* row 1, col 2, KEY_KP5 */
+			0x0103004d /* row 1, col 3, KEY_KP6 */
+			0x02000047 /* row 2, col 0, KEY_KP7 */
+			0x02010048 /* row 2, col 1, KEY_KP8 */
+			0x02020049 /* row 2, col 2, KEY_KP9 */
+		>;
+		gpio-activelow;
+		linux,wakeup;
+
+		debounce-delay-ms =3D <100>;
+		col-scan-delay-us =3D <5000>;
+		linux,no-autorepeat;
 	};
 };
+
+/* 2nd TX-Std UART - (A)UART1  */
+&auart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&auart1_pins_a>;
+	status =3D "okay";
+};
+
+/* 3rd TX-Std UART - (A)UART3  */
+&auart3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&auart3_pins_a>;
+	status =3D "okay";
+};
+
+&can0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&can0_pins_a>;
+	xceiver-supply =3D <&reg_can_xcvr>;
+	status =3D "okay";
+};
+
+&can1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&can1_pins_a>;
+	xceiver-supply =3D <&reg_can_xcvr>;
+	status =3D "okay";
+};
+
+&digctl {
+	status =3D "okay";
+};
+
+/* 1st TX-Std UART - (D)UART */
+&duart {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&duart_4pins_a>;
+	status =3D "okay";
+};
+
+&gpmi {
+	pinctrl-0 =3D <&gpmi_pins_a &gpmi_status_cfg>;
+	nand-on-flash-bbt;
+	status =3D "okay";
+};
+
+&i2c0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2c0_pins_a>;
+	clock-frequency =3D <400000>;
+	status =3D "okay";
+
+	ds1339: rtc@68 {
+		compatible =3D "mxim,ds1339";
+		reg =3D <0x68>;
+	};
+
+	gpio5: pca953x@20 {
+		compatible =3D "nxp,pca9554";
+		reg =3D <0x20>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&tx28_pca9554_pins>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <28 0>;
+		gpio-controller;
+		#gpio-cells =3D <2>;
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
+	touchscreen: tsc2007@48 {
+		compatible =3D "ti,tsc2007";
+		reg =3D <0x48>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&tx28_tsc2007_pins>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <20 0>;
+		pendown-gpio =3D <&gpio3 20 1>;
+		ti,x-plate-ohms =3D /bits/ 16 <660>;
+	};
+
+	polytouch: edt-ft5x06@38 {
+		compatible =3D "edt,edt-ft5x06";
+		reg =3D <0x38>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&tx28_edt_ft5x06_pins>;
+		interrupt-parent =3D <&gpio2>;
+		interrupts =3D <5 0>;
+		reset-gpios =3D <&gpio2 6 1>;
+		wake-gpios =3D <&gpio4 9 0>;
+	};
+
+	sgtl5000: sgtl5000@0a {
+		compatible =3D "fsl,sgtl5000";
+		reg =3D <0x0a>;
+		VDDA-supply =3D <&reg_2p5v>;
+		VDDIO-supply =3D <&reg_3p3v>;
+		clocks =3D <&mclk>;
+	};
+};
+
+&lcdif {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&lcdif_24bit_pins_a &lcdif_sync_pins_a &tx28_lcdif_ctr=
l_pins>;
+	lcd-supply =3D <&reg_lcd>;
+	display =3D <&display>;
+	status =3D "okay";
+
+	display: display@0 {
+		bits-per-pixel =3D <32>;
+		bus-width =3D <24>;
+
+		display-timings {
+			native-mode =3D <&timing5>;
+			timing0: timing0 {
+				panel-name =3D "VGA";
+				clock-frequency =3D <25175000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <48>;
+				hsync-len =3D <96>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <33>;
+				vsync-len =3D <2>;
+				vfront-porch =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+
+			timing1: timing1 {
+				panel-name =3D "ETV570";
+				clock-frequency =3D <25175000>;
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
+				pixelclk-active =3D <1>;
+			};
+
+			timing2: timing2 {
+				panel-name =3D "ET0350";
+				clock-frequency =3D <6500000>;
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
+				pixelclk-active =3D <1>;
+			};
+
+			timing3: timing3 {
+				panel-name =3D "ET0430";
+				clock-frequency =3D <9000000>;
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
+			timing4: timing4 {
+				panel-name =3D "ET0500", "ET0700";
+				clock-frequency =3D <33260000>;
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
+				pixelclk-active =3D <1>;
+			};
+
+			timing5: timing5 {
+				panel-name =3D "ETQ570";
+				clock-frequency =3D <6400000>;
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
+				pixelclk-active =3D <1>;
+			};
+        	};
+	};
+};
+
+&lradc {
+	fsl,lradc-touchscreen-wires =3D <4>;
+	status =3D "okay";
+};
+
+&mac0 {
+	phy-mode =3D "rmii";
+	pinctrl-names =3D "default", "gpio_mode";
+	pinctrl-0 =3D <&mac0_pins_a>;
+	pinctrl-1 =3D <&tx28_mac0_pins_gpio>;
+	status =3D "okay";
+};
+
+&mac1 {
+	phy-mode =3D "rmii";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&mac1_pins_a>;
+	/* not enabled by default */
+};
+
+&mxs_rtc {
+	status =3D "okay";
+};
+
+&ocotp {
+	status =3D "okay";
+};
+
+&pwm {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pwm0_pins_a>;
+	status =3D "okay";
+};
+
+&pinctrl {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hog_pins_a>;
+
+	hog_pins_a: hog@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_ENET0_RXD3__GPIO_4_10 /* module LED */
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	tx28_edt_ft5x06_pins: tx28-edt-ft5x06-pins {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_SSP0_DATA6__GPIO_2_6 /* RESET */
+			MX28_PAD_SSP0_DATA5__GPIO_2_5 /* IRQ */
+			MX28_PAD_ENET0_RXD2__GPIO_4_9 /* WAKE */
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	tx28_flexcan_xcvr_pins: tx28-flexcan-xcvr-pins {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_D00__GPIO_1_0
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	tx28_lcdif_23bit_pins: tx28-lcdif-23bit {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			/* LCD_D00 may be used as Flexcan Transceiver Enable on STK5-V5 */
+			MX28_PAD_LCD_D01__LCD_D1
+			MX28_PAD_LCD_D02__LCD_D2
+			MX28_PAD_LCD_D03__LCD_D3
+			MX28_PAD_LCD_D04__LCD_D4
+			MX28_PAD_LCD_D05__LCD_D5
+			MX28_PAD_LCD_D06__LCD_D6
+			MX28_PAD_LCD_D07__LCD_D7
+			MX28_PAD_LCD_D08__LCD_D8
+			MX28_PAD_LCD_D09__LCD_D9
+			MX28_PAD_LCD_D10__LCD_D10
+			MX28_PAD_LCD_D11__LCD_D11
+			MX28_PAD_LCD_D12__LCD_D12
+			MX28_PAD_LCD_D13__LCD_D13
+			MX28_PAD_LCD_D14__LCD_D14
+			MX28_PAD_LCD_D15__LCD_D15
+			MX28_PAD_LCD_D16__LCD_D16
+			MX28_PAD_LCD_D17__LCD_D17
+			MX28_PAD_LCD_D18__LCD_D18
+			MX28_PAD_LCD_D19__LCD_D19
+			MX28_PAD_LCD_D20__LCD_D20
+			MX28_PAD_LCD_D21__LCD_D21
+			MX28_PAD_LCD_D22__LCD_D22
+			MX28_PAD_LCD_D23__LCD_D23
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	tx28_lcdif_ctrl_pins: tx28-lcdif-ctrl {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_ENABLE__GPIO_1_31 /* Enable */
+			MX28_PAD_LCD_RESET__GPIO_3_30  /* Reset */
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	tx28_mac0_pins_gpio: tx28-mac0-gpio-pins {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_ENET0_MDC__GPIO_4_0
+			MX28_PAD_ENET0_MDIO__GPIO_4_1
+			MX28_PAD_ENET0_RX_EN__GPIO_4_2
+			MX28_PAD_ENET0_RXD0__GPIO_4_3
+			MX28_PAD_ENET0_RXD1__GPIO_4_4
+			MX28_PAD_ENET0_TX_EN__GPIO_4_6
+			MX28_PAD_ENET0_TXD0__GPIO_4_7
+			MX28_PAD_ENET0_TXD1__GPIO_4_8
+			MX28_PAD_ENET_CLK__GPIO_4_16
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	tx28_pca9554_pins: tx28-pca9554-pins {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_PWM3__GPIO_3_28
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	tx28_tsc2007_pins: tx28-tsc2007-pins {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_SAIF0_MCLK__GPIO_3_20 /* TSC2007 IRQ */
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+
+	tx28_usbphy0_pins: tx28-usbphy0-pins {
+		reg =3D <2>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_GPMI_CE2N__GPIO_0_18 /* USBOTG_VBUSEN */
+			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* USBOTH_OC */
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_12mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	tx28_usbphy1_pins: tx28-usbphy1-pins {
+		reg =3D <1>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_SPDIF__GPIO_3_27 /* USBH_VBUSEN */
+			MX28_PAD_JTAG_RTCK__GPIO_4_20 /* USBH_OC */
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_12mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+};
+
+&saif0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&saif0_pins_b>;
+	fsl,saif-master;
+	status =3D "okay";
+};
+
+&saif1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&saif1_pins_a>;
+	status =3D "okay";
+};
+
+&ssp0 {
+	compatible =3D "fsl,imx28-mmc";
+	pinctrl-names =3D "default", "special";
+	pinctrl-0 =3D <&mmc0_4bit_pins_a
+		     &mmc0_cd_cfg
+		     &mmc0_sck_cfg>;
+	bus-width =3D <4>;
+	status =3D "okay";
+};
+
+&ssp3 {
+	compatible =3D "fsl,imx28-spi";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&spi3_pins_a>;
+	clock-frequency =3D <57600000>;
+	status =3D "okay";
+
+	spidev0: spi@0 {
+		compatible =3D "spidev";
+		reg =3D <0>;
+		spi-max-frequency =3D <57600000>;
+	};
+
+	spidev1: spi@1 {
+		compatible =3D "spidev";
+		reg =3D <1>;
+		spi-max-frequency =3D <57600000>;
+	};
+};
+
+&timer {
+	status =3D "okay";
+};
+
+&usb0 {
+	vbus-supply =3D <&reg_usb0_vbus>;
+	disable-over-current;
+	dr_mode =3D "peripheral";
+	status =3D "okay";
+};
+
+&usb1 {
+	vbus-supply =3D <&reg_usb1_vbus>;
+	disable-over-current;
+	dr_mode =3D "host";
+	status =3D "okay";
+};
+
+&usbphy0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&tx28_usbphy0_pins>;
+	phy_type =3D "utmi";
+	status =3D "okay";
+};
+
+&usbphy1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&tx28_usbphy1_pins>;
+	phy_type =3D "utmi";
+	status =3D "okay";
+};
--=20
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
