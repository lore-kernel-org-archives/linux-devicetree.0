From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 1/2] drm/bridge: dumb-vga-dac: Support a VDD regulator supply
Date: Wed, 16 Nov 2016 23:42:31 +0800
Message-ID: <20161116154232.872-2-wens@csie.org>
References: <20161116154232.872-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161116154232.872-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some dumb VGA DACs are active components which require external power.
Add support for specifying a regulator as its power supply.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/display/bridge/dumb-vga-dac.txt       |  2 ++
 drivers/gpu/drm/bridge/dumb-vga-dac.c              | 35 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt b/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
index 003bc246a270..164cbb15f04c 100644
--- a/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
+++ b/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
@@ -16,6 +16,8 @@ graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 - Video port 0 for RGB input
 - Video port 1 for VGA output
 
+Optional properties:
+- vdd-supply: Power supply for DAC
 
 Example
 -------
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index afec232185a7..15b549f94307 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -12,6 +12,7 @@
 
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
@@ -23,6 +24,7 @@ struct dumb_vga {
 	struct drm_connector	connector;
 
 	struct i2c_adapter	*ddc;
+	struct regulator	*vdd;
 };
 
 static inline struct dumb_vga *
@@ -124,8 +126,32 @@ static int dumb_vga_attach(struct drm_bridge *bridge)
 	return 0;
 }
 
+static void dumb_vga_enable(struct drm_bridge *bridge)
+{
+	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
+	int ret = 0;
+
+	if (vga->vdd)
+		ret = regulator_enable(vga->vdd);
+
+	if (ret) {
+		DRM_ERROR("Failed to enable vdd regulator: %d\n", ret);
+		return;
+	}
+}
+
+static void dumb_vga_disable(struct drm_bridge *bridge)
+{
+	struct dumb_vga *vga = drm_bridge_to_dumb_vga(bridge);
+
+	if (vga->vdd)
+		regulator_disable(vga->vdd);
+}
+
 static const struct drm_bridge_funcs dumb_vga_bridge_funcs = {
 	.attach		= dumb_vga_attach,
+	.enable		= dumb_vga_enable,
+	.disable	= dumb_vga_disable,
 };
 
 static struct i2c_adapter *dumb_vga_retrieve_ddc(struct device *dev)
@@ -169,6 +195,15 @@ static int dumb_vga_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, vga);
 
+	vga->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
+	if (IS_ERR(vga->vdd)) {
+		ret = PTR_ERR(vga->vdd);
+		if (ret == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		vga->vdd = NULL;
+		dev_dbg(&pdev->dev, "No vdd regulator found: %d\n", ret);
+	}
+
 	vga->ddc = dumb_vga_retrieve_ddc(&pdev->dev);
 	if (IS_ERR(vga->ddc)) {
 		if (PTR_ERR(vga->ddc) == -ENODEV) {
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
