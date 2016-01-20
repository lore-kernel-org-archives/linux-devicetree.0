From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 6/6] ARM: dts: imx6: add support for the Ka-Ro electronics 'MB7' baseboard
Date: Wed, 20 Jan 2016 13:57:06 +0100
Message-ID: <1453294626-17608-7-git-send-email-LW@KARO-electronics.de>
References: <1453294626-17608-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453294626-17608-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

This baseboard can be used with all TX6 SoMs, but only a certain set
of combinations can be ordered. Add support for these combinations in
mainline, so that users can easily adopt their own combination of SoM
and baseboard themselves.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/Makefile                 |   2 +
 arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts | 236 +++++++++++++++++++++=
++++
 arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts  | 267 +++++++++++++++++++++=
++++++++
 3 files changed, 505 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e997d6c..d520c6d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -316,6 +316,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
 	imx6dl-tx6s-8035.dtb \
 	imx6dl-tx6u-8033.dtb \
 	imx6dl-tx6u-80xx.dtb \
+	imx6dl-tx6u-81xx-mb7.dtb \
 	imx6dl-tx6u-81xx.dtb \
 	imx6dl-udoo.dtb \
 	imx6dl-wandboard.dtb \
@@ -350,6 +351,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
 	imx6q-tx6q-1036.dtb \
 	imx6q-tx6q-10x0-comtft.dtb \
 	imx6q-tx6q-10x0.dtb \
+	imx6q-tx6q-11x0-mb7.dtb \
 	imx6q-tx6q-11x0.dtb \
 	imx6q-udoo.dtb \
 	imx6q-wandboard.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts b/arch/arm/boot=
/dts/imx6dl-tx6u-81xx-mb7.dts
new file mode 100644
index 0000000..70552f6
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts
@@ -0,0 +1,236 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
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
+#include "imx6dl.dtsi"
+#include "imx6qdl-tx6.dtsi"
+
+/ {
+	model =3D "Ka-Ro electronics TX6U-81xx Module";
+	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
+
+	aliases {
+		display =3D &lvds0;
+		lvds0 =3D &lvds0;
+		lvds1 =3D &lvds1;
+	};
+
+	backlight0: backlight0 {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
+		power-supply =3D <&reg_3v3>;
+		/*
+		 * a poor man's way to create a 1:1 relationship between
+		 * the PWM value and the actual duty cycle
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
+	backlight1: backlight1 {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm1 0 500000 PWM_POLARITY_INVERTED>;
+		power-supply =3D <&reg_3v3>;
+		/*
+		 * a poor man's way to create a 1:1 relationship between
+		 * the PWM value and the actual duty cycle
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
+};
+
+&can1 {
+	status =3D "disabled";
+};
+
+&can2 {
+	xceiver-supply =3D <&reg_3v3>;
+};
+
+&i2c3 {
+	polytouch1: eeti@04 {
+		compatible =3D "eeti,egalax_ts";
+		reg =3D <0x04>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_eeti>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <22 0>;
+		wakeup-gpios =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		linux,wakeup;
+	};
+};
+
+&iomuxc {
+	imx6dl-tx6u-81xx {
+		pinctrl_eeti: eetigrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b1 /* Interrupt */
+			>;
+		};
+	};
+};
+
+&kpp {
+	status =3D "disabled"; /* pads partially clash with backlight1 PWM */
+};
+
+&ldb {
+	status =3D "okay";
+
+	lvds0: lvds-channel@0 {
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
+		status =3D "okay";
+
+		display-timings {
+			native-mode =3D <&lvds0_timing1>;
+
+			lvds0_timing0: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vfront-porch =3D <7>;
+				hsync-len =3D <60>;
+				vsync-len =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+
+			lvds0_timing1: VGA {
+				clock-frequency =3D <25200000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <48>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <31>;
+				vfront-porch =3D <12>;
+				hsync-len =3D <96>;
+				vsync-len =3D <2>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			lvds0_timing2: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vfront-porch =3D <5>;
+				hsync-len =3D <60>;
+				vsync-len =3D <13>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+		};
+	};
+
+	lvds1: lvds-channel@1 {
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
+		status =3D "disabled";
+
+		display-timings {
+			native-mode =3D <&lvds1_timing2>;
+
+			lvds1_timing0: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vfront-porch =3D <7>;
+				hsync-len =3D <60>;
+				vsync-len =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+
+			lvds1_timing1: VGA {
+				clock-frequency =3D <25200000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <48>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <31>;
+				vfront-porch =3D <12>;
+				hsync-len =3D <96>;
+				vsync-len =3D <2>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			lvds1_timing2: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vfront-porch =3D <5>;
+				hsync-len =3D <60>;
+				vsync-len =3D <13>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+		};
+	};
+};
+
+&pwm1 {
+	status =3D "okay";
+};
+
+&reg_lcd0_pwr {
+	status =3D "okay";
+};
+
+&reg_lcd1_pwr {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts b/arch/arm/boot/=
dts/imx6q-tx6q-11x0-mb7.dts
new file mode 100644
index 0000000..d4c6a0e
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts
@@ -0,0 +1,267 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
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
+#include "imx6q.dtsi"
+#include "imx6qdl-tx6.dtsi"
+
+/ {
+	model =3D "Ka-Ro electronics TX6Q-1110/-1130 Module";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
+
+	aliases {
+		display =3D &lvds0;
+		ipu1 =3D &ipu2;
+		lvds0 =3D &lvds0;
+		lvds1 =3D &lvds1;
+		mxcfb0 =3D &lvds0;
+		mxcfb1 =3D &lvds1;
+	};
+
+	backlight0: backlight0 {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
+		power-supply =3D <&reg_lcd0_pwr>;
+		/*
+		 * a poor man's way to create a 1:1 relationship between
+		 * the PWM value and the actual duty cycle
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
+	backlight1: backlight1 {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm1 0 500000 PWM_POLARITY_INVERTED>;
+		power-supply =3D <&reg_lcd1_pwr>;
+		/*
+		 * a poor man's way to create a 1:1 relationship between
+		 * the PWM value and the actual duty cycle
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
+	lvds0: fb@0 {
+		compatible =3D "fsl,mxc_sdc_fb";
+		disp_dev =3D "ldb";
+		interface_pix_fmt =3D "RGB666";
+		mode_str =3D "LDB-VGA";
+		default_bpp =3D <32>;
+		int_clk =3D <0>;
+		late_init =3D <0>;
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
+		status =3D "okay";
+
+		display-timings {
+			native-mode =3D <&lvds0_timing1>;
+
+			lvds0_timing0: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vfront-porch =3D <7>;
+				hsync-len =3D <60>;
+				vsync-len =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+
+			lvds0_timing1: VGA {
+				clock-frequency =3D <25200000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <48>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <31>;
+				vfront-porch =3D <12>;
+				hsync-len =3D <96>;
+				vsync-len =3D <2>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			lvds0_timing2: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vfront-porch =3D <5>;
+				hsync-len =3D <60>;
+				vsync-len =3D <13>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+		};
+	};
+
+	lvds1: fb@1 {
+		compatible =3D "fsl,mxc_sdc_fb";
+		disp_dev =3D "ldb";
+		interface_pix_fmt =3D "RGB24";
+		mode_str =3D "LDB-NL12880BC20";
+		default_bpp =3D <32>;
+		int_clk =3D <0>;
+		late_init =3D <0>;
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
+		status =3D "okay";
+
+		display-timings {
+			native-mode =3D <&lvds1_timing2>;
+
+			lvds1_timing0: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vfront-porch =3D <7>;
+				hsync-len =3D <60>;
+				vsync-len =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+
+			lvds1_timing1: VGA {
+				clock-frequency =3D <25200000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <48>;
+				hfront-porch =3D <16>;
+				vback-porch =3D <31>;
+				vfront-porch =3D <12>;
+				hsync-len =3D <96>;
+				vsync-len =3D <2>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+
+			lvds1_timing2: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vfront-porch =3D <5>;
+				hsync-len =3D <60>;
+				vsync-len =3D <13>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+		};
+	};
+};
+
+&can1 {
+	status =3D "disabled";
+};
+
+&can2 {
+	xceiver-supply =3D <&reg_3v3>;
+};
+
+&i2c3 {
+	polytouch1: eeti@04 {
+		compatible =3D "eeti,egalax_ts";
+		reg =3D <0x04>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_eeti>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <22 0>;
+		wakeup-gpios =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		linux,wakeup;
+	};
+};
+
+&iomuxc {
+	imx6q-tx6q-11x0 {
+		pinctrl_eeti: eetigrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b1 /* Interrupt */
+			>;
+		};
+	};
+};
+
+&ipu2 {
+	status =3D "disabled";
+};
+
+&kpp {
+	status =3D "disabled"; /* pads partially clash with backlight1 PWM */
+};
+
+&ldb {
+	ipu_id =3D <0>;
+	disp_id =3D <0>;
+	ext_ref =3D <0>;
+	mode =3D "sep0";
+	sec_ipu_id =3D <0>;
+	sec_disp_id =3D <1>;
+	status =3D "okay";
+};
+
+&pwm1 {
+	status =3D "okay";
+};
+
+&reg_lcd0_pwr {
+	status =3D "okay";
+};
+
+&reg_lcd1_pwr {
+	status =3D "okay";
+};
+
+&sata {
+	status =3D "okay";
+};
--=20
2.1.4
