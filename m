Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD4CCA9EB9
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD7F421A4C
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406905AbfJWPpX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37766 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404032AbfJWPpX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:23 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B794D28F90F;
        Wed, 23 Oct 2019 16:45:19 +0100 (BST)
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
Subject: [PATCH v3 04/21] drm/bridge: Rename bridge helpers targeting a bridge chain
Date:   Wed, 23 Oct 2019 17:44:55 +0200
Message-Id: <20191023154512.9762-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Change the prefix of bridge helpers targeting a bridge chain from
drm_bridge_ to drm_bridge_chain_ to better reflect the fact that
the operation will happen on all elements of chain, starting at the
bridge passed in argument.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* None

Changes in v2:
* Pass te bridge, not the encoder, so we can later act on a sub-chain
  instead of the whole chain
---
 drivers/gpu/drm/drm_atomic_helper.c |  19 +++--
 drivers/gpu/drm/drm_bridge.c        | 125 ++++++++++++++--------------
 drivers/gpu/drm/drm_probe_helper.c  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c |   4 +-
 include/drm/drm_bridge.h            |  64 +++++++-------
 5 files changed, 112 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 587052751b48..cf678be58fa4 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -435,8 +435,9 @@ mode_fixup(struct drm_atomic_state *state)
 		encoder = new_conn_state->best_encoder;
 		funcs = encoder->helper_private;
 
-		ret = drm_bridge_mode_fixup(encoder->bridge, &new_crtc_state->mode,
-				&new_crtc_state->adjusted_mode);
+		ret = drm_bridge_chain_mode_fixup(encoder->bridge,
+					&new_crtc_state->mode,
+					&new_crtc_state->adjusted_mode);
 		if (!ret) {
 			DRM_DEBUG_ATOMIC("Bridge fixup failed\n");
 			return -EINVAL;
@@ -501,7 +502,7 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
 		return ret;
 	}
 
-	ret = drm_bridge_mode_valid(encoder->bridge, mode);
+	ret = drm_bridge_chain_mode_valid(encoder->bridge, mode);
 	if (ret != MODE_OK) {
 		DRM_DEBUG_ATOMIC("[BRIDGE] mode_valid() failed\n");
 		return ret;
@@ -1020,7 +1021,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call disable hooks twice.
 		 */
-		drm_atomic_bridge_disable(encoder->bridge, old_state);
+		drm_atomic_bridge_chain_disable(encoder->bridge, old_state);
 
 		/* Right function depends upon target state. */
 		if (funcs) {
@@ -1034,7 +1035,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
 		}
 
-		drm_atomic_bridge_post_disable(encoder->bridge, old_state);
+		drm_atomic_bridge_chain_post_disable(encoder->bridge,
+						     old_state);
 	}
 
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -1215,7 +1217,8 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 			funcs->mode_set(encoder, mode, adjusted_mode);
 		}
 
-		drm_bridge_mode_set(encoder->bridge, mode, adjusted_mode);
+		drm_bridge_chain_mode_set(encoder->bridge, mode,
+					  adjusted_mode);
 	}
 }
 
@@ -1332,7 +1335,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call enable hooks twice.
 		 */
-		drm_atomic_bridge_pre_enable(encoder->bridge, old_state);
+		drm_atomic_bridge_chain_pre_enable(encoder->bridge, old_state);
 
 		if (funcs) {
 			if (funcs->atomic_enable)
@@ -1343,7 +1346,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 				funcs->commit(encoder);
 		}
 
-		drm_atomic_bridge_enable(encoder->bridge, old_state);
+		drm_atomic_bridge_chain_enable(encoder->bridge, old_state);
 	}
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cba537c99e43..54c874493c57 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -172,8 +172,8 @@ void drm_bridge_detach(struct drm_bridge *bridge)
  */
 
 /**
- * drm_bridge_mode_fixup - fixup proposed mode for all bridges in the
- *			   encoder chain
+ * drm_bridge_chain_mode_fixup - fixup proposed mode for all bridges in the
+ *				 encoder chain
  * @bridge: bridge control structure
  * @mode: desired mode to be set for the bridge
  * @adjusted_mode: updated mode that works for this bridge
@@ -186,9 +186,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
  * RETURNS:
  * true on success, false on failure
  */
-bool drm_bridge_mode_fixup(struct drm_bridge *bridge,
-			const struct drm_display_mode *mode,
-			struct drm_display_mode *adjusted_mode)
+bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 struct drm_display_mode *adjusted_mode)
 {
 	bool ret = true;
 
@@ -198,15 +198,16 @@ bool drm_bridge_mode_fixup(struct drm_bridge *bridge,
 	if (bridge->funcs->mode_fixup)
 		ret = bridge->funcs->mode_fixup(bridge, mode, adjusted_mode);
 
-	ret = ret && drm_bridge_mode_fixup(bridge->next, mode, adjusted_mode);
+	ret = ret && drm_bridge_chain_mode_fixup(bridge->next, mode,
+						 adjusted_mode);
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_bridge_mode_fixup);
+EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
 
 /**
- * drm_bridge_mode_valid - validate the mode against all bridges in the
- * 			   encoder chain.
+ * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
+ *				 encoder chain.
  * @bridge: bridge control structure
  * @mode: desired mode to be validated
  *
@@ -219,8 +220,9 @@ EXPORT_SYMBOL(drm_bridge_mode_fixup);
  * RETURNS:
  * MODE_OK on success, drm_mode_status Enum error code on failure
  */
-enum drm_mode_status drm_bridge_mode_valid(struct drm_bridge *bridge,
-					   const struct drm_display_mode *mode)
+enum drm_mode_status
+drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_mode *mode)
 {
 	enum drm_mode_status ret = MODE_OK;
 
@@ -233,12 +235,12 @@ enum drm_mode_status drm_bridge_mode_valid(struct drm_bridge *bridge,
 	if (ret != MODE_OK)
 		return ret;
 
-	return drm_bridge_mode_valid(bridge->next, mode);
+	return drm_bridge_chain_mode_valid(bridge->next, mode);
 }
-EXPORT_SYMBOL(drm_bridge_mode_valid);
+EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
 
 /**
- * drm_bridge_disable - disables all bridges in the encoder chain
+ * drm_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
  *
  * Calls &drm_bridge_funcs.disable op for all the bridges in the encoder
@@ -247,20 +249,21 @@ EXPORT_SYMBOL(drm_bridge_mode_valid);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_bridge_disable(struct drm_bridge *bridge)
+void drm_bridge_chain_disable(struct drm_bridge *bridge)
 {
 	if (!bridge)
 		return;
 
-	drm_bridge_disable(bridge->next);
+	drm_bridge_chain_disable(bridge->next);
 
 	if (bridge->funcs->disable)
 		bridge->funcs->disable(bridge);
 }
-EXPORT_SYMBOL(drm_bridge_disable);
+EXPORT_SYMBOL(drm_bridge_chain_disable);
 
 /**
- * drm_bridge_post_disable - cleans up after disabling all bridges in the encoder chain
+ * drm_bridge_chain_post_disable - cleans up after disabling all bridges in the
+ *				   encoder chain
  * @bridge: bridge control structure
  *
  * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
@@ -269,7 +272,7 @@ EXPORT_SYMBOL(drm_bridge_disable);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_bridge_post_disable(struct drm_bridge *bridge)
+void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
 {
 	if (!bridge)
 		return;
@@ -277,25 +280,25 @@ void drm_bridge_post_disable(struct drm_bridge *bridge)
 	if (bridge->funcs->post_disable)
 		bridge->funcs->post_disable(bridge);
 
-	drm_bridge_post_disable(bridge->next);
+	drm_bridge_chain_post_disable(bridge->next);
 }
-EXPORT_SYMBOL(drm_bridge_post_disable);
+EXPORT_SYMBOL(drm_bridge_chain_post_disable);
 
 /**
- * drm_bridge_mode_set - set proposed mode for all bridges in the
- *			 encoder chain
+ * drm_bridge_chain_mode_set - set proposed mode for all bridges in the
+ *			       encoder chain
  * @bridge: bridge control structure
- * @mode: desired mode to be set for the bridge
- * @adjusted_mode: updated mode that works for this bridge
+ * @mode: desired mode to be set for the encoder chain
+ * @adjusted_mode: updated mode that works for this encoder chain
  *
  * Calls &drm_bridge_funcs.mode_set op for all the bridges in the
  * encoder chain, starting from the first bridge to the last.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_bridge_mode_set(struct drm_bridge *bridge,
-			 const struct drm_display_mode *mode,
-			 const struct drm_display_mode *adjusted_mode)
+void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
+			       const struct drm_display_mode *mode,
+			       const struct drm_display_mode *adjusted_mode)
 {
 	if (!bridge)
 		return;
@@ -303,13 +306,13 @@ void drm_bridge_mode_set(struct drm_bridge *bridge,
 	if (bridge->funcs->mode_set)
 		bridge->funcs->mode_set(bridge, mode, adjusted_mode);
 
-	drm_bridge_mode_set(bridge->next, mode, adjusted_mode);
+	drm_bridge_chain_mode_set(bridge->next, mode, adjusted_mode);
 }
-EXPORT_SYMBOL(drm_bridge_mode_set);
+EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
 /**
- * drm_bridge_pre_enable - prepares for enabling all
- *			   bridges in the encoder chain
+ * drm_bridge_chain_pre_enable - prepares for enabling all bridges in the
+ *				 encoder chain
  * @bridge: bridge control structure
  *
  * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
@@ -318,20 +321,20 @@ EXPORT_SYMBOL(drm_bridge_mode_set);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_bridge_pre_enable(struct drm_bridge *bridge)
+void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
 {
 	if (!bridge)
 		return;
 
-	drm_bridge_pre_enable(bridge->next);
+	drm_bridge_chain_pre_enable(bridge->next);
 
 	if (bridge->funcs->pre_enable)
 		bridge->funcs->pre_enable(bridge);
 }
-EXPORT_SYMBOL(drm_bridge_pre_enable);
+EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
 
 /**
- * drm_bridge_enable - enables all bridges in the encoder chain
+ * drm_bridge_chain_enable - enables all bridges in the encoder chain
  * @bridge: bridge control structure
  *
  * Calls &drm_bridge_funcs.enable op for all the bridges in the encoder
@@ -340,7 +343,7 @@ EXPORT_SYMBOL(drm_bridge_pre_enable);
  *
  * Note that the bridge passed should be the one closest to the encoder
  */
-void drm_bridge_enable(struct drm_bridge *bridge)
+void drm_bridge_chain_enable(struct drm_bridge *bridge)
 {
 	if (!bridge)
 		return;
@@ -348,12 +351,12 @@ void drm_bridge_enable(struct drm_bridge *bridge)
 	if (bridge->funcs->enable)
 		bridge->funcs->enable(bridge);
 
-	drm_bridge_enable(bridge->next);
+	drm_bridge_chain_enable(bridge->next);
 }
-EXPORT_SYMBOL(drm_bridge_enable);
+EXPORT_SYMBOL(drm_bridge_chain_enable);
 
 /**
- * drm_atomic_bridge_disable - disables all bridges in the encoder chain
+ * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
  * @state: atomic state being committed
  *
@@ -364,24 +367,24 @@ EXPORT_SYMBOL(drm_bridge_enable);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_atomic_bridge_disable(struct drm_bridge *bridge,
-			       struct drm_atomic_state *state)
+void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
 {
 	if (!bridge)
 		return;
 
-	drm_atomic_bridge_disable(bridge->next, state);
+	drm_atomic_bridge_chain_disable(bridge->next, state);
 
 	if (bridge->funcs->atomic_disable)
 		bridge->funcs->atomic_disable(bridge, state);
 	else if (bridge->funcs->disable)
 		bridge->funcs->disable(bridge);
 }
-EXPORT_SYMBOL(drm_atomic_bridge_disable);
+EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
 /**
- * drm_atomic_bridge_post_disable - cleans up after disabling all bridges in the
- *				    encoder chain
+ * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
+ *					  in the encoder chain
  * @bridge: bridge control structure
  * @state: atomic state being committed
  *
@@ -392,8 +395,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_disable);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_atomic_bridge_post_disable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state)
+void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	if (!bridge)
 		return;
@@ -403,13 +406,13 @@ void drm_atomic_bridge_post_disable(struct drm_bridge *bridge,
 	else if (bridge->funcs->post_disable)
 		bridge->funcs->post_disable(bridge);
 
-	drm_atomic_bridge_post_disable(bridge->next, state);
+	drm_atomic_bridge_chain_post_disable(bridge->next, state);
 }
-EXPORT_SYMBOL(drm_atomic_bridge_post_disable);
+EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
 /**
- * drm_atomic_bridge_pre_enable - prepares for enabling all bridges in the
- *				  encoder chain
+ * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
+ *					the encoder chain
  * @bridge: bridge control structure
  * @state: atomic state being committed
  *
@@ -420,23 +423,23 @@ EXPORT_SYMBOL(drm_atomic_bridge_post_disable);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_atomic_bridge_pre_enable(struct drm_bridge *bridge,
-				  struct drm_atomic_state *state)
+void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	if (!bridge)
 		return;
 
-	drm_atomic_bridge_pre_enable(bridge->next, state);
+	drm_atomic_bridge_chain_pre_enable(bridge->next, state);
 
 	if (bridge->funcs->atomic_pre_enable)
 		bridge->funcs->atomic_pre_enable(bridge, state);
 	else if (bridge->funcs->pre_enable)
 		bridge->funcs->pre_enable(bridge);
 }
-EXPORT_SYMBOL(drm_atomic_bridge_pre_enable);
+EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
 
 /**
- * drm_atomic_bridge_enable - enables all bridges in the encoder chain
+ * drm_atomic_bridge_chain_enable - enables all bridges in the encoder chain
  * @bridge: bridge control structure
  * @state: atomic state being committed
  *
@@ -447,8 +450,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_pre_enable);
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
-void drm_atomic_bridge_enable(struct drm_bridge *bridge,
-			      struct drm_atomic_state *state)
+void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
 {
 	if (!bridge)
 		return;
@@ -458,9 +461,9 @@ void drm_atomic_bridge_enable(struct drm_bridge *bridge,
 	else if (bridge->funcs->enable)
 		bridge->funcs->enable(bridge);
 
-	drm_atomic_bridge_enable(bridge->next, state);
+	drm_atomic_bridge_chain_enable(bridge->next, state);
 }
-EXPORT_SYMBOL(drm_atomic_bridge_enable);
+EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
 #ifdef CONFIG_OF
 /**
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index a7c87abe88d0..c3ea722065c4 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -112,7 +112,7 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
 			continue;
 		}
 
-		ret = drm_bridge_mode_valid(encoder->bridge, mode);
+		ret = drm_bridge_chain_mode_valid(encoder->bridge, mode);
 		if (ret != MODE_OK) {
 			/* There is also no point in continuing for crtc check
 			 * here. */
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c79b1f855d89..ea68b5adccbe 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1247,8 +1247,8 @@ static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
 		struct drm_display_mode adjusted_mode;
 
 		drm_mode_copy(&adjusted_mode, mode);
-		if (!drm_bridge_mode_fixup(hdmi->bridge.next, mode,
-					   &adjusted_mode))
+		if (!drm_bridge_chain_mode_fixup(hdmi->bridge.next, mode,
+						 &adjusted_mode))
 			return MODE_BAD;
 	}
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c0a2286a81e9..726435baf4ad 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -254,9 +254,10 @@ struct drm_bridge_funcs {
 	 * there is one) when this callback is called.
 	 *
 	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from &drm_bridge_pre_enable. It
-	 * would be prudent to also provide an implementation of @pre_enable if
-	 * you are expecting driver calls into &drm_bridge_pre_enable.
+	 * atomic commit. It will not be invoked from
+	 * &drm_bridge_chain_pre_enable. It would be prudent to also provide an
+	 * implementation of @pre_enable if you are expecting driver calls into
+	 * &drm_bridge_chain_pre_enable.
 	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
@@ -279,9 +280,9 @@ struct drm_bridge_funcs {
 	 * chain if there is one.
 	 *
 	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from &drm_bridge_enable. It
-	 * would be prudent to also provide an implementation of @enable if
-	 * you are expecting driver calls into &drm_bridge_enable.
+	 * atomic commit. It will not be invoked from &drm_bridge_chain_enable.
+	 * It would be prudent to also provide an implementation of @enable if
+	 * you are expecting driver calls into &drm_bridge_chain_enable.
 	 *
 	 * The @atomic_enable callback is optional.
 	 */
@@ -301,9 +302,10 @@ struct drm_bridge_funcs {
 	 * signals) feeding it is still running when this callback is called.
 	 *
 	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from &drm_bridge_disable. It
-	 * would be prudent to also provide an implementation of @disable if
-	 * you are expecting driver calls into &drm_bridge_disable.
+	 * atomic commit. It will not be invoked from
+	 * &drm_bridge_chain_disable. It would be prudent to also provide an
+	 * implementation of @disable if you are expecting driver calls into
+	 * &drm_bridge_chain_disable.
 	 *
 	 * The @atomic_disable callback is optional.
 	 */
@@ -325,10 +327,11 @@ struct drm_bridge_funcs {
 	 * called.
 	 *
 	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from &drm_bridge_post_disable.
+	 * atomic commit. It will not be invoked from
+	 * &drm_bridge_chain_post_disable.
 	 * It would be prudent to also provide an implementation of
 	 * @post_disable if you are expecting driver calls into
-	 * &drm_bridge_post_disable.
+	 * &drm_bridge_chain_post_disable.
 	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
@@ -406,27 +409,28 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous);
 
-bool drm_bridge_mode_fixup(struct drm_bridge *bridge,
-			   const struct drm_display_mode *mode,
-			   struct drm_display_mode *adjusted_mode);
-enum drm_mode_status drm_bridge_mode_valid(struct drm_bridge *bridge,
-					   const struct drm_display_mode *mode);
-void drm_bridge_disable(struct drm_bridge *bridge);
-void drm_bridge_post_disable(struct drm_bridge *bridge);
-void drm_bridge_mode_set(struct drm_bridge *bridge,
-			 const struct drm_display_mode *mode,
-			 const struct drm_display_mode *adjusted_mode);
-void drm_bridge_pre_enable(struct drm_bridge *bridge);
-void drm_bridge_enable(struct drm_bridge *bridge);
+bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 struct drm_display_mode *adjusted_mode);
+enum drm_mode_status
+drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_mode *mode);
+void drm_bridge_chain_disable(struct drm_bridge *bridge);
+void drm_bridge_chain_post_disable(struct drm_bridge *bridge);
+void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
+			       const struct drm_display_mode *mode,
+			       const struct drm_display_mode *adjusted_mode);
+void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
+void drm_bridge_chain_enable(struct drm_bridge *bridge);
 
-void drm_atomic_bridge_disable(struct drm_bridge *bridge,
-			       struct drm_atomic_state *state);
-void drm_atomic_bridge_post_disable(struct drm_bridge *bridge,
+void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state);
+void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state);
+void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state);
+void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
-void drm_atomic_bridge_pre_enable(struct drm_bridge *bridge,
-				  struct drm_atomic_state *state);
-void drm_atomic_bridge_enable(struct drm_bridge *bridge,
-			      struct drm_atomic_state *state);
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
-- 
2.21.0

