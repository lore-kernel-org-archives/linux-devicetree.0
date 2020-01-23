Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F2FC33CAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 09:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 891F92253D
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 09:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgAWJxl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 04:53:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43876 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbgAWJxk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 04:53:40 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 466BE293C5C;
        Thu, 23 Jan 2020 09:53:38 +0000 (GMT)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, intel-gfx-trybot@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v8 02/12] drm/bridge: Patch atomic hooks to take a drm_bridge_state
Date:   Thu, 23 Jan 2020 10:53:23 +0100
Message-Id: <20200123095333.2085810-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123095333.2085810-1-boris.brezillon@collabora.com>
References: <20200123095333.2085810-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This way the drm_bridge_funcs interface is consistent with the rest of
the subsystem.

The only driver implementing those hooks (analogix DP) is patched too.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
[narmstrong: renamed state as old_bridge_state in rcar_lvds_atomic_disable]
Reviewed by: Jernej Skrabec <jernej.skrabec@siol.net>
Tested-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v7:
* None
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 41 +++++++------
 drivers/gpu/drm/drm_bridge.c                  | 61 +++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  8 ++-
 include/drm/drm_bridge.h                      |  8 +--
 4 files changed, 82 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6effe532f820..6fab71985cd4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1289,19 +1289,21 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
 	return conn_state->crtc;
 }
 
-static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-						 struct drm_atomic_state *state)
+static void
+analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int ret;
 
-	crtc = analogix_dp_get_new_crtc(dp, state);
+	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
 		return;
 
-	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Don't touch the panel if we're coming back from PSR */
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
@@ -1366,20 +1368,22 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	return ret;
 }
 
-static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
-					     struct drm_atomic_state *state)
+static void
+analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int timeout_loop = 0;
 	int ret;
 
-	crtc = analogix_dp_get_new_crtc(dp, state);
+	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
 		return;
 
-	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Not a full enable, just disable PSR and continue */
 	if (old_crtc_state && old_crtc_state->self_refresh_active) {
 		ret = analogix_dp_disable_psr(dp);
@@ -1440,18 +1444,20 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
-static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-					      struct drm_atomic_state *state)
+static void
+analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 
-	crtc = analogix_dp_get_new_crtc(dp, state);
+	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
 		goto out;
 
-	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
 	if (!new_crtc_state)
 		goto out;
 
@@ -1463,20 +1469,21 @@ static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	analogix_dp_bridge_disable(bridge);
 }
 
-static
-void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
-					    struct drm_atomic_state *state)
+static void
+analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	int ret;
 
-	crtc = analogix_dp_get_new_crtc(dp, state);
+	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
 		return;
 
-	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
 	if (!new_crtc_state || !new_crtc_state->self_refresh_active)
 		return;
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 31d658f7312f..18d2c42491ca 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -428,10 +428,19 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->atomic_disable)
-			iter->funcs->atomic_disable(iter, old_state);
-		else if (iter->funcs->disable)
+		if (iter->funcs->atomic_disable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								iter);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			iter->funcs->atomic_disable(iter, old_bridge_state);
+		} else if (iter->funcs->disable) {
 			iter->funcs->disable(iter);
+		}
 
 		if (iter == bridge)
 			break;
@@ -462,10 +471,20 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_post_disable)
-			bridge->funcs->atomic_post_disable(bridge, old_state);
-		else if (bridge->funcs->post_disable)
+		if (bridge->funcs->atomic_post_disable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								bridge);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			bridge->funcs->atomic_post_disable(bridge,
+							   old_bridge_state);
+		} else if (bridge->funcs->post_disable) {
 			bridge->funcs->post_disable(bridge);
+		}
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
@@ -494,10 +513,19 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->atomic_pre_enable)
-			iter->funcs->atomic_pre_enable(iter, old_state);
-		else if (iter->funcs->pre_enable)
+		if (iter->funcs->atomic_pre_enable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								iter);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			iter->funcs->atomic_pre_enable(iter, old_bridge_state);
+		} else if (iter->funcs->pre_enable) {
 			iter->funcs->pre_enable(iter);
+		}
 
 		if (iter == bridge)
 			break;
@@ -527,10 +555,19 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_enable)
-			bridge->funcs->atomic_enable(bridge, old_state);
-		else if (bridge->funcs->enable)
+		if (bridge->funcs->atomic_enable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								bridge);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			bridge->funcs->atomic_enable(bridge, old_bridge_state);
+		} else if (bridge->funcs->enable) {
 			bridge->funcs->enable(bridge);
+		}
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 8ffa4fbbdeb3..961519ce6634 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -590,8 +590,9 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 }
 
 static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state)
+				    struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
 
@@ -603,7 +604,7 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 }
 
 static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
-				     struct drm_atomic_state *state)
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
@@ -618,7 +619,8 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 
 	/* Disable the companion LVDS encoder in dual-link mode. */
 	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
-		lvds->companion->funcs->atomic_disable(lvds->companion, state);
+		lvds->companion->funcs->atomic_disable(lvds->companion,
+						       old_bridge_state);
 
 	clk_disable_unprepare(lvds->clocks.mod);
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3ec37f6d4dff..c971ba143e3e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -265,7 +265,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
-				  struct drm_atomic_state *old_state);
+				  struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_enable:
@@ -290,7 +290,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
-			      struct drm_atomic_state *old_state);
+			      struct drm_bridge_state *old_bridge_state);
 	/**
 	 * @atomic_disable:
 	 *
@@ -313,7 +313,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
-			       struct drm_atomic_state *old_state);
+			       struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_post_disable:
@@ -339,7 +339,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
-				    struct drm_atomic_state *old_state);
+				    struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_duplicate_state:
-- 
2.24.1

