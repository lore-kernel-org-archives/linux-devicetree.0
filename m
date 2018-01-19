From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/3] drm/etnaviv: add generic compatible for the GPU subsystem node
Date: Fri, 19 Jan 2018 13:06:32 +0100
Message-ID: <20180119120634.22856-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

With different SoCs gaining support for etnaviv it doesn't make much sense
to add specific compatibles for the generic GPU subsystem node, which is
only used to find all GPU core nodes.

Add a generic compatible, that can be used by all new implementations.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
index 05176f1ae108..c6f4e023c34a 100644
--- a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
+++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
@@ -8,6 +8,7 @@ Required properties:
 - compatible: Should be one of
     "fsl,imx-gpu-subsystem"
     "marvell,dove-gpu-subsystem"
+    "vivante,gpu-subsystem"
 - cores: Should contain a list of phandles pointing to Vivante GPU devices
 
 example:
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 491eddf9b150..c9fb94f6b976 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -694,6 +694,7 @@ static int etnaviv_pdev_remove(struct platform_device *pdev)
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "fsl,imx-gpu-subsystem" },
 	{ .compatible = "marvell,dove-gpu-subsystem" },
+	{ .compatible = "vivante,gpu-subsystem" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
