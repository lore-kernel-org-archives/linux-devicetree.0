From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv13][ 4/4] ARM: dts: imx25: mbimxsd25: Add displays support.
Date: Thu,  5 Dec 2013 16:43:39 +0100
Message-ID: <1386258219-26437-4-git-send-email-denis@eukrea.com>
References: <1386258219-26437-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386258219-26437-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The CMO-QVGA(With backlight), DVI-VGA and DVI-SVGA displays
were added.

Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
ChangeLog v10->v13:
- This patch is the display part splitted out from the patch adding
  support for the cpuimx25(and its baseboard).
- Shawn Guo was added to the Cc list.
- The regulator part was updated to match the current style.
- The new GPIO defines are now used in the dts(i).
---
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |   72 ++++++++++++=
++++++++
 .../imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts  |   45 ++++++++++++
 .../imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dts   |   45 ++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-=
cmo-qvga.dts
 create mode 100644 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-=
dvi-svga.dts
 create mode 100644 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-=
dvi-vga.dts

diff --git a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvg=
a.dts b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
new file mode 100644
index 0000000..0df7e9e
--- /dev/null
+++ b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
@@ -0,0 +1,72 @@
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
+	regulators {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		reg_lcd_3v3: regulator@0 {
+			compatible =3D "regulator-fixed";
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_reg_lcd_3v3>;
+			regulator-name =3D "lcd-3v3";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio1 26 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
+};
+
+&iomuxc {
+	imx25-eukrea-mbimxsd25-baseboard-cmo-qvga {
+		pinctrl_reg_lcd_3v3: reg_lcd_3v3 {
+			fsl,pins =3D <MX25_PAD_PWM__GPIO_1_26 0x80000000>;
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
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
