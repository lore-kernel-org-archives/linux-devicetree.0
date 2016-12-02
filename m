From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RESEND PATCH v2 3/7] drm: Add TV connector states to drm_connector_state
Date: Fri,  2 Dec 2016 14:48:09 +0100
Message-ID: <1480686493-4813-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1480686493-4813-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480686493-4813-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some generic TV connector properties are exposed in drm_mode_config, but
they are currently handled independently in each DRM encoder driver.

Extend the drm_connector_state to store TV related states, and modify the
drm_atomic_connector_{set,get}_property() helpers to fill the connector
state accordingly.

Each driver is then responsible for checking and applying the new config
in its ->atomic_mode_{check,set}() operations.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
Changes in v2
- fix copy/paste errors
- use an enum for the subconnector field
- switch all fields to unsigned int
---
 drivers/gpu/drm/drm_atomic.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h  | 32 ++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e6862a744210..f93395c3c181 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -989,12 +989,38 @@ int drm_atomic_connector_set_property(struct drm_connector *connector,
 		 * now?) atomic writes to DPMS property:
 		 */
 		return -EINVAL;
+	} else if (property == config->tv_select_subconnector_property) {
+		state->tv.subconnector = val;
+	} else if (property == config->tv_left_margin_property) {
+		state->tv.margins.left = val;
+	} else if (property == config->tv_right_margin_property) {
+		state->tv.margins.right = val;
+	} else if (property == config->tv_top_margin_property) {
+		state->tv.margins.top = val;
+	} else if (property == config->tv_bottom_margin_property) {
+		state->tv.margins.bottom = val;
+	} else if (property == config->tv_mode_property) {
+		state->tv.mode = val;
+	} else if (property == config->tv_brightness_property) {
+		state->tv.brightness = val;
+	} else if (property == config->tv_contrast_property) {
+		state->tv.contrast = val;
+	} else if (property == config->tv_flicker_reduction_property) {
+		state->tv.flicker_reduction = val;
+	} else if (property == config->tv_overscan_property) {
+		state->tv.overscan = val;
+	} else if (property == config->tv_saturation_property) {
+		state->tv.saturation = val;
+	} else if (property == config->tv_hue_property) {
+		state->tv.hue = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
 	} else {
 		return -EINVAL;
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_connector_set_property);
 
@@ -1025,6 +1051,30 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = (state->crtc) ? state->crtc->base.id : 0;
 	} else if (property == config->dpms_property) {
 		*val = connector->dpms;
+	} else if (property == config->tv_select_subconnector_property) {
+		*val = state->tv.subconnector;
+	} else if (property == config->tv_left_margin_property) {
+		*val = state->tv.margins.left;
+	} else if (property == config->tv_right_margin_property) {
+		*val = state->tv.margins.right;
+	} else if (property == config->tv_top_margin_property) {
+		*val = state->tv.margins.top;
+	} else if (property == config->tv_bottom_margin_property) {
+		*val = state->tv.margins.bottom;
+	} else if (property == config->tv_mode_property) {
+		*val = state->tv.mode;
+	} else if (property == config->tv_brightness_property) {
+		*val = state->tv.brightness;
+	} else if (property == config->tv_contrast_property) {
+		*val = state->tv.contrast;
+	} else if (property == config->tv_flicker_reduction_property) {
+		*val = state->tv.flicker_reduction;
+	} else if (property == config->tv_overscan_property) {
+		*val = state->tv.overscan;
+	} else if (property == config->tv_saturation_property) {
+		*val = state->tv.saturation;
+	} else if (property == config->tv_hue_property) {
+		*val = state->tv.hue;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index ac9d7d8e0e43..2645e8038572 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -194,10 +194,40 @@ int drm_display_info_set_bus_formats(struct drm_display_info *info,
 				     unsigned int num_formats);
 
 /**
+ * struct drm_tv_connector_state - TV connector related states
+ * @subconnector: selected subconnector
+ * @margins: left/right/top/bottom margins
+ * @mode: TV mode
+ * @brightness: brightness in percent
+ * @contrast: contrast in percent
+ * @flicker_reduction: flicker reduction in percent
+ * @overscan: overscan in percent
+ * @saturation: saturation in percent
+ * @hue: hue in percent
+ */
+struct drm_tv_connector_state {
+	enum drm_mode_subconnector subconnector;
+	struct {
+		unsigned int left;
+		unsigned int right;
+		unsigned int top;
+		unsigned int bottom;
+	} margins;
+	unsigned int mode;
+	unsigned int brightness;
+	unsigned int contrast;
+	unsigned int flicker_reduction;
+	unsigned int overscan;
+	unsigned int saturation;
+	unsigned int hue;
+};
+
+/**
  * struct drm_connector_state - mutable connector state
  * @connector: backpointer to the connector
  * @best_encoder: can be used by helpers and drivers to select the encoder
  * @state: backpointer to global drm_atomic_state
+ * @tv: TV connector state
  */
 struct drm_connector_state {
 	struct drm_connector *connector;
@@ -213,6 +243,8 @@ struct drm_connector_state {
 	struct drm_encoder *best_encoder;
 
 	struct drm_atomic_state *state;
+
+	struct drm_tv_connector_state tv;
 };
 
 /**
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
