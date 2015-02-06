From: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Subject: [PATCH 1/1] arm: Fix bootled on Excito B3 boards
Date: Fri,  6 Feb 2015 10:13:11 +0100
Message-ID: <1423213991-11246-1-git-send-email-gordon@bosvangennip.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On a normal boot Excito B3 boards will set the LED color to purple,
however when booting a kernel with the kirkwood-b3 device tree blob
attached the LED will switch off. There is a default-state parameter
wit value "off" included for the green gpio-led, but this is already
the default.

Add default-state parameter to blue and red gpio-leds and set their
value to "on".

Note: when creating a kernel for a USB device the default-state for
the gpio-leds should be reversed, i.e. the LED should be green while
the kernel is being loaded.

Verified on my own Excito B3

Signed-off-by: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
---
 arch/arm/boot/dts/kirkwood-b3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
index c9247f8..f24e4fe 100644
--- a/arch/arm/boot/dts/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/kirkwood-b3.dts
@@ -141,11 +141,13 @@
 		error_led {
 			label = "bubba3:red:error";
 			gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
 		};
 
 		active_led {
 			label = "bubba3:blue:active";
 			gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
 		};
 	};
 
-- 
2.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
