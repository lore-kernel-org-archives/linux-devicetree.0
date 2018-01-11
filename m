From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] arm: spear600: Add missing interrupt-parent of rtc
Date: Thu, 11 Jan 2018 11:28:51 +0530
Message-ID: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The interrupt-parent of rtc was missing, add it.

Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.8+
Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/spear600.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
index 6b32d20acc9f..00166eb9be86 100644
--- a/arch/arm/boot/dts/spear600.dtsi
+++ b/arch/arm/boot/dts/spear600.dtsi
@@ -194,6 +194,7 @@
 			rtc: rtc@fc900000 {
 				compatible = "st,spear600-rtc";
 				reg = <0xfc900000 0x1000>;
+				interrupt-parent = <&vic0>;
 				interrupts = <10>;
 				status = "disabled";
 			};
-- 
2.15.0.194.g9af6a3dea062

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
