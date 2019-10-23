Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2991CA9EB7
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C963921A4A
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436465AbfJWPp2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37856 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406907AbfJWPp2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:28 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EDF4728F90D;
        Wed, 23 Oct 2019 16:45:25 +0100 (BST)
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
Subject: [PATCH v3 10/21] drm/bridge: Clarify the atomic enable/disable hooks semantics
Date:   Wed, 23 Oct 2019 17:45:01 +0200
Message-Id: <20191023154512.9762-11-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The [pre_]enable/[post_]disable hooks are passed the old atomic state.
Update the doc and rename the arguments to make it clear.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* New patch
---
 drivers/gpu/drm/drm_bridge.c | 24 ++++++++++++------------
 include/drm/drm_bridge.h     | 16 ++++++++++++----
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c53966767782..ca74bfe028c9 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -447,7 +447,7 @@ EXPORT_SYMBOL(drm_bridge_chain_enable);
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
- * @state: atomic state being committed
+ * @old_state: old atomic state
  *
  * Calls &drm_bridge_funcs.atomic_disable (falls back on
  * &drm_bridge_funcs.disable) op for all the bridges in the encoder chain,
@@ -457,7 +457,7 @@ EXPORT_SYMBOL(drm_bridge_chain_enable);
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
-				     struct drm_atomic_state *state)
+				     struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *iter;
@@ -469,7 +469,7 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain,
 				    chain_node) {
 		if (iter->funcs->atomic_disable)
-			iter->funcs->atomic_disable(iter, state);
+			iter->funcs->atomic_disable(iter, old_state);
 		else if (iter->funcs->disable)
 			iter->funcs->disable(iter);
 
@@ -483,7 +483,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
  * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
  *					  in the encoder chain
  * @bridge: bridge control structure
- * @state: atomic state being committed
+ * @old_state: old atomic state
  *
  * Calls &drm_bridge_funcs.atomic_post_disable (falls back on
  * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
@@ -493,7 +493,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
-					  struct drm_atomic_state *state)
+					  struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
 
@@ -504,7 +504,7 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 	list_for_each_entry_from(bridge, &encoder->bridge_chain,
 				 chain_node) {
 		if (bridge->funcs->atomic_post_disable)
-			bridge->funcs->atomic_post_disable(bridge, state);
+			bridge->funcs->atomic_post_disable(bridge, old_state);
 		else if (bridge->funcs->post_disable)
 			bridge->funcs->post_disable(bridge);
 	}
@@ -515,7 +515,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
  * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
  *					the encoder chain
  * @bridge: bridge control structure
- * @state: atomic state being committed
+ * @old_state: old atomic state
  *
  * Calls &drm_bridge_funcs.atomic_pre_enable (falls back on
  * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
@@ -525,7 +525,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
-					struct drm_atomic_state *state)
+					struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *iter;
@@ -537,7 +537,7 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 	list_for_each_entry_reverse(iter, &bridge->encoder->bridge_chain,
 				    chain_node) {
 		if (iter->funcs->atomic_pre_enable)
-			iter->funcs->atomic_pre_enable(iter, state);
+			iter->funcs->atomic_pre_enable(iter, old_state);
 		else if (iter->funcs->pre_enable)
 			iter->funcs->pre_enable(iter);
 
@@ -550,7 +550,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
 /**
  * drm_atomic_bridge_chain_enable - enables all bridges in the encoder chain
  * @bridge: bridge control structure
- * @state: atomic state being committed
+ * @old_state: old atomic state
  *
  * Calls &drm_bridge_funcs.atomic_enable (falls back on
  * &drm_bridge_funcs.enable) op for all the bridges in the encoder chain,
@@ -560,7 +560,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state)
+				    struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
 
@@ -571,7 +571,7 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 	list_for_each_entry_from(bridge, &bridge->encoder->bridge_chain,
 				 chain_node) {
 		if (bridge->funcs->atomic_enable)
-			bridge->funcs->atomic_enable(bridge, state);
+			bridge->funcs->atomic_enable(bridge, old_state);
 		else if (bridge->funcs->enable)
 			bridge->funcs->enable(bridge);
 	}
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a608c47d1de5..e814e6d6e7c2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -266,6 +266,8 @@ struct drm_bridge_funcs {
 	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
 	 * element is a &drm_encoder it's called right before the encoder's
 	 * &drm_encoder_helper_funcs.atomic_enable hook.
+	 * This hook is passed the old atomic state (atomic state after new/old
+	 * states have been swapped).
 	 *
 	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
 	 * will not yet be running when this callback is called. The bridge must
@@ -281,7 +283,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
-				  struct drm_atomic_state *state);
+				  struct drm_atomic_state *old_state);
 
 	/**
 	 * @atomic_enable:
@@ -292,6 +294,8 @@ struct drm_bridge_funcs {
 	 * bridge's @atomic_enable or @enable function. If the preceding element
 	 * is a &drm_encoder it's called right after the encoder's
 	 * &drm_encoder_helper_funcs.atomic_enable hook.
+	 * This hook is passed the old atomic state (atomic state after new/old
+	 * states have been swapped).
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is running when this callback is called. This
@@ -306,7 +310,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
-			      struct drm_atomic_state *state);
+			      struct drm_atomic_state *old_state);
 	/**
 	 * @atomic_disable:
 	 *
@@ -316,6 +320,8 @@ struct drm_bridge_funcs {
 	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
 	 * is a &drm_encoder it's called right before the
 	 * &drm_encoder_helper_funcs.atomic_disable hook.
+	 * This hook is passed the old atomic state (atomic state after new/old
+	 * states have been swapped).
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
@@ -329,7 +335,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
-			       struct drm_atomic_state *state);
+			       struct drm_atomic_state *old_state);
 
 	/**
 	 * @atomic_post_disable:
@@ -340,6 +346,8 @@ struct drm_bridge_funcs {
 	 * @atomic_post_disable or @post_disable function. If the preceding
 	 * element is a &drm_encoder it's called right after the encoder's
 	 * &drm_encoder_helper_funcs.atomic_disable hook.
+	 * This hook is passed the old atomic state (atomic state after new/old
+	 * states have been swapped).
 	 *
 	 * The bridge must assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is no longer running when this callback is
@@ -355,7 +363,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state);
+				    struct drm_atomic_state *old_state);
 
 	/**
 	 * @atomic_duplicate_state:
-- 
2.21.0

