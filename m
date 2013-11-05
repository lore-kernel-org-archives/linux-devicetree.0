From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv11][ 7/7] ARM: dts: Add support for the cpuimx25 board from Eukrea and its baseboard.
Date: Tue,  5 Nov 2013 15:39:14 +0100
Message-ID: <1383662354-22417-7-git-send-email-denis@eukrea.com>
References: <1383662354-22417-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383662354-22417-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following devices/functionalities were added:
 * Main and secondary UARTs.
 * i2c and the pcf8563 device.
 * CMO-QVGA(With backlight), DVI-VGA and DVI-SVGA displays
 * Ethernet.
 * NAND.
 * The BP1 button.
 * The LED.
 * Watchdog
 * SD.

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
ChangeLog v9->v10:
- Adapted to the new pingrp patches.

ChangeLog v8->v9:
- Licenses were shortened.
---
 arch/arm/boot/dts/imx25-eukrea-cpuimx25.dtsi       |   60 ++++++++++
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |   66 +++++++++++
 .../imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts  |   45 ++++++++
 .../imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dts   |   45 ++++++++
 .../boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts  |  117 ++++++++++++=
++++++++
 5 files changed, 333 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx25-eukrea-cpuimx25.dtsi
 create mode 100644 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-=
cmo-qvga.dts
 create mode 100644 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-=
dvi-svga.dts
 create mode 100644 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-=
dvi-vga.dts
 create mode 100644 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.=
dts

diff --git a/arch/arm/boot/dts/imx25-eukrea-cpuimx25.dtsi b/arch/arm/bo=
ot/dts/imx25-eukrea-cpuimx25.dtsi
new file mode 100644
index 0000000..8abd45a
--- /dev/null
+++ b/arch/arm/boot/dts/imx25-eukrea-cpuimx25.dtsi
@@ -0,0 +1,60 @@
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
+ */
+
+#include "imx25.dtsi"
+
+/ {
+	model =3D "Eukrea CPUIMX25";
+	compatible =3D "eukrea,cpuimx25", "fsl,imx25";
+
+	memory {
+		reg =3D <0x80000000 0x4000000>; /* 64M */
+	};
+};
+
+&fec {
+	phy-mode =3D "rmii";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_fec>;
+	status =3D "okay";
+};
+
+&i2c1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c1>;
+	status =3D "okay";
+
+	pcf8563@51 {
+		compatible =3D "nxp,pcf8563";
+		reg =3D <0x51>;
+	};
+};
+
+&iomuxc {
+	imx25-eukrea-cpuimx25 {
+		pinctrl_fec: fecgrp {
+			fsl,pins =3D <MX25_FEC_PINGRP1>;
+		};
+
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins =3D <MX25_I2C1_PINGRP1>;
+		};
+	};
+};
+
+&nfc {
+	nand-bus-width =3D <8>;
+	nand-ecc-mode =3D "hw";
+	nand-on-flash-bbt;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvg=
a.dts b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
new file mode 100644
index 0000000..622de82
--- /dev/null
+++ b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
@@ -0,0 +1,66 @@
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
+ */
+
+#include "imx25-eukrea-mbimxsd25-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD25 with the CMO-QVGA Display";
+	compatible =3D "eukrea,mbimxsd25-baseboard-cmo-qvga", "eukrea,mbimxsd=
25-baseboard", "eukrea,cpuimx25", "fsl,imx25";
+
+	cmo_qvga: display {
+		model =3D "CMO-QVGA";
+		bits-per-pixel =3D <16>;
+		fsl,pcr =3D <0xcad08b80>;
+		bus-width =3D <18>;
+		native-mode =3D <&qvga_timings>;
+		display-timings {
+			qvga_timings: 320x240 {
+				clock-frequency =3D <6500000>;
+				hactive =3D <320>;
+				vactive =3D <240>;
+				hback-porch =3D <30>;
+				hfront-porch =3D <38>;
+				vback-porch =3D <20>;
+				vfront-porch =3D <3>;
+				hsync-len =3D <15>;
+				vsync-len =3D <4>;
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
+		gpio =3D <&gpio1 26 0>;
+		enable-active-high;
+	};
+};
+
+&iomuxc {
+	imx25-eukrea-mbimxsd25-baseboard-cmo-qvga {
+		pinctrl_reg_lcd_3v3: reg_lcd_3v3 {
+			fsl,pins =3D <MX25_PAD_PWM__GPIO_1_26  0x80000000>;
+		};
+	};
+};
+
+&lcdc {
+	display =3D <&cmo_qvga>;
+	fsl,pwmr =3D <0x00a903ff>;
+	lcd-supply =3D <&reg_lcd_3v3>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svg=
a.dts b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts
new file mode 100644
index 0000000..8eee2f6
--- /dev/null
+++ b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts
@@ -0,0 +1,45 @@
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
+ */
+
+#include "imx25-eukrea-mbimxsd25-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD25 with the DVI-SVGA Display";
+	compatible =3D "eukrea,mbimxsd25-baseboard-dvi-svga", "eukrea,mbimxsd=
25-baseboard", "eukrea,cpuimx25", "fsl,imx25";
+
+	dvi_svga: display {
+		model =3D "DVI-SVGA";
+		bits-per-pixel =3D <16>;
+		fsl,pcr =3D <0xfa208b80>;
+		bus-width =3D <18>;
+		native-mode =3D <&dvi_svga_timings>;
+		display-timings {
+			dvi_svga_timings: 800x600 {
+				clock-frequency =3D <40000000>;
+				hactive =3D <800>;
+				vactive =3D <600>;
+				hback-porch =3D <75>;
+				hfront-porch =3D <75>;
+				vback-porch =3D <7>;
+				vfront-porch =3D <75>;
+				hsync-len =3D <7>;
+				vsync-len =3D <7>;
+			};
+		};
+	};
+};
+
+&lcdc {
+	display =3D <&dvi_svga>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga=
=2Edts b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dts
new file mode 100644
index 0000000..447da62
--- /dev/null
+++ b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dts
@@ -0,0 +1,45 @@
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
+ */
+
+#include "imx25-eukrea-mbimxsd25-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD25 with the DVI-VGA Display";
+	compatible =3D "eukrea,mbimxsd25-baseboard-dvi-vga", "eukrea,mbimxsd2=
5-baseboard", "eukrea,cpuimx25", "fsl,imx25";
+
+	dvi_vga: display {
+		model =3D "DVI-VGA";
+		bits-per-pixel =3D <16>;
+		fsl,pcr =3D <0xfa208b80>;
+		bus-width =3D <18>;
+		native-mode =3D <&dvi_vga_timings>;
+		display-timings {
+			dvi_vga_timings: 640x480 {
+				clock-frequency =3D <31250000>;
+				hactive =3D <640>;
+				vactive =3D <480>;
+				hback-porch =3D <100>;
+				hfront-porch =3D <100>;
+				vback-porch =3D <7>;
+				vfront-porch =3D <100>;
+				hsync-len =3D <7>;
+				vsync-len =3D <7>;
+			};
+		};
+	};
+};
+
+&lcdc {
+	display =3D <&dvi_vga>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts b/a=
rch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts
new file mode 100644
index 0000000..fad6847
--- /dev/null
+++ b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts
@@ -0,0 +1,117 @@
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
+ */
+
+/dts-v1/;
+#include "imx25-eukrea-cpuimx25.dtsi"
+
+/ {
+	model =3D "Eukrea MBIMXSD25";
+	compatible =3D "eukrea,mbimxsd25-baseboard", "eukrea,cpuimx25", "fsl,=
imx25";
+
+	gpio_keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpiokeys>;
+
+		bp1 {
+			label =3D "BP1";
+			gpios =3D <&gpio3 18 1>;
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
+			gpios =3D <&gpio3 19 1>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+};
+
+&audmux {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_audmux>;
+	status =3D "okay";
+};
+
+&esdhc1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_esdhc1>;
+	cd-gpios =3D <&gpio1 20>;
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
+	imx25-eukrea-mbimxsd25-baseboard {
+		pinctrl_audmux: audmuxgrp {
+			fsl,pins =3D <MX25_AUDMUX_PINGRP1>;
+		};
+
+		pinctrl_esdhc1: esdhc1grp {
+			fsl,pins =3D <MX25_ESDHC1_PINGRP1>;
+		};
+
+		pinctrl_gpiokeys: gpiokeysgrp {
+			fsl,pins =3D <MX25_PAD_VSTBY_ACK__GPIO_3_18 0x80000000>;
+		};
+
+		pinctrl_gpioled: gpioledgrp {
+			fsl,pins =3D <MX25_PAD_POWER_FAIL__GPIO_3_19 0x80000000>;
+		};
+
+		pinctrl_lcdc: lcdcgrp {
+			fsl,pins =3D <MX25_LCDC_PINGRP1>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <MX25_UART1_PINGRP1>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins =3D <MX25_UART2_PINGRP1>;
+		};
+	};
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
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
