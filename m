Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC40CA9EB9
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B54A2084C
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406910AbfJWPp1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404032AbfJWPp1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:27 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2F96528F905;
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
Subject: [PATCH v3 09/21] drm/bridge: Add a drm_bridge_state object
Date:   Wed, 23 Oct 2019 17:45:00 +0200
Message-Id: <20191023154512.9762-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

One of the last remaining objects to not have its atomic state.

This is being motivated by our attempt to support runtime bus-format
negotiation between elements of the bridge chain.
This patch just paves the road for such a feature by adding a new
drm_bridge_state object inheriting from drm_private_obj so we can
re-use some of the existing state initialization/tracking logic.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* None

Changes in v2:
* Use drm_for_each_bridge_in_chain()
* Rename helpers to be more consistent with the rest of the DRM API
* Improve/fix the doc
---
 drivers/gpu/drm/drm_atomic.c        |  39 +++++++
 drivers/gpu/drm/drm_atomic_helper.c |  20 ++++
 drivers/gpu/drm/drm_bridge.c        | 168 +++++++++++++++++++++++++++-
 include/drm/drm_atomic.h            |   3 +
 include/drm/drm_bridge.h            | 118 +++++++++++++++++++
 5 files changed, 343 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 419381abbdd1..6c249ce39380 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -30,6 +30,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -1010,6 +1011,44 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 		connector->funcs->atomic_print_state(p, state);
 }
 
+/**
+ * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
+ * @state: atomic state
+ * @encoder: DRM encoder
+ *
+ * This function adds all bridges attached to @encoder. This is needed to add
+ * bridge states to @state and make them available when
+ * &bridge_funcs.atomic_{check,pre_enable,enable,disable_post_disable}() are
+ * called
+ *
+ * Returns:
+ * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
+ * then the w/w mutex code has detected a deadlock and the entire atomic
+ * sequence must be restarted. All other errors are fatal.
+ */
+int
+drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
+			       struct drm_encoder *encoder)
+{
+	struct drm_bridge_state *bridge_state;
+	struct drm_bridge *bridge;
+
+	if (!encoder)
+		return 0;
+
+	DRM_DEBUG_ATOMIC("Adding all bridges for [encoder:%d:%s] to %p\n",
+			 encoder->base.id, encoder->name, state);
+
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		bridge_state = drm_atomic_get_bridge_state(state, bridge);
+		if (IS_ERR(bridge_state))
+			return PTR_ERR(bridge_state);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_add_encoder_bridges);
+
 /**
  * drm_atomic_add_affected_connectors - add connectors for crtc
  * @state: atomic state
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f02ddffd4960..de985ba7ce2d 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -730,6 +730,26 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			return ret;
 	}
 
+	/*
+	 * Iterate over all connectors again, and add all affected bridges to
+	 * the state.
+	 */
+	for_each_oldnew_connector_in_state(state, connector,
+					   old_connector_state,
+					   new_connector_state, i) {
+		struct drm_encoder *encoder;
+
+		encoder = old_connector_state->best_encoder;
+		ret = drm_atomic_add_encoder_bridges(state, encoder);
+		if (ret)
+			return ret;
+
+		encoder = new_connector_state->best_encoder;
+		ret = drm_atomic_add_encoder_bridges(state, encoder);
+		if (ret)
+			return ret;
+	}
+
 	ret = mode_valid(state);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c5cf8a9c4237..c53966767782 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -25,6 +25,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
 
@@ -89,6 +90,38 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
+static struct drm_private_state *
+drm_bridge_atomic_duplicate_priv_state(struct drm_private_obj *obj)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+	struct drm_bridge_state *state;
+
+	if (bridge->funcs->atomic_duplicate_state)
+		state = bridge->funcs->atomic_duplicate_state(bridge);
+	else
+		state = drm_atomic_helper_bridge_duplicate_state(bridge);
+
+	return &state->base;
+}
+
+static void
+drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
+				     struct drm_private_state *s)
+{
+	struct drm_bridge_state *state = drm_priv_to_bridge_state(s);
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+
+	if (bridge->funcs->atomic_destroy_state)
+		bridge->funcs->atomic_destroy_state(bridge, state);
+	else
+		drm_atomic_helper_bridge_destroy_state(bridge, state);
+}
+
+static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
+	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
+	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
+};
+
 /**
  * drm_bridge_attach - attach the bridge to an encoder's chain
  *
@@ -114,6 +147,7 @@ EXPORT_SYMBOL(drm_bridge_remove);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous)
 {
+	struct drm_bridge_state *state;
 	LIST_HEAD(tmp_list);
 	int ret;
 
@@ -132,19 +166,39 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge);
-		if (ret < 0) {
-			bridge->dev = NULL;
-			bridge->encoder = NULL;
-			return ret;
-		}
+		if (ret < 0)
+			goto err_reset_bridge;
 	}
 
+	if (bridge->funcs->atomic_reset)
+		state = bridge->funcs->atomic_reset(bridge);
+	else
+		state = drm_atomic_helper_bridge_reset(bridge);
+
+	if (IS_ERR(state)) {
+		ret = PTR_ERR(state);
+		goto err_detach_bridge;
+	}
+
+	drm_atomic_private_obj_init(bridge->dev, &bridge->base,
+				    &state->base,
+				    &drm_bridge_priv_state_funcs);
+
 	if (previous)
 		list_splice(&tmp_list, &previous->chain_node);
 	else
 		list_splice(&tmp_list, &encoder->bridge_chain);
 
 	return 0;
+
+err_detach_bridge:
+	if (bridge->funcs->detach)
+		bridge->funcs->detach(bridge);
+
+err_reset_bridge:
+	bridge->dev = NULL;
+	bridge->encoder = NULL;
+	return ret;
 }
 EXPORT_SYMBOL(drm_bridge_attach);
 
@@ -156,6 +210,8 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (WARN_ON(!bridge->dev))
 		return;
 
+	drm_atomic_private_obj_fini(&bridge->base);
+
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
@@ -522,6 +578,108 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
+/**
+ * drm_atomic_helper_bridge_destroy_state() - Default destroy state helper
+ * @bridge: the bridge this state refers to
+ * @state: state object to destroy
+ *
+ * Just a simple kfree() for now.
+ */
+void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
+					    struct drm_bridge_state *state)
+{
+	kfree(state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
+
+/**
+ * __drm_atomic_helper_bridge_reset() - Initialize a bridge state to its
+ *					default
+ * @bridge: the bridge this state is refers to
+ * @state: bridge state to initialize
+ *
+ * For now it's just a memset(0) plus a state->bridge assignment. Might
+ * be extended in the future.
+ */
+void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
+				      struct drm_bridge_state *state)
+{
+	memset(state, 0, sizeof(*state));
+	state->bridge = bridge;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
+
+/**
+ * drm_atomic_helper_bridge_reset() - default &drm_plane_funcs.reset hook for
+ *				      bridges
+ * @bridge: the bridge to reset state on
+ *
+ * Resets the atomic state for @bridge by freeing the state pointer (which
+ * might be NULL, e.g. at driver load time) and allocating a new empty state
+ * object.
+ *
+ * RETURNS:
+ * A valid drm_bridge_state object in case of success, an ERR_PTR()
+ * giving the reaon of the failure otherwise.
+ */
+struct drm_bridge_state *
+drm_atomic_helper_bridge_reset(struct drm_bridge *bridge)
+{
+	struct drm_bridge_state *bridge_state;
+
+	bridge_state = kzalloc(sizeof(*bridge_state), GFP_KERNEL);
+	if (!bridge_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_bridge_reset(bridge, bridge_state);
+	return bridge_state;
+}
+EXPORT_SYMBOL(drm_atomic_helper_bridge_reset);
+
+/**
+ * __drm_atomic_helper_bridge_duplicate_state() - Copy the content of the
+ *						  current bridge state into a
+ *						  new one
+ * @bridge: bridge element the old and new states are referring to
+ * @new: new bridge state to copy to
+ *
+ * Should be used by custom &drm_bridge_funcs.atomic_duplicate() implementation
+ * to copy the previous state into the new object.
+ */
+void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
+						struct drm_bridge_state *new)
+{
+	__drm_atomic_helper_private_obj_duplicate_state(&bridge->base,
+							&new->base);
+	new->bridge = bridge;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_bridge_duplicate_state);
+
+/**
+ * drm_atomic_helper_duplicate_bridge_state() - Default duplicate state helper
+ * @bridge: bridge containing the state to duplicate
+ *
+ * Default implementation of &drm_bridge_funcs.atomic_duplicate().
+ *
+ * RETURNS:
+ * a valid state object or NULL if the allocation fails.
+ */
+struct drm_bridge_state *
+drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge)
+{
+	struct drm_bridge_state *new;
+
+	if (WARN_ON(!bridge->base.state))
+		return NULL;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (new)
+		__drm_atomic_helper_bridge_duplicate_state(bridge, new);
+
+	return new;
+}
+EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 927e1205d7aa..1c0a08217712 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -660,6 +660,9 @@ __drm_atomic_get_current_plane_state(struct drm_atomic_state *state,
 	return plane->state;
 }
 
+int __must_check
+drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
+			       struct drm_encoder *encoder);
 int __must_check
 drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 				   struct drm_crtc *crtc);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 238e84ab63a3..a608c47d1de5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -25,6 +25,7 @@
 
 #include <linux/list.h>
 #include <linux/ctype.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
@@ -33,6 +34,23 @@ struct drm_bridge;
 struct drm_bridge_timings;
 struct drm_panel;
 
+/**
+ * struct drm_bridge_state - Atomic bridge state object
+ * @base: inherit from &drm_private_state
+ * @bridge: the bridge this state refers to
+ */
+struct drm_bridge_state {
+	struct drm_private_state base;
+
+	struct drm_bridge *bridge;
+};
+
+static inline struct drm_bridge_state *
+drm_priv_to_bridge_state(struct drm_private_state *priv)
+{
+	return container_of(priv, struct drm_bridge_state, base);
+}
+
 /**
  * struct drm_bridge_funcs - drm_bridge control functions
  */
@@ -338,6 +356,48 @@ struct drm_bridge_funcs {
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
+
+	/**
+	 * @atomic_duplicate_state:
+	 *
+	 * Duplicate the current bridge state object (which is guaranteed to be
+	 * non-NULL).
+	 *
+	 * The atomic_duplicate_state() is optional, the core falls back on
+	 * &drm_atomic_helper_bridge_duplicate_state() when not implemented.
+	 *
+	 * RETURNS:
+	 * A valid drm_bridge_state object or NULL if the allocation fails.
+	 */
+	struct drm_bridge_state *(*atomic_duplicate_state)(struct drm_bridge *bridge);
+
+	/**
+	 * @atomic_destroy_state:
+	 *
+	 * Destroy a bridge state object previously allocated by
+	 * &drm_bridge_funcs.atomic_duplicate_state().
+	 *
+	 * The atomic_destroy_state hook is optional, the coref falls back on
+	 * &drm_atomic_helper_bridge_destroy_state() when not implemented.
+	 */
+	void (*atomic_destroy_state)(struct drm_bridge *bridge,
+				     struct drm_bridge_state *state);
+
+	/**
+	 * @atomic_reset:
+	 *
+	 * Reset the bridge to a predefined state (or retrieve its current
+	 * state) and return a &drm_bridge_state object matching this state.
+	 * This function is called at attach time.
+	 *
+	 * The atomic_reset hook is optional, the core falls back on
+	 * &drm_atomic_helper_bridge_reset() when not implemented.
+	 *
+	 * RETURNS:
+	 * A valid drm_bridge_state object in case of success, an ERR_PTR()
+	 * giving the reaon of the failure otherwise.
+	 */
+	struct drm_bridge_state *(*atomic_reset)(struct drm_bridge *bridge);
 };
 
 /**
@@ -380,6 +440,8 @@ struct drm_bridge_timings {
  * struct drm_bridge - central DRM bridge control structure
  */
 struct drm_bridge {
+	/** @base: inherit from &drm_private_object */
+	struct drm_private_obj base;
 	/** @dev: DRM device this bridge belongs to */
 	struct drm_device *dev;
 	/** @encoder: encoder to which this bridge is connected */
@@ -404,6 +466,12 @@ struct drm_bridge {
 	void *driver_private;
 };
 
+static inline struct drm_bridge *
+drm_priv_to_bridge(struct drm_private_obj *priv)
+{
+	return container_of(priv, struct drm_bridge, base);
+}
+
 void drm_bridge_add(struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
@@ -475,6 +543,56 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
 
+void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
+				      struct drm_bridge_state *state);
+struct drm_bridge_state *
+drm_atomic_helper_bridge_reset(struct drm_bridge *bridge);
+void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
+					    struct drm_bridge_state *state);
+void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
+						struct drm_bridge_state *new);
+struct drm_bridge_state *
+drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge);
+
+static inline struct drm_bridge_state *
+drm_atomic_get_bridge_state(struct drm_atomic_state *state,
+			    struct drm_bridge *bridge)
+{
+	struct drm_private_state *obj_state;
+
+	obj_state = drm_atomic_get_private_obj_state(state, &bridge->base);
+	if (!obj_state)
+		return NULL;
+
+	return drm_priv_to_bridge_state(obj_state);
+}
+
+static inline struct drm_bridge_state *
+drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
+				struct drm_bridge *bridge)
+{
+	struct drm_private_state *obj_state;
+
+	obj_state = drm_atomic_get_old_private_obj_state(state, &bridge->base);
+	if (!obj_state)
+		return NULL;
+
+	return drm_priv_to_bridge_state(obj_state);
+}
+
+static inline struct drm_bridge_state *
+drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
+				struct drm_bridge *bridge)
+{
+	struct drm_private_state *obj_state;
+
+	obj_state = drm_atomic_get_new_private_obj_state(state, &bridge->base);
+	if (!obj_state)
+		return NULL;
+
+	return drm_priv_to_bridge_state(obj_state);
+}
+
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
 struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
-- 
2.21.0

