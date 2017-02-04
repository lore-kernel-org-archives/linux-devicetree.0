From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/5] drm: of: introduce drm_of_find_panel_or_bridge
Date: Fri,  3 Feb 2017 21:36:32 -0600
Message-ID: <20170204033635.10250-3-robh@kernel.org>
References: <20170204033635.10250-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170204033635.10250-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puc>
List-Id: devicetree@vger.kernel.org

Many drivers have a common pattern of searching the OF graph for either an
attached panel or bridge and then finding the DRM struct for the panel
or bridge. Also, most drivers need to handle deferred probing when the
DRM device is not yet instantiated. Create a common function,
drm_of_find_panel_or_bridge, to find the connected node and the
associated DRM panel or bridge device.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/drm_of.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_of.h     | 13 +++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 47848ed8ca48..b29ce2f52113 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -3,7 +3,9 @@
 #include <linux/list.h>
 #include <linux/of_graph.h>
 #include <drm/drmP.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_of.h>
 
 static void drm_release_of(struct device *dev, void *data)
@@ -207,3 +209,51 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
+
+/*
+ * drm_of_find_panel_or_bridge - return connected panel or bridge device
+ * @np: device tree node containing encoder input ports
+ * @panel: pointer to hold returned drm_panel
+ * @bridge: pointer to hold returned drm_bridge
+ *
+ * Given a DT node's port and endpoint number, find the connected node and
+ * return either the associated struct drm_panel or drm_bridge device.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_find_panel_or_bridge(const struct device_node *np,
+				int port, int endpoint,
+				struct drm_panel **panel,
+				struct drm_bridge **bridge)
+{
+	int ret = -ENODEV;
+	struct device_node *remote;
+
+	remote = of_graph_get_remote_node(np, port, endpoint);
+	if (!remote)
+		return -ENODEV;
+
+	if (bridge)
+		*bridge = NULL;
+
+	if (panel) {
+		*panel = of_drm_find_panel(remote);
+		if (*panel) {
+			ret = 0;
+			goto out_put;
+		}
+		ret = -EPROBE_DEFER;
+	}
+
+	if (bridge) {
+		*bridge = of_drm_find_bridge(remote);
+		if (*bridge)
+			ret = 0;
+		else
+			ret = -EPROBE_DEFER;
+	}
+out_put:
+	of_node_put(remote);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 26a64805cc15..f86507f0599b 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -8,6 +8,8 @@ struct component_match;
 struct device;
 struct drm_device;
 struct drm_encoder;
+struct drm_panel;
+struct drm_bridge;
 struct device_node;
 
 #ifdef CONFIG_OF
@@ -23,6 +25,10 @@ extern int drm_of_component_probe(struct device *dev,
 extern int drm_of_encoder_active_endpoint(struct device_node *node,
 					  struct drm_encoder *encoder,
 					  struct of_endpoint *endpoint);
+extern int drm_of_find_panel_or_bridge(const struct device_node *np,
+				       int port, int endpoint,
+				       struct drm_panel **panel,
+				       struct drm_bridge **bridge);
 #else
 static inline uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 						  struct device_node *port)
@@ -52,6 +58,13 @@ static inline int drm_of_encoder_active_endpoint(struct device_node *node,
 {
 	return -EINVAL;
 }
+static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
+					      int port, int endpoint,
+					      struct drm_panel **panel,
+					      struct drm_bridge **bridge)
+{
+	return -EINVAL;
+}
 #endif
 
 static inline int drm_of_encoder_active_endpoint_id(struct device_node *node,
-- 
2.10.1
