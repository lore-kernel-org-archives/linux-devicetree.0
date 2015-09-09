From: Olliver Schinagl <o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
Subject: [PATCH 2/5] dts: sunxi: correct vendor prefix on OLinuXino a10s micro
Date: Wed,  9 Sep 2015 11:25:12 +0200
Message-ID: <1441790715-11957-3-git-send-email-o.schinagl@ultimaker.com>
References: <1441790715-11957-1-git-send-email-o.schinagl@ultimaker.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441790715-11957-1-git-send-email-o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>

The OLinuXino A10S micro features an eeprom. According to the eeprom.txt
binding document, we should use the manufacturer and 'at' is not the
proper manufacturer id according to the vendor-prefixes.

This patch takes the proper vendor-prefix and uses it for the eeprom
node.

--Signed-off-by: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
index a7e19e4..49a1be6 100644
--- a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
@@ -104,7 +104,7 @@
 	status = "okay";
 
 	at24@50 {
-		compatible = "at,24c16";
+		compatible = "atmel,24c16";
 		pagesize = <16>;
 		reg = <0x50>;
 		read-only;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
