From: Peter Rosin <peda@lysator.liu.se>
Subject: [PATCH v2 3/3] drm/bridge: add pwdn-gpios support to the lvds-encoder
Date: Wed, 19 Dec 2018 14:04:49 +0100
Message-ID: <20181219130449.31641-4-peda@lysator.liu.se>
References: <20181219130449.31641-1-peda@lysator.liu.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219130449.31641-1-peda@lysator.liu.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Peter Rosin <peda@axentia.se>

Optionally power down the LVDS-encoder when it is not in use.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/bridge/lvds-encoder.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
index 75b0d3f6e4de..43d584a6a6b9 100644
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -11,11 +11,13 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 
+#include <linux/gpio/consumer.h>
 #include <linux/of_graph.h>
 
 struct lvds_encoder {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct gpio_desc *pwdn_gpio;
 };
 
 static int lvds_encoder_attach(struct drm_bridge *bridge)
@@ -28,8 +30,30 @@ static int lvds_encoder_attach(struct drm_bridge *bridge)
 				 bridge);
 }
 
+static void lvds_encoder_enable(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds_encoder = container_of(bridge,
+							 struct lvds_encoder,
+							 bridge);
+
+	if (lvds_encoder->pwdn_gpio)
+		gpiod_set_value_cansleep(lvds_encoder->pwdn_gpio, 0);
+}
+
+static void lvds_encoder_disable(struct drm_bridge *bridge)
+{
+	struct lvds_encoder *lvds_encoder = container_of(bridge,
+							 struct lvds_encoder,
+							 bridge);
+
+	if (lvds_encoder->pwdn_gpio)
+		gpiod_set_value_cansleep(lvds_encoder->pwdn_gpio, 1);
+}
+
 static struct drm_bridge_funcs funcs = {
 	.attach = lvds_encoder_attach,
+	.enable = lvds_encoder_enable,
+	.disable = lvds_encoder_disable,
 };
 
 static int lvds_encoder_probe(struct platform_device *pdev)
@@ -45,6 +69,16 @@ static int lvds_encoder_probe(struct platform_device *pdev)
 	if (!lvds_encoder)
 		return -ENOMEM;
 
+	lvds_encoder->pwdn_gpio = devm_gpiod_get_optional(&pdev->dev, "pwdn",
+							  GPIOD_OUT_HIGH);
+	if (IS_ERR(lvds_encoder->pwdn_gpio)) {
+		int err = PTR_ERR(lvds_encoder->pwdn_gpio);
+
+		if (err != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "pwdn GPIO failure: %d\n", err);
+		return err;
+	}
+
 	/* Locate the panel DT node. */
 	port = of_graph_get_port_by_id(pdev->dev.of_node, 1);
 	if (!port) {
-- 
2.11.0
