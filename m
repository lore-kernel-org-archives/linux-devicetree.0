From: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH RFC 1/2] dts: regulator-clk32kg should always be enabled
Date: Mon, 14 Jul 2014 13:50:54 +0200
Message-ID: <1405338655-18415-2-git-send-email-sassmann@kpanic.de>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405338655-18415-1-git-send-email-sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This clock needs to be turned on for the wifi to work properly.

Signed-off-by: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/twl6030.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/twl6030.dtsi b/arch/arm/boot/dts/twl6030.dtsi
index 2e3bd31..e91e507 100644
--- a/arch/arm/boot/dts/twl6030.dtsi
+++ b/arch/arm/boot/dts/twl6030.dtsi
@@ -85,6 +85,7 @@
 
 	clk32kg: regulator-clk32kg {
 		compatible = "ti,twl6030-clk32kg";
+		regulator-always-on;
 	};
 
 	twl_usb_comparator: usb-comparator {
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
