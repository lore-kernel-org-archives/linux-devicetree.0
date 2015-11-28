From: Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 10/10] drm/hisilicon: Add support for external bridge
Date: Sat, 28 Nov 2015 18:39:05 +0800
Message-ID: <1448707145-69348-11-git-send-email-xinliang.liu@linaro.org>
References: <1448707145-69348-1-git-send-email-xinliang.liu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448707145-69348-1-git-send-email-xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zourongrong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lijianhua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for external HDMI bridge.

Signed-off-by: Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/hisilicon/hisi_drm_dsi.c | 51 ++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hisi_drm_dsi.c b/drivers/gpu/drm/hisilicon/hisi_drm_dsi.c
index 066e08d..9e056db 100644
--- a/drivers/gpu/drm/hisilicon/hisi_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/hisi_drm_dsi.c
@@ -78,6 +78,7 @@ struct dsi_hw_ctx {
 
 struct hisi_dsi {
 	struct drm_encoder encoder;
+	struct drm_bridge *bridge;
 	struct mipi_dsi_host host;
 	struct drm_display_mode cur_mode;
 	struct dsi_hw_ctx *ctx;
@@ -671,6 +672,25 @@ static int dsi_host_init(struct device *dev, struct hisi_dsi *dsi)
 	return 0;
 }
 
+static int dsi_bridge_init(struct drm_device *dev, struct hisi_dsi *dsi)
+{
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_bridge *bridge = dsi->bridge;
+	int ret;
+
+	/* associate the bridge to dsi encoder */
+	encoder->bridge = bridge;
+	bridge->encoder = encoder;
+
+	ret = drm_bridge_attach(dev, bridge);
+	if (ret) {
+		DRM_ERROR("failed to attach exteranl bridge\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct dsi_data *ddata = dev_get_drvdata(dev);
@@ -686,6 +706,10 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	ret = dsi_bridge_init(drm_dev, dsi);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -702,8 +726,35 @@ static const struct component_ops dsi_ops = {
 static int dsi_parse_dt(struct platform_device *pdev, struct hisi_dsi *dsi)
 {
 	struct dsi_hw_ctx *ctx = dsi->ctx;
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *endpoint, *bridge_node;
+	struct drm_bridge *bridge;
 	struct resource *res;
 
+	/*
+	 * Get the endpoint node. In our case, dsi has one output port
+	 * to which the external HDMI bridge is connected.
+	 */
+	endpoint = of_graph_get_next_endpoint(np, NULL);
+	if (!endpoint) {
+		DRM_ERROR("no valid endpoint node\n");
+		return -ENODEV;
+	}
+	of_node_put(endpoint);
+
+	bridge_node = of_graph_get_remote_port_parent(endpoint);
+	if (!bridge_node) {
+		DRM_ERROR("no valid bridge node\n");
+		return -ENODEV;
+	}
+	of_node_put(bridge_node);
+
+	bridge = of_drm_find_bridge(bridge_node);
+	if (!bridge) {
+		DRM_INFO("wait for external HDMI bridge driver.\n");
+		return -EPROBE_DEFER;
+	}
+	dsi->bridge = bridge;
 
 	ctx->dsi_cfg_clk = devm_clk_get(&pdev->dev, "pclk_dsi");
 	if (IS_ERR(ctx->dsi_cfg_clk)) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
