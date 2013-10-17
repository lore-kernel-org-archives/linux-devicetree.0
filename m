From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v2][ 27/37] arm/dts: Add support for the cpuimx35 board from Eukrea and its baseboard.
Date: Thu, 17 Oct 2013 17:02:25 +0200
Message-ID: <1382022155-21954-28-git-send-email-denis@eukrea.com>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382022155-21954-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following devices/functionalities were added:
 * Main and secondary UARTs.
 * i2c and the pcf8563 device.
 * Sound.
 * CMO-QVGA, DVI-VGA and DVI-SVGA displays
 * Ethernet.
 * NAND.
 * The BP1 button.
 * The LED.
 * Watchdog
 * SD.
 * Touchscreen.

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi       |   63 ++++++++
 .../imx35-eukrea-mbimxsd35-baseboard-cmo-qvga.dts  |   59 ++++++++
 .../imx35-eukrea-mbimxsd35-baseboard-dvi-svga.dts  |   51 +++++++
 .../imx35-eukrea-mbimxsd35-baseboard-dvi-vga.dts   |   51 +++++++
 .../boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts  |  152 ++++++++++++=
++++++++
 5 files changed, 376 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-=
cmo-qvga.dts
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-=
dvi-svga.dts
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-=
dvi-vga.dts
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.=
dts

diff --git a/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi b/arch/arm/bo=
ot/dts/imx35-eukrea-cpuimx35.dtsi
new file mode 100644
index 0000000..f6570d4
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
@@ -0,0 +1,63 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+ * MA 02110-1301, USA.
+ */
+
+#include "imx35.dtsi"
+
+/ {
+	model =3D "Eukrea CPUIMX35";
+	compatible =3D "eukrea,cpuimx35", "fsl,imx35";
+
+	memory {
+		reg =3D <0x80000000 0x8000000>; /* 128M */
+	};
+};
+
+&fec {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_fec_1>;
+	status =3D "okay";
+};
+
+&i2c1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c1_1>;
+	status =3D "okay";
+	pcf8563@51 {
+		compatible =3D "nxp,pcf8563";
+		reg =3D <0x51>;
+	};
+
+	tsc2007: tsc2007@48 {
+		compatible =3D "ti,tsc2007";
+		reg =3D <0x48>;
+
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_tsc2007_1>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <0x2 0x8>;
+		gpios =3D <&gpio3 2 0>;
+		x-plate-ohms =3D <180>;
+	};
+};
+
+&nfc {
+	nand-bus-width =3D <8>;
+	nand-ecc-mode =3D "hw";
+	nand-on-flash-bbt;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-cmo-qvg=
a.dts b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-cmo-qvga.dts
new file mode 100644
index 0000000..8ba8659
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-cmo-qvga.dts
@@ -0,0 +1,59 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+ * MA 02110-1301, USA.
+ */
+
+#include "imx35-eukrea-mbimxsd35-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD35 with the CMO-QVGA Display";
+	compatible =3D "eukrea,mbimxsd35-baseboard-cmo-qvga", "eukrea,mbimxsd=
35-baseboard", "eukrea,cpuimx35", "fsl,imx35";
+	cmo_qvga: display {
+		model =3D "CMO-QVGA";
+		bits-per-pixel =3D <16>;
+		native-mode =3D <&qvga_timings>;
+		display-timings {
+			qvga_timings: 320x240 {
+				clock-frequency =3D <6500000>;
+				hactive =3D <320>;
+				vactive =3D <240>;
+				hback-porch =3D <68>;
+				hfront-porch =3D <20>;
+				vback-porch =3D <15>;
+				vfront-porch =3D <4>;
+				hsync-len =3D <30>;
+				vsync-len =3D <3>;
+			};
+		};
+	};
+
+	reg_lcd_3v3: lcd-en {
+		compatible =3D "regulator-fixed";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_reg_lcd_3v3>;
+		regulator-name =3D "lcd-3v3";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&gpio1 4 0>;
+		enable-active-high;
+	};
+};
+
+&lcdc {
+	display =3D <&cmo_qvga>;
+	lcd-supply =3D <&reg_lcd_3v3>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-svg=
a.dts b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-svga.dts
new file mode 100644
index 0000000..35e5c04
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-svga.dts
@@ -0,0 +1,51 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+ * MA 02110-1301, USA.
+ */
+
+#include "imx35-eukrea-mbimxsd35-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD35 with the DVI-SVGA Display";
+	compatible =3D "eukrea,mbimxsd35-baseboard-dvi-svga", "eukrea,mbimxsd=
35-baseboard", "eukrea,cpuimx35", "fsl,imx35";
+	dvi_svga: display {
+		model =3D "DVI-SVGA";
+		bits-per-pixel =3D <16>;
+		native-mode =3D <&svga_timings>;
+		display-timings {
+			svga_timings: 800x600 {
+				clock-frequency =3D <40000000>;
+				hactive =3D <800>;
+				vactive =3D <600>;
+				hback-porch =3D <75>;
+				hfront-porch =3D <75>;
+				vback-porch =3D <7>;
+				vfront-porch =3D <75>;
+				hsync-len =3D <7>;
+				vsync-len =3D <7>;
+				hsync-active =3D <1>;
+				vsync-active =3D <1>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+		};
+	};
+};
+
+&lcdc {
+	display =3D <&dvi_svga>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-vga=
=2Edts b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-vga.dts
new file mode 100644
index 0000000..b64118c
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-vga.dts
@@ -0,0 +1,51 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+ * MA 02110-1301, USA.
+ */
+
+#include "imx35-eukrea-mbimxsd35-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD35 with the DVI-VGA Display";
+	compatible =3D "eukrea,mbimxsd35-baseboard-dvi-vga", "eukrea,mbimxsd3=
5-baseboard", "eukrea,cpuimx35", "fsl,imx35";
+	dvi_vga: display {
+		model =3D "DVI-VGA";
+		bits-per-pixel =3D <16>;
+		native-mode =3D <&vga_timings>;
+		display-timings {
+			vga_timings: 640x480 {
+				clock-frequency =3D <31250000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <100>;
+				hfront-porch =3D <100>;
+				vback-porch =3D <7>;
+				vfront-porch =3D <100>;
+				hsync-len =3D <7>;
+				vsync-len =3D <7>;
+				hsync-active =3D <1>;
+				vsync-active =3D <1>;
+				de-active =3D <1>;
+				pixelclk-active =3D <0>;
+			};
+		};
+	};
+};
+
+&lcdc {
+	display =3D <&dvi_vga>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts b/a=
rch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts
new file mode 100644
index 0000000..ff22ca7
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts
@@ -0,0 +1,152 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+ * MA 02110-1301, USA.
+ */
+
+/dts-v1/;
+#include "imx35-eukrea-cpuimx35.dtsi"
+
+/ {
+	model =3D "Eukrea CPUIMX35";
+	compatible =3D "eukrea,mbimxsd35-baseboard", "eukrea,cpuimx35", "fsl,=
imx35";
+
+	gpio_keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpiokeys_1>;
+
+		bp1 {
+			label =3D "BP1";
+			gpios =3D <&gpio3 25 1>;
+			linux,code =3D <256>;
+			gpio-key,wakeup;
+			linux,input-type =3D <1>;
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpioled>;
+
+		led1 {
+			label =3D "led1";
+			gpios =3D <&gpio3 29 1>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+
+	sound {
+		compatible =3D "eukrea,eukrea-tlv320";
+		model =3D "imx35-eukrea-tlv320aic23";
+		ssi-controller =3D <&ssi1>;
+		fsl,audio-codec =3D <&tlv320aic23>;
+		mux-int-port =3D <1>;
+		mux-ext-port =3D <4>;
+	};
+};
+
+&audmux {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_audmux_1>;
+	status =3D "okay";
+};
+
+&esdhc1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_esdhc1_1 &pinctrl_esdhc1_cd>;
+	cd-gpios =3D <&gpio3 24 0>;
+	status =3D "okay";
+};
+
+&i2c1 {
+	tlv320aic23: codec@1a {
+		compatible =3D "ti,tlv320aic23";
+		reg =3D <0x1a>;
+	};
+};
+
+&iomuxc {
+	esdhc1 {
+		pinctrl_esdhc1_cd: esdhc1_cd_grp-1 {
+			fsl,pins =3D <
+				MX35_PAD_LD18__GPIO3_24 0x80000000
+			>;
+		};
+	};
+
+	gpio_keys {
+		pinctrl_gpiokeys_1: gpiokeysgrp-1 {
+			fsl,pins =3D <
+				MX35_PAD_LD19__GPIO3_25 0x80000000
+			>;
+		};
+	};
+
+	leds {
+		pinctrl_gpioled: gpioledgrp-1 {
+			fsl,pins =3D <
+				MX35_PAD_LD23__GPIO3_29 0x80000000
+			>;
+		};
+	};
+
+	reg_lcd_3v3 {
+		pinctrl_reg_lcd_3v3: reg_lcd_3v3 {
+			fsl,pins =3D <
+				MX35_PAD_D3_CLS__GPIO1_4 0x80000000
+			>;
+		};
+	};
+
+	tsc2007 {
+		pinctrl_tsc2007_1: tsc2007grp-1 {
+			fsl,pins =3D <
+				MX35_PAD_ATA_DA2__GPIO3_2 0x80000000
+			>;
+		};
+	};
+
+};
+
+&ipu {
+	status =3D "okay";
+};
+
+&lcdc {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_lcdc_1>;
+	ipu-disp-format =3D "rgb666";
+};
+
+&ssi1 {
+	fsl,mode =3D "i2s-slave";
+	status =3D "okay";
+};
+
+&uart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1_1>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&uart2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart2_1>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
