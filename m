From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCHv2 7/8] ARM: dts: imx6: add support for more Ka-Ro electronics modules
Date: Tue,  8 Mar 2016 09:04:03 +0100
Message-ID: <1457424244-14549-8-git-send-email-LW@KARO-electronics.de>
References: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457424244-14549-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the following i.MX6 based modules from Ka-Ro
electronics GmbH:
TX6S-8034:
Processor    Freescale i.MX 6 Solo, 800MHz
RAM          256MiB DDR3 SDRAM
ROM          128MiB NAND Flash
Power supply Single 3.1V to 5.5V
Size         31mm SO-DIMM
Temp. Range  industrial grade (-40=C2=B0C/-25=C2=B0C to 105=C2=B0C Tj)

TX6S-8035:
Processor    Freescale i.MX 6 Solo, 800MHz
RAM          512MiB DDR3 SDRAM
ROM          4GiB eMMC
Power supply Single 3.1V to 5.5V
Size         31mm SO-DIMM
Temp. Range  industrial grade (-40=C2=B0C/-25=C2=B0C to 105=C2=B0C Tj)

TX6U-8033:
Processor    Freescale i.MX 6 Dual Lite, 800MHz
RAM          1GiB DDR3 SDRAM
ROM          4GiB eMMC
Power supply Single 3.1V to 5.5V
Size         31mm SO-DIMM
Temp. Range  industrial grade (-40=C2=B0C/-25=C2=B0C to 105=C2=B0C Tj)

TX6Q-1036:
Processor    Freescale i.MX 6Quad, 1GHz
RAM          1GB DDR3 SDRAM 64-bit
ROM          8GiB eMMC
Power supply Single 3.1V to 5.5V
Size         31mm SO-DIMM
Temp. Range  Extended Consumer Grade (-20=C2=B0C to 105=C2=B0C Tj)

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/Makefile             |   4 +
 arch/arm/boot/dts/imx6dl-tx6s-8034.dts | 249 +++++++++++++++++++++++++=
+++
 arch/arm/boot/dts/imx6dl-tx6s-8035.dts | 246 +++++++++++++++++++++++++=
++
 arch/arm/boot/dts/imx6dl-tx6u-8033.dts | 248 +++++++++++++++++++++++++=
++
 arch/arm/boot/dts/imx6q-tx6q-1036.dts  | 295 +++++++++++++++++++++++++=
++++++++
 5 files changed, 1042 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6s-8034.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6s-8035.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-8033.dts
 create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1036.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 072294f..71b5cd3 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -320,6 +320,9 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
 	imx6dl-sabrelite.dtb \
 	imx6dl-sabresd.dtb \
 	imx6dl-tx6dl-comtft.dtb \
+	imx6dl-tx6s-8034.dtb \
+	imx6dl-tx6s-8035.dtb \
+	imx6dl-tx6u-8033.dtb \
 	imx6dl-tx6u-801x.dtb \
 	imx6dl-tx6u-811x.dtb \
 	imx6dl-udoo.dtb \
@@ -360,6 +363,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
 	imx6q-tx6q-1010-comtft.dtb \
 	imx6q-tx6q-1020.dtb \
 	imx6q-tx6q-1020-comtft.dtb \
+	imx6q-tx6q-1036.dtb \
 	imx6q-tx6q-1110.dtb \
 	imx6q-udoo.dtb \
 	imx6q-wandboard.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-tx6s-8034.dts b/arch/arm/boot/dts=
/imx6dl-tx6s-8034.dts
new file mode 100644
index 0000000..0d3df6e
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6s-8034.dts
@@ -0,0 +1,237 @@
+/*
+ * Copyright 2015-2016 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "imx6dl.dtsi"
+#include "imx6qdl-tx6.dtsi"
+
+/ {
+	model =3D "Ka-Ro electronics TX6S-8034 Module";
+	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
+
+	aliases {
+		display =3D &display;
+		ipu1 =3D &ipu1;
+	};
+
+	cpus {
+		/delete-node/ cpu@1;
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcd0_pwr>;
+		enable-gpios =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_2>;
+		interface-pix-fmt =3D "rgb24";
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
+			};
+		};
+
+		display-timings {
+			native-mode =3D <&vga>;
+
+			vga: VGA {
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
+&ds1339 {
+	status =3D "disabled";
+};
+
+&pinctrl_usdhc1 {
+	fsl,pins =3D <
+		MX6QDL_PAD_SD1_CMD__SD1_CMD		0x070b1
+		MX6QDL_PAD_SD1_CLK__SD1_CLK		0x07099
+		MX6QDL_PAD_SD1_DAT0__SD1_DATA0		0x070b1
+		MX6QDL_PAD_SD1_DAT1__SD1_DATA1		0x070b1
+		MX6QDL_PAD_SD1_DAT2__SD1_DATA2		0x070b1
+		MX6QDL_PAD_SD1_DAT3__SD1_DATA3		0x070b1
+		MX6QDL_PAD_SD3_CMD__GPIO7_IO02		0x170b0 /* SD1 CD */
+	>;
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&reg_lcd0_pwr {
+	status =3D "disabled";
+};
diff --git a/arch/arm/boot/dts/imx6dl-tx6s-8035.dts b/arch/arm/boot/dts=
/imx6dl-tx6s-8035.dts
new file mode 100644
index 0000000..2f9efdb
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6s-8035.dts
@@ -0,0 +1,253 @@
+/*
+ * Copyright 2015-2016 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "imx6dl.dtsi"
+#include "imx6qdl-tx6.dtsi"
+
+/ {
+	model =3D "Ka-Ro electronics TX6S-8035 Module";
+	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
+
+	aliases {
+		display =3D &display;
+		ipu1 =3D &ipu1;
+	};
+
+	cpus {
+		/delete-node/ cpu@1;
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcd0_pwr>;
+		enable-gpios =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_2>;
+		interface-pix-fmt =3D "rgb24";
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
+			};
+		};
+
+		display-timings {
+			native-mode =3D <&vga>;
+
+			vga: VGA {
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
+&ds1339 {
+	status =3D "disabled";
+};
+
+&gpmi {
+	status =3D "disabled";
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&reg_lcd0_pwr {
+	status =3D "disabled";
+};
+
+&usdhc4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc4>;
+	bus-width =3D <4>;
+	non-removable;
+	no-1-8-v;
+	fsl,wp-controller;
+	status =3D "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins =3D <
+			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x070b1
+			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x070b1
+			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x070b1
+			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x070b1
+			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x070b1
+			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x070b1
+			MX6QDL_PAD_NANDF_ALE__SD4_RESET		0x0b0b1
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-8033.dts b/arch/arm/boot/dts=
/imx6dl-tx6u-8033.dts
new file mode 100644
index 0000000..4d3204a
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tx6u-8033.dts
@@ -0,0 +1,248 @@
+/*
+ * Copyright 2014-2016 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "imx6dl.dtsi"
+#include "imx6qdl-tx6.dtsi"
+
+/ {
+	model =3D "Ka-Ro electronics TX6U-8033 Module";
+	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
+
+	aliases {
+		display =3D &display;
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcd0_pwr>;
+		enable-gpios =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_2>;
+		interface-pix-fmt =3D "rgb24";
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
+			};
+		};
+
+		display-timings {
+			native-mode =3D <&vga>;
+
+			vga: VGA {
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
+&ds1339 {
+	status =3D "disabled";
+};
+
+&gpmi {
+	status =3D "disabled";
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint =3D <&display0_in>;
+};
+
+&reg_lcd0_pwr {
+	status =3D "disabled";
+};
+
+&usdhc4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc4>;
+	bus-width =3D <4>;
+	non-removable;
+	no-1-8-v;
+	fsl,wp-controller;
+	status =3D "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins =3D <
+			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x070b1
+			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x070b1
+			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x070b1
+			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x070b1
+			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x070b1
+			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x070b1
+			MX6QDL_PAD_NANDF_ALE__SD4_RESET		0x0b0b1
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1036.dts b/arch/arm/boot/dts/=
imx6q-tx6q-1036.dts
new file mode 100644
index 0000000..70c478b
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tx6q-1036.dts
@@ -0,0 +1,252 @@
+/*
+ * Copyright 2014-2016 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
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
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "imx6q.dtsi"
+#include "imx6qdl-tx6.dtsi"
+
+/ {
+	model =3D "Ka-Ro electronics TX6Q-1036 Module";
+	compatible =3D "karo,imx6q-tx6q", "fsl,imx6q";
+
+	aliases {
+		display =3D &display;
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm2 0 500000 PWM_POLARITY_INVERTED>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcd0_pwr>;
+		enable-gpios =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
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
+	display: display@di0 {
+		compatible =3D "fsl,imx-parallel-display";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_disp0_2>;
+		interface-pix-fmt =3D "rgb24";
+		status =3D "okay";
+
+		port {
+			display0_in: endpoint {
+				remote-endpoint =3D <&ipu1_di0_disp0>;
+			};
+		};
+
+		display-timings {
+			native-mode =3D <&vga>;
+
+			vga: VGA {
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
+&ds1339 {
+	status =3D "disabled";
+};
+
+&gpmi {
+	status =3D "disabled";
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
+	status =3D "disabled";
+};
+
+&usdhc4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc4>;
+	bus-width =3D <4>;
+	non-removable;
+	no-1-8-v;
+	fsl,wp-controller;
+	status =3D "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc4: usdhc4grp {
+		fsl,pins =3D <
+			MX6QDL_PAD_SD4_CMD__SD4_CMD		0x070b1
+			MX6QDL_PAD_SD4_CLK__SD4_CLK		0x070b1
+			MX6QDL_PAD_SD4_DAT0__SD4_DATA0		0x070b1
+			MX6QDL_PAD_SD4_DAT1__SD4_DATA1		0x070b1
+			MX6QDL_PAD_SD4_DAT2__SD4_DATA2		0x070b1
+			MX6QDL_PAD_SD4_DAT3__SD4_DATA3		0x070b1
+			MX6QDL_PAD_NANDF_ALE__SD4_RESET		0x0b0b1
+		>;
+	};
+};
--=20
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
