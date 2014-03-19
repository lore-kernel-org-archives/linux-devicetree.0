From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 2/5] ARM: dts: tx53: sort the i2c subnodes by I2C address
Date: Wed, 19 Mar 2014 14:28:38 +0100
Message-ID: <1395235721-13847-2-git-send-email-LW@KARO-electronics.de>
References: <1395235721-13847-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395235721-13847-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org


Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx53-tx53-x13x.dts |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dts/=
imx53-tx53-x13x.dts
index c8a3473..cd3476b 100644
--- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@ -108,14 +108,6 @@
 	pinctrl-0 =3D <&pinctrl_i2c3>;
 	status =3D "okay";
=20
-	sgtl5000: codec@0a {
-		compatible =3D "fsl,sgtl5000";
-		reg =3D <0x0a>;
-		VDDA-supply =3D <&reg_2v5>;
-		VDDIO-supply =3D <&reg_3v3>;
-		clocks =3D <&mclk>;
-	};
-
 	touchscreen1: eeti@04 {
 		compatible =3D "eeti,egalax_ts";
 		reg =3D <0x04>;
@@ -126,6 +118,14 @@
 		wakeup-gpios =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		linux,wakeup;
 	};
+
+	sgtl5000: codec@0a {
+		compatible =3D "fsl,sgtl5000";
+		reg =3D <0x0a>;
+		VDDA-supply =3D <&reg_2v5>;
+		VDDIO-supply =3D <&reg_3v3>;
+		clocks =3D <&mclk>;
+	};
 };
=20
 &iomuxc {
--=20
1.7.10.4
