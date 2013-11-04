From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv4][ 6/6] ARM: dts: mbimxsd35 Add video and displays support.
Date: Mon,  4 Nov 2013 17:15:24 +0100
Message-ID: <1383581724-14817-6-git-send-email-denis@eukrea.com>
References: <1383581724-14817-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383581724-14817-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v3->v4:
- Shortened the licenses.
- adapted the dts(i) to the new bindings.
ChangeLog v2->v3:
- The dts were adapted to the new DT bindings which looks more like the=
 IPUv3
  ones.
---
 .../imx35-eukrea-mbimxsd35-baseboard-cmo-qvga.dts  |   62 ++++++++++++=
++++++++
 .../imx35-eukrea-mbimxsd35-baseboard-dvi-svga.dts  |   51 ++++++++++++=
++++
 .../imx35-eukrea-mbimxsd35-baseboard-dvi-vga.dts   |   52 ++++++++++++=
++++
 3 files changed, 165 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-=
cmo-qvga.dts
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-=
dvi-svga.dts
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-=
dvi-vga.dts

diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-cmo-qvg=
a.dts b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-cmo-qvga.dts
new file mode 100644
index 0000000..b060f08
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-cmo-qvga.dts
@@ -0,0 +1,62 @@
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
+#include "imx35-eukrea-mbimxsd35-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD35 with the CMO-QVGA Display";
+	compatible =3D "eukrea,mbimxsd35-baseboard-cmo-qvga", "eukrea,mbimxsd=
35-baseboard", "eukrea,cpuimx35", "fsl,imx35";
+
+	cmo_qvga: display@di0 {
+		compatible =3D "fsl,mx3-parallel-display";
+		regulator-name =3D "lcd";
+		interface-pix-fmt =3D "rgb666";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcdc_1>;
+		lcd-supply =3D <&reg_lcd_3v3>;
+		model =3D "CMO-QVGA";
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
+		regulator-name =3D "lcd";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&gpio1 4 0>;
+		enable-active-high;
+	};
+};
+
+&ipu {
+	status =3D "okay";
+};
+
+&lcdc {
+	display =3D <&cmo_qvga>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-svg=
a.dts b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-svga.dts
new file mode 100644
index 0000000..ec1a713
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
+ */
+
+#include "imx35-eukrea-mbimxsd35-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD35 with the DVI-SVGA Display";
+	compatible =3D "eukrea,mbimxsd35-baseboard-dvi-svga", "eukrea,mbimxsd=
35-baseboard", "eukrea,cpuimx35", "fsl,imx35";
+	dvi_svga: display@di0 {
+		interface-pix-fmt =3D "rgb666";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcdc_1>;
+		model =3D "DVI-SVGA";
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
+&ipu {
+	status =3D "okay";
+};
+
+&lcdc {
+	display =3D <&dvi_svga>;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-vga=
=2Edts b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-vga.dts
new file mode 100644
index 0000000..9e3d08a
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard-dvi-vga.dts
@@ -0,0 +1,52 @@
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
+#include "imx35-eukrea-mbimxsd35-baseboard.dts"
+
+/ {
+	model =3D "Eukrea MBIMXSD35 with the DVI-VGA Display";
+	compatible =3D "eukrea,mbimxsd35-baseboard-dvi-vga", "eukrea,mbimxsd3=
5-baseboard", "eukrea,cpuimx35", "fsl,imx35";
+	dvi_vga: display@di0 {
+		interface-pix-fmt =3D "rgb666";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_lcdc_1>;
+		model =3D "DVI-VGA";
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
+
+&ipu {
+	status =3D "okay";
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
