From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 2/2] drm/etnaviv: remove the need for a gpu-subsystem DT node
Date: Wed, 24 Jan 2018 16:37:11 +0100
Message-ID: <20180124153711.22049-2-l.stach@pengutronix.de>
References: <20180124153711.22049-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180124153711.22049-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The module autoloading can be triggered through the GPU core nodes
and the necessary platform device for the DRM toplevel device will
be instantiated on module init.

Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/display/etnaviv/etnaviv-drm.txt       | 20 ------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              | 36 ++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |  1 +
 3 files changed, 20 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
index 511b814543ba..8def11b16a24 100644
--- a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
+++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
@@ -1,23 +1,3 @@
-Etnaviv DRM master device
-=========================
-
-The Etnaviv DRM master device is a virtual device needed to list all
-Vivante GPU cores that comprise the GPU subsystem.
-
-Required properties:
-- compatible: Should be one of
-    "fsl,imx-gpu-subsystem"
-    "marvell,dove-gpu-subsystem"
-- cores: Should contain a list of phandles pointing to Vivante GPU devices
-
-example:
-
-gpu-subsystem {
-	compatible = "fsl,imx-gpu-subsystem";
-	cores = <&gpu_2d>, <&gpu_3d>;
-};
-
-
 Vivante GPU core devices
 ========================
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 491eddf9b150..665e62272a87 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -655,25 +655,21 @@ static int compare_str(struct device *dev, void *data)
 static int etnaviv_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
 	struct component_match *match = NULL;
 
 	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 
-	if (node) {
+	if (!dev->platform_data) {
 		struct device_node *core_node;
-		int i;
 
-		for (i = 0; ; i++) {
-			core_node = of_parse_phandle(node, "cores", i);
-			if (!core_node)
-				break;
+		for_each_compatible_node(core_node, NULL, "vivante,gc") {
+			if (!of_device_is_available(core_node))
+				continue;
 
 			drm_of_component_match_add(&pdev->dev, &match,
 						   compare_of, core_node);
-			of_node_put(core_node);
 		}
-	} else if (dev->platform_data) {
+	} else {
 		char **names = dev->platform_data;
 		unsigned i;
 
@@ -691,25 +687,18 @@ static int etnaviv_pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id dt_match[] = {
-	{ .compatible = "fsl,imx-gpu-subsystem" },
-	{ .compatible = "marvell,dove-gpu-subsystem" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, dt_match);
-
 static struct platform_driver etnaviv_platform_driver = {
 	.probe      = etnaviv_pdev_probe,
 	.remove     = etnaviv_pdev_remove,
 	.driver     = {
 		.name   = "etnaviv",
-		.of_match_table = dt_match,
 	},
 };
 
 static int __init etnaviv_init(void)
 {
 	int ret;
+	struct device_node *np;
 
 	etnaviv_validate_init();
 
@@ -721,6 +710,19 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		platform_driver_unregister(&etnaviv_gpu_driver);
 
+	/*
+	 * If the DT contains at least one available GPU device, instantiate
+	 * the DRM platform device.
+	 */
+	for_each_compatible_node(np, NULL, "vivante,gc") {
+		if (!of_device_is_available(np))
+			continue;
+
+		platform_device_register_simple("etnaviv", -1, NULL, 0);
+		of_node_put(np);
+		break;
+	}
+
 	return ret;
 }
 module_init(etnaviv_init);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index e19cbe05da2a..3f282d725935 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1823,6 +1823,7 @@ static const struct of_device_id etnaviv_gpu_match[] = {
 	},
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
 
 static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 {
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
