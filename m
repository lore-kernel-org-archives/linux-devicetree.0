Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47825CA9EB6
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DFF02086D
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406908AbfJWPpZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406858AbfJWPpZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:25 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 88DC928F903;
        Wed, 23 Oct 2019 16:45:23 +0100 (BST)
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
Subject: [PATCH v3 07/21] drm/bridge: Make the bridge chain a double-linked list
Date:   Wed, 23 Oct 2019 17:44:58 +0200
Message-Id: <20191023154512.9762-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

So that each element in the chain can easily access its predecessor.
This will be needed to support bus format negotiation between elements
of the bridge chain.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* None

Changes in v2:
* Adjust things to the "dummy encoder bridge" change (patch 2 in this
  series)
---
 drivers/gpu/drm/drm_bridge.c  | 171 ++++++++++++++++++++++------------
 drivers/gpu/drm/drm_encoder.c |  16 +---
 include/drm/drm_bridge.h      |  12 ++-
 include/drm/drm_encoder.h     |   9 +-
 4 files changed, 135 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 54c874493c57..c5cf8a9c4237 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -55,7 +55,7 @@
  * just provide additional hooks to get the desired output at the end of the
  * encoder chain.
  *
- * Bridges can also be chained up using the &drm_bridge.next pointer.
+ * Bridges can also be chained up using the &drm_bridge.chain_node field.
  *
  * Both legacy CRTC helpers and the new atomic modeset helpers support bridges.
  */
@@ -114,6 +114,7 @@ EXPORT_SYMBOL(drm_bridge_remove);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous)
 {
+	LIST_HEAD(tmp_list);
 	int ret;
 
 	if (!encoder || !bridge)
@@ -127,6 +128,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 	bridge->dev = encoder->dev;
 	bridge->encoder = encoder;
+	list_add_tail(&bridge->chain_node, &tmp_list);
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge);
@@ -138,9 +140,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	}
 
 	if (previous)
-		previous->next = bridge;
+		list_splice(&tmp_list, &previous->chain_node);
 	else
-		encoder->bridge = bridge;
+		list_splice(&tmp_list, &encoder->bridge_chain);
 
 	return 0;
 }
@@ -157,6 +159,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
+	list_del(&bridge->chain_node);
 	bridge->dev = NULL;
 }
 
@@ -190,18 +193,22 @@ bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
 				 struct drm_display_mode *adjusted_mode)
 {
-	bool ret = true;
+	struct drm_encoder *encoder;
 
 	if (!bridge)
 		return true;
 
-	if (bridge->funcs->mode_fixup)
-		ret = bridge->funcs->mode_fixup(bridge, mode, adjusted_mode);
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain,
+				 chain_node) {
+		if (!bridge->funcs->mode_fixup)
+			continue;
 
-	ret = ret && drm_bridge_chain_mode_fixup(bridge->next, mode,
-						 adjusted_mode);
+		if (!bridge->funcs->mode_fixup(bridge, mode, adjusted_mode))
+			return false;
+	}
 
-	return ret;
+	return true;
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
 
@@ -224,18 +231,24 @@ enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_mode *mode)
 {
-	enum drm_mode_status ret = MODE_OK;
+	struct drm_encoder *encoder;
 
 	if (!bridge)
-		return ret;
+		return MODE_OK;
+
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		enum drm_mode_status ret;
+
+		if (!bridge->funcs->mode_valid)
+			continue;
 
-	if (bridge->funcs->mode_valid)
 		ret = bridge->funcs->mode_valid(bridge, mode);
+		if (ret != MODE_OK)
+			return ret;
+	}
 
-	if (ret != MODE_OK)
-		return ret;
-
-	return drm_bridge_chain_mode_valid(bridge->next, mode);
+	return MODE_OK;
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
 
@@ -251,13 +264,20 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
  */
 void drm_bridge_chain_disable(struct drm_bridge *bridge)
 {
+	struct drm_encoder *encoder;
+	struct drm_bridge *iter;
+
 	if (!bridge)
 		return;
 
-	drm_bridge_chain_disable(bridge->next);
+	encoder = bridge->encoder;
+	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+		if (iter->funcs->disable)
+			iter->funcs->disable(iter);
 
-	if (bridge->funcs->disable)
-		bridge->funcs->disable(bridge);
+		if (iter == bridge)
+			break;
+	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_disable);
 
@@ -274,13 +294,16 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
  */
 void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
 {
+	struct drm_encoder *encoder;
+
 	if (!bridge)
 		return;
 
-	if (bridge->funcs->post_disable)
-		bridge->funcs->post_disable(bridge);
-
-	drm_bridge_chain_post_disable(bridge->next);
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		if (bridge->funcs->post_disable)
+			bridge->funcs->post_disable(bridge);
+	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_post_disable);
 
@@ -300,13 +323,16 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *mode,
 			       const struct drm_display_mode *adjusted_mode)
 {
+	struct drm_encoder *encoder;
+
 	if (!bridge)
 		return;
 
-	if (bridge->funcs->mode_set)
-		bridge->funcs->mode_set(bridge, mode, adjusted_mode);
-
-	drm_bridge_chain_mode_set(bridge->next, mode, adjusted_mode);
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		if (bridge->funcs->mode_set)
+			bridge->funcs->mode_set(bridge, mode, adjusted_mode);
+	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
@@ -323,13 +349,17 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
  */
 void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
 {
+	struct drm_encoder *encoder;
+	struct drm_bridge *iter;
+
 	if (!bridge)
 		return;
 
-	drm_bridge_chain_pre_enable(bridge->next);
-
-	if (bridge->funcs->pre_enable)
-		bridge->funcs->pre_enable(bridge);
+	encoder = bridge->encoder;
+	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+		if (iter->funcs->pre_enable)
+			iter->funcs->pre_enable(iter);
+	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
 
@@ -345,13 +375,16 @@ EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
  */
 void drm_bridge_chain_enable(struct drm_bridge *bridge)
 {
+	struct drm_encoder *encoder;
+
 	if (!bridge)
 		return;
 
-	if (bridge->funcs->enable)
-		bridge->funcs->enable(bridge);
-
-	drm_bridge_chain_enable(bridge->next);
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		if (bridge->funcs->enable)
+			bridge->funcs->enable(bridge);
+	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_enable);
 
@@ -370,15 +403,23 @@ EXPORT_SYMBOL(drm_bridge_chain_enable);
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 				     struct drm_atomic_state *state)
 {
+	struct drm_encoder *encoder;
+	struct drm_bridge *iter;
+
 	if (!bridge)
 		return;
 
-	drm_atomic_bridge_chain_disable(bridge->next, state);
+	encoder = bridge->encoder;
+	list_for_each_entry_reverse(iter, &encoder->bridge_chain,
+				    chain_node) {
+		if (iter->funcs->atomic_disable)
+			iter->funcs->atomic_disable(iter, state);
+		else if (iter->funcs->disable)
+			iter->funcs->disable(iter);
 
-	if (bridge->funcs->atomic_disable)
-		bridge->funcs->atomic_disable(bridge, state);
-	else if (bridge->funcs->disable)
-		bridge->funcs->disable(bridge);
+		if (iter == bridge)
+			break;
+	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
@@ -398,15 +439,19 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *state)
 {
+	struct drm_encoder *encoder;
+
 	if (!bridge)
 		return;
 
-	if (bridge->funcs->atomic_post_disable)
-		bridge->funcs->atomic_post_disable(bridge, state);
-	else if (bridge->funcs->post_disable)
-		bridge->funcs->post_disable(bridge);
-
-	drm_atomic_bridge_chain_post_disable(bridge->next, state);
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain,
+				 chain_node) {
+		if (bridge->funcs->atomic_post_disable)
+			bridge->funcs->atomic_post_disable(bridge, state);
+		else if (bridge->funcs->post_disable)
+			bridge->funcs->post_disable(bridge);
+	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
@@ -426,15 +471,23 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *state)
 {
+	struct drm_encoder *encoder;
+	struct drm_bridge *iter;
+
 	if (!bridge)
 		return;
 
-	drm_atomic_bridge_chain_pre_enable(bridge->next, state);
+	encoder = bridge->encoder;
+	list_for_each_entry_reverse(iter, &bridge->encoder->bridge_chain,
+				    chain_node) {
+		if (iter->funcs->atomic_pre_enable)
+			iter->funcs->atomic_pre_enable(iter, state);
+		else if (iter->funcs->pre_enable)
+			iter->funcs->pre_enable(iter);
 
-	if (bridge->funcs->atomic_pre_enable)
-		bridge->funcs->atomic_pre_enable(bridge, state);
-	else if (bridge->funcs->pre_enable)
-		bridge->funcs->pre_enable(bridge);
+		if (iter == bridge)
+			break;
+	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
 
@@ -453,15 +506,19 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state)
 {
+	struct drm_encoder *encoder;
+
 	if (!bridge)
 		return;
 
-	if (bridge->funcs->atomic_enable)
-		bridge->funcs->atomic_enable(bridge, state);
-	else if (bridge->funcs->enable)
-		bridge->funcs->enable(bridge);
-
-	drm_atomic_bridge_chain_enable(bridge->next, state);
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &bridge->encoder->bridge_chain,
+				 chain_node) {
+		if (bridge->funcs->atomic_enable)
+			bridge->funcs->atomic_enable(bridge, state);
+		else if (bridge->funcs->enable)
+			bridge->funcs->enable(bridge);
+	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 4fe9e723e227..e555281f43d4 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -140,6 +140,7 @@ int drm_encoder_init(struct drm_device *dev,
 		goto out_put;
 	}
 
+	INIT_LIST_HEAD(&encoder->bridge_chain);
 	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
 	encoder->index = dev->mode_config.num_encoder++;
 
@@ -160,23 +161,16 @@ EXPORT_SYMBOL(drm_encoder_init);
 void drm_encoder_cleanup(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
+	struct drm_bridge *bridge, *next;
 
 	/* Note that the encoder_list is considered to be static; should we
 	 * remove the drm_encoder at runtime we would have to decrement all
 	 * the indices on the drm_encoder after us in the encoder_list.
 	 */
 
-	if (encoder->bridge) {
-		struct drm_bridge *bridge;
-		struct drm_bridge *next;
-
-		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		while (bridge) {
-			next = bridge->next;
-			drm_bridge_detach(bridge);
-			bridge = next;
-		}
-	}
+	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
+				 chain_node)
+		drm_bridge_detach(bridge);
 
 	drm_mode_object_unregister(dev, &encoder->base);
 	kfree(encoder->name);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 27eef63ce0ff..3ab16c95e59e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -384,8 +384,8 @@ struct drm_bridge {
 	struct drm_device *dev;
 	/** @encoder: encoder to which this bridge is connected */
 	struct drm_encoder *encoder;
-	/** @next: the next bridge in the encoder chain */
-	struct drm_bridge *next;
+	/** @chain_node: used to form a bridge chain */
+	struct list_head chain_node;
 #ifdef CONFIG_OF
 	/** @of_node: device node pointer to the bridge */
 	struct device_node *of_node;
@@ -420,7 +420,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 static inline struct drm_bridge *
 drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
 {
-	return bridge->next;
+	if (list_is_last(&bridge->chain_node, &bridge->encoder->bridge_chain))
+		return NULL;
+
+	return list_next_entry(bridge, chain_node);
 }
 
 /**
@@ -434,7 +437,8 @@ drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
 static inline struct drm_bridge *
 drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
 {
-	return encoder->bridge;
+	return list_first_entry_or_null(&encoder->bridge_chain,
+					struct drm_bridge, chain_node);
 }
 
 bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index f06164f44efe..9b3dde177c81 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -172,7 +172,14 @@ struct drm_encoder {
 	 * &drm_connector_state.crtc.
 	 */
 	struct drm_crtc *crtc;
-	struct drm_bridge *bridge;
+
+	/**
+	 * @bridge_chain: Bridges attached to this encoder. The first entry of
+	 * this list is always &drm_encoder.bridge. It may be followed by other
+	 * bridge entities.
+	 */
+	struct list_head bridge_chain;
+
 	const struct drm_encoder_funcs *funcs;
 	const struct drm_encoder_helper_funcs *helper_private;
 };
-- 
2.21.0

