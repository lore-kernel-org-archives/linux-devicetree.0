From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 3/3] ARM: dts: imx6: add display timing for NL12880BC20 display to Ka-Ro electronics TX6 LVDS modules
Date: Tue, 12 Jan 2016 19:01:50 +0100
Message-ID: <1452621710-15336-4-git-send-email-LW@KARO-electronics.de>
References: <1452621710-15336-1-git-send-email-LW@KARO-electronics.de>
 <1452621710-15336-2-git-send-email-LW@KARO-electronics.de>
 <1452621710-15336-3-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452621710-15336-3-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Add support for the NLT Technologies WXGA LVDS display NL12880BC20 to
the TX6 LVDS modules from Ka-Ro electronics.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6dl-tx6u-811x.dts | 42 ++++++++++++++++++++++++++=
++++----
 arch/arm/boot/dts/imx6q-tx6q-1110.dts  | 42 ++++++++++++++++++++++++++=
++++----
 2 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts b/arch/arm/boot/dts=
/imx6dl-tx6u-811x.dts
index c275eec..c14ee8f 100644
--- a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
+++ b/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
@@ -104,8 +104,9 @@
 		status =3D "okay";
=20
 		display-timings {
-			native-mode =3D <&lvds_timing0>;
-			lvds_timing0: hsd100pxn1 {
+			native-mode =3D <&lvds0_timing0>;
+
+			lvds0_timing0: hsd100pxn1 {
 				clock-frequency =3D <65000000>;
 				hactive =3D <1024>;
 				vactive =3D <768>;
@@ -118,6 +119,22 @@
 				de-active =3D <1>;
 				pixelclk-active =3D <1>;
 			};
+
+			lvds0_timing1: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hsync-len =3D <60>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vsync-len =3D <13>;
+				vfront-porch =3D <5>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
 		};
 	};
=20
@@ -127,8 +144,9 @@
 		status =3D "disabled";
=20
 		display-timings {
-			native-mode =3D <&lvds_timing1>;
-			lvds_timing1: hsd100pxn1 {
+			native-mode =3D <&lvds1_timing0>;
+
+			lvds1_timing0: hsd100pxn1 {
 				clock-frequency =3D <65000000>;
 				hactive =3D <1024>;
 				vactive =3D <768>;
@@ -141,6 +159,22 @@
 				de-active =3D <1>;
 				pixelclk-active =3D <1>;
 			};
+
+			lvds1_timing1: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hsync-len =3D <60>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vsync-len =3D <13>;
+				vfront-porch =3D <5>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1110.dts b/arch/arm/boot/dts/=
imx6q-tx6q-1110.dts
index 88aa1e4..7a8be02 100644
--- a/arch/arm/boot/dts/imx6q-tx6q-1110.dts
+++ b/arch/arm/boot/dts/imx6q-tx6q-1110.dts
@@ -104,8 +104,9 @@
 		status =3D "okay";
=20
 		display-timings {
-			native-mode =3D <&lvds_timing0>;
-			lvds_timing0: hsd100pxn1 {
+			native-mode =3D <&lvds0_timing0>;
+
+			lvds0_timing0: hsd100pxn1 {
 				clock-frequency =3D <65000000>;
 				hactive =3D <1024>;
 				vactive =3D <768>;
@@ -118,6 +119,22 @@
 				de-active =3D <1>;
 				pixelclk-active =3D <1>;
 			};
+
+			lvds0_timing1: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hsync-len =3D <60>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vsync-len =3D <13>;
+				vfront-porch =3D <5>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
 		};
 	};
=20
@@ -127,8 +144,9 @@
 		status =3D "disabled";
=20
 		display-timings {
-			native-mode =3D <&lvds_timing1>;
-			lvds_timing1: hsd100pxn1 {
+			native-mode =3D <&lvds1_timing0>;
+
+			lvds1_timing0: hsd100pxn1 {
 				clock-frequency =3D <65000000>;
 				hactive =3D <1024>;
 				vactive =3D <768>;
@@ -141,6 +159,22 @@
 				de-active =3D <1>;
 				pixelclk-active =3D <1>;
 			};
+
+			lvds1_timing1: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hsync-len =3D <60>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vsync-len =3D <13>;
+				vfront-porch =3D <5>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
 		};
 	};
 };
--=20
2.1.4
