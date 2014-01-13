From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 2/2] ARM: dts: imx53: add support for Ka-Ro TX53 modules
Date: Mon, 13 Jan 2014 11:32:38 +0100
Message-ID: <1389609158-11179-3-git-send-email-LW@KARO-electronics.de>
References: <1389609158-11179-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389609158-11179-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

This patch adds support for the Ka-Ro electronics GmbH TX53 modules.
There are two distinct module types. One with an LVDS display
interface and SATA support, the other with a parallel LCD
interface and no SATA interface.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/Makefile            |    2 +
 arch/arm/boot/dts/imx53-tx53-x03x.dts |  286 ++++++++++++++++++++++
 arch/arm/boot/dts/imx53-tx53-x13x.dts |  240 +++++++++++++++++++
 arch/arm/boot/dts/imx53-tx53.dtsi     |  423 +++++++++++++++++++++++++=
++++----
 4 files changed, 910 insertions(+), 41 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx53-tx53-x03x.dts
 create mode 100644 arch/arm/boot/dts/imx53-tx53-x13x.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 059d280..392b60f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -154,6 +154,8 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
 	imx53-mba53.dtb \
 	imx53-qsb.dtb \
 	imx53-smd.dtb \
+	imx53-tx53-x03x.dtb \
+	imx53-tx53-x13x.dtb \
 	imx53-voipac-bsb.dtb \
 	imx6dl-gw51xx.dtb \
 	imx6dl-gw52xx.dtb \
diff --git a/arch/arm/boot/dts/imx53-tx53-x03x.dts b/arch/arm/boot/dts/=
imx53-tx53-x03x.dts
new file mode 100644
index 0000000..9029ae9
--- /dev/null
+++ b/arch/arm/boot/dts/imx53-tx53-x03x.dts
@@ -0,0 +1,286 @@
+/*
+ * Copyright 2013 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
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
+#include "imx53-tx53.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	model =3D "Ka-Ro electronics TX53 module (LCD)";
+	compatible =3D "karo,tx53", "fsl,imx53";
+
+	aliases {
+		display =3D &display;
+	};
+
+	soc {
+		display: display@di0 {
+			compatible =3D "fsl,imx-parallel-display";
+			crtcs =3D <&ipu 0>;
+			interface-pix-fmt =3D "rgb24";
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_rgb24_vga1>;
+			status =3D "okay";
+
+			display-timings {
+				VGA {
+					clock-frequency =3D <25200000>;
+					hactive =3D <640>;
+					vactive =3D <480>;
+					hback-porch =3D <48>;
+					hsync-len =3D <96>;
+					hfront-porch =3D <16>;
+					vback-porch =3D <31>;
+					vsync-len =3D <2>;
+					vfront-porch =3D <12>;
+					hsync-active =3D <0>;
+					vsync-active =3D <0>;
+					de-active =3D <1>;
+					pixelclk-active =3D <0>;
+				};
+
+				ETV570 {
+					clock-frequency =3D <25200000>;
+					hactive =3D <640>;
+					vactive =3D <480>;
+					hback-porch =3D <114>;
+					hsync-len =3D <30>;
+					hfront-porch =3D <16>;
+					vback-porch =3D <32>;
+					vsync-len =3D <3>;
+					vfront-porch =3D <10>;
+					hsync-active =3D <0>;
+					vsync-active =3D <0>;
+					de-active =3D <1>;
+					pixelclk-active =3D <0>;
+				};
+
+				ET0350 {
+					clock-frequency =3D <6413760>;
+					hactive =3D <320>;
+					vactive =3D <240>;
+					hback-porch =3D <34>;
+					hsync-len =3D <34>;
+					hfront-porch =3D <20>;
+					vback-porch =3D <15>;
+					vsync-len =3D <3>;
+					vfront-porch =3D <4>;
+					hsync-active =3D <0>;
+					vsync-active =3D <0>;
+					de-active =3D <1>;
+					pixelclk-active =3D <0>;
+				};
+
+				ET0430 {
+					clock-frequency =3D <9009000>;
+					hactive =3D <480>;
+					vactive =3D <272>;
+					hback-porch =3D <2>;
+					hsync-len =3D <41>;
+					hfront-porch =3D <2>;
+					vback-porch =3D <2>;
+					vsync-len =3D <10>;
+					vfront-porch =3D <2>;
+					hsync-active =3D <0>;
+					vsync-active =3D <0>;
+					de-active =3D <1>;
+					pixelclk-active =3D <1>;
+				};
+
+				ET0500 {
+					clock-frequency =3D <33264000>;
+					hactive =3D <800>;
+					vactive =3D <480>;
+					hback-porch =3D <88>;
+					hsync-len =3D <128>;
+					hfront-porch =3D <40>;
+					vback-porch =3D <33>;
+					vsync-len =3D <2>;
+					vfront-porch =3D <10>;
+					hsync-active =3D <0>;
+					vsync-active =3D <0>;
+					de-active =3D <1>;
+					pixelclk-active =3D <0>;
+				};
+
+				ET0700 { /* same as ET0500 */
+					clock-frequency =3D <33264000>;
+					hactive =3D <800>;
+					vactive =3D <480>;
+					hback-porch =3D <88>;
+					hsync-len =3D <128>;
+					hfront-porch =3D <40>;
+					vback-porch =3D <33>;
+					vsync-len =3D <2>;
+					vfront-porch =3D <10>;
+					hsync-active =3D <0>;
+					vsync-active =3D <0>;
+					de-active =3D <1>;
+					pixelclk-active =3D <0>;
+				};
+
+				ETQ570 {
+					clock-frequency =3D <6596040>;
+					hactive =3D <320>;
+					vactive =3D <240>;
+					hback-porch =3D <38>;
+					hsync-len =3D <30>;
+					hfront-porch =3D <30>;
+					vback-porch =3D <16>;
+					vsync-len =3D <3>;
+					vfront-porch =3D <4>;
+					hsync-active =3D <0>;
+					vsync-active =3D <0>;
+					de-active =3D <1>;
+					pixelclk-active =3D <0>;
+				};
+			};
+		};
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
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
+	regulators {
+		reg_lcd_pwr: regulator@5 {
+			compatible =3D "regulator-fixed";
+			reg =3D <5>;
+			regulator-name =3D "LCD POWER";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+
+		reg_lcd_reset: regulator@6 {
+			compatible =3D "regulator-fixed";
+			reg =3D <6>;
+			regulator-name =3D "LCD RESET";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+	};
+};
+
+&i2c3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c3>;
+	status =3D "okay";
+
+	sgtl5000: codec@0a {
+		compatible =3D "fsl,sgtl5000";
+		reg =3D <0x0a>;
+		VDDA-supply =3D <&reg_2v5>;
+		VDDIO-supply =3D <&reg_3v3>;
+		clocks =3D <&mclk>;
+	};
+
+	polytouch: edt-ft5x06@38 {
+		compatible =3D "edt,edt-ft5x06";
+		reg =3D <0x38>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_edt_ft5x06_1>;
+		interrupt-parent =3D <&gpio6>;
+		interrupts =3D <15 0>;
+		reset-gpios =3D <&gpio2 22 GPIO_ACTIVE_LOW>;
+		wake-gpios =3D <&gpio2 21 GPIO_ACTIVE_HIGH>;
+	};
+
+	touchscreen: tsc2007@48 {
+		compatible =3D "ti,tsc2007";
+		reg =3D <0x48>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_tsc2007>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <26 0>;
+		gpios =3D <&gpio3 26 GPIO_ACTIVE_LOW>;
+		ti,x-plate-ohms =3D <660>;
+		linux,wakeup;
+	};
+};
+
+&iomuxc {
+	imx53-tx53-x03x {
+		pinctrl_edt_ft5x06_1: edt-ft5x06grp-1 {
+			fsl,pins =3D <
+				MX53_PAD_NANDF_CS2__GPIO6_15 0x1f0 /* Interrupt */
+				MX53_PAD_EIM_A16__GPIO2_22   0x04 /* Reset */
+				MX53_PAD_EIM_A17__GPIO2_21   0x04 /* Wake */
+			>;
+		};
+
+		pinctrl_kpp: kppgrp {
+			fsl,pins =3D <
+				MX53_PAD_GPIO_9__KPP_COL_6 0x1f4
+				MX53_PAD_GPIO_4__KPP_COL_7 0x1f4
+				MX53_PAD_KEY_COL2__KPP_COL_2 0x1f4
+				MX53_PAD_KEY_COL3__KPP_COL_3 0x1f4
+				MX53_PAD_GPIO_2__KPP_ROW_6 0x1f4
+				MX53_PAD_GPIO_5__KPP_ROW_7 0x1f4
+				MX53_PAD_KEY_ROW2__KPP_ROW_2 0x1f4
+				MX53_PAD_KEY_ROW3__KPP_ROW_3 0x1f4
+			>;
+		};
+
+		pinctrl_rgb24_vga1: rgb24-vgagrp1 {
+			fsl,pins =3D <MX53_IPU_DISP0_PINGRP1>;
+		};
+
+		pinctrl_tsc2007: tsc2007grp {
+			fsl,pins =3D <
+				MX53_PAD_EIM_D26__GPIO3_26 0x1f0 /* Interrupt */
+			>;
+		};
+	};
+};
+
+&kpp {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_kpp>;
+	/* sample keymap */
+	/* row/col 0,1 are mapped to KPP row/col 6,7 */
+	linux,keymap =3D <
+		MATRIX_KEY(6, 6, KEY_POWER)
+		MATRIX_KEY(6, 7, KEY_KP0)
+		MATRIX_KEY(6, 2, KEY_KP1)
+		MATRIX_KEY(6, 3, KEY_KP2)
+		MATRIX_KEY(7, 6, KEY_KP3)
+		MATRIX_KEY(7, 7, KEY_KP4)
+		MATRIX_KEY(7, 2, KEY_KP5)
+		MATRIX_KEY(7, 3, KEY_KP6)
+		MATRIX_KEY(2, 6, KEY_KP7)
+		MATRIX_KEY(2, 7, KEY_KP8)
+		MATRIX_KEY(2, 2, KEY_KP9)
+	>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dts/=
imx53-tx53-x13x.dts
new file mode 100644
index 0000000..eb5d51f
--- /dev/null
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@ -0,0 +1,240 @@
+/*
+ * Copyright 2013 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
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
+#include "imx53-tx53.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	model =3D "Ka-Ro electronics TX53 module (LVDS)";
+	compatible =3D "karo,tx53", "fsl,imx53";
+
+	aliases {
+		display =3D &lvds0;
+		lvds0 =3D &lvds0;
+		lvds1 =3D &lvds1;
+	};
+
+	backlight0: backlight0 {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 0>;
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
+	backlight1: backlight1 {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm1 0 500000 0>;
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
+	regulators {
+		reg_lcd_pwr0: regulator@5 {
+			compatible =3D "regulator-fixed";
+			reg =3D <5>;
+			regulator-name =3D "LVDS0 POWER";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+
+		reg_lcd_pwr1: regulator@6 {
+			compatible =3D "regulator-fixed";
+			reg =3D <6>;
+			regulator-name =3D "LVDS1 POWER";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+	};
+};
+
+&i2c2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c2>;
+	status =3D "okay";
+
+	touchscreen2: eeti@04 {
+		compatible =3D "eeti,egalax_ts";
+		reg =3D <0x04>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_eeti2>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <23 0>;
+		wakeup-gpios =3D <&gpio3 23 GPIO_ACTIVE_HIGH>;
+		linux,wakeup;
+	};
+};
+
+&i2c3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c3>;
+	status =3D "okay";
+
+	sgtl5000: codec@0a {
+		compatible =3D "fsl,sgtl5000";
+		reg =3D <0x0a>;
+		VDDA-supply =3D <&reg_2v5>;
+		VDDIO-supply =3D <&reg_3v3>;
+		clocks =3D <&mclk>;
+	};
+
+	touchscreen1: eeti@04 {
+		compatible =3D "eeti,egalax_ts";
+		reg =3D <0x04>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_eeti1>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <22 0>;
+		wakeup-gpios =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		linux,wakeup;
+	};
+};
+
+&iomuxc {
+	imx53-tx53-x13x {
+		pinctrl_i2c2: i2c2-grp1 {
+			fsl,pins =3D <MX53_I2C2_PINGRP1>;
+		};
+
+		pinctrl_lvds0: lvds0grp {
+			fsl,pins =3D <
+				MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3 0x80000000
+				MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK 0x80000000
+				MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2 0x80000000
+				MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1 0x80000000
+				MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0 0x80000000
+			>;
+		};
+
+		pinctrl_lvds1: lvds1grp {
+			fsl,pins =3D <
+				MX53_PAD_LVDS1_TX3_P__LDB_LVDS1_TX3 0x80000000
+				MX53_PAD_LVDS1_TX2_P__LDB_LVDS1_TX2 0x80000000
+				MX53_PAD_LVDS1_CLK_P__LDB_LVDS1_CLK 0x80000000
+				MX53_PAD_LVDS1_TX1_P__LDB_LVDS1_TX1 0x80000000
+				MX53_PAD_LVDS1_TX0_P__LDB_LVDS1_TX0 0x80000000
+			>;
+		};
+
+		pinctrl_pwm1: pwm1grp {
+			fsl,pins =3D <MX53_PAD_GPIO_9__PWM1_PWMO 0x04>;
+		};
+
+		pinctrl_eeti1: eeti1grp {
+			fsl,pins =3D <
+				MX53_PAD_EIM_D22__GPIO3_22 0x1f0 /* Interrupt */
+			>;
+		};
+
+		pinctrl_eeti2: eeti2grp {
+			fsl,pins =3D <
+				MX53_PAD_EIM_D23__GPIO3_23 0x1f0 /* Interrupt */
+			>;
+		};
+	};
+};
+
+&ldb {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_lvds0 &pinctrl_lvds1>;
+	status =3D "okay";
+
+	lvds0: lvds-channel@0 {
+		fsl,data-mapping =3D "jeida";
+		fsl,data-width =3D <24>;
+		status =3D "okay";
+
+		display-timings {
+			native-mode =3D <&lvds_timing0>;
+			lvds_timing0: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hsync-len =3D <60>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vsync-len =3D <10>;
+				vfront-porch =3D <7>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+		};
+	};
+
+	lvds1: lvds-channel@1 {
+		fsl,data-mapping =3D "jeida";
+		fsl,data-width =3D <24>;
+		status =3D "okay";
+
+		display-timings {
+			native-mode =3D <&lvds_timing1>;
+			lvds_timing1: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hsync-len =3D <60>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vsync-len =3D <10>;
+				vfront-porch =3D <7>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+		};
+	};
+};
+
+&pwm1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm1>;
+};
+
+&sata {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/imx5=
3-tx53.dtsi
index db4255c..a720d93 100644
--- a/arch/arm/boot/dts/imx53-tx53.dtsi
+++ b/arch/arm/boot/dts/imx53-tx53.dtsi
@@ -1,22 +1,69 @@
 /*
- * Copyright 2013 Steffen Trumtrar <s.trumtrar@pengutronix.de>
+ * Copyright 2012 <LW@KARO-electronics.de>
+ * based on imx53-qsb.dts
+ *   Copyright 2011 Freescale Semiconductor, Inc.
+ *   Copyright 2011 Linaro Ltd.
  *
  * The code contained herein is licensed under the GNU General Public
  * License. You may obtain a copy of the GNU General Public License
- * Version 2 or later at the following locations:
+ * Version 2 at the following locations:
  *
  * http://www.opensource.org/licenses/gpl-license.html
  * http://www.gnu.org/copyleft/gpl.html
  */
=20
-/include/ "imx53.dtsi"
+#include "imx53.dtsi"
+#include <dt-bindings/gpio/gpio.h>
=20
 / {
-	model =3D "Ka-Ro TX53";
+	model =3D "Ka-Ro electronics TX53 module";
 	compatible =3D "karo,tx53", "fsl,imx53";
=20
-	memory {
-		reg =3D <0x70000000 0x40000000>; /* Up to 1GiB */
+	aliases {
+		can0 =3D &can2; /* Make the can interface indices consistent with TX=
28/TX48 modules */
+		can1 =3D &can1;
+		ipu =3D &ipu;
+		reg_can_xcvr =3D &reg_can_xcvr;
+		usbh1 =3D &usbh1;
+		usbotg =3D &usbotg;
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
+	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpio_key>;
+
+		power {
+			label =3D "Power Button";
+			gpios =3D <&gpio5 2 GPIO_ACTIVE_HIGH>;
+			linux,code =3D <116>; /* KEY_POWER */
+			gpio-key,wakeup;
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
+			gpios =3D <&gpio2 20 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "heartbeat";
+		};
 	};
=20
 	regulators {
@@ -24,102 +71,396 @@
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
=20
-		reg_3p3v: regulator@0 {
+		reg_2v5: regulator@0 {
 			compatible =3D "regulator-fixed";
 			reg =3D <0>;
-			regulator-name =3D "3P3V";
+			regulator-name =3D "2V5";
+			regulator-min-microvolt =3D <2500000>;
+			regulator-max-microvolt =3D <2500000>;
+		};
+
+		reg_3v3: regulator@1 {
+			compatible =3D "regulator-fixed";
+			reg =3D <1>;
+			regulator-name =3D "3V3";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+		};
+
+		reg_can_xcvr: regulator@2 {
+			compatible =3D "regulator-fixed";
+			reg =3D <2>;
+			regulator-name =3D "CAN XCVR";
 			regulator-min-microvolt =3D <3300000>;
 			regulator-max-microvolt =3D <3300000>;
-			regulator-always-on;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_can_xcvr>;
+			gpio =3D <&gpio4 21 GPIO_ACTIVE_HIGH>;
+			enable-active-low;
 		};
+
+		reg_usbh1_vbus: regulator@3 {
+			compatible =3D "regulator-fixed";
+			reg =3D <3>;
+			regulator-name =3D "usbh1_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_usbh1_vbus>;
+			gpio =3D <&gpio3 31 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usbotg_vbus: regulator@4 {
+			compatible =3D "regulator-fixed";
+			reg =3D <4>;
+			regulator-name =3D "usbotg_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_usbotg_vbus>;
+			gpio =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
+
+	sound {
+		compatible =3D "karo,tx53-audio-sgtl5000", "fsl,imx-audio-sgtl5000";
+		model =3D "tx53-audio-sgtl5000";
+		ssi-controller =3D <&ssi1>;
+		audio-codec =3D <&sgtl5000>;
+		audio-routing =3D
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+		/* '1' based port numbers according to datasheet names */
+		mux-int-port =3D <1>;
+		mux-ext-port =3D <5>;
 	};
 };
=20
+&audmux {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_ssi1>;
+	status =3D "okay";
+};
+
 &can1 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_can1_2>;
-	status =3D "disabled";
+	pinctrl-0 =3D <&pinctrl_can1>;
+	xceiver-supply =3D <&reg_can_xcvr>;
+	status =3D "okay";
 };
=20
 &can2 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_can2_1>;
-	status =3D "disabled";
+	pinctrl-0 =3D <&pinctrl_can2>;
+	xceiver-supply =3D <&reg_can_xcvr>;
+	status =3D "okay";
 };
=20
 &ecspi1 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_ecspi1_2>;
-	status =3D "disabled";
+	pinctrl-0 =3D <&pinctrl_ecspi1>;
+	fsl,spi-num-chipselects =3D <2>;
+	status =3D "okay";
+
+	cs-gpios =3D <
+		&gpio2 30 GPIO_ACTIVE_HIGH
+		&gpio3 19 GPIO_ACTIVE_HIGH
+	>;
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
 };
=20
 &esdhc1 {
+	cd-gpios =3D <&gpio3 24 GPIO_ACTIVE_HIGH>;
+	fsl,wp-controller;
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_esdhc1_2>;
-	status =3D "disabled";
+	pinctrl-0 =3D <&pinctrl_esdhc1>;
+	status =3D "okay";
 };
=20
 &esdhc2 {
+	cd-gpios =3D <&gpio3 25 GPIO_ACTIVE_HIGH>;
+	fsl,wp-controller;
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_esdhc2_1>;
-	status =3D "disabled";
+	pinctrl-0 =3D <&pinctrl_esdhc2>;
+	status =3D "okay";
 };
=20
 &fec {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_fec_1>;
+	pinctrl-0 =3D <&pinctrl_fec>;
 	phy-mode =3D "rmii";
-	status =3D "disabled";
+	phy-reset-gpios =3D <&gpio7 6 GPIO_ACTIVE_HIGH>;
+	phy-handle =3D <&phy0>;
+	mac-address =3D [000000000000]; /* placeholder; will be overwritten b=
y bootloader */
+	status =3D "okay";
+
+	phy0: ethernet-phy@0 {
+		interrupt-parent =3D <&gpio2>;
+		interrupts =3D <4>;
+		device_type =3D "ethernet-phy";
+	};
 };
=20
-&i2c3 {
+&i2c1 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_i2c3_2>;
-	status =3D "disabled";
+	pinctrl-0 =3D <&pinctrl_i2c1>;
+	clock-frequency =3D <400000>;
+	status =3D "okay";
+
+	rtc1: ds1339@68 {
+		compatible =3D "dallas,ds1339";
+		reg =3D <0x68>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_ds1339>;
+		interrupt-parent =3D <&gpio4>;
+		interrupts =3D <20 0>;
+	};
 };
=20
-&owire {
+&iomuxc {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_owire_1>;
-	status =3D "disabled";
+	pinctrl-0 =3D <&pinctrl_hog>;
+
+	imx53-tx53 {
+		pinctrl_hog: hoggrp {
+			/* pins not in use by any device on the Starterkit board series */
+			fsl,pins =3D <
+				/* CMOS Sensor Interface */
+				MX53_PAD_CSI0_DAT12__GPIO5_30 0x1f4
+				MX53_PAD_CSI0_DAT13__GPIO5_31 0x1f4
+				MX53_PAD_CSI0_DAT14__GPIO6_0 0x1f4
+				MX53_PAD_CSI0_DAT15__GPIO6_1 0x1f4
+				MX53_PAD_CSI0_DAT16__GPIO6_2 0x1f4
+				MX53_PAD_CSI0_DAT17__GPIO6_3 0x1f4
+				MX53_PAD_CSI0_DAT18__GPIO6_4 0x1f4
+				MX53_PAD_CSI0_DAT19__GPIO6_5 0x1f4
+				MX53_PAD_CSI0_MCLK__GPIO5_19 0x1f4
+				MX53_PAD_CSI0_VSYNC__GPIO5_21 0x1f4
+				MX53_PAD_CSI0_PIXCLK__GPIO5_18 0x1f4
+				MX53_PAD_GPIO_0__GPIO1_0 0x1f4
+				/* Module Specific Signal */
+				/* MX53_PAD_NANDF_CS2__GPIO6_15 0x1f4 maybe used by EDT-FT5x06 */
+				/* MX53_PAD_EIM_A16__GPIO2_22 0x1f4 maybe used by EDT-FT5x06 */
+				MX53_PAD_EIM_D29__GPIO3_29 0x1f4
+				MX53_PAD_EIM_EB3__GPIO2_31 0x1f4
+				/* MX53_PAD_EIM_A17__GPIO2_21 0x1f4 maybe used by EDT-FT5x06 */
+				/* MX53_PAD_EIM_A18__GPIO2_20 0x1f4 used by LED */
+				MX53_PAD_EIM_A19__GPIO2_19 0x1f4
+				MX53_PAD_EIM_A20__GPIO2_18 0x1f4
+				MX53_PAD_EIM_A21__GPIO2_17 0x1f4
+				MX53_PAD_EIM_A22__GPIO2_16 0x1f4
+				MX53_PAD_EIM_A23__GPIO6_6 0x1f4
+				MX53_PAD_EIM_A24__GPIO5_4 0x1f4
+				MX53_PAD_CSI0_DAT8__GPIO5_26 0x1f4
+				MX53_PAD_CSI0_DAT9__GPIO5_27 0x1f4
+				MX53_PAD_CSI0_DAT10__GPIO5_28 0x1f4
+				MX53_PAD_CSI0_DAT11__GPIO5_29 0x1f4
+				/* MX53_PAD_EIM_D22__GPIO3_22 0x1f4 maybe used by EETI touchpanel =
driver */
+				/* MX53_PAD_EIM_D23__GPIO3_23 0x1f4 maybe used by EETI touchpanel =
driver */
+				MX53_PAD_GPIO_13__GPIO4_3 0x1f4
+				MX53_PAD_EIM_CS0__GPIO2_23 0x1f4
+				MX53_PAD_EIM_CS1__GPIO2_24 0x1f4
+				MX53_PAD_CSI0_DATA_EN__GPIO5_20 0x1f4
+				MX53_PAD_EIM_WAIT__GPIO5_0 0x1f4
+				MX53_PAD_EIM_EB0__GPIO2_28 0x1f4
+				MX53_PAD_EIM_EB1__GPIO2_29 0x1f4
+				MX53_PAD_EIM_OE__GPIO2_25 0x1f4
+				MX53_PAD_EIM_LBA__GPIO2_27 0x1f4
+				MX53_PAD_EIM_RW__GPIO2_26 0x1f4
+				MX53_PAD_EIM_DA8__GPIO3_8 0x1f4
+				MX53_PAD_EIM_DA9__GPIO3_9 0x1f4
+				MX53_PAD_EIM_DA10__GPIO3_10 0x1f4
+				MX53_PAD_EIM_DA11__GPIO3_11 0x1f4
+				MX53_PAD_EIM_DA12__GPIO3_12 0x1f4
+				MX53_PAD_EIM_DA13__GPIO3_13 0x1f4
+				MX53_PAD_EIM_DA14__GPIO3_14 0x1f4
+				MX53_PAD_EIM_DA15__GPIO3_15 0x1f4
+				>;
+		};
+
+		pinctrl_can1: can1grp {
+			fsl,pins =3D <MX53_CAN1_PINGRP3>;
+		};
+
+		pinctrl_can2: can2grp {
+			fsl,pins =3D <MX53_CAN2_PINGRP1>;
+		};
+
+		pinctrl_can_xcvr: can-xcvrgrp {
+			fsl,pins =3D <MX53_PAD_DISP0_DAT0__GPIO4_21 0xe0>; /* Flexcan XCVR =
enable */
+		};
+
+		pinctrl_ds1339: ds1339grp {
+			fsl,pins =3D <MX53_PAD_DI0_PIN4__GPIO4_20 0xe0>;
+		};
+
+		pinctrl_ecspi1: ecspi1grp {
+			fsl,pins =3D <MX53_ECSPI1_PINGRP2>;
+		};
+
+		pinctrl_esdhc1: esdhc1grp {
+			fsl,pins =3D <MX53_ESDHC1_PINGRP1
+				MX53_PAD_EIM_D24__GPIO3_24 0x1f0
+			>;
+		};
+
+		pinctrl_esdhc2: esdhc2grp {
+			fsl,pins =3D <MX53_ESDHC2_PINGRP1
+				MX53_PAD_EIM_D25__GPIO3_25 0x1f0
+			>;
+		};
+
+		pinctrl_fec: fecgrp {
+			fsl,pins =3D <MX53_FEC_PINGRP1>;
+		};
+
+		pinctrl_gpio_key: gpio-keygrp {
+			fsl,pins =3D <MX53_PAD_EIM_A25__GPIO5_2 0x1f4>;
+		};
+
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins =3D <MX53_I2C1_PINGRP2>;
+		};
+
+		pinctrl_i2c3: i2c3grp {
+			fsl,pins =3D <MX53_I2C3_PINGRP2>;
+		};
+
+		pinctrl_nand: nandgrp {
+			fsl,pins =3D <MX53_NAND_PINGRP2>;
+		};
+
+		pinctrl_pwm2: pwm2grp {
+			fsl,pins =3D <MX53_PWM2_PINGRP1>;
+		};
+
+		pinctrl_ssi1: ssi1grp {
+			fsl,pins =3D <MX53_AUDMUX_PINGRP1>;
+		};
+
+		pinctrl_ssi2: ssi2grp {
+			fsl,pins =3D <MX53_AUDMUX_PINGRP3
+				MX53_PAD_EIM_D27__GPIO3_27 0x1f0
+			>;
+		};
+
+		pinctrl_stk5led: stk5ledgrp {
+			fsl,pins =3D <MX53_PAD_EIM_A18__GPIO2_20 0xc0>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <MX53_UART1_PINGRP2 MX53_UART1_PINGRP3>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins =3D <MX53_UART2_PINGRP2>;
+		};
+
+		pinctrl_uart3: uart3grp {
+			fsl,pins =3D <MX53_UART3_PINGRP1>;
+		};
+
+		pinctrl_usbh1: usbh1grp {
+			fsl,pins =3D <
+				MX53_PAD_EIM_D30__GPIO3_30 0x100 /* OC */
+			>;
+		};
+
+		pinctrl_usbh1_vbus: usbh1-vbusgrp {
+			fsl,pins =3D <
+				MX53_PAD_EIM_D31__GPIO3_31 0xe0 /* VBUS ENABLE */
+			>;
+		};
+
+		pinctrl_usbotg_vbus: usbotg-vbusgrp {
+			fsl,pins =3D <
+				MX53_PAD_GPIO_7__GPIO1_7 0xe0 /* VBUS ENABLE */
+				MX53_PAD_GPIO_8__GPIO1_8 0x100 /* OC */
+			>;
+		};
+	};
+};
+
+&ipu {
+	status =3D "okay";
+};
+
+&nfc {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_nand>;
+	nand-bus-width =3D <8>;
+	nand-ecc-mode =3D "hw";
+	nand-on-flash-bbt;
+	status =3D "okay";
 };
=20
 &pwm2 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_pwm2_1>;
-	status =3D "disabled";
+	pinctrl-0 =3D <&pinctrl_pwm2>;
+};
+
+&sdma {
+	fsl,sdma-ram-script-name =3D "sdma-imx53.bin";
 };
=20
 &ssi1 {
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_audmux_1>;
-	status =3D "disabled";
+	fsl,mode =3D "i2s-slave";
+	codec-handle =3D <&sgtl5000>;
+	status =3D "okay";
 };
=20
 &ssi2 {
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_audmux_2>;
 	status =3D "disabled";
 };
=20
 &uart1 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_uart1_2>,
-		    <&pinctrl_uart1_3>;
+	pinctrl-0 =3D <&pinctrl_uart1>;
 	fsl,uart-has-rtscts;
-	status =3D "disabled";
+	status =3D "okay";
 };
=20
 &uart2 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_uart2_2>;
+	pinctrl-0 =3D <&pinctrl_uart2>;
 	fsl,uart-has-rtscts;
-	status =3D "disabled";
+	status =3D "okay";
 };
=20
 &uart3 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_uart3_1>;
+	pinctrl-0 =3D <&pinctrl_uart3>;
 	fsl,uart-has-rtscts;
-	status =3D "disabled";
+	status =3D "okay";
+};
+
+&usbh1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usbh1>;
+	phy_type =3D "utmi";
+	disable-over-current;
+	vbus-supply =3D <&reg_usbh1_vbus>;
+	status =3D "okay";
+};
+
+&usbotg {
+	phy_type =3D "utmi";
+	dr_mode =3D "peripheral";
+	disable-over-current;
+	vbus-supply =3D <&reg_usbotg_vbus>;
+	status =3D "okay";
 };
--=20
1.7.2.5
