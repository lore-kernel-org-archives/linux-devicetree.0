From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 4/5] ARM: dts: tx53: add simple-panel support
Date: Wed, 19 Mar 2014 14:28:40 +0100
Message-ID: <1395235721-13847-4-git-send-email-LW@KARO-electronics.de>
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
 arch/arm/boot/dts/imx53-tx53-x13x.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dts/=
imx53-tx53-x13x.dts
index 26b918e..86a964d 100644
--- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@ -63,6 +63,18 @@
 		default-brightness-level =3D <50>;
 	};
=20
+	panel0 {
+		compatible =3D "simple-panel";
+		power-supply =3D <&reg_lcd_pwr0>;
+		backlight =3D <&backlight0>;
+	};
+
+	panel1 {
+		compatible =3D "simple-panel";
+		power-supply =3D <&reg_lcd_pwr1>;
+		backlight =3D <&backlight1>;
+	};
+
 	regulators {
 		reg_lcd_pwr0: regulator@5 {
 			compatible =3D "regulator-fixed";
--=20
1.7.10.4
