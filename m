From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 5/5] ARM: dts: tx53: Add IPU DI ports and endpoints
Date: Wed, 19 Mar 2014 14:28:41 +0100
Message-ID: <1395235721-13847-5-git-send-email-LW@KARO-electronics.de>
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
 arch/arm/boot/dts/imx53-tx53-x03x.dts |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx53-tx53-x03x.dts b/arch/arm/boot/dts/=
imx53-tx53-x03x.dts
index 0217dde3..43b4b7b 100644
--- a/arch/arm/boot/dts/imx53-tx53-x03x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x03x.dts
@@ -25,12 +25,17 @@
 	soc {
 		display: display@di0 {
 			compatible =3D "fsl,imx-parallel-display";
-			crtcs =3D <&ipu 0>;
 			interface-pix-fmt =3D "rgb24";
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&pinctrl_rgb24_vga1>;
 			status =3D "okay";
=20
+			port {
+				display0_in: endpoint {
+					remote-endpoint =3D <&ipu_di0_disp0>;
+				};
+			};
+
 			display-timings {
 				VGA {
 					clock-frequency =3D <25200000>;
--=20
1.7.10.4
