From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: add the grf clock for dw-mipi-dsi
Date: Wed, 15 Mar 2017 16:42:30 +0800
Message-ID: <1489567352-3333-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

For RK3399, the grf clock should be controlled by dw-mipi-dsi driver,
add the description for this clock.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 .../devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
index 188f6f7..7e17a60 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
@@ -10,7 +10,7 @@ Required properties:
 - interrupts: Represent the controller's interrupt to the CPU(s).
 - clocks, clock-names: Phandles to the controller's pll reference
   clock(ref) and APB clock(pclk). For RK3399, a phy config clock
-  (phy_cfg) is additional required. As described in [1].
+  (phy_cfg) and a grf clock(grf) are additional required. As described in [1].
 - rockchip,grf: this soc should set GRF regs to mux vopl/vopb.
 - ports: contain a port node with endpoint definitions as defined in [2].
   For vopb,set the reg = <0> and set the reg = <1> for vopl.
-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
