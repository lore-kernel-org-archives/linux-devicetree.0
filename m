From: Peter Rosin <peda@axentia.se>
Subject: [RFC PATCH 2/3] drm: bridge: panel: allow override of the bus format
Date: Sat, 17 Mar 2018 23:15:24 +0100
Message-ID: <20180317221525.18534-3-peda@axentia.se>
References: <20180317221525.18534-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180317221525.18534-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Useful if the bridge does some kind of conversion of the bus format.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/bridge/panel.c | 22 +++++++++++++++++++++-
 include/drm/drm_bridge.h       |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6d99d4a3beb3..ccef0283ff41 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -22,6 +22,7 @@ struct panel_bridge {
 	struct drm_connector connector;
 	struct drm_panel *panel;
 	u32 connector_type;
+	u32 bus_format;
 };
 
 static inline struct panel_bridge *
@@ -40,8 +41,15 @@ static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct panel_bridge *panel_bridge =
 		drm_connector_to_panel_bridge(connector);
+	int ret;
+
+	ret = drm_panel_get_modes(panel_bridge->panel);
+
+	if (panel_bridge->bus_format)
+		drm_display_info_set_bus_formats(&connector->display_info,
+						 &panel_bridge->bus_format, 1);
 
-	return drm_panel_get_modes(panel_bridge->panel);
+	return ret;
 }
 
 static const struct drm_connector_helper_funcs
@@ -203,6 +211,18 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 
+void drm_panel_bridge_set_bus_format(struct drm_bridge *bridge, u32 bus_format)
+{
+	struct panel_bridge *panel_bridge;
+
+	if (!bridge)
+		return;
+
+	panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	panel_bridge->bus_format = bus_format;
+}
+EXPORT_SYMBOL(drm_panel_bridge_set_bus_format);
+
 static void devm_drm_panel_bridge_release(struct device *dev, void *res)
 {
 	struct drm_bridge **bridge = res;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 682d01ba920c..81903b92f187 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -268,6 +268,7 @@ void drm_bridge_enable(struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel,
 					u32 connector_type);
 void drm_panel_bridge_remove(struct drm_bridge *bridge);
+void drm_panel_bridge_set_bus_format(struct drm_bridge *bridge, u32 bus_format);
 struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 					     struct drm_panel *panel,
 					     u32 connector_type);
-- 
2.11.0
