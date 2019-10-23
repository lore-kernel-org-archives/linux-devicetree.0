Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C39CC47E49
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D8792084C
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406858AbfJWPp0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37766 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404032AbfJWPpZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:25 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B7A1728F91F;
        Wed, 23 Oct 2019 16:45:22 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 06/21] drm: Stop accessing encoder->bridge directly
Date:   Wed, 23 Oct 2019 17:44:57 +0200
Message-Id: <20191023154512.9762-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We are about to replace the single-linked bridge list by a double-linked
one based on list.h, leading to the suppression of the encoder->bridge
field. But before we can do that we must provide a
drm_bridge_chain_get_first_bridge() bridge helper and patch all drivers
and core helpers to use it instead of directly accessing encoder->bridge.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c    | 25 +++++++++++++++++--------
 drivers/gpu/drm/drm_encoder.c          |  3 ++-
 drivers/gpu/drm/drm_probe_helper.c     |  4 +++-
 drivers/gpu/drm/msm/edp/edp_bridge.c   | 10 ++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 ++++++++---
 include/drm/drm_bridge.h               | 15 +++++++++++++++
 6 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index cf678be58fa4..f02ddffd4960 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -419,6 +419,7 @@ mode_fixup(struct drm_atomic_state *state)
 	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
 
 		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
 
@@ -435,7 +436,8 @@ mode_fixup(struct drm_atomic_state *state)
 		encoder = new_conn_state->best_encoder;
 		funcs = encoder->helper_private;
 
-		ret = drm_bridge_chain_mode_fixup(encoder->bridge,
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		ret = drm_bridge_chain_mode_fixup(bridge,
 					&new_crtc_state->mode,
 					&new_crtc_state->adjusted_mode);
 		if (!ret) {
@@ -493,6 +495,7 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
 					    struct drm_crtc *crtc,
 					    const struct drm_display_mode *mode)
 {
+	struct drm_bridge *bridge;
 	enum drm_mode_status ret;
 
 	ret = drm_encoder_mode_valid(encoder, mode);
@@ -502,7 +505,8 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
 		return ret;
 	}
 
-	ret = drm_bridge_chain_mode_valid(encoder->bridge, mode);
+	bridge = drm_bridge_chain_get_first_bridge(encoder);
+	ret = drm_bridge_chain_mode_valid(bridge, mode);
 	if (ret != MODE_OK) {
 		DRM_DEBUG_ATOMIC("[BRIDGE] mode_valid() failed\n");
 		return ret;
@@ -985,6 +989,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
 
 		/* Shut down everything that's in the changeset and currently
 		 * still on. So need to check the old, saved state. */
@@ -1021,7 +1026,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call disable hooks twice.
 		 */
-		drm_atomic_bridge_chain_disable(encoder->bridge, old_state);
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_disable(bridge, old_state);
 
 		/* Right function depends upon target state. */
 		if (funcs) {
@@ -1035,7 +1041,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
 		}
 
-		drm_atomic_bridge_chain_post_disable(encoder->bridge,
+		drm_atomic_bridge_chain_post_disable(bridge,
 						     old_state);
 	}
 
@@ -1190,6 +1196,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_display_mode *mode, *adjusted_mode;
+		struct drm_bridge *bridge;
 
 		if (!new_conn_state->best_encoder)
 			continue;
@@ -1217,8 +1224,8 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 			funcs->mode_set(encoder, mode, adjusted_mode);
 		}
 
-		drm_bridge_chain_mode_set(encoder->bridge, mode,
-					  adjusted_mode);
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_bridge_chain_mode_set(bridge, mode, adjusted_mode);
 	}
 }
 
@@ -1317,6 +1324,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
 
 		if (!new_conn_state->best_encoder)
 			continue;
@@ -1335,7 +1343,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call enable hooks twice.
 		 */
-		drm_atomic_bridge_chain_pre_enable(encoder->bridge, old_state);
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
 
 		if (funcs) {
 			if (funcs->atomic_enable)
@@ -1346,7 +1355,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 				funcs->commit(encoder);
 		}
 
-		drm_atomic_bridge_chain_enable(encoder->bridge, old_state);
+		drm_atomic_bridge_chain_enable(bridge, old_state);
 	}
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 80d88a55302e..4fe9e723e227 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -167,9 +167,10 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
 	 */
 
 	if (encoder->bridge) {
-		struct drm_bridge *bridge = encoder->bridge;
+		struct drm_bridge *bridge;
 		struct drm_bridge *next;
 
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
 		while (bridge) {
 			next = bridge->next;
 			drm_bridge_detach(bridge);
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index c3ea722065c4..576b4b7dcd89 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -101,6 +101,7 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
 
 	/* Step 2: Validate against encoders and crtcs */
 	drm_connector_for_each_possible_encoder(connector, encoder) {
+		struct drm_bridge *bridge;
 		struct drm_crtc *crtc;
 
 		ret = drm_encoder_mode_valid(encoder, mode);
@@ -112,7 +113,8 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
 			continue;
 		}
 
-		ret = drm_bridge_chain_mode_valid(encoder->bridge, mode);
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		ret = drm_bridge_chain_mode_valid(bridge, mode);
 		if (ret != MODE_OK) {
 			/* There is also no point in continuing for crtc check
 			 * here. */
diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp/edp_bridge.c
index 2950bba4aca9..b65b5cc2dba2 100644
--- a/drivers/gpu/drm/msm/edp/edp_bridge.c
+++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
@@ -55,8 +55,14 @@ static void edp_bridge_mode_set(struct drm_bridge *bridge,
 	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
 
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		if ((connector->encoder != NULL) &&
-			(connector->encoder->bridge == bridge)) {
+		struct drm_encoder *encoder = connector->encoder;
+		struct drm_bridge *first_bridge;
+
+		if (!connector->encoder)
+			continue;
+
+		first_bridge = drm_bridge_chain_get_first_bridge(encoder);
+		if (bridge == first_bridge) {
 			msm_edp_ctrl_timing_cfg(edp->ctrl,
 				adjusted_mode, &connector->display_info);
 			break;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 2da46e3dc4ae..7a1f1e5f0326 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -680,9 +681,10 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
 		const struct drm_display_mode *mode =
 			&crtc->state->adjusted_mode;
+		struct drm_bridge *bridge;
 
-		rcar_lvds_clk_enable(encoder->base.bridge,
-				     mode->clock * 1000);
+		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
+		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
 	}
 
 	rcar_du_crtc_start(rcrtc);
@@ -702,12 +704,15 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
 		struct rcar_du_encoder *encoder =
 			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
+		struct drm_bridge *bridge;
+
 
 		/*
 		 * Disable the LVDS clock output, see
 		 * rcar_du_crtc_atomic_enable().
 		 */
-		rcar_lvds_clk_disable(encoder->base.bridge);
+		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
+		rcar_lvds_clk_disable(bridge);
 	}
 
 	spin_lock_irq(&crtc->dev->event_lock);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8aeba83fcf31..27eef63ce0ff 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -25,6 +25,7 @@
 
 #include <linux/list.h>
 #include <linux/ctype.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
@@ -422,6 +423,20 @@ drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
 	return bridge->next;
 }
 
+/**
+ * drm_bridge_chain_get_first_bridge() - Get the first bridge in the chain
+ * @encoder: encoder object
+ *
+ * RETURNS:
+ * the first bridge in the chain, or NULL if @encoder has no bridge attached
+ * to it.
+ */
+static inline struct drm_bridge *
+drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
+{
+	return encoder->bridge;
+}
+
 bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
 				 struct drm_display_mode *adjusted_mode);
-- 
2.21.0

