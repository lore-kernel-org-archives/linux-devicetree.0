From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: rockchip: correct the name of REG8 for rk3288-evb-act8846
Date: Thu, 10 Dec 2015 13:46:37 +0800
Message-ID: <1449726399-12507-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

According to the schematic, the name of REG8 should be vcc_tp, rather
than vcca_tp.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/rk3288-evb-act8846.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rk3288-evb-act8846.dts
index 43949a6..53d8b08 100644
--- a/arch/arm/boot/dts/rk3288-evb-act8846.dts
+++ b/arch/arm/boot/dts/rk3288-evb-act8846.dts
@@ -152,7 +152,7 @@
 				regulator-always-on;
 			};
 
-			vcca_tp: REG8 {
+			vcc_tp: REG8 {
 				regulator-name = "VCCA_TP";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
