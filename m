From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 2/4] ARM: dts: imx53: fix LVDS data-mapping and data-width
Date: Wed, 20 Jan 2016 14:09:20 +0100
Message-ID: <1453295362-18798-3-git-send-email-LW@KARO-electronics.de>
References: <1453295362-18798-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453295362-18798-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx53-tx53-x13x.dts | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dts/=
imx53-tx53-x13x.dts
index 6480471..6d0b526 100644
--- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@ -183,13 +183,14 @@
 	status =3D "okay";
=20
 	lvds0: lvds-channel@0 {
-		fsl,data-mapping =3D "jeida";
-		fsl,data-width =3D <24>;
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
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
@@ -208,13 +209,14 @@
 	};
=20
 	lvds1: lvds-channel@1 {
-		fsl,data-mapping =3D "jeida";
-		fsl,data-width =3D <24>;
+		fsl,data-mapping =3D "spwg";
+		fsl,data-width =3D <18>;
 		status =3D "okay";
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
--=20
2.1.4
