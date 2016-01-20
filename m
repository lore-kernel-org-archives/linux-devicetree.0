From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 4/6] ARM: dts: imx6: change TX6 module names due to new HW revision
Date: Wed, 20 Jan 2016 13:57:04 +0100
Message-ID: <1453294626-17608-5-git-send-email-LW@KARO-electronics.de>
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

The second last digit of the Ka-Ro electronics TX-module names denotes
the HW revision of the module. HW rev 1 and 3 of the TX6 modules can
use the same DTB. Change this digit to 'x' to indicate that the DTB
file can be used for both HW revisions.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/Makefile                   |  10 +-
 arch/arm/boot/dts/imx6dl-tx6u-801x.dts       | 177 -------------------
 arch/arm/boot/dts/imx6dl-tx6u-80xx.dts       | 185 +++++++++++++++++++=
+
 arch/arm/boot/dts/imx6dl-tx6u-811x.dts       | 150 ----------------
 arch/arm/boot/dts/imx6dl-tx6u-81xx.dts       | 156 +++++++++++++++++
 arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts | 103 -----------
 arch/arm/boot/dts/imx6q-tx6q-1010.dts        | 177 -------------------
 arch/arm/boot/dts/imx6q-tx6q-10x0-comtft.dts | 119 +++++++++++++
 arch/arm/boot/dts/imx6q-tx6q-10x0.dts        | 191 +++++++++++++++++++=
+
 arch/arm/boot/dts/imx6q-tx6q-1110.dts        | 154 -----------------
 arch/arm/boot/dts/imx6q-tx6q-11x0.dts        | 249 +++++++++++++++++++=
++++++++
 11 files changed, 905 insertions(+), 766 deletions(-)
 delete mode 100644 arch/arm/boot/dts/imx6dl-tx6u-801x.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-80xx.dts
 delete mode 100644 arch/arm/boot/dts/imx6dl-tx6u-811x.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-81xx.dts
 delete mode 100644 arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts
 delete mode 100644 arch/arm/boot/dts/imx6q-tx6q-1010.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-10x0-comtft.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-10x0.dts
 delete mode 100644 arch/arm/boot/dts/imx6q-tx6q-1110.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-11x0.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a4a6d70..5759aac 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -312,8 +312,8 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
 	imx6dl-sabrelite.dtb \
 	imx6dl-sabresd.dtb \
 	imx6dl-tx6dl-comtft.dtb \
-	imx6dl-tx6u-801x.dtb \
-	imx6dl-tx6u-811x.dtb \
+	imx6dl-tx6u-80xx.dtb \
+	imx6dl-tx6u-81xx.dtb \
 	imx6dl-udoo.dtb \
 	imx6dl-wandboard.dtb \
 	imx6dl-wandboard-revb1.dtb \
@@ -342,11 +342,11 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
 	imx6q-sabresd.dtb \
 	imx6q-sbc6x.dtb \
 	imx6q-tbs2910.dtb \
-	imx6q-tx6q-1010.dtb \
-	imx6q-tx6q-1010-comtft.dtb \
 	imx6q-tx6q-1020.dtb \
 	imx6q-tx6q-1020-comtft.dtb \
-	imx6q-tx6q-1110.dtb \
+	imx6q-tx6q-10x0-comtft.dtb \
+	imx6q-tx6q-10x0.dtb \
+	imx6q-tx6q-11x0.dtb \
 	imx6q-udoo.dtb \
 	imx6q-wandboard.dtb \
 	imx6q-wandboard-revb1.dtb
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-801x.dts b/arch/arm/boot/dts=
/imx6dl-tx6u-801x.dts
deleted file mode 100644
index 5fe465c..0000000
--- a/arch/arm/boot/dts/imx6dl-tx6u-801x.dts
+++ /dev/null
@@ -1,177 +0,0 @@
-/*
- * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
- *
- * The code contained herein is licensed under the GNU General Public
- * License. You may obtain a copy of the GNU General Public License
- * Version 2 at the following locations:
- *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
- */
-
-/dts-v1/;
-#include "imx6dl.dtsi"
-#include "imx6qdl-tx6.dtsi"
-
-/ {
-	model =3D "Ka-Ro electronics TX6U-801x Module";
-	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
-
-	aliases {
-		display =3D &display;
-	};
-
-	backlight: backlight {
-		compatible =3D "pwm-backlight";
-		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
-		power-supply =3D <&reg_3v3>;
-		/*
-		 * a poor man's way to create a 1:1 relationship between
-		 * the PWM value and the actual duty cycle
-		 */
-		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
-				     10 11 12 13 14 15 16 17 18 19
-				     20 21 22 23 24 25 26 27 28 29
-				     30 31 32 33 34 35 36 37 38 39
-				     40 41 42 43 44 45 46 47 48 49
-				     50 51 52 53 54 55 56 57 58 59
-				     60 61 62 63 64 65 66 67 68 69
-				     70 71 72 73 74 75 76 77 78 79
-				     80 81 82 83 84 85 86 87 88 89
-				     90 91 92 93 94 95 96 97 98 99
-				    100>;
-		default-brightness-level =3D <50>;
-	};
-
-	display: display@di0 {
-		compatible =3D "fsl,imx-parallel-display";
-		interface-pix-fmt =3D "rgb24";
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&pinctrl_disp0_1>;
-		status =3D "okay";
-
-		port {
-			display0_in: endpoint {
-				remote-endpoint =3D <&ipu1_di0_disp0>;
-			};
-		};
-
-		display-timings {
-			VGA {
-				clock-frequency =3D <25200000>;
-				hactive =3D <640>;
-				vactive =3D <480>;
-				hback-porch =3D <48>;
-				hsync-len =3D <96>;
-				hfront-porch =3D <16>;
-				vback-porch =3D <31>;
-				vsync-len =3D <2>;
-				vfront-porch =3D <12>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ETV570 {
-				clock-frequency =3D <25200000>;
-				hactive =3D <640>;
-				vactive =3D <480>;
-				hback-porch =3D <114>;
-				hsync-len =3D <30>;
-				hfront-porch =3D <16>;
-				vback-porch =3D <32>;
-				vsync-len =3D <3>;
-				vfront-porch =3D <10>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ET0350 {
-				clock-frequency =3D <6413760>;
-				hactive =3D <320>;
-				vactive =3D <240>;
-				hback-porch =3D <34>;
-				hsync-len =3D <34>;
-				hfront-porch =3D <20>;
-				vback-porch =3D <15>;
-				vsync-len =3D <3>;
-				vfront-porch =3D <4>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ET0430 {
-				clock-frequency =3D <9009000>;
-				hactive =3D <480>;
-				vactive =3D <272>;
-				hback-porch =3D <2>;
-				hsync-len =3D <41>;
-				hfront-porch =3D <2>;
-				vback-porch =3D <2>;
-				vsync-len =3D <10>;
-				vfront-porch =3D <2>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <1>;
-			};
-
-			ET0500 {
-				clock-frequency =3D <33264000>;
-				hactive =3D <800>;
-				vactive =3D <480>;
-				hback-porch =3D <88>;
-				hsync-len =3D <128>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <33>;
-				vsync-len =3D <2>;
-				vfront-porch =3D <10>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ET0700 { /* same as ET0500 */
-				clock-frequency =3D <33264000>;
-				hactive =3D <800>;
-				vactive =3D <480>;
-				hback-porch =3D <88>;
-				hsync-len =3D <128>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <33>;
-				vsync-len =3D <2>;
-				vfront-porch =3D <10>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ETQ570 {
-				clock-frequency =3D <6596040>;
-				hactive =3D <320>;
-				vactive =3D <240>;
-				hback-porch =3D <38>;
-				hsync-len =3D <30>;
-				hfront-porch =3D <30>;
-				vback-porch =3D <16>;
-				vsync-len =3D <3>;
-				vfront-porch =3D <4>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-		};
-        };
-};
-
-&ipu1_di0_disp0 {
-	remote-endpoint =3D <&display0_in>;
-};
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-80xx.dts b/arch/arm/boot/dts=
/imx6dl-tx6u-80xx.dts
new file mode 100644
index 0000000..f6621d6
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6u-80xx.dts
@@ -0,0 +1,185 @@
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
+	model =3D "Ka-Ro electronics TX6U-801x/-803x Module";
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
+	};
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&reg_lcd0_pwr {
+	status =3D "okay";
+};
+
+&reg_lcd1_pwr {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts b/arch/arm/boot/dts=
/imx6dl-tx6u-811x.dts
deleted file mode 100644
index c275eec..0000000
--- a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
+++ /dev/null
@@ -1,150 +0,0 @@
-/*
- * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
- *
- * The code contained herein is licensed under the GNU General Public
- * License. You may obtain a copy of the GNU General Public License
- * Version 2 at the following locations:
- *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
- */
-
-/dts-v1/;
-#include "imx6dl.dtsi"
-#include "imx6qdl-tx6.dtsi"
-
-/ {
-	model =3D "Ka-Ro electronics TX6U-811x Module";
-	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
-
-	aliases {
-		display =3D &lvds0;
-		lvds0 =3D &lvds0;
-		lvds1 =3D &lvds1;
-	};
-
-	backlight0: backlight0 {
-		compatible =3D "pwm-backlight";
-		pwms =3D <&pwm2 0 500000 0>;
-		power-supply =3D <&reg_lcd0_pwr>;
-		/*
-		 * a poor man's way to create a 1:1 relationship between
-		 * the PWM value and the actual duty cycle
-		 */
-		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
-				     10 11 12 13 14 15 16 17 18 19
-				     20 21 22 23 24 25 26 27 28 29
-				     30 31 32 33 34 35 36 37 38 39
-				     40 41 42 43 44 45 46 47 48 49
-				     50 51 52 53 54 55 56 57 58 59
-				     60 61 62 63 64 65 66 67 68 69
-				     70 71 72 73 74 75 76 77 78 79
-				     80 81 82 83 84 85 86 87 88 89
-				     90 91 92 93 94 95 96 97 98 99
-				    100>;
-		default-brightness-level =3D <50>;
-	};
-
-	backlight1: backlight1 {
-		compatible =3D "pwm-backlight";
-		pwms =3D <&pwm1 0 500000 0>;
-		power-supply =3D <&reg_lcd1_pwr>;
-		/*
-		 * a poor man's way to create a 1:1 relationship between
-		 * the PWM value and the actual duty cycle
-		 */
-		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
-				     10 11 12 13 14 15 16 17 18 19
-				     20 21 22 23 24 25 26 27 28 29
-				     30 31 32 33 34 35 36 37 38 39
-				     40 41 42 43 44 45 46 47 48 49
-				     50 51 52 53 54 55 56 57 58 59
-				     60 61 62 63 64 65 66 67 68 69
-				     70 71 72 73 74 75 76 77 78 79
-				     80 81 82 83 84 85 86 87 88 89
-				     90 91 92 93 94 95 96 97 98 99
-				    100>;
-		default-brightness-level =3D <50>;
-	};
-};
-
-&i2c3 {
-	polytouch2: eeti@04 {
-		compatible =3D "eeti,egalax_ts";
-		reg =3D <0x04>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&pinctrl_eeti>;
-		interrupt-parent =3D <&gpio3>;
-		interrupts =3D <22 0>;
-		wakeup-gpios =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
-		linux,wakeup;
-	};
-};
-
-&iomuxc {
-	imx6dl-tx6u-811x {
-		pinctrl_eeti: eetigrp {
-			fsl,pins =3D <
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b1 /* Interrupt */
-			>;
-		};
-	};
-};
-
-&kpp {
-	status =3D "disabled"; /* pad conflict with backlight1 PWM */
-};
-
-&ldb {
-	status =3D "okay";
-
-	lvds0: lvds-channel@0 {
-		fsl,data-mapping =3D "spwg";
-		fsl,data-width =3D <18>;
-		status =3D "okay";
-
-		display-timings {
-			native-mode =3D <&lvds_timing0>;
-			lvds_timing0: hsd100pxn1 {
-				clock-frequency =3D <65000000>;
-				hactive =3D <1024>;
-				vactive =3D <768>;
-				hback-porch =3D <220>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <21>;
-				vfront-porch =3D <7>;
-				hsync-len =3D <60>;
-				vsync-len =3D <10>;
-				de-active =3D <1>;
-				pixelclk-active =3D <1>;
-			};
-		};
-	};
-
-	lvds1: lvds-channel@1 {
-		fsl,data-mapping =3D "spwg";
-		fsl,data-width =3D <18>;
-		status =3D "disabled";
-
-		display-timings {
-			native-mode =3D <&lvds_timing1>;
-			lvds_timing1: hsd100pxn1 {
-				clock-frequency =3D <65000000>;
-				hactive =3D <1024>;
-				vactive =3D <768>;
-				hback-porch =3D <220>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <21>;
-				vfront-porch =3D <7>;
-				hsync-len =3D <60>;
-				vsync-len =3D <10>;
-				de-active =3D <1>;
-				pixelclk-active =3D <1>;
-			};
-		};
-	};
-};
-
-&pwm1 {
-	status =3D "okay";
-};
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-81xx.dts b/arch/arm/boot/dts=
/imx6dl-tx6u-81xx.dts
new file mode 100644
index 0000000..5ff8e13
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6u-81xx.dts
@@ -0,0 +1,156 @@
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
+	backlight1: backlight1 {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm1 0 500000 0>;
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
+			native-mode =3D <&lvds0_timing0>;
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
+		};
+	};
+
+	lvds1: lvds-channel@1 {
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
+		status =3D "disabled";
+
+		display-timings {
+			native-mode =3D <&lvds1_timing0>;
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
+		};
+	};
+};
+
+&pwm1 {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts b/arch/arm/bo=
ot/dts/imx6q-tx6q-1010-comtft.dts
deleted file mode 100644
index b18fae1..0000000
--- a/arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts
+++ /dev/null
@@ -1,103 +0,0 @@
-/*
- * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
- *
- * The code contained herein is licensed under the GNU General Public
- * License. You may obtain a copy of the GNU General Public License
- * Version 2 at the following locations:
- *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
- */
-
-/dts-v1/;
-#include "imx6q.dtsi"
-#include "imx6qdl-tx6.dtsi"
-
-/ {
-	model =3D "Ka-Ro electronics TX6Q-1010 Module on CoMpact TFT";
-	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
-
-	aliases {
-		display =3D &display;
-	};
-
-	backlight: backlight {
-		compatible =3D "pwm-backlight";
-		pwms =3D <&pwm2 0 500000 0>;
-		power-supply =3D <&reg_3v3>;
-		/*
-		 * a poor man's way to create a 1:1 relationship between
-		 * the PWM value and the actual duty cycle
-		 */
-		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
-				     10 11 12 13 14 15 16 17 18 19
-				     20 21 22 23 24 25 26 27 28 29
-				     30 31 32 33 34 35 36 37 38 39
-				     40 41 42 43 44 45 46 47 48 49
-				     50 51 52 53 54 55 56 57 58 59
-				     60 61 62 63 64 65 66 67 68 69
-				     70 71 72 73 74 75 76 77 78 79
-				     80 81 82 83 84 85 86 87 88 89
-				     90 91 92 93 94 95 96 97 98 99
-				    100>;
-		default-brightness-level =3D <50>;
-	};
-
-	display: display@di0 {
-		compatible =3D "fsl,imx-parallel-display";
-		interface-pix-fmt =3D "rgb24";
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&pinctrl_disp0_1>;
-		status =3D "okay";
-
-		port {
-			display0_in: endpoint {
-				remote-endpoint =3D <&ipu1_di0_disp0>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&ET070001DM6>;
-
-			ET070001DM6: CoMTFT { /* same as ET0700 but with inverted pixel clo=
ck */
-				clock-frequency =3D <33264000>;
-				hactive =3D <800>;
-				vactive =3D <480>;
-				hback-porch =3D <88>;
-				hsync-len =3D <128>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <33>;
-				vsync-len =3D <2>;
-				vfront-porch =3D <10>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <1>;
-			};
-		};
-        };
-};
-
-&can1 {
-	status =3D "disabled";
-};
-
-&can2 {
-	xceiver-supply =3D <&reg_3v3>;
-};
-
-&ipu1_di0_disp0 {
-	remote-endpoint =3D <&display0_in>;
-};
-
-&kpp {
-	status =3D "disabled";
-};
-
-&reg_can_xcvr {
-	status =3D "disabled";
-};
-
-&touchscreen {
-	status =3D "disabled";
-};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1010.dts b/arch/arm/boot/dts/=
imx6q-tx6q-1010.dts
deleted file mode 100644
index b58ec9c..0000000
--- a/arch/arm/boot/dts/imx6q-tx6q-1010.dts
+++ /dev/null
@@ -1,177 +0,0 @@
-/*
- * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
- *
- * The code contained herein is licensed under the GNU General Public
- * License. You may obtain a copy of the GNU General Public License
- * Version 2 at the following locations:
- *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
- */
-
-/dts-v1/;
-#include "imx6q.dtsi"
-#include "imx6qdl-tx6.dtsi"
-
-/ {
-	model =3D "Ka-Ro electronics TX6Q-1010 Module";
-	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
-
-	aliases {
-		display =3D &display;
-	};
-
-	backlight: backlight {
-		compatible =3D "pwm-backlight";
-		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
-		power-supply =3D <&reg_3v3>;
-		/*
-		 * a poor man's way to create a 1:1 relationship between
-		 * the PWM value and the actual duty cycle
-		 */
-		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
-				     10 11 12 13 14 15 16 17 18 19
-				     20 21 22 23 24 25 26 27 28 29
-				     30 31 32 33 34 35 36 37 38 39
-				     40 41 42 43 44 45 46 47 48 49
-				     50 51 52 53 54 55 56 57 58 59
-				     60 61 62 63 64 65 66 67 68 69
-				     70 71 72 73 74 75 76 77 78 79
-				     80 81 82 83 84 85 86 87 88 89
-				     90 91 92 93 94 95 96 97 98 99
-				    100>;
-		default-brightness-level =3D <50>;
-	};
-
-	display: display@di0 {
-		compatible =3D "fsl,imx-parallel-display";
-		interface-pix-fmt =3D "rgb24";
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&pinctrl_disp0_1>;
-		status =3D "okay";
-
-		port {
-			display0_in: endpoint {
-				remote-endpoint =3D <&ipu1_di0_disp0>;
-			};
-		};
-
-		display-timings {
-			VGA {
-				clock-frequency =3D <25200000>;
-				hactive =3D <640>;
-				vactive =3D <480>;
-				hback-porch =3D <48>;
-				hsync-len =3D <96>;
-				hfront-porch =3D <16>;
-				vback-porch =3D <31>;
-				vsync-len =3D <2>;
-				vfront-porch =3D <12>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ETV570 {
-				clock-frequency =3D <25200000>;
-				hactive =3D <640>;
-				vactive =3D <480>;
-				hback-porch =3D <114>;
-				hsync-len =3D <30>;
-				hfront-porch =3D <16>;
-				vback-porch =3D <32>;
-				vsync-len =3D <3>;
-				vfront-porch =3D <10>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ET0350 {
-				clock-frequency =3D <6413760>;
-				hactive =3D <320>;
-				vactive =3D <240>;
-				hback-porch =3D <34>;
-				hsync-len =3D <34>;
-				hfront-porch =3D <20>;
-				vback-porch =3D <15>;
-				vsync-len =3D <3>;
-				vfront-porch =3D <4>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ET0430 {
-				clock-frequency =3D <9009000>;
-				hactive =3D <480>;
-				vactive =3D <272>;
-				hback-porch =3D <2>;
-				hsync-len =3D <41>;
-				hfront-porch =3D <2>;
-				vback-porch =3D <2>;
-				vsync-len =3D <10>;
-				vfront-porch =3D <2>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <1>;
-			};
-
-			ET0500 {
-				clock-frequency =3D <33264000>;
-				hactive =3D <800>;
-				vactive =3D <480>;
-				hback-porch =3D <88>;
-				hsync-len =3D <128>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <33>;
-				vsync-len =3D <2>;
-				vfront-porch =3D <10>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ET0700 { /* same as ET0500 */
-				clock-frequency =3D <33264000>;
-				hactive =3D <800>;
-				vactive =3D <480>;
-				hback-porch =3D <88>;
-				hsync-len =3D <128>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <33>;
-				vsync-len =3D <2>;
-				vfront-porch =3D <10>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-
-			ETQ570 {
-				clock-frequency =3D <6596040>;
-				hactive =3D <320>;
-				vactive =3D <240>;
-				hback-porch =3D <38>;
-				hsync-len =3D <30>;
-				hfront-porch =3D <30>;
-				vback-porch =3D <16>;
-				vsync-len =3D <3>;
-				vfront-porch =3D <4>;
-				hsync-active =3D <0>;
-				vsync-active =3D <0>;
-				de-active =3D <1>;
-				pixelclk-active =3D <0>;
-			};
-		};
-        };
-};
-
-&ipu1_di0_disp0 {
-	remote-endpoint =3D <&display0_in>;
-};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-10x0-comtft.dts b/arch/arm/bo=
ot/dts/imx6q-tx6q-10x0-comtft.dts
new file mode 100644
index 0000000..8997553
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-10x0-comtft.dts
@@ -0,0 +1,119 @@
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
+	model =3D "Ka-Ro electronics TX6Q-1010/-1030 Module on CoMpact TFT";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
+
+	aliases {
+		display =3D &mxcfb0;
+		mxcfb0 =3D &mxcfb0;
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
+	mxcfb0: fb@2 {
+		compatible =3D "fsl,mxc_sdc_fb";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_2>;
+		disp_dev =3D "lcd";
+		interface_pix_fmt =3D "RGB24";
+		mode_str =3D "";
+		default_bpp =3D <32>;
+		int_clk =3D <1>;
+		late_init =3D <0>;
+		status =3D "okay";
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
+	};
+
+	lcd: lcd@0 {
+		compatible =3D "fsl,lcd";
+		ipu_id =3D <0>;
+		disp_id =3D <0>;
+		default_ifmt =3D "RGB24";
+		status =3D "okay";
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
+&ipu2 {
+	status =3D "disabled";
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
+&reg_lcd0_pwr {
+	status =3D "okay";
+};
+
+&reg_lcd1_pwr {
+	status =3D "okay";
+};
+
+&touchscreen {
+	status =3D "disabled";
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-10x0.dts b/arch/arm/boot/dts/=
imx6q-tx6q-10x0.dts
new file mode 100644
index 0000000..c3782af
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-10x0.dts
@@ -0,0 +1,191 @@
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
+	model =3D "Ka-Ro electronics TX6Q-1010/-1030 Module";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
+
+	aliases {
+		display =3D &display;
+		ipu1 =3D &ipu1;
+		ipu2 =3D &ipu2;
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
+	};
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&ipu2 {
+	status =3D "disabled";
+};
+
+&reg_lcd0_pwr {
+	status =3D "okay";
+};
+
+&reg_lcd1_pwr {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1110.dts b/arch/arm/boot/dts/=
imx6q-tx6q-1110.dts
deleted file mode 100644
index 88aa1e4..0000000
--- a/arch/arm/boot/dts/imx6q-tx6q-1110.dts
+++ /dev/null
@@ -1,154 +0,0 @@
-/*
- * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
- *
- * The code contained herein is licensed under the GNU General Public
- * License. You may obtain a copy of the GNU General Public License
- * Version 2 at the following locations:
- *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
- */
-
-/dts-v1/;
-#include "imx6q.dtsi"
-#include "imx6qdl-tx6.dtsi"
-
-/ {
-	model =3D "Ka-Ro electronics TX6Q-1110 Module";
-	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
-
-	aliases {
-		display =3D &lvds0;
-		lvds0 =3D &lvds0;
-		lvds1 =3D &lvds1;
-	};
-
-	backlight0: backlight0 {
-		compatible =3D "pwm-backlight";
-		pwms =3D <&pwm2 0 500000 0>;
-		power-supply =3D <&reg_lcd0_pwr>;
-		/*
-		 * a poor man's way to create a 1:1 relationship between
-		 * the PWM value and the actual duty cycle
-		 */
-		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
-				     10 11 12 13 14 15 16 17 18 19
-				     20 21 22 23 24 25 26 27 28 29
-				     30 31 32 33 34 35 36 37 38 39
-				     40 41 42 43 44 45 46 47 48 49
-				     50 51 52 53 54 55 56 57 58 59
-				     60 61 62 63 64 65 66 67 68 69
-				     70 71 72 73 74 75 76 77 78 79
-				     80 81 82 83 84 85 86 87 88 89
-				     90 91 92 93 94 95 96 97 98 99
-				    100>;
-		default-brightness-level =3D <50>;
-	};
-
-	backlight1: backlight1 {
-		compatible =3D "pwm-backlight";
-		pwms =3D <&pwm1 0 500000 0>;
-		power-supply =3D <&reg_lcd1_pwr>;
-		/*
-		 * a poor man's way to create a 1:1 relationship between
-		 * the PWM value and the actual duty cycle
-		 */
-		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
-				     10 11 12 13 14 15 16 17 18 19
-				     20 21 22 23 24 25 26 27 28 29
-				     30 31 32 33 34 35 36 37 38 39
-				     40 41 42 43 44 45 46 47 48 49
-				     50 51 52 53 54 55 56 57 58 59
-				     60 61 62 63 64 65 66 67 68 69
-				     70 71 72 73 74 75 76 77 78 79
-				     80 81 82 83 84 85 86 87 88 89
-				     90 91 92 93 94 95 96 97 98 99
-				    100>;
-		default-brightness-level =3D <50>;
-	};
-};
-
-&i2c3 {
-	polytouch1: eeti@04 {
-		compatible =3D "eeti,egalax_ts";
-		reg =3D <0x04>;
-		pinctrl-names =3D "default";
-		pinctrl-0 =3D <&pinctrl_eeti>;
-		interrupt-parent =3D <&gpio3>;
-		interrupts =3D <22 0>;
-		wakeup-gpios =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
-		linux,wakeup;
-	};
-};
-
-&iomuxc {
-	imx6q-tx6q-1110 {
-		pinctrl_eeti: eetigrp {
-			fsl,pins =3D <
-				MX6QDL_PAD_EIM_D22__GPIO3_IO22 0x1b0b1 /* Interrupt */
-			>;
-		};
-	};
-};
-
-&kpp {
-	status =3D "disabled"; /* pad conflict with backlight1 PWM */
-};
-
-&ldb {
-	status =3D "okay";
-
-	lvds0: lvds-channel@0 {
-		fsl,data-mapping =3D "spwg";
-		fsl,data-width =3D <18>;
-		status =3D "okay";
-
-		display-timings {
-			native-mode =3D <&lvds_timing0>;
-			lvds_timing0: hsd100pxn1 {
-				clock-frequency =3D <65000000>;
-				hactive =3D <1024>;
-				vactive =3D <768>;
-				hback-porch =3D <220>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <21>;
-				vfront-porch =3D <7>;
-				hsync-len =3D <60>;
-				vsync-len =3D <10>;
-				de-active =3D <1>;
-				pixelclk-active =3D <1>;
-			};
-		};
-	};
-
-	lvds1: lvds-channel@1 {
-		fsl,data-mapping =3D "spwg";
-		fsl,data-width =3D <18>;
-		status =3D "disabled";
-
-		display-timings {
-			native-mode =3D <&lvds_timing1>;
-			lvds_timing1: hsd100pxn1 {
-				clock-frequency =3D <65000000>;
-				hactive =3D <1024>;
-				vactive =3D <768>;
-				hback-porch =3D <220>;
-				hfront-porch =3D <40>;
-				vback-porch =3D <21>;
-				vfront-porch =3D <7>;
-				hsync-len =3D <60>;
-				vsync-len =3D <10>;
-				de-active =3D <1>;
-				pixelclk-active =3D <1>;
-			};
-		};
-	};
-};
-
-&pwm1 {
-	status =3D "okay";
-};
-
-&sata {
-	status =3D "okay";
-};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-11x0.dts b/arch/arm/boot/dts/=
imx6q-tx6q-11x0.dts
new file mode 100644
index 0000000..c66524b
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-11x0.dts
@@ -0,0 +1,249 @@
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
+		pwms =3D <&pwm2 0 500000 0>;
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
+		mode_str =3D "LDB-XGA";
+		default_bpp =3D <32>;
+		int_clk =3D <0>;
+		late_init =3D <0>;
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
+		status =3D "okay";
+
+		display-timings {
+			native-mode =3D <&lvds0_timing0>;
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
+				pixelclk-active =3D <0>;
+			};
+		};
+	};
+
+	lvds1: fb@1 {
+		compatible =3D "fsl,mxc_sdc_fb";
+		disp_dev =3D "ldb";
+		interface_pix_fmt =3D "RGB666";
+		mode_str =3D "LDB-XGA";
+		default_bpp =3D <32>;
+		int_clk =3D <0>;
+		late_init =3D <0>;
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
+		status =3D "okay";
+
+		display-timings {
+			native-mode =3D <&lvds1_timing0>;
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
+				pixelclk-active =3D <0>;
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
+				pixelclk-active =3D <0>;
+			};
+		};
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
+&sata {
+	status =3D "okay";
+};
--=20
2.1.4
