From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2 1/2] drm: Add drm_bridge
Date: Wed, 14 Aug 2013 16:47:37 -0400
Message-ID: <1376513258-25703-2-git-send-email-seanpaul@chromium.org>
References: <1376513258-25703-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1376513258-25703-1-git-send-email-seanpaul@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie, marcheu@chromium.org
Cc: Sean Paul <seanpaul@chromium.org>
List-Id: devicetree@vger.kernel.org

This patch adds the notion of a drm_bridge. A bridge is a chained
device which hangs off an encoder. The drm driver using the bridge
should provide the association between encoder and bridge. Once a
bridge is associated with an encoder, it will participate in mode
set, and dpms (via the enable/disable hooks).

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_crtc.c        | 50 ++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_helper.c | 89 ++++++++++++++++++++++++++++++---------
 include/drm/drm_crtc.h            | 55 ++++++++++++++++++++++++
 3 files changed, 175 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index fc83bb9..0311e2b 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -781,6 +781,41 @@ void drm_connector_unplug_all(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_connector_unplug_all);
 
+int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
+		const struct drm_bridge_funcs *funcs)
+{
+	int ret;
+
+	drm_modeset_lock_all(dev);
+
+	ret = drm_mode_object_get(dev, &bridge->base, DRM_MODE_OBJECT_BRIDGE);
+	if (ret)
+		goto out;
+
+	bridge->dev = dev;
+	bridge->funcs = funcs;
+
+	list_add_tail(&bridge->head, &dev->mode_config.bridge_list);
+	dev->mode_config.num_bridge++;
+
+ out:
+	drm_modeset_unlock_all(dev);
+	return ret;
+}
+EXPORT_SYMBOL(drm_bridge_init);
+
+void drm_bridge_cleanup(struct drm_bridge *bridge)
+{
+	struct drm_device *dev = bridge->dev;
+
+	drm_modeset_lock_all(dev);
+	drm_mode_object_put(dev, &bridge->base);
+	list_del(&bridge->head);
+	dev->mode_config.num_bridge--;
+	drm_modeset_unlock_all(dev);
+}
+EXPORT_SYMBOL(drm_bridge_cleanup);
+
 int drm_encoder_init(struct drm_device *dev,
 		      struct drm_encoder *encoder,
 		      const struct drm_encoder_funcs *funcs,
@@ -1190,6 +1225,7 @@ static int drm_mode_group_init(struct drm_device *dev, struct drm_mode_group *gr
 	total_objects += dev->mode_config.num_crtc;
 	total_objects += dev->mode_config.num_connector;
 	total_objects += dev->mode_config.num_encoder;
+	total_objects += dev->mode_config.num_bridge;
 
 	group->id_list = kzalloc(total_objects * sizeof(uint32_t), GFP_KERNEL);
 	if (!group->id_list)
@@ -1198,6 +1234,7 @@ static int drm_mode_group_init(struct drm_device *dev, struct drm_mode_group *gr
 	group->num_crtcs = 0;
 	group->num_connectors = 0;
 	group->num_encoders = 0;
+	group->num_bridges = 0;
 	return 0;
 }
 
@@ -1207,6 +1244,7 @@ int drm_mode_group_init_legacy_group(struct drm_device *dev,
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
+	struct drm_bridge *bridge;
 	int ret;
 
 	if ((ret = drm_mode_group_init(dev, group)))
@@ -1223,6 +1261,11 @@ int drm_mode_group_init_legacy_group(struct drm_device *dev,
 		group->id_list[group->num_crtcs + group->num_encoders +
 			       group->num_connectors++] = connector->base.id;
 
+	list_for_each_entry(bridge, &dev->mode_config.bridge_list, head)
+		group->id_list[group->num_crtcs + group->num_encoders +
+			       group->num_connectors + group->num_bridges++] =
+					bridge->base.id;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_mode_group_init_legacy_group);
@@ -3905,6 +3948,7 @@ void drm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.fb_list);
 	INIT_LIST_HEAD(&dev->mode_config.crtc_list);
 	INIT_LIST_HEAD(&dev->mode_config.connector_list);
+	INIT_LIST_HEAD(&dev->mode_config.bridge_list);
 	INIT_LIST_HEAD(&dev->mode_config.encoder_list);
 	INIT_LIST_HEAD(&dev->mode_config.property_list);
 	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
@@ -3941,6 +3985,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 	struct drm_connector *connector, *ot;
 	struct drm_crtc *crtc, *ct;
 	struct drm_encoder *encoder, *enct;
+	struct drm_bridge *bridge, *brt;
 	struct drm_framebuffer *fb, *fbt;
 	struct drm_property *property, *pt;
 	struct drm_property_blob *blob, *bt;
@@ -3951,6 +3996,11 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 		encoder->funcs->destroy(encoder);
 	}
 
+	list_for_each_entry_safe(bridge, brt,
+				 &dev->mode_config.bridge_list, head) {
+		bridge->funcs->destroy(bridge);
+	}
+
 	list_for_each_entry_safe(connector, ot,
 				 &dev->mode_config.connector_list, head) {
 		connector->funcs->destroy(connector);
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 6a64749..c722c3b 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -257,10 +257,16 @@ drm_encoder_disable(struct drm_encoder *encoder)
 {
 	struct drm_encoder_helper_funcs *encoder_funcs = encoder->helper_private;
 
+	if (encoder->bridge)
+		encoder->bridge->funcs->disable(encoder->bridge);
+
 	if (encoder_funcs->disable)
 		(*encoder_funcs->disable)(encoder);
 	else
 		(*encoder_funcs->dpms)(encoder, DRM_MODE_DPMS_OFF);
+
+	if (encoder->bridge)
+		encoder->bridge->funcs->post_disable(encoder->bridge);
 }
 
 /**
@@ -424,6 +430,16 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 
 		if (encoder->crtc != crtc)
 			continue;
+
+		if (encoder->bridge && encoder->bridge->funcs->mode_fixup) {
+			ret = encoder->bridge->funcs->mode_fixup(
+					encoder->bridge, mode, adjusted_mode);
+			if (!ret) {
+				DRM_DEBUG_KMS("Bridge fixup failed\n");
+				goto done;
+			}
+		}
+
 		encoder_funcs = encoder->helper_private;
 		if (!(ret = encoder_funcs->mode_fixup(encoder, mode,
 						      adjusted_mode))) {
@@ -443,9 +459,16 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 
 		if (encoder->crtc != crtc)
 			continue;
+
+		if (encoder->bridge)
+			encoder->bridge->funcs->disable(encoder->bridge);
+
 		encoder_funcs = encoder->helper_private;
 		/* Disable the encoders as the first thing we do. */
 		encoder_funcs->prepare(encoder);
+
+		if (encoder->bridge)
+			encoder->bridge->funcs->post_disable(encoder->bridge);
 	}
 
 	drm_crtc_prepare_encoders(dev);
@@ -469,6 +492,10 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 			mode->base.id, mode->name);
 		encoder_funcs = encoder->helper_private;
 		encoder_funcs->mode_set(encoder, mode, adjusted_mode);
+
+		if (encoder->bridge && encoder->bridge->funcs->mode_set)
+			encoder->bridge->funcs->mode_set(encoder->bridge, mode,
+					adjusted_mode);
 	}
 
 	/* Now enable the clocks, plane, pipe, and connectors that we set up. */
@@ -479,9 +506,14 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 		if (encoder->crtc != crtc)
 			continue;
 
+		if (encoder->bridge)
+			encoder->bridge->funcs->pre_enable(encoder->bridge);
+
 		encoder_funcs = encoder->helper_private;
 		encoder_funcs->commit(encoder);
 
+		if (encoder->bridge)
+			encoder->bridge->funcs->enable(encoder->bridge);
 	}
 
 	/* Store real post-adjustment hardware mode. */
@@ -830,6 +862,31 @@ static int drm_helper_choose_encoder_dpms(struct drm_encoder *encoder)
 	return dpms;
 }
 
+/* Helper which handles bridge ordering around encoder dpms */
+static void drm_helper_encoder_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_bridge *bridge = encoder->bridge;
+	struct drm_encoder_helper_funcs *encoder_funcs;
+
+	if (bridge) {
+		if (mode == DRM_MODE_DPMS_ON)
+			bridge->funcs->pre_enable(bridge);
+		else
+			bridge->funcs->disable(bridge);
+	}
+
+	encoder_funcs = encoder->helper_private;
+	if (encoder_funcs->dpms)
+		encoder_funcs->dpms(encoder, mode);
+
+	if (bridge) {
+		if (mode == DRM_MODE_DPMS_ON)
+			bridge->funcs->enable(bridge);
+		else
+			bridge->funcs->post_disable(bridge);
+	}
+}
+
 static int drm_helper_choose_crtc_dpms(struct drm_crtc *crtc)
 {
 	int dpms = DRM_MODE_DPMS_OFF;
@@ -857,7 +914,7 @@ void drm_helper_connector_dpms(struct drm_connector *connector, int mode)
 {
 	struct drm_encoder *encoder = connector->encoder;
 	struct drm_crtc *crtc = encoder ? encoder->crtc : NULL;
-	int old_dpms;
+	int old_dpms, encoder_dpms = DRM_MODE_DPMS_OFF;
 
 	if (mode == connector->dpms)
 		return;
@@ -865,6 +922,9 @@ void drm_helper_connector_dpms(struct drm_connector *connector, int mode)
 	old_dpms = connector->dpms;
 	connector->dpms = mode;
 
+	if (encoder)
+		encoder_dpms = drm_helper_choose_encoder_dpms(encoder);
+
 	/* from off to on, do crtc then encoder */
 	if (mode < old_dpms) {
 		if (crtc) {
@@ -873,22 +933,14 @@ void drm_helper_connector_dpms(struct drm_connector *connector, int mode)
 				(*crtc_funcs->dpms) (crtc,
 						     drm_helper_choose_crtc_dpms(crtc));
 		}
-		if (encoder) {
-			struct drm_encoder_helper_funcs *encoder_funcs = encoder->helper_private;
-			if (encoder_funcs->dpms)
-				(*encoder_funcs->dpms) (encoder,
-							drm_helper_choose_encoder_dpms(encoder));
-		}
+		if (encoder)
+			drm_helper_encoder_dpms(encoder, encoder_dpms);
 	}
 
 	/* from on to off, do encoder then crtc */
 	if (mode > old_dpms) {
-		if (encoder) {
-			struct drm_encoder_helper_funcs *encoder_funcs = encoder->helper_private;
-			if (encoder_funcs->dpms)
-				(*encoder_funcs->dpms) (encoder,
-							drm_helper_choose_encoder_dpms(encoder));
-		}
+		if (encoder)
+			drm_helper_encoder_dpms(encoder, encoder_dpms);
 		if (crtc) {
 			struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
 			if (crtc_funcs->dpms)
@@ -924,9 +976,8 @@ int drm_helper_resume_force_mode(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
-	struct drm_encoder_helper_funcs *encoder_funcs;
 	struct drm_crtc_helper_funcs *crtc_funcs;
-	int ret;
+	int ret, encoder_dpms;
 
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 
@@ -946,10 +997,10 @@ int drm_helper_resume_force_mode(struct drm_device *dev)
 				if(encoder->crtc != crtc)
 					continue;
 
-				encoder_funcs = encoder->helper_private;
-				if (encoder_funcs->dpms)
-					(*encoder_funcs->dpms) (encoder,
-								drm_helper_choose_encoder_dpms(encoder));
+				encoder_dpms = drm_helper_choose_encoder_dpms(
+							encoder);
+
+				drm_helper_encoder_dpms(encoder, encoder_dpms);
 			}
 
 			crtc_funcs = crtc->helper_private;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index fa12a2f..a26d3d9 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -49,6 +49,7 @@ struct drm_clip_rect;
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_BRIDGE 0xbdbdbdbd
 
 struct drm_mode_object {
 	uint32_t id;
@@ -305,6 +306,7 @@ struct drm_connector;
 struct drm_encoder;
 struct drm_pending_vblank_event;
 struct drm_plane;
+struct drm_bridge;
 
 /**
  * drm_crtc_funcs - control CRTCs for a given device
@@ -507,6 +509,7 @@ struct drm_encoder_funcs {
  * @possible_crtcs: bitmask of potential CRTC bindings
  * @possible_clones: bitmask of potential sibling encoders for cloning
  * @crtc: currently bound CRTC
+ * @bridge: bridge associated to the encoder
  * @funcs: control functions
  * @helper_private: mid-layer private data
  *
@@ -523,6 +526,7 @@ struct drm_encoder {
 	uint32_t possible_clones;
 
 	struct drm_crtc *crtc;
+	struct drm_bridge *bridge;
 	const struct drm_encoder_funcs *funcs;
 	void *helper_private;
 };
@@ -683,6 +687,48 @@ struct drm_plane {
 };
 
 /**
+ * drm_bridge_funcs - drm_bridge control functions
+ * @mode_fixup: Try to fixup (or reject entirely) proposed mode for this bridge
+ * @disable: Called right before encoder prepare, disables the bridge
+ * @post_disable: Called right after encoder prepare, for lockstepped disable
+ * @mode_set: Set this mode to the bridge
+ * @pre_enable: Called right before encoder commit, for lockstepped commit
+ * @enable: Called right after encoder commit, enables the bridge
+ * @destroy: make object go away
+ */
+struct drm_bridge_funcs {
+	bool (*mode_fixup)(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+	void (*disable)(struct drm_bridge *bridge);
+	void (*post_disable)(struct drm_bridge *bridge);
+	void (*mode_set)(struct drm_bridge *bridge,
+			 struct drm_display_mode *mode,
+			 struct drm_display_mode *adjusted_mode);
+	void (*pre_enable)(struct drm_bridge *bridge);
+	void (*enable)(struct drm_bridge *bridge);
+	void (*destroy)(struct drm_bridge *bridge);
+};
+
+/**
+ * drm_bridge - central DRM bridge control structure
+ * @dev: DRM device this bridge belongs to
+ * @head: list management
+ * @base: base mode object
+ * @funcs: control functions
+ * @driver_private: pointer to the bridge driver's internal context
+ */
+struct drm_bridge {
+	struct drm_device *dev;
+	struct list_head head;
+
+	struct drm_mode_object base;
+
+	const struct drm_bridge_funcs *funcs;
+	void *driver_private;
+};
+
+/**
  * drm_mode_set - new values for a CRTC config change
  * @head: list management
  * @fb: framebuffer to use for new config
@@ -742,6 +788,7 @@ struct drm_mode_group {
 	uint32_t num_crtcs;
 	uint32_t num_encoders;
 	uint32_t num_connectors;
+	uint32_t num_bridges;
 
 	/* list of object IDs for this group */
 	uint32_t *id_list;
@@ -756,6 +803,8 @@ struct drm_mode_group {
  * @fb_list: list of framebuffers available
  * @num_connector: number of connectors on this device
  * @connector_list: list of connector objects
+ * @num_bridge: number of bridges on this device
+ * @bridge_list: list of bridge objects
  * @num_encoder: number of encoders on this device
  * @encoder_list: list of encoder objects
  * @num_crtc: number of CRTCs on this device
@@ -793,6 +842,8 @@ struct drm_mode_config {
 
 	int num_connector;
 	struct list_head connector_list;
+	int num_bridge;
+	struct list_head bridge_list;
 	int num_encoder;
 	struct list_head encoder_list;
 	int num_plane;
@@ -878,6 +929,10 @@ extern void drm_connector_cleanup(struct drm_connector *connector);
 /* helper to unplug all connectors from sysfs for device */
 extern void drm_connector_unplug_all(struct drm_device *dev);
 
+extern int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
+			   const struct drm_bridge_funcs *funcs);
+extern void drm_bridge_cleanup(struct drm_bridge *bridge);
+
 extern int drm_encoder_init(struct drm_device *dev,
 			    struct drm_encoder *encoder,
 			    const struct drm_encoder_funcs *funcs,
-- 
1.8.3

