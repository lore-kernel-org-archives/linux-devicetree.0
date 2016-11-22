From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 4/4] drm/tilcdc: Add drm bridge support for attaching drm bridge drivers
Date: Tue, 22 Nov 2016 16:49:53 +0200
Message-ID: <73d418f804fed030ded8586a83fba232649fbd12.1479825908.git.jsarha@ti.com>
References: <cover.1479825908.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1479825908.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds drm bride support for attaching drm bridge drivers to tilcdc. The
decision whether a video port leads to an external encoder or bridge
is made simply based on remote device's compatible string. The code
has been tested with BeagleBone-Black with and without BeagleBone
DVI-D Cape Rev A3 using ti-tfp410 driver.

Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c      |   7 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      |   2 +
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 140 +++++++++++++++++++++++++++----
 drivers/gpu/drm/tilcdc/tilcdc_external.h |   1 +
 4 files changed, 131 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3d2cea0..af959df 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -384,9 +384,14 @@ static int tilcdc_init(struct drm_driver *ddrv, struct device *dev)
 		ret = tilcdc_add_external_encoders(ddev);
 		if (ret < 0)
 			goto init_failed;
+	} else {
+		ret = tilcdc_attach_remote_device(ddev);
+		if (ret)
+			goto init_failed;
 	}
 
-	if ((priv->num_encoders == 0) || (priv->num_connectors == 0)) {
+	if (!priv->remote_encoder &&
+	    ((priv->num_encoders == 0) || (priv->num_connectors == 0))) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -ENXIO;
 		goto init_failed;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index d31fe5d..283ff28 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -90,6 +90,8 @@ struct tilcdc_drm_private {
 	struct drm_connector *connectors[8];
 	const struct drm_connector_helper_funcs *connector_funcs[8];
 
+	struct drm_encoder *remote_encoder;
+
 	bool is_registered;
 	bool is_componentized;
 };
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 06a4c58..e1576ba 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -28,6 +28,18 @@
 		.raster_order           = 0,
 };
 
+static const struct tilcdc_panel_info panel_info_default = {
+		.ac_bias                = 255,
+		.ac_bias_intrpt         = 0,
+		.dma_burst_sz           = 16,
+		.bpp                    = 16,
+		.fdd                    = 0x80,
+		.tft_alt_mode           = 0,
+		.sync_edge              = 0,
+		.sync_ctrl              = 1,
+		.raster_order           = 0,
+};
+
 static int tilcdc_external_mode_valid(struct drm_connector *connector,
 				      struct drm_display_mode *mode)
 {
@@ -130,6 +142,101 @@ void tilcdc_remove_external_encoders(struct drm_device *dev)
 						 priv->connector_funcs[i]);
 }
 
+static const struct drm_encoder_funcs tilcdc_remote_encoder_funcs = {
+	.destroy	= drm_encoder_cleanup,
+};
+
+static
+int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
+{
+	struct tilcdc_drm_private *priv = ddev->dev_private;
+	int ret;
+
+	priv->remote_encoder->possible_crtcs = BIT(0);
+	priv->remote_encoder->bridge = bridge;
+	bridge->encoder = priv->remote_encoder;
+
+	ret = drm_bridge_attach(ddev, bridge);
+	if (ret) {
+		dev_err(ddev->dev, "drm_bridge_attach() failed %d\n", ret);
+		return ret;
+	}
+
+	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_default);
+
+	return 0;
+}
+
+static int tilcdc_node_has_port(struct device_node *dev_node)
+{
+	struct device_node *node;
+
+	node = of_get_child_by_name(dev_node, "ports");
+	if (!node)
+		node = of_get_child_by_name(dev_node, "port");
+	if (!node)
+		return 0;
+	of_node_put(node);
+
+	return 1;
+}
+
+static
+struct device_node *tilcdc_get_remote_node(struct device_node *node)
+{
+	struct device_node *ep;
+	struct device_node *parent;
+
+	if (!tilcdc_node_has_port(node))
+		return NULL;
+
+	ep = of_graph_get_next_endpoint(node, NULL);
+	if (!ep)
+		return NULL;
+
+	parent = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+
+	return parent;
+}
+
+int tilcdc_attach_remote_device(struct drm_device *ddev)
+{
+	struct tilcdc_drm_private *priv = ddev->dev_private;
+	struct device_node *remote_node;
+	struct drm_bridge *bridge;
+	int ret;
+
+	remote_node = tilcdc_get_remote_node(ddev->dev->of_node);
+	if (!remote_node)
+		return 0;
+
+	bridge = of_drm_find_bridge(remote_node);
+	of_node_put(remote_node);
+	if (!bridge)
+		return -EPROBE_DEFER;
+
+	priv->remote_encoder = devm_kzalloc(ddev->dev,
+					    sizeof(*priv->remote_encoder),
+					    GFP_KERNEL);
+	if (!priv->remote_encoder)
+		return -ENOMEM;
+
+	ret = drm_encoder_init(ddev, priv->remote_encoder,
+			       &tilcdc_remote_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		dev_err(ddev->dev, "drm_encoder_init() failed %d\n", ret);
+		return ret;
+	}
+
+	ret = tilcdc_attach_bridge(ddev, bridge);
+	if (ret)
+		drm_encoder_cleanup(priv->remote_encoder);
+
+	return ret;
+}
+
 static int dev_match_of(struct device *dev, void *data)
 {
 	return dev->of_node == data;
@@ -141,16 +248,10 @@ int tilcdc_get_external_components(struct device *dev,
 	struct device_node *node;
 	struct device_node *ep = NULL;
 	int count = 0;
+	int ret = 0;
 
-	/* Avoid error print by of_graph_get_next_endpoint() if there
-	 * is no ports present.
-	 */
-	node = of_get_child_by_name(dev->of_node, "ports");
-	if (!node)
-		node = of_get_child_by_name(dev->of_node, "port");
-	if (!node)
+	if (!tilcdc_node_has_port(dev->of_node))
 		return 0;
-	of_node_put(node);
 
 	while ((ep = of_graph_get_next_endpoint(dev->of_node, ep))) {
 		node = of_graph_get_remote_port_parent(ep);
@@ -160,17 +261,20 @@ int tilcdc_get_external_components(struct device *dev,
 		}
 
 		dev_dbg(dev, "Subdevice node '%s' found\n", node->name);
-		if (match)
-			drm_of_component_match_add(dev, match, dev_match_of,
-						   node);
-		of_node_put(node);
-		count++;
-	}
 
-	if (count > 1) {
-		dev_err(dev, "Only one external encoder is supported\n");
-		return -EINVAL;
+		if (of_device_is_compatible(node, "nxp,tda998x")) {
+			if (match)
+				drm_of_component_match_add(dev, match,
+							   dev_match_of, node);
+			ret = 1;
+		}
+
+		of_node_put(node);
+		if (count++ > 1) {
+			dev_err(dev, "Only one port is supported\n");
+			return -EINVAL;
+		}
 	}
 
-	return count;
+	return ret;
 }
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.h b/drivers/gpu/drm/tilcdc/tilcdc_external.h
index c700e0c..a27c365 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.h
@@ -22,4 +22,5 @@
 void tilcdc_remove_external_encoders(struct drm_device *dev);
 int tilcdc_get_external_components(struct device *dev,
 				   struct component_match **match);
+int tilcdc_attach_remote_device(struct drm_device *ddev);
 #endif /* __TILCDC_SLAVE_H__ */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
