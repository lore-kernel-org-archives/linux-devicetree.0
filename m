From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/3] dt-bindings: etnaviv: change clocks to be optional
Date: Fri, 19 Jan 2018 13:06:33 +0100
Message-ID: <20180119120634.22856-2-l.stach@pengutronix.de>
References: <20180119120634.22856-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180119120634.22856-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

While the clocks were documented as required, the driver always treated them
as optional and there are existing Marvell Dove DTs, which would break if
changed to required. Accept reality and document the clocks as optional.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/display/etnaviv/etnaviv-drm.txt        | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
index c6f4e023c34a..f28aa5735f4f 100644
--- a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
+++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
@@ -30,16 +30,16 @@ Required properties:
 - reg: should be register base and length as documented in the
   datasheet
 - interrupts: Should contain the cores interrupt line
+
+Optional properties:
+- power-domains: a power domain consumer specifier according to
+  Documentation/devicetree/bindings/power/power_domain.txt
 - clocks: should contain one clock for entry in clock-names
   see Documentation/devicetree/bindings/clock/clock-bindings.txt
 - clock-names:
    - "bus":    AXI/register clock
    - "core":   GPU core clock
-   - "shader": Shader clock (only required if GPU has feature PIPE_3D)
-
-Optional properties:
-- power-domains: a power domain consumer specifier according to
-  Documentation/devicetree/bindings/power/power_domain.txt
+   - "shader": Shader clock (only if GPU has feature PIPE_3D)
 
 example:
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
