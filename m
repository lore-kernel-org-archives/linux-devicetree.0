Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EADCA9EB6
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B1652086D
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436467AbfJWPp2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436464AbfJWPp2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:28 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 22D9828F932;
        Wed, 23 Oct 2019 16:45:27 +0100 (BST)
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
Subject: [PATCH v3 11/21] drm/bridge: Patch atomic hooks to take a drm_bridge_state
Date:   Wed, 23 Oct 2019 17:45:02 +0200
Message-Id: <20191023154512.9762-12-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
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
---
Changes in v3:
* Old state clarification moved to a separate patch

Changes in v2:
* Pass the old bridge state
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 12 ++--
 drivers/gpu/drm/drm_bridge.c                  | 61 +++++++++++++++----
 include/drm/drm_bridge.h                      | 24 ++++----
 3 files changed, 69 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bb411fe52ae8..e438e757f2ce 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1290,8 +1290,9 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
 }
 
 static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-						 struct drm_atomic_state *state)
+						 struct drm_bridge_state *bstate)
 {
+	struct drm_atomic_state *state = bstate->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
@@ -1367,8 +1368,9 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 }
 
 static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
-					     struct drm_atomic_state *state)
+					     struct drm_bridge_state *bstate)
 {
+	struct drm_atomic_state *state = bstate->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
@@ -1441,8 +1443,9 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 }
 
 static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-					      struct drm_atomic_state *state)
+					      struct drm_bridge_state *bstate)
 {
+	struct drm_atomic_state *state = bstate->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
@@ -1465,8 +1468,9 @@ static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 static
 void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
-					    struct drm_atomic_state *state)
+					    struct drm_bridge_state *bstate)
 {
+	struct drm_atomic_state *state = bstate->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ca74bfe028c9..377866e3214f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -468,10 +468,19 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain,
 				    chain_node) {
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
@@ -503,10 +512,20 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain,
 				 chain_node) {
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
@@ -536,10 +555,19 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &bridge->encoder->bridge_chain,
 				    chain_node) {
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
@@ -570,10 +598,19 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &bridge->encoder->bridge_chain,
 				 chain_node) {
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
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e814e6d6e7c2..b1f557d8dba9 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -266,8 +266,8 @@ struct drm_bridge_funcs {
 	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
 	 * element is a &drm_encoder it's called right before the encoder's
 	 * &drm_encoder_helper_funcs.atomic_enable hook.
-	 * This hook is passed the old atomic state (atomic state after new/old
-	 * states have been swapped).
+	 * This hook is passed the old bridge state (the new one can be
+	 * retrieved from bridge->state).
 	 *
 	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
 	 * will not yet be running when this callback is called. The bridge must
@@ -283,7 +283,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
-				  struct drm_atomic_state *old_state);
+				  struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_enable:
@@ -294,8 +294,8 @@ struct drm_bridge_funcs {
 	 * bridge's @atomic_enable or @enable function. If the preceding element
 	 * is a &drm_encoder it's called right after the encoder's
 	 * &drm_encoder_helper_funcs.atomic_enable hook.
-	 * This hook is passed the old atomic state (atomic state after new/old
-	 * states have been swapped).
+	 * This hook is passed the old bridge state (the new one can be
+	 * retrieved from bridge->state).
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is running when this callback is called. This
@@ -310,7 +310,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
-			      struct drm_atomic_state *old_state);
+			      struct drm_bridge_state *old_bridge_state);
 	/**
 	 * @atomic_disable:
 	 *
@@ -320,8 +320,8 @@ struct drm_bridge_funcs {
 	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
 	 * is a &drm_encoder it's called right before the
 	 * &drm_encoder_helper_funcs.atomic_disable hook.
-	 * This hook is passed the old atomic state (atomic state after new/old
-	 * states have been swapped).
+	 * This hook is passed the old bridge state (the new one can be
+	 * retrieved from bridge->state).
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
@@ -335,7 +335,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
-			       struct drm_atomic_state *old_state);
+			       struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_post_disable:
@@ -346,8 +346,8 @@ struct drm_bridge_funcs {
 	 * @atomic_post_disable or @post_disable function. If the preceding
 	 * element is a &drm_encoder it's called right after the encoder's
 	 * &drm_encoder_helper_funcs.atomic_disable hook.
-	 * This hook is passed the old atomic state (atomic state after new/old
-	 * states have been swapped).
+	 * This hook is passed the old bridge state (the new one can be
+	 * retrieved from bridge->state).
 	 *
 	 * The bridge must assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is no longer running when this callback is
@@ -363,7 +363,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
-				    struct drm_atomic_state *old_state);
+				    struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_duplicate_state:
-- 
2.21.0

