From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCHv2] ARM: dts: imx6: add support for Ka-Ro TX6 modules
Date: Thu, 12 Jun 2014 15:05:17 +0200
Message-ID: <1402578317-12566-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for the Ka-Ro electronics GmbH TX6 modules.
There are five distinct module types with either i.MX6Q or i.MX6DL and
LVDS or LCD display interface and one DTS file for a complete system
with an i.MX6DL based TX6 module and a baseboard mounted on the back
of a display (imx6dl-tx6dl-comtft.dts).

Changes wrt. v1
- addressed comments by Shawn Guo


Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                   |    8 +
 arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts    |  103 ++++
 arch/arm/boot/dts/imx6dl-tx6u-801x.dts       |  177 +++++++
 arch/arm/boot/dts/imx6dl-tx6u-811x.dts       |  150 ++++++
 arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts |  103 ++++
 arch/arm/boot/dts/imx6q-tx6q-1010.dts        |  177 +++++++
 arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts |  136 +++++
 arch/arm/boot/dts/imx6q-tx6q-1020.dts        |  210 ++++++++
 arch/arm/boot/dts/imx6q-tx6q-1110.dts        |  154 ++++++
 arch/arm/boot/dts/imx6qdl-tx6.dtsi           |  696 ++++++++++++++++++=
++++++++
 10 files changed, 1914 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-801x.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-811x.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1010.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1020.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1110.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-tx6.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0f1e8be..8c75945 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -199,6 +199,9 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
 	imx6dl-sabreauto.dtb \
 	imx6dl-sabrelite.dtb \
 	imx6dl-sabresd.dtb \
+	imx6dl-tx6dl-comtft.dtb \
+	imx6dl-tx6u-801x.dtb \
+	imx6dl-tx6u-811x.dtb \
 	imx6dl-wandboard.dtb \
 	imx6q-arm2.dtb \
 	imx6q-cm-fx6.dtb \
@@ -219,6 +222,11 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
 	imx6q-sbc6x.dtb \
 	imx6q-udoo.dtb \
 	imx6q-wandboard.dtb \
+	imx6q-tx6q-1010.dtb \
+	imx6q-tx6q-1010-comtft.dtb \
+	imx6q-tx6q-1020.dtb \
+	imx6q-tx6q-1020-comtft.dtb \
+	imx6q-tx6q-1110.dtb \
 	imx6sl-evk.dtb \
 	imx6sx-sdb.dtb \
 	vf610-colibri.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts b/arch/arm/boot/=
dts/imx6dl-tx6dl-comtft.dts
new file mode 100644
index 0000000..913bb9a
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts
@@ -0,0 +1,103 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+	model =3D "Ka-Ro electronics TX6DL Module on CoMpact TFT";
+	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
+
+	aliases {
+		display =3D &display;
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 0>;
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		interface-pix-fmt =3D "rgb24";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_1>;
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
+			};
+		};
+
+		display-timings {
+			native-mode =3D <&ET070001DM6>;
+
+			ET070001DM6: CoMTFT { /* same as ET0700 but with inverted pixel clo=
ck */
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
+				pixelclk-active =3D <1>;
+			};
+		};
+        };
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
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&kpp {
+	status =3D "disabled";
+};
+
+&reg_can_xcvr {
+	status =3D "disabled";
+};
+
+&touchscreen {
+	status =3D "disabled";
+};
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-801x.dts b/arch/arm/boot/dts=
/imx6dl-tx6u-801x.dts
new file mode 100644
index 0000000..5fe465c
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6u-801x.dts
@@ -0,0 +1,177 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+	model =3D "Ka-Ro electronics TX6U-801x Module";
+	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
+
+	aliases {
+		display =3D &display;
+	};
+
+	backlight: backlight {
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		interface-pix-fmt =3D "rgb24";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_1>;
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
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
+        };
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts b/arch/arm/boot/dts=
/imx6dl-tx6u-811x.dts
new file mode 100644
index 0000000..7318c5a
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
@@ -0,0 +1,150 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+	model =3D "Ka-Ro electronics TX6U-811x Module";
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
+		pwms =3D <&pwm2 0 500000 0>;
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
+		pwms =3D <&pwm1 0 500000 0>;
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
+};
+
+&i2c3 {
+	polytouch2: eeti@04 {
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
+	imx6dl-tx6u-811x {
+		pinctrl_eeti: eetigrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b1 /* Interrupt */
+			>;
+		};
+	};
+};
+
+&kpp {
+	status =3D "disabled"; /* pad conflict with backlight1 PWM */
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
+			native-mode =3D <&lvds_timing0>;
+			lvds_timing0: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vfront-porch =3D <7>;
+				hsync-len =3D <60>;
+				vsync-len =3D <10>;
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
+			native-mode =3D <&lvds_timing1>;
+			lvds_timing1: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vfront-porch =3D <7>;
+				hsync-len =3D <60>;
+				vsync-len =3D <10>;
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
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts b/arch/arm/bo=
ot/dts/imx6q-tx6q-1010-comtft.dts
new file mode 100644
index 0000000..b18fae1
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts
@@ -0,0 +1,103 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+	model =3D "Ka-Ro electronics TX6Q-1010 Module on CoMpact TFT";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
+
+	aliases {
+		display =3D &display;
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 0>;
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		interface-pix-fmt =3D "rgb24";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_1>;
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
+			};
+		};
+
+		display-timings {
+			native-mode =3D <&ET070001DM6>;
+
+			ET070001DM6: CoMTFT { /* same as ET0700 but with inverted pixel clo=
ck */
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
+				pixelclk-active =3D <1>;
+			};
+		};
+        };
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
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&kpp {
+	status =3D "disabled";
+};
+
+&reg_can_xcvr {
+	status =3D "disabled";
+};
+
+&touchscreen {
+	status =3D "disabled";
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1010.dts b/arch/arm/boot/dts/=
imx6q-tx6q-1010.dts
new file mode 100644
index 0000000..b58ec9c
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-1010.dts
@@ -0,0 +1,177 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+	model =3D "Ka-Ro electronics TX6Q-1010 Module";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
+
+	aliases {
+		display =3D &display;
+	};
+
+	backlight: backlight {
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		interface-pix-fmt =3D "rgb24";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_1>;
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
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
+        };
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts b/arch/arm/bo=
ot/dts/imx6q-tx6q-1020-comtft.dts
new file mode 100644
index 0000000..0bb9a9d
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts
@@ -0,0 +1,136 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+	model =3D "Ka-Ro electronics TX6Q-1020 Module on CoMpact TFT";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
+
+	aliases {
+		display =3D &display;
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 0>;
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		interface-pix-fmt =3D "rgb24";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_1>;
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
+			};
+		};
+
+		display-timings {
+			native-mode =3D <&ET070001DM6>;
+
+			ET070001DM6: CoMTFT { /* same as ET0700 but with inverted pixel clo=
ck */
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
+				pixelclk-active =3D <1>;
+			};
+		};
+        };
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
+&ds1339 {
+	status =3D "disabled";
+};
+
+&gpmi {
+	status =3D "disabled";
+};
+
+&iomuxc {
+	imx6qdl-tx6 {
+		pinctrl_usdhc4: usdhc4grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD4_CMD__SD4_CMD		0x070b1
+				MX6QDL_PAD_SD4_CLK__SD4_CLK		0x070b1
+				MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x070b1
+				MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x070b1
+				MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x070b1
+				MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x070b1
+				MX6QDL_PAD_NANDF_ALE__SD4_RESET		0x0b0b1
+			>;
+		};
+	};
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&kpp {
+	status =3D "disabled";
+};
+
+&reg_can_xcvr {
+	status =3D "disabled";
+};
+
+&touchscreen {
+	status =3D "disabled";
+};
+
+&usdhc4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc4>;
+	bus-width =3D <4>;
+	no-1-8-v;
+	fsl,wp-controller;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1020.dts b/arch/arm/boot/dts/=
imx6q-tx6q-1020.dts
new file mode 100644
index 0000000..b96d80a
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-1020.dts
@@ -0,0 +1,210 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+	model =3D "Ka-Ro electronics TX6Q-1020 Module";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
+
+	aliases {
+		display =3D &display;
+	};
+
+	backlight: backlight {
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		interface-pix-fmt =3D "rgb24";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_1>;
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
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
+        };
+};
+
+&ds1339 {
+	status =3D "disabled";
+};
+
+&gpmi {
+	status =3D "disabled";
+};
+
+&iomuxc {
+	imx6qdl-tx6 {
+		pinctrl_usdhc4: usdhc4grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD4_CMD__SD4_CMD		0x070b1
+				MX6QDL_PAD_SD4_CLK__SD4_CLK		0x070b1
+				MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x070b1
+				MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x070b1
+				MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x070b1
+				MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x070b1
+				MX6QDL_PAD_NANDF_ALE__SD4_RESET		0x0b0b1
+			>;
+		};
+	};
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&usdhc4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc4>;
+	bus-width =3D <4>;
+	no-1-8-v;
+	fsl,wp-controller;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1110.dts b/arch/arm/boot/dts/=
imx6q-tx6q-1110.dts
new file mode 100644
index 0000000..d2c9dfa
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-1110.dts
@@ -0,0 +1,154 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+	model =3D "Ka-Ro electronics TX6Q-1110 Module";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
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
+		pwms =3D <&pwm1 0 500000 0>;
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
+	imx6q-tx6q-1110 {
+		pinctrl_eeti: eetigrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b1 /* Interrupt */
+			>;
+		};
+	};
+};
+
+&kpp {
+	status =3D "disabled"; /* pad conflict with backlight1 PWM */
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
+			native-mode =3D <&lvds_timing0>;
+			lvds_timing0: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vfront-porch =3D <7>;
+				hsync-len =3D <60>;
+				vsync-len =3D <10>;
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
+			native-mode =3D <&lvds_timing1>;
+			lvds_timing1: hsd100pxn1 {
+				clock-frequency =3D <65000000>;
+				hactive =3D <1024>;
+				vactive =3D <768>;
+				hback-porch =3D <220>;
+				hfront-porch =3D <40>;
+				vback-porch =3D <21>;
+				vfront-porch =3D <7>;
+				hsync-len =3D <60>;
+				vsync-len =3D <10>;
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
+&sata {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx=
6qdl-tx6.dtsi
new file mode 100644
index 0000000..5c350a3
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -0,0 +1,696 @@
+/*
+ * Copyright 2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	aliases {
+		can0 =3D &can2;
+		can1 =3D &can1;
+		ethernet0 =3D &fec;
+		lcdif_23bit_pins_a =3D &pinctrl_disp0_1;
+		lcdif_24bit_pins_a =3D &pinctrl_disp0_2;
+		pwm0 =3D &pwm1;
+		pwm1 =3D &pwm2;
+		reg_can_xcvr =3D &reg_can_xcvr;
+		stk5led =3D &user_led;
+		usbotg =3D &usbotg;
+		sdhc0 =3D &usdhc1;
+		sdhc1 =3D &usdhc2;
+	};
+
+	memory {
+		reg =3D <0 0>; /* will be filled by U-Boot */
+	};
+
+	clocks {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
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
+
+		power {
+			label =3D "Power Button";
+			gpios =3D <&gpio5 2 GPIO_ACTIVE_HIGH>;
+			linux,code =3D <KEY_POWER>;
+			gpio-key,wakeup;
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+
+		user_led: user {
+			label =3D "Heartbeat";
+			gpios =3D <&gpio2 20 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+
+	regulators {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		reg_3v3_etn: regulator@0 {
+			compatible =3D "regulator-fixed";
+			reg =3D <0>;
+			regulator-name =3D "3V3_ETN";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_etnphy_power>;
+			gpio =3D <&gpio3 20 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_2v5: regulator@1 {
+			compatible =3D "regulator-fixed";
+			reg =3D <1>;
+			regulator-name =3D "2V5";
+			regulator-min-microvolt =3D <2500000>;
+			regulator-max-microvolt =3D <2500000>;
+			regulator-always-on;
+		};
+
+		reg_3v3: regulator@2 {
+			compatible =3D "regulator-fixed";
+			reg =3D <2>;
+			regulator-name =3D "3V3";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			regulator-always-on;
+		};
+
+		reg_can_xcvr: regulator@3 {
+			compatible =3D "regulator-fixed";
+			reg =3D <3>;
+			regulator-name =3D "CAN XCVR";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_flexcan_xcvr>;
+			gpio =3D <&gpio4 21 GPIO_ACTIVE_HIGH>;
+			enable-active-low;
+		};
+
+		reg_lcd0_pwr: regulator@4 {
+			compatible =3D "regulator-fixed";
+			reg =3D <4>;
+			regulator-name =3D "LCD0 POWER";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_lcd0_pwr>;
+			gpio =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		reg_lcd1_pwr: regulator@5 {
+			compatible =3D "regulator-fixed";
+			reg =3D <5>;
+			regulator-name =3D "LCD1 POWER";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_lcd1_pwr>;
+			gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		reg_usbh1_vbus: regulator@6 {
+			compatible =3D "regulator-fixed";
+			reg =3D <6>;
+			regulator-name =3D "usbh1_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_usbh1_vbus>;
+			gpio =3D <&gpio3 31 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usbotg_vbus: regulator@7 {
+			compatible =3D "regulator-fixed";
+			reg =3D <7>;
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
+		compatible =3D "karo,imx6qdl-tx6qdl-sgtl5000",
+			     "fsl,imx-audio-sgtl5000";
+		model =3D "sgtl5000-audio";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_audmux>;
+		ssi-controller =3D <&ssi1>;
+		audio-codec =3D <&sgtl5000>;
+		audio-routing =3D
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+		mux-int-port =3D <1>;
+		mux-ext-port =3D <5>;
+	};
+};
+
+&audmux {
+	status =3D "okay";
+};
+
+&can1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan1>;
+	xceiver-supply =3D <&reg_can_xcvr>;
+	status =3D "okay";
+};
+
+&can2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan2>;
+	xceiver-supply =3D <&reg_can_xcvr>;
+	status =3D "okay";
+};
+
+&ecspi1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_ecspi1>;
+	fsl,spi-num-chipselects =3D <2>;
+	cs-gpios =3D <
+		&gpio2 30 GPIO_ACTIVE_HIGH
+		&gpio3 19 GPIO_ACTIVE_HIGH
+	>;
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
+&fec {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_enet>;
+	phy-mode =3D "rmii";
+	phy-reset-gpios =3D <&gpio7 6 GPIO_ACTIVE_HIGH>;
+	phy-supply =3D <&reg_3v3_etn>;
+	status =3D "okay";
+};
+
+&gpmi {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
+	fsl,no-blockmark-swap;
+	status =3D "okay";
+};
+
+&i2c1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c1>;
+	clock-frequency =3D <400000>;
+	status =3D "okay";
+
+	ds1339: rtc@68 {
+		compatible =3D "dallas,ds1339";
+		reg =3D <0x68>;
+	};
+};
+
+&i2c3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c3>;
+	clock-frequency =3D <400000>;
+	status =3D "okay";
+
+	sgtl5000: sgtl5000@0a {
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
+		pinctrl-0 =3D <&pinctrl_edt_ft5x06>;
+		interrupt-parent =3D <&gpio6>;
+		interrupts =3D <15 0>;
+		reset-gpios =3D <&gpio2 22 GPIO_ACTIVE_LOW>;
+		wake-gpios =3D <&gpio2 21 GPIO_ACTIVE_HIGH>;
+		linux,wakeup;
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
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_hog>;
+
+	imx6qdl-tx6 {
+		pinctrl_hog: hoggrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_A18__GPIO2_IO20		0x1b0b1 /* LED */
+				MX6QDL_PAD_SD3_DAT2__GPIO7_IO06		0x1b0b1 /* ETN PHY RESET */
+				MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x1b0b1 /* ETN PHY INT */
+				MX6QDL_PAD_EIM_A25__GPIO5_IO02		0x1b0b1 /* PWR BTN */
+			>;
+		};
+
+		pinctrl_audmux: audmuxgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_ROW1__AUD5_RXD		0x130b0 /* SSI1_RXD */
+				MX6QDL_PAD_KEY_ROW0__AUD5_TXD		0x110b0 /* SSI1_TXD */
+				MX6QDL_PAD_KEY_COL0__AUD5_TXC		0x130b0 /* SSI1_CLK */
+				MX6QDL_PAD_KEY_COL1__AUD5_TXFS		0x130b0 /* SSI1_FS */
+			>;
+		};
+
+		pinctrl_disp0_1: disp0grp-1 {
+			fsl,pins =3D <
+				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
+				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
+				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
+				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
+				/* PAD DISP0_DAT0 is used for the Flexcan transceiver control */
+				MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
+				MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
+				MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
+				MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
+				MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
+				MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
+				MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
+				MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
+				MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
+				MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
+				MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
+				MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
+				MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
+				MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
+				MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
+				MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
+				MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
+				MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
+				MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
+				MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
+				MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
+				MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
+				MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
+			>;
+		};
+
+		pinctrl_disp0_2: disp0grp-2 {
+			fsl,pins =3D <
+				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
+				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
+				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
+				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
+				MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00   0x10
+				MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
+				MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
+				MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
+				MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
+				MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
+				MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
+				MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
+				MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
+				MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
+				MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
+				MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
+				MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
+				MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
+				MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
+				MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
+				MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
+				MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
+				MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
+				MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
+				MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
+				MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
+				MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
+				MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
+			>;
+		};
+
+		pinctrl_ecspi1: ecspi1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x0b0b0
+				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x0b0b0
+				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x0b0b0
+				MX6QDL_PAD_GPIO_19__ECSPI1_RDY		0x0b0b0
+				MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x0b0b0 /* SPI CS0 */
+				MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x0b0b0 /* SPI CS1 */
+			>;
+		};
+
+		pinctrl_edt_ft5x06: edt-ft5x06grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_CS2__GPIO6_IO15	0x1b0b0 /* Interrupt */
+				MX6QDL_PAD_EIM_A16__GPIO2_IO22  	0x1b0b0 /* Reset */
+				MX6QDL_PAD_EIM_A17__GPIO2_IO21  	0x1b0b0 /* Wake */
+			>;
+		};
+
+		pinctrl_enet: enetgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+				MX6QDL_PAD_ENET_RXD0__ENET_RX_DATA0	0x1b0b0
+				MX6QDL_PAD_ENET_RXD1__ENET_RX_DATA1	0x1b0b0
+				MX6QDL_PAD_ENET_RX_ER__ENET_RX_ER	0x1b0b0
+				MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN	0x1b0b0
+				MX6QDL_PAD_ENET_TXD0__ENET_TX_DATA0	0x1b0b0
+				MX6QDL_PAD_ENET_TXD1__ENET_TX_DATA1	0x1b0b0
+				MX6QDL_PAD_ENET_CRS_DV__ENET_RX_EN	0x1b0b0
+			>;
+		};
+
+		pinctrl_etnphy_power: etnphy-pwrgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D20__GPIO3_IO20		0x1b0b1 /* ETN PHY POWER */
+			>;
+		};
+
+		pinctrl_flexcan1: flexcan1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_7__FLEXCAN1_TX		0x1b0b0
+				MX6QDL_PAD_GPIO_8__FLEXCAN1_RX		0x1b0b0
+			>;
+		};
+
+		pinctrl_flexcan2: flexcan2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX	0x1b0b0
+				MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX	0x1b0b0
+			>;
+		};
+
+		pinctrl_flexcan_xcvr: flexcan-xcvrgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_DISP0_DAT0__GPIO4_IO21	0x1b0b0 /* Flexcan XCVR enable *=
/
+			>;
+		};
+
+		pinctrl_gpmi_nand: gpminandgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_CLE__NAND_CLE    	0x0b0b1
+				MX6QDL_PAD_NANDF_ALE__NAND_ALE    	0x0b0b1
+				MX6QDL_PAD_NANDF_WP_B__NAND_WP_B  	0x0b0b1
+				MX6QDL_PAD_NANDF_RB0__NAND_READY_B	0x0b000
+				MX6QDL_PAD_NANDF_CS0__NAND_CE0_B  	0x0b0b1
+				MX6QDL_PAD_SD4_CMD__NAND_RE_B     	0x0b0b1
+				MX6QDL_PAD_SD4_CLK__NAND_WE_B     	0x0b0b1
+				MX6QDL_PAD_NANDF_D0__NAND_DATA00  	0x0b0b1
+				MX6QDL_PAD_NANDF_D1__NAND_DATA01  	0x0b0b1
+				MX6QDL_PAD_NANDF_D2__NAND_DATA02  	0x0b0b1
+				MX6QDL_PAD_NANDF_D3__NAND_DATA03  	0x0b0b1
+				MX6QDL_PAD_NANDF_D4__NAND_DATA04  	0x0b0b1
+				MX6QDL_PAD_NANDF_D5__NAND_DATA05  	0x0b0b1
+				MX6QDL_PAD_NANDF_D6__NAND_DATA06  	0x0b0b1
+				MX6QDL_PAD_NANDF_D7__NAND_DATA07  	0x0b0b1
+			>;
+		};
+
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+				MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+			>;
+		};
+
+		pinctrl_i2c3: i2c3grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
+				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+			>;
+		};
+
+		pinctrl_kpp: kppgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_9__KEY_COL6		0x1b0b1
+				MX6QDL_PAD_GPIO_4__KEY_COL7		0x1b0b1
+				MX6QDL_PAD_KEY_COL2__KEY_COL2		0x1b0b1
+				MX6QDL_PAD_KEY_COL3__KEY_COL3		0x1b0b1
+				MX6QDL_PAD_GPIO_2__KEY_ROW6		0x1b0b1
+				MX6QDL_PAD_GPIO_5__KEY_ROW7		0x1b0b1
+				MX6QDL_PAD_KEY_ROW2__KEY_ROW2		0x1b0b1
+				MX6QDL_PAD_KEY_ROW3__KEY_ROW3		0x1b0b1
+			>;
+		};
+
+		pinctrl_lcd0_pwr: lcd0-pwrgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D29__GPIO3_IO29		0x1b0b1 /* LCD Reset */
+			>;
+		};
+
+		pinctrl_lcd1_pwr: lcd1-pwrgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_EB3__GPIO2_IO31		0x1b0b1 /* LCD Power Enable */
+			>;
+		};
+
+		pinctrl_pwm1: pwm1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_9__PWM1_OUT		0x1b0b1
+			>;
+		};
+
+		pinctrl_pwm2: pwm2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_1__PWM2_OUT		0x1b0b1
+			>;
+		};
+
+		pinctrl_tsc2007: tsc2007grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D26__GPIO3_IO26		0x1b0b0 /* Interrupt */
+			>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b0b1
+				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b0b1
+			>;
+		};
+
+		pinctrl_uart1_rtscts: uart1_rtsctsgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD3_DAT1__UART1_RTS_B	0x1b0b1
+				MX6QDL_PAD_SD3_DAT0__UART1_CTS_B	0x1b0b1
+			>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+			>;
+		};
+
+		pinctrl_uart2_rtscts: uart2_rtsctsgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD4_DAT5__UART2_RTS_B	0x1b0b1
+				MX6QDL_PAD_SD4_DAT6__UART2_CTS_B	0x1b0b1
+			>;
+		};
+
+		pinctrl_uart3: uart3grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+				MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+			>;
+		};
+
+		pinctrl_uart3_rtscts: uart3_rtsctsgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD3_DAT3__UART3_CTS_B	0x1b0b1
+				MX6QDL_PAD_SD3_RST__UART3_RTS_B		0x1b0b1
+			>;
+		};
+
+		pinctrl_usbh1_vbus: usbh1-vbusgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D31__GPIO3_IO31		0x1b0b0 /* USBH1_VBUSEN */
+			>;
+		};
+
+		pinctrl_usbotg: usbotggrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x17059
+			>;
+		};
+
+		pinctrl_usbotg_vbus: usbotg-vbusgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_GPIO_7__GPIO1_IO07		0x1b0b0 /* USBOTG_VBUSEN */
+			>;
+		};
+
+		pinctrl_usdhc1: usdhc1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD1_CMD__SD1_CMD		0x070b1
+				MX6QDL_PAD_SD1_CLK__SD1_CLK		0x070b1
+				MX6QDL_PAD_SD1_DAT0__SD1_DATA0		0x070b1
+				MX6QDL_PAD_SD1_DAT1__SD1_DATA1		0x070b1
+				MX6QDL_PAD_SD1_DAT2__SD1_DATA2		0x070b1
+				MX6QDL_PAD_SD1_DAT3__SD1_DATA3		0x070b1
+				MX6QDL_PAD_SD3_CMD__GPIO7_IO02		0x170b0 /* SD1 CD */
+			>;
+		};
+
+		pinctrl_usdhc2: usdhc2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x070b1
+				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x070b1
+				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x070b1
+				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x070b1
+				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x070b1
+				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x070b1
+				MX6QDL_PAD_SD3_CLK__GPIO7_IO03		0x170b0 /* SD2 CD */
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
+		MATRIX_KEY(6, 6, KEY_POWER) /* 0x06060074 */
+		MATRIX_KEY(6, 7, KEY_KP0) /* 0x06070052 */
+		MATRIX_KEY(6, 2, KEY_KP1) /* 0x0602004f */
+		MATRIX_KEY(6, 3, KEY_KP2) /* 0x06030050 */
+		MATRIX_KEY(7, 6, KEY_KP3) /* 0x07060051 */
+		MATRIX_KEY(7, 7, KEY_KP4) /* 0x0707004b */
+		MATRIX_KEY(7, 2, KEY_KP5) /* 0x0702004c */
+		MATRIX_KEY(7, 3, KEY_KP6) /* 0x0703004d */
+		MATRIX_KEY(2, 6, KEY_KP7) /* 0x02060047 */
+		MATRIX_KEY(2, 7, KEY_KP8) /* 0x02070048 */
+		MATRIX_KEY(2, 2, KEY_KP9) /* 0x02020049 */
+	>;
+};
+
+&pwm1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm1>;
+	#pwm-cells =3D <3>;
+	status =3D "disabled";
+};
+
+&pwm2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_pwm2>;
+	#pwm-cells =3D <3>;
+	status =3D "okay";
+};
+
+&ssi1 {
+	fsl,mode =3D "i2s-slave";
+	status =3D "okay";
+};
+
+&uart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1>;
+	status =3D "okay";
+};
+
+&uart2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart2 &pinctrl_uart2_rtscts>;
+	status =3D "okay";
+};
+
+&uart3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart3 &pinctrl_uart3_rtscts>;
+	status =3D "okay";
+};
+
+&usbh1 {
+	vbus-supply =3D <&reg_usbh1_vbus>;
+	dr_mode =3D "host";
+	disable-over-current;
+	status =3D "okay";
+};
+
+&usbotg {
+	vbus-supply =3D <&reg_usbotg_vbus>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usbotg>;
+	dr_mode =3D "peripheral";
+	disable-over-current;
+	status =3D "okay";
+};
+
+&usdhc1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc1>;
+	bus-width =3D <4>;
+	no-1-8-v;
+	cd-gpios =3D <&gpio7 2 0>;
+	fsl,wp-controller;
+	status =3D "okay";
+};
+
+&usdhc2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc2>;
+	bus-width =3D <4>;
+	no-1-8-v;
+	cd-gpios =3D <&gpio7 3 0>;
+	fsl,wp-controller;
+	status =3D "okay";
+};
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
