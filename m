From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH 1/5] drm/imx-ldb: Add support to drm-bridge
Date: Mon, 30 May 2016 18:39:41 +0200
Message-ID: <1464626385-19253-2-git-send-email-peter.senna@collabora.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: airlied@linux.ie, akpm@linux-foundation.org, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, p.zabel@pengutronix.de, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org, tiwai@suse.com, treding@nvidia.com, ykk@rock-chips.com
List-Id: devicetree@vger.kernel.org

Add support to attach a drm_bridge to imx-ldb in addition to
existing support to attach a LVDS panel.

Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
---
 drivers/gpu/drm/imx/imx-ldb.c | 75 +++++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index a58eee5..7233a81 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -57,7 +57,11 @@ struct imx_ldb_channel {
 	struct imx_ldb *ldb;
 	struct drm_connector connector;
 	struct drm_encoder encoder;
+
+	/* Defines what is connected to the ldb, only one at a time */
 	struct drm_panel *panel;
+	struct drm_bridge *ext_bridge;
+
 	struct device_node *child;
 	int chno;
 	void *edid;
@@ -295,6 +299,10 @@ static void imx_ldb_encoder_mode_set(struct drm_encoder *encoder,
 	}
 }
 
+static void imx_ldb_encoder_enable(struct drm_encoder *encoder)
+{
+}
+
 static void imx_ldb_encoder_disable(struct drm_encoder *encoder)
 {
 	struct imx_ldb_channel *imx_ldb_ch = enc_to_imx_ldb_ch(encoder);
@@ -373,6 +381,7 @@ static const struct drm_encoder_helper_funcs imx_ldb_encoder_helper_funcs = {
 	.prepare = imx_ldb_encoder_prepare,
 	.commit = imx_ldb_encoder_commit,
 	.mode_set = imx_ldb_encoder_mode_set,
+	.enable = imx_ldb_encoder_enable,
 	.disable = imx_ldb_encoder_disable,
 };
 
@@ -417,16 +426,28 @@ static int imx_ldb_register(struct drm_device *drm,
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
 
-	drm_mode_connector_attach_encoder(&imx_ldb_ch->connector,
-			&imx_ldb_ch->encoder);
+		drm_mode_connector_attach_encoder(&imx_ldb_ch->connector,
+				&imx_ldb_ch->encoder);
+	}
+
+	if (imx_ldb_ch->ext_bridge) {
+		imx_ldb_ch->ext_bridge->encoder = &imx_ldb_ch->encoder;
+
+		imx_ldb_ch->encoder.bridge = imx_ldb_ch->ext_bridge;
+		ret = drm_bridge_attach(drm, imx_ldb_ch->ext_bridge);
+		if (ret) {
+			DRM_ERROR("Failed to initialize bridge with drm\n");
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -583,23 +604,35 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 			endpoint = of_get_child_by_name(port, "endpoint");
 			if (endpoint) {
 				remote = of_graph_get_remote_port_parent(endpoint);
-				if (remote)
-					channel->panel = of_drm_find_panel(remote);
-				else
-					return -EPROBE_DEFER;
-				if (!channel->panel) {
-					dev_err(dev, "panel not found: %s\n",
-						remote->full_name);
-					return -EPROBE_DEFER;
+				if (remote) {
+					/* Only one of these two will succeed */
+					channel->panel =
+						of_drm_find_panel(remote);
+
+					channel->ext_bridge =
+						of_drm_find_bridge(remote);
+
+					/*
+					 * If the bridge is compiled as a
+					 * module, it may take some time until
+					 * the bridge driver is available.
+					 * Defer until the bridge driver is
+					 * ready.
+					 */
+					if (!channel->panel &&
+							!channel->ext_bridge)
+						return -EPROBE_DEFER;
 				}
 			}
 		}
 
-		edidp = of_get_property(child, "edid", &channel->edid_len);
-		if (edidp) {
-			channel->edid = kmemdup(edidp, channel->edid_len,
-						GFP_KERNEL);
-		} else if (!channel->panel) {
+		if (channel->panel) {
+			edidp = of_get_property(child, "edid",
+					&channel->edid_len);
+			if (edidp)
+				channel->edid = kmemdup(edidp,
+						channel->edid_len, GFP_KERNEL);
+		} else {
 			ret = of_get_drm_display_mode(child, &channel->mode, 0);
 			if (!ret)
 				channel->mode_valid = 1;
-- 
2.5.5
