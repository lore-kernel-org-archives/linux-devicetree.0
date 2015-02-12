From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 1/5] ARM: dts: zynq: Split out common Parallella bits
Date: Thu, 12 Feb 2015 01:55:09 +0100
Message-ID: <1423702513-4032-2-git-send-email-afaerber@suse.de>
References: <1423702513-4032-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423702513-4032-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Ola Jeppsson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This prepares for the USB-less Microserver edition as well as
headless vs. HDMI bitstreams.

Cc: Ola Jeppsson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm/boot/dts/zynq-parallella.dts              | 80 +-------------=
--------
 .../{zynq-parallella.dts =3D> zynq-parallella1.dtsi} |  3 +-
 2 files changed, 3 insertions(+), 80 deletions(-)
 copy arch/arm/boot/dts/{zynq-parallella.dts =3D> zynq-parallella1.dtsi=
} (97%)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
index 0ebd2107022b..99ee6551ae8d 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -1,11 +1,6 @@
 /*
  * Copyright (c) 2014 SUSE LINUX Products GmbH
- *
- * Derived from zynq-zed.dts:
- *
- *  Copyright (C) 2011 Xilinx
- *  Copyright (C) 2012 National Instruments Corp.
- *  Copyright (C) 2013 Xilinx
+ * Copyright (c) 2015 SUSE Linux GmbH
  *
  * This software is licensed under the terms of the GNU General Public
  * License version 2, as published by the Free Software Foundation, an=
d
@@ -17,79 +12,8 @@
  * GNU General Public License for more details.
  */
 /dts-v1/;
-/include/ "zynq-7000.dtsi"
+#include "zynq-parallella1.dtsi"
=20
 / {
 	model =3D "Adapteva Parallella Board";
-	compatible =3D "adapteva,parallella", "xlnx,zynq-7000";
-
-	aliases {
-		ethernet0 =3D &gem0;
-		serial0 =3D &uart1;
-	};
-
-	memory {
-		device_type =3D "memory";
-		reg =3D <0x0 0x40000000>;
-	};
-
-	chosen {
-		bootargs =3D "console=3DttyPS0,115200 earlyprintk root=3D/dev/mmcblk=
0p2 rootfstype=3Dext4 rw rootwait";
-		linux,stdout-path =3D "/amba/serial@e0001000";
-	};
-};
-
-&clkc {
-	fclk-enable =3D <0xf>;
-	ps-clk-frequency =3D <33333333>;
-};
-
-&gem0 {
-	status =3D "okay";
-	phy-mode =3D "rgmii-id";
-	phy-handle =3D <&ethernet_phy>;
-
-	ethernet_phy: ethernet-phy@0 {
-		/* Marvell 88E1318 */
-		compatible =3D "ethernet-phy-id0141.0e90",
-		             "ethernet-phy-ieee802.3-c22";
-		reg =3D <0>;
-		marvell,reg-init =3D <0x3 0x10 0xff00 0x1e>,
-		                   <0x3 0x11 0xfff0 0xa>;
-	};
-};
-
-&i2c0 {
-	status =3D "okay";
-
-	isl9305: isl9305@68 {
-		compatible =3D "isil,isl9305";
-		reg =3D <0x68>;
-
-		regulators {
-			dcd1 {
-				regulator-name =3D "VDD_DSP";
-				regulator-always-on;
-			};
-			dcd2 {
-				regulator-name =3D "1P35V";
-				regulator-always-on;
-			};
-			ldo1 {
-				regulator-name =3D "VDD_ADJ";
-			};
-			ldo2 {
-				regulator-name =3D "VDD_GPIO";
-				regulator-always-on;
-			};
-		};
-	};
-};
-
-&sdhci1 {
-	status =3D "okay";
-};
-
-&uart1 {
-	status =3D "okay";
 };
diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella1.dtsi
similarity index 97%
copy from arch/arm/boot/dts/zynq-parallella.dts
copy to arch/arm/boot/dts/zynq-parallella1.dtsi
index 0ebd2107022b..7c1206f928bc 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella1.dtsi
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2014 SUSE LINUX Products GmbH
+ * Copyright (c) 2015 SUSE Linux GmbH
  *
  * Derived from zynq-zed.dts:
  *
@@ -16,11 +17,9 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  */
-/dts-v1/;
 /include/ "zynq-7000.dtsi"
=20
 / {
-	model =3D "Adapteva Parallella Board";
 	compatible =3D "adapteva,parallella", "xlnx,zynq-7000";
=20
 	aliases {
--=20
2.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
