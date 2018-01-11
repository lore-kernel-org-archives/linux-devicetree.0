From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] arm: spear13xx: Fix spics gpio controller's warning
Date: Thu, 11 Jan 2018 11:28:53 +0530
Message-ID: <9d8521e3990be6789f1ed3d5757b57c65483117b.1515650104.git.viresh.kumar@linaro.org>
References: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
In-Reply-To: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
References: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This fixes the following warning by also sending the flags argument for
gpio controllers:

Property 'cs-gpios', cell 6 is not a phandle reference in
/ahb/apb/spi@e0100000

Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.8+
Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/spear1310-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index 84101e4eebbf..0f5f379323a8 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -349,7 +349,7 @@
 			spi0: spi@e0100000 {
 				status = "okay";
 				num-cs = <3>;
-				cs-gpios = <&gpio1 7 0>, <&spics 0>, <&spics 1>;
+				cs-gpios = <&gpio1 7 0>, <&spics 0 0>, <&spics 1 0>;
 
 				stmpe610@0 {
 					compatible = "st,stmpe610";
-- 
2.15.0.194.g9af6a3dea062

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
