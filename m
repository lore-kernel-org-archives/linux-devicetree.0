From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v1 2/3] dt-bindings: add binding for rk3328 power domains
Date: Fri, 23 Dec 2016 11:47:51 +0800
Message-ID: <1482464872-12954-3-git-send-email-zhangqing@rock-chips.com>
References: <1482464872-12954-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482464872-12954-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the power domains
found on Rockchip RK3328 SoCs.
But RK3328 SoC just support idle, not support pd.

Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/soc/rockchip/power_domain.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt b/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
index f909ce06afc4..01bfb6745fbd 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
+++ b/Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
@@ -6,6 +6,7 @@ powered up/down by software based on different application scenes to save power.
 Required properties for power domain controller:
 - compatible: Should be one of the following.
 	"rockchip,rk3288-power-controller" - for RK3288 SoCs.
+	"rockchip,rk3328-power-controller" - for RK3328 SoCs.
 	"rockchip,rk3368-power-controller" - for RK3368 SoCs.
 	"rockchip,rk3399-power-controller" - for RK3399 SoCs.
 - #power-domain-cells: Number of cells in a power-domain specifier.
@@ -16,6 +17,7 @@ Required properties for power domain controller:
 Required properties for power domain sub nodes:
 - reg: index of the power domain, should use macros in:
 	"include/dt-bindings/power/rk3288-power.h" - for RK3288 type power domain.
+	"include/dt-bindings/power/rk3328-power.h" - for RK3328 type power domain.
 	"include/dt-bindings/power/rk3368-power.h" - for RK3368 type power domain.
 	"include/dt-bindings/power/rk3399-power.h" - for RK3399 type power domain.
 - clocks (optional): phandles to clocks which need to be enabled while power domain
@@ -90,6 +92,7 @@ containing a phandle to the power device node and an index specifying which
 power domain to use.
 The index should use macros in:
 	"include/dt-bindings/power/rk3288-power.h" - for rk3288 type power domain.
+	"include/dt-bindings/power/rk3328-power.h" - for rk3328 type power domain.
 	"include/dt-bindings/power/rk3368-power.h" - for rk3368 type power domain.
 	"include/dt-bindings/power/rk3399-power.h" - for rk3399 type power domain.
 
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
