From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH] ARM: dts: mxs: convert usb0_id_pins_a to use symbolic pin defs
Date: Mon, 23 Sep 2013 14:20:27 +0200
Message-ID: <1379938827-23726-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This pin definition had been added after the initial patch to use
symbolic pin names in DTS files.

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/imx28.dtsi |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dts=
i
index 44151f5..918d419 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -745,11 +745,11 @@
 				usb0_id_pins_a: usb0id@0 {
 					reg =3D <0>;
 					fsl,pinmux-ids =3D <
-						0x3071 /* MX28_PAD_AUART1_RTS__USB0_ID */
+						MX28_PAD_AUART1_RTS__USB0_ID
 					>;
-					fsl,drive-strength =3D <2>;
-					fsl,voltage =3D <1>;
-					fsl,pull-up =3D <1>;
+					fsl,drive-strength =3D <MXS_DRIVE_12mA>;
+					fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up =3D <MXS_PULL_ENABLE>;
 				};
 			};
=20
--=20
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
