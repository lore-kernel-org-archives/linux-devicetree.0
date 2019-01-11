From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v4 4/5] drm/bridge: lvds-encoder: add dev helper variable in
 .probe()
Date: Fri, 11 Jan 2019 15:19:10 +0000
Message-ID: <20190111151843.11114-5-peda@axentia.se>
References: <20190111151843.11114-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111151843.11114-1-peda@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Make the code easier to read and modify.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/bridge/lvds-encoder.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge=
/lvds-encoder.c
index 75b0d3f6e4de..f6770e83d49d 100644
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -34,48 +34,47 @@ static struct drm_bridge_funcs funcs =3D {
=20
 static int lvds_encoder_probe(struct platform_device *pdev)
 {
+	struct device *dev =3D &pdev->dev;
 	struct device_node *port;
 	struct device_node *endpoint;
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_encoder *lvds_encoder;
=20
-	lvds_encoder =3D devm_kzalloc(&pdev->dev, sizeof(*lvds_encoder),
-				    GFP_KERNEL);
+	lvds_encoder =3D devm_kzalloc(dev, sizeof(*lvds_encoder), GFP_KERNEL);
 	if (!lvds_encoder)
 		return -ENOMEM;
=20
 	/* Locate the panel DT node. */
-	port =3D of_graph_get_port_by_id(pdev->dev.of_node, 1);
+	port =3D of_graph_get_port_by_id(dev->of_node, 1);
 	if (!port) {
-		dev_dbg(&pdev->dev, "port 1 not found\n");
+		dev_dbg(dev, "port 1 not found\n");
 		return -ENXIO;
 	}
=20
 	endpoint =3D of_get_child_by_name(port, "endpoint");
 	of_node_put(port);
 	if (!endpoint) {
-		dev_dbg(&pdev->dev, "no endpoint for port 1\n");
+		dev_dbg(dev, "no endpoint for port 1\n");
 		return -ENXIO;
 	}
=20
 	panel_node =3D of_graph_get_remote_port_parent(endpoint);
 	of_node_put(endpoint);
 	if (!panel_node) {
-		dev_dbg(&pdev->dev, "no remote endpoint for port 1\n");
+		dev_dbg(dev, "no remote endpoint for port 1\n");
 		return -ENXIO;
 	}
=20
 	panel =3D of_drm_find_panel(panel_node);
 	of_node_put(panel_node);
 	if (!panel) {
-		dev_dbg(&pdev->dev, "panel not found, deferring probe\n");
+		dev_dbg(dev, "panel not found, deferring probe\n");
 		return -EPROBE_DEFER;
 	}
=20
 	lvds_encoder->panel_bridge =3D
-		devm_drm_panel_bridge_add(&pdev->dev,
-					  panel, DRM_MODE_CONNECTOR_LVDS);
+		devm_drm_panel_bridge_add(dev, panel, DRM_MODE_CONNECTOR_LVDS);
 	if (IS_ERR(lvds_encoder->panel_bridge))
 		return PTR_ERR(lvds_encoder->panel_bridge);
=20
@@ -83,7 +82,7 @@ static int lvds_encoder_probe(struct platform_device *pde=
v)
 	 * but we need a bridge attached to our of_node for our user
 	 * to look up.
 	 */
-	lvds_encoder->bridge.of_node =3D pdev->dev.of_node;
+	lvds_encoder->bridge.of_node =3D dev->of_node;
 	lvds_encoder->bridge.funcs =3D &funcs;
 	drm_bridge_add(&lvds_encoder->bridge);
=20
--=20
2.11.0
