From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 5/9] dt-bindings: add compatibles for rk3066/rk3188 power controllers
Date: Fri, 15 Sep 2017 10:33:53 +0200
Message-ID: <20170915083357.11296-6-heiko@sntech.de>
References: <20170915083357.11296-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915083357.11296-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the compatible values for the power-domain controllers found on
rk3066 and rk3188.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/soc/rockchip/power_domain.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt b/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
index 301d2a9bc1b8..1c42c5b7ca6a 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
+++ b/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
@@ -5,6 +5,8 @@ powered up/down by software based on different application scenes to save power.
 
 Required properties for power domain controller:
 - compatible: Should be one of the following.
+	"rockchip,rk3066-power-controller" - for RK3288 SoCs.
+	"rockchip,rk3188-power-controller" - for RK3288 SoCs.
 	"rockchip,rk3288-power-controller" - for RK3288 SoCs.
 	"rockchip,rk3328-power-controller" - for RK3328 SoCs.
 	"rockchip,rk3366-power-controller" - for RK3366 SoCs.
@@ -17,6 +19,8 @@ Required properties for power domain controller:
 
 Required properties for power domain sub nodes:
 - reg: index of the power domain, should use macros in:
+	"include/dt-bindings/power/rk3066-power.h" - for RK3288 type power domain.
+	"include/dt-bindings/power/rk3188-power.h" - for RK3288 type power domain.
 	"include/dt-bindings/power/rk3288-power.h" - for RK3288 type power domain.
 	"include/dt-bindings/power/rk3328-power.h" - for RK3328 type power domain.
 	"include/dt-bindings/power/rk3366-power.h" - for RK3366 type power domain.
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
