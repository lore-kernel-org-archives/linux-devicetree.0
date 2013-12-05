From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: mxs: Add 18bit pin config for lcdif.
Date: Thu,  5 Dec 2013 14:28:04 +0100
Message-ID: <1386250086-4666-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/imx28.dtsi |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dts=
i
index 51ff335..93a7e79 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -668,6 +668,33 @@
 					fsl,pull-up =3D <MXS_PULL_DISABLE>;
 				};
=20
+				lcdif_18bit_pins_a: lcdif-18bit@0 {
+					reg =3D <0>;
+					fsl,pinmux-ids =3D <
+						MX28_PAD_LCD_D00__LCD_D0
+						MX28_PAD_LCD_D01__LCD_D1
+						MX28_PAD_LCD_D02__LCD_D2
+						MX28_PAD_LCD_D03__LCD_D3
+						MX28_PAD_LCD_D04__LCD_D4
+						MX28_PAD_LCD_D05__LCD_D5
+						MX28_PAD_LCD_D06__LCD_D6
+						MX28_PAD_LCD_D07__LCD_D7
+						MX28_PAD_LCD_D08__LCD_D8
+						MX28_PAD_LCD_D09__LCD_D9
+						MX28_PAD_LCD_D10__LCD_D10
+						MX28_PAD_LCD_D11__LCD_D11
+						MX28_PAD_LCD_D12__LCD_D12
+						MX28_PAD_LCD_D13__LCD_D13
+						MX28_PAD_LCD_D14__LCD_D14
+						MX28_PAD_LCD_D15__LCD_D15
+						MX28_PAD_LCD_D16__LCD_D16
+						MX28_PAD_LCD_D17__LCD_D17
+					>;
+					fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+					fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up =3D <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_16bit_pins_a: lcdif-16bit@0 {
 					reg =3D <0>;
 					fsl,pinmux-ids =3D <
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
