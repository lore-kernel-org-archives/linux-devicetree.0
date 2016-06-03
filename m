From: luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [linux-sunxi] [PATCH] [V2] ARM: dts: sun7i: Add dts file for Bananapi M1 Plus board
Date: Fri,  3 Jun 2016 14:13:36 +0800
Message-ID: <20160603061336.16263-1-luoyi.ly@gmail.com>
References: <574FF94B.3020309@web.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <574FF94B.3020309-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luo Yi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Luo Yi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Remove the extra empty line and add signed off. 

Signed-off-by: Luo Yi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
index 6fd55d7..f9063ba 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
@@ -47,7 +47,6 @@
 	compatible = "sinovoip,bpi-m1-plus", "allwinner,sun7i-a20";
 };
 
-
 &codec {
 	status = "okay";
 };
@@ -62,11 +61,8 @@
 		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>; 
 		interrupt-names = "host-wake";
 	};
-
 };
 
 &mmc3_pins_a {
-    /* AP6210 requires pull-up */
 	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 };
-
-- 
2.8.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
