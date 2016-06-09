From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH V2 1/5] drm/imx-ldb: Add support to drm-bridge
Date: Thu,  9 Jun 2016 18:25:01 +0200
Message-ID: <ecdd2f66f5a4661e81b40808dffd212989d0ab15.1465486875.git.peter.senna@collabora.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
 <cover.1465486875.git.peter.senna@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1465486875.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1465486875.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1465486875.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support to attach a drm_bridge to imx-ldb in addition to
existing support to attach a LVDS panel.

This patch does a simple code refactoring by moving code
from for_each_child_of_node iterator to a new function named
imx_ldb_panel_ddc(). This was necessary to allow the panel ddc
code to run only when the imx_ldb is not attached to a bridge.

Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
Changes from V1:
 - Reanmed ext_bridge to bridge
 - Removed empty entry point imx_ldb_encoder_enable()
 - Adapted the code to apply to the latest linux next: next-20160609

 drivers/gpu/drm/imx/imx-ldb.c | 121 +++++++++++++++++++++++++++---------------
 1 file changed, 79 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index beff793..55e94cc 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -58,7 +58,11 @@ struct imx_ldb_channel {
 	struct imx_ldb *ldb;
 	struct drm_connector connector;
 	struct drm_encoder encoder;
+
+	/* Defines what is connected to the ldb, only one at a time */
 	struct drm_panel *panel;
+	struct drm_bridge *bridge;
+
 	struct device_node *child;
 	struct i2c_adapter *ddc;
 	int chno;
@@ -422,16 +426,27 @@ static int imx_ldb_register(struct drm_device *drm,
 	drm_encoder_init(drm, &imx_ldb_ch->encoder, &imx_ldb_encoder_funcs,
 			 DRM_MODE_ENCODER_LVDS, NULL);
 
-	drm_connector_helper_add(&imx_ldb_ch->connector,
-			&imx_ldb_connector_helper_funcs);
-	drm_connector_init(drm, &imx_ldb_ch->connector,
-			   &imx_ldb_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
-
-	if (imx_ldb_ch->panel)
+	if (imx_ldb_ch->panel) {
+		drm_connector_helper_add(&imx_ldb_ch->connector,
+				&imx_ldb_connector_helper_funcs);
+		drm_connector_init(drm, &imx_ldb_ch->connector,
+				&imx_ldb_connector_funcs,
+				DRM_MODE_CONNECTOR_LVDS);
 		drm_panel_attach(imx_ldb_ch->panel, &imx_ldb_ch->connector);
+		drm_mode_connector_attach_encoder(&imx_ldb_ch->connector,
+				&imx_ldb_ch->encoder);
+	}
 
-	drm_mode_connector_attach_encoder(&imx_ldb_ch->connector,
-			&imx_ldb_ch->encoder);
+	if (imx_ldb_ch->bridge) {
+		imx_ldb_ch->bridge->encoder = &imx_ldb_ch->encoder;
+
+		imx_ldb_ch->encoder.bridge = imx_ldb_ch->bridge;
+		ret = drm_bridge_attach(drm, imx_ldb_ch->bridge);
+		if (ret) {
+			DRM_ERROR("Failed to initialize bridge with drm\n");
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -501,6 +516,45 @@ static const struct of_device_id imx_ldb_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, imx_ldb_dt_ids);
 
+static int imx_ldb_panel_ddc(struct device *dev,
+		struct imx_ldb_channel *channel, struct device_node *child)
+{
+	struct device_node *ddc_node;
+	const u8 *edidp;
+	int ret;
+
+	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
+	if (ddc_node) {
+		channel->ddc = of_find_i2c_adapter_by_node(ddc_node);
+		of_node_put(ddc_node);
+		if (!channel->ddc) {
+			dev_warn(dev, "failed to get ddc i2c adapter\n");
+			return -EPROBE_DEFER;
+		}
+	}
+
+	if (!channel->ddc) {
+		/* if no DDC available, fallback to hardcoded EDID */
+		dev_dbg(dev, "no ddc available\n");
+
+		edidp = of_get_property(child, "edid",
+					&channel->edid_len);
+		if (edidp) {
+			channel->edid = kmemdup(edidp,
+						channel->edid_len,
+						GFP_KERNEL);
+		} else if (!channel->panel) {
+			/* fallback to display-timings node */
+			ret = of_get_drm_display_mode(child,
+						      &channel->mode,
+						      OF_USE_NATIVE_MODE);
+			if (!ret)
+				channel->mode_valid = 1;
+		}
+	}
+	return 0;
+}
+
 static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
@@ -508,7 +562,6 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 	const struct of_device_id *of_id =
 			of_match_device(imx_ldb_dt_ids, dev);
 	struct device_node *child;
-	const u8 *edidp;
 	struct imx_ldb *imx_ldb;
 	int dual;
 	int ret;
@@ -558,7 +611,6 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 
 	for_each_child_of_node(np, child) {
 		struct imx_ldb_channel *channel;
-		struct device_node *ddc_node;
 		struct device_node *ep;
 
 		ret = of_property_read_u32(child, "reg", &i);
@@ -590,46 +642,31 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 
 			remote = of_graph_get_remote_port_parent(ep);
 			of_node_put(ep);
-			if (remote)
+			if (remote) {
 				channel->panel = of_drm_find_panel(remote);
-			else
+				channel->bridge = of_drm_find_bridge(remote);
+			} else
 				return -EPROBE_DEFER;
+
 			of_node_put(remote);
-			if (!channel->panel) {
-				dev_err(dev, "panel not found: %s\n",
-					remote->full_name);
-				return -EPROBE_DEFER;
-			}
-		}
 
-		ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
-		if (ddc_node) {
-			channel->ddc = of_find_i2c_adapter_by_node(ddc_node);
-			of_node_put(ddc_node);
-			if (!channel->ddc) {
-				dev_warn(dev, "failed to get ddc i2c adapter\n");
+			/*
+			 * If the bridge is compiled as a module, it may take
+			 * some time until the bridge driver is available.
+			 * Defer until the bridge driver is ready.
+			 */
+			if (!channel->panel && !channel->bridge) {
+				dev_err(dev, "panel/bridge not found: %s\n",
+					remote->full_name);
 				return -EPROBE_DEFER;
 			}
 		}
 
-		if (!channel->ddc) {
-			/* if no DDC available, fallback to hardcoded EDID */
-			dev_dbg(dev, "no ddc available\n");
-
-			edidp = of_get_property(child, "edid",
-						&channel->edid_len);
-			if (edidp) {
-				channel->edid = kmemdup(edidp,
-							channel->edid_len,
-							GFP_KERNEL);
-			} else if (!channel->panel) {
-				/* fallback to display-timings node */
-				ret = of_get_drm_display_mode(child,
-							      &channel->mode,
-							      OF_USE_NATIVE_MODE);
-				if (!ret)
-					channel->mode_valid = 1;
-			}
+		/* Only does panel ddc work if there is no bridge */
+		if (!channel->bridge) {
+			ret = imx_ldb_panel_ddc(dev, channel, child);
+			if (ret)
+				return ret;
 		}
 
 		channel->bus_format = of_get_bus_format(dev, child);
-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
