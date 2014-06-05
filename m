From: Andrew Ruder <andrew.ruder-zVnPOJbVE67JhSu7km37dQ@public.gmane.org>
Subject: [PATCH 1/6] arm: pxa2xx.dtsi: compatible tags for usb, mmc
Date: Thu,  5 Jun 2014 14:27:03 -0500
Message-ID: <708a099c2c0e2220ad5d2ad7b999378caf237439.1401995177.git.andrew.ruder@elecsyscorp.com>
References: <cover.1401995177.git.andrew.ruder@elecsyscorp.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1401995177.git.andrew.ruder-zVnPOJbVE67JhSu7km37dQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Andrew Ruder <andrew.ruder-zVnPOJbVE67JhSu7km37dQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This changes pxa2xx.dtsi's compatible tags for MMC and USB to match both
the documentation and the code.

Signed-off-by: Andrew Ruder <andrew.ruder-zVnPOJbVE67JhSu7km37dQ@public.gmane.org>
---
 arch/arm/boot/dts/pxa2xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index a5e90f0..c08f846 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -113,14 +113,14 @@
 		};
 
 		usb0: ohci@4c000000 {
-			compatible = "mrvl,pxa-ohci";
+			compatible = "marvell,pxa-ohci";
 			reg = <0x4c000000 0x10000>;
 			interrupts = <3>;
 			status = "disabled";
 		};
 
 		mmc0: mmc@41100000 {
-			compatible = "mrvl,pxa-mmc";
+			compatible = "marvell,pxa-mmc";
 			reg = <0x41100000 0x1000>;
 			interrupts = <23>;
 			status = "disabled";
-- 
1.9.0.rc3.12.gbc97e2d

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
