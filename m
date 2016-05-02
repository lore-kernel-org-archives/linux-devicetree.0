From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: DTS: da850: add pinmux configuration for mmc1
Date: Mon,  2 May 2016 15:40:38 +0200
Message-ID: <1462196439-4693-1-git-send-email-petr@barix.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, brain-wDf7oJUeT2I@public.gmane.org, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The da850.dtsi defined a pinmux configuration only for MMC0
and not for MMC1.
This adds a (4-bit) pinmux configuration for MMC1.

Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/da850.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 226cda76e77c..4983b3d0be55 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -72,6 +72,22 @@
 					0x28 0x00222222  0x00ffffff
 				>;
 			};
+			mmc1_pins: pinmux_mmc1_pins {
+				pinctrl-single,bits = <
+					/*
+					 * PINMUX18:
+					 * MMCSD1_CMD MMCSD1_CLK
+					 * MMCSD0_DAT[0]
+					 */
+					0x48 0x00022200  0x000fff00
+					/*
+					 * PINMUX19:
+					 * MMCSD0_DAT[1] MMCSD0_DAT[2]
+					 * MMCSD0_DAT[3]
+					 */
+					0x4c 0x00022200  0x000fff00
+				>;
+			};
 			ehrpwm0a_pins: pinmux_ehrpwm0a_pins {
 				pinctrl-single,bits = <
 					/* EPWM0A */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
