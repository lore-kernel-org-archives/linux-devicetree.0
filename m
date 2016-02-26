From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH bugfix] ARM: dts: imx51: remove bogus pin definition
Date: Fri, 26 Feb 2016 15:08:52 +0100
Message-ID: <1456495732-3233-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pad DISPB2_SER_RS has no function DISP1_EXT_CLK.
The definition is obviusly a copy/paste error from
MX51_PAD_DISPB2_SER_RS__DISP1_PIN16.

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/imx51-pinfunc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx51-pinfunc.h b/arch/arm/boot/dts/imx5=
1-pinfunc.h
index 9eb92ab..82eae3c 100644
--- a/arch/arm/boot/dts/imx51-pinfunc.h
+++ b/arch/arm/boot/dts/imx51-pinfunc.h
@@ -536,7 +536,6 @@
 #define MX51_PAD_DISPB2_SER_CLK__DISP1_PIN7		0x2c4 0x6c4 0x000 0x3 0x0
 #define MX51_PAD_DISPB2_SER_CLK__DISPB2_SER_CLK		0x2c4 0x6c4 0x000 0x0=
 0x0
 #define MX51_PAD_DISPB2_SER_CLK__GPIO3_7		0x2c4 0x6c4 0x990 0x4 0x1
-#define MX51_PAD_DISPB2_SER_RS__DISP1_EXT_CLK		0x2c8 0x6c8 0x000 0x2 0=
x0
 #define MX51_PAD_DISPB2_SER_RS__DISP1_PIN16		0x2c8 0x6c8 0x000 0x2 0x0
 #define MX51_PAD_DISPB2_SER_RS__DISP1_PIN8		0x2c8 0x6c8 0x000 0x3 0x0
 #define MX51_PAD_DISPB2_SER_RS__DISPB2_SER_RS		0x2c8 0x6c8 0x000 0x0 0=
x0
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
