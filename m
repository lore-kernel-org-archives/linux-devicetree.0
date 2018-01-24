From: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
Subject: [PATCH] ARM: dts: use 'atmel' as at24 manufacturer for sama5d34ek
Date: Wed, 24 Jan 2018 22:23:46 +0100
Message-ID: <20180124212346.3823-1-brgl@bgdev.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Using compatible strings without the <manufacturer> part for at24 is
now deprecated. Use a correct 'atmel,<model>' value.

Signed-off-by: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
---
 arch/arm/boot/dts/sama5d34ek.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d34ek.dts b/arch/arm/boot/dts/sama5d34ek.dts
index c8b8449fdc3e..15d5c46013a4 100644
--- a/arch/arm/boot/dts/sama5d34ek.dts
+++ b/arch/arm/boot/dts/sama5d34ek.dts
@@ -38,7 +38,7 @@
 				status = "okay";
 
 				24c256@50 {
-					compatible = "24c256";
+					compatible = "atmel,24c256";
 					reg = <0x50>;
 					pagesize = <64>;
 				};
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
