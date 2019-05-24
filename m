From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 3/6] drm/sun4i: dsi: Add bridge support
Date: Fri, 24 May 2019 16:13:14 +0530
Message-ID: <20190524104317.20287-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Some display panels would come up with a non-DSI output which
can have an option to connect DSI interface by means of bridge
converter.

This DSI to non-DSI bridge converter would require a bridge
driver that would communicate the DSI controller for bridge
functionalities.

So, add support for bridge functionalities in Allwinner DSI
controller.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 60 +++++++++++++++++++-------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  1 +
 2 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index ae2fe31b05b1..2b4b1355a88f 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -775,6 +775,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (!IS_ERR(dsi->panel))
 		drm_panel_prepare(dsi->panel);
 
+	if (!IS_ERR(dsi->bridge))
+		drm_bridge_pre_enable(dsi->bridge);
+
 	/*
 	 * FIXME: This should be moved after the switch to HS mode.
 	 *
@@ -790,6 +793,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (!IS_ERR(dsi->panel))
 		drm_panel_enable(dsi->panel);
 
+	if (!IS_ERR(dsi->bridge))
+		drm_bridge_enable(dsi->bridge);
+
 	sun6i_dsi_start(dsi, DSI_START_HSC);
 
 	udelay(1000);
@@ -806,6 +812,9 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
 	if (!IS_ERR(dsi->panel)) {
 		drm_panel_disable(dsi->panel);
 		drm_panel_unprepare(dsi->panel);
+	} else if (!IS_ERR(dsi->bridge)) {
+		drm_bridge_disable(dsi->bridge);
+		drm_bridge_post_disable(dsi->bridge);
 	}
 
 	phy_power_off(dsi->dphy);
@@ -969,11 +978,12 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 
 	dsi->device = device;
 	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 0, 0,
-					  &dsi->panel, NULL);
+					  &dsi->panel, &dsi->bridge);
 	if (ret)
 		return ret;
 
-	dev_info(host->dev, "Attached device %s\n", device->name);
+	dev_info(host->dev, "Attached %s %s\n",
+		 dsi->bridge ? "bridge" : "panel", device->name);
 
 	return 0;
 }
@@ -983,7 +993,10 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
-	dsi->panel = NULL;
+	if (dsi->panel)
+		dsi->panel = NULL;
+	else if (dsi->bridge)
+		dsi->bridge = NULL;
 	dsi->device = NULL;
 
 	return 0;
@@ -1055,8 +1068,10 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct sun4i_tcon *tcon0 = sun4i_get_tcon0(drm);
 	int ret;
 
-	if (!dsi->panel)
+	if (!(dsi->panel || dsi->bridge)) {
+		dev_info(drm->dev, "No panel or bridge found... DSI output disabled\n");
 		return -EPROBE_DEFER;
+	}
 
 	dsi->drv = drv;
 
@@ -1078,19 +1093,29 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	}
 	dsi->encoder.possible_crtcs = BIT(0);
 
-	drm_connector_helper_add(&dsi->connector,
-				 &sun6i_dsi_connector_helper_funcs);
-	ret = drm_connector_init(drm, &dsi->connector,
-				 &sun6i_dsi_connector_funcs,
-				 DRM_MODE_CONNECTOR_DSI);
-	if (ret) {
-		dev_err(dsi->dev,
-			"Couldn't initialise the DSI connector\n");
-		goto err_cleanup_connector;
+	if (dsi->panel) {
+		drm_connector_helper_add(&dsi->connector,
+					 &sun6i_dsi_connector_helper_funcs);
+		ret = drm_connector_init(drm, &dsi->connector,
+					 &sun6i_dsi_connector_funcs,
+					 DRM_MODE_CONNECTOR_DSI);
+		if (ret) {
+			dev_err(dsi->dev,
+				"Couldn't initialise the DSI connector\n");
+			goto err_cleanup_connector;
+		}
+
+		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
+		drm_panel_attach(dsi->panel, &dsi->connector);
 	}
 
-	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
-	drm_panel_attach(dsi->panel, &dsi->connector);
+	if (dsi->bridge) {
+		ret = drm_bridge_attach(&dsi->encoder, dsi->bridge, NULL);
+		if (ret) {
+			dev_err(dsi->dev, "Couldn't attach the DSI bridge\n");
+			goto err_cleanup_connector;
+		}
+	}
 
 	return 0;
 
@@ -1104,7 +1129,10 @@ static void sun6i_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 
-	drm_panel_detach(dsi->panel);
+	if (dsi->panel)
+		drm_panel_detach(dsi->panel);
+	else if (dsi->bridge->funcs->detach)
+		dsi->bridge->funcs->detach(dsi->bridge);
 }
 
 static const struct component_ops sun6i_dsi_ops = {
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index c570f2b3868f..c76b71259d2e 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -32,6 +32,7 @@ struct sun6i_dsi {
 	struct sun4i_tcon	*tcon;
 	struct mipi_dsi_device	*device;
 	struct drm_panel	*panel;
+	struct drm_bridge	*bridge;
 };
 
 static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
-- 
2.18.0.321.gffc6fa0e3
