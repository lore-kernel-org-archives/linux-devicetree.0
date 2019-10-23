Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D5FCA9EB9
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 554672084C
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436464AbfJWPpc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37856 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436466AbfJWPpc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:32 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7DB1D28F969;
        Wed, 23 Oct 2019 16:45:29 +0100 (BST)
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
Subject: [PATCH v3 14/21] drm/bridge: Add the necessary bits to support bus format negotiation
Date:   Wed, 23 Oct 2019 17:45:05 +0200
Message-Id: <20191023154512.9762-15-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

drm_bridge_state is extended to describe the input and output bus
configuration. This bus configuration is exposed through the
drm_bus_cfg struct which contains 2 properties: the bus format and
the bus flags.

Bus format negotiation is automated by the core, drivers just have
to implement the ->atomic_get_{output,input}_bus_fmts() hooks if they
want to take part to this negotiation. Negotiation happens in reserve
order, starting from the last element of the chain (the one directly
connected to the display) up to the first element of the chain (the one
connected to the encoder).
During this negotiation all supported formats are tested until we find
one that works, meaning that the formats array should be in decreasing
preference order (assuming the driver has a preference order).

Note that the bus format negotiation works even if some elements in the
chain don't implement the ->atomic_get_{output,input}_bus_fmts() hooks.
In that case, the core advertises only MEDIA_BUS_FMT_FIXED and let
the previous bridge element decide what to do (most of the time, bridge
drivers will pick a default bus format of extract this piece of
information from somewhere else, like a FW property).

Bus flags negotiation is left to drivers which can simply propagate the
flags from the input of the next bridge element if there's no conversion
done inside the bridge, or tweak them if the bridge does some kind of
signal inversion.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* Fix the commit message (Reported by Laurent)
* Document the fact that bus formats should not be directly modified by
  drivers (Suggested by Laurent)
* Document the fact that format order matters (Suggested by Laurent)
* Propagate bus flags by default
* Document the fact that drivers can tweak bus flags if needed
* Let ->atomic_get_{output,input}_bus_fmts() allocate the bus format
  array (Suggested by Laurent)
* Add a drm_atomic_helper_bridge_propagate_bus_fmt()
* Mandate that bridge drivers return accurate input_fmts even if they
  are known to be the first element in the bridge chain

Changes in v2:
* Rework things to support more complex use cases
---
 drivers/gpu/drm/drm_bridge.c | 257 ++++++++++++++++++++++++++++++++++-
 include/drm/drm_bridge.h     | 106 +++++++++++++++
 2 files changed, 362 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 990e056296bd..6022fb3d406a 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -641,13 +641,251 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int select_bus_fmt_recursive(struct drm_bridge *first,
+				    struct drm_bridge *cur,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state,
+				    u32 out_bus_fmt)
+{
+	struct drm_bridge_state *cur_state;
+	unsigned int num_in_bus_fmts, i;
+	struct drm_bridge *prev;
+	u32 *in_bus_fmts;
+	int ret;
+
+	prev = drm_bridge_chain_get_prev_bridge(cur);
+	cur_state = drm_atomic_get_new_bridge_state(crtc_state->state, cur);
+	if (WARN_ON(!cur_state))
+		return -EINVAL;
+
+	/*
+	 * Bus format negotiation is not supported by this bridge, let's pass
+	 * MEDIA_BUS_FMT_FIXED to the previous bridge in the chain and hope
+	 * that it can handle this situation gracefully (by providing
+	 * appropriate default values).
+	 */
+	if (!cur->funcs->atomic_get_input_bus_fmts) {
+		if (cur != first) {
+			ret = select_bus_fmt_recursive(first, prev, crtc_state,
+						       conn_state,
+						       MEDIA_BUS_FMT_FIXED);
+			if (ret)
+				return ret;
+		}
+
+		cur_state->input_bus_cfg.fmt = MEDIA_BUS_FMT_FIXED;
+		cur_state->output_bus_cfg.fmt = out_bus_fmt;
+		return 0;
+	}
+
+	in_bus_fmts = cur->funcs->atomic_get_input_bus_fmts(cur, cur_state,
+							    crtc_state,
+							    conn_state,
+							    out_bus_fmt,
+							    &num_in_bus_fmts);
+	if (!num_in_bus_fmts)
+		return -ENOTSUPP;
+	else if (!in_bus_fmts)
+		return -ENOMEM;
+
+	if (first == cur) {
+		cur_state->input_bus_cfg.fmt = in_bus_fmts[0];
+		cur_state->output_bus_cfg.fmt = out_bus_fmt;
+		kfree(in_bus_fmts);
+		return 0;
+	}
+
+	for (i = 0; i < num_in_bus_fmts; i++) {
+		ret = select_bus_fmt_recursive(first, prev, crtc_state,
+					       conn_state, in_bus_fmts[i]);
+		if (ret != -ENOTSUPP)
+			break;
+	}
+
+	if (!ret) {
+		cur_state->input_bus_cfg.fmt = in_bus_fmts[i];
+		cur_state->output_bus_cfg.fmt = out_bus_fmt;
+	}
+
+	kfree(in_bus_fmts);
+	return ret;
+}
+
+/*
+ * This function is called by &drm_atomic_bridge_chain_check() just before
+ * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
+ * It's providing bus format negotiation between bridge elements. The
+ * negotiation happens in reverse order, starting from the last element in
+ * the chain up to @bridge.
+ *
+ * Negotiation starts by retrieving supported output bus formats on the last
+ * bridge element and testing them one by one. The test is recursive, meaning
+ * that for each tested output format, the whole chain will be walked backward,
+ * and each element will have to choose an input bus format that can be
+ * transcoded to the requested output format. When a bridge element does not
+ * support transcoding into a specific output format -ENOTSUPP is returned and
+ * the next bridge element will have to try a different format. If none of the
+ * combinations worked, -ENOTSUPP is returned and the atomic modeset will fail.
+ *
+ * This implementation is relying on
+ * &drm_bridge_funcs.atomic_get_output_bus_fmts() and
+ * &drm_bridge_funcs.atomic_get_input_bus_fmts() to gather supported
+ * input/output formats.
+ * When &drm_bridge_funcs.atomic_get_output_bus_fmts() is not implemented by
+ * the last element of the chain, &drm_atomic_bridge_chain_select_bus_fmts()
+ * tries a single format: &drm_connector.display_info.bus_formats[0] if
+ * available, MEDIA_BUS_FMT_FIXED otherwise.
+ * When &drm_bridge_funcs.atomic_get_input_bus_fmts() is not implemented,
+ * &drm_atomic_bridge_chain_select_bus_fmts() skips the negotiation on the
+ * bridge element that lacks this hook and asks the previous element in the
+ * chain to try MEDIA_BUS_FMT_FIXED. It's up to bridge drivers to decide what
+ * to do in that case (fail if they want to enforce bus format negotiation, or
+ * provide a reasonable default if they need to support pipelines where not
+ * all elements support bus format negotiation).
+ */
+static int
+drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct drm_connector *conn = conn_state->connector;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_bridge_state *last_bridge_state;
+	unsigned int i, num_out_bus_fmts;
+	struct drm_bridge *last_bridge;
+	u32 *out_bus_fmts;
+	int ret = 0;
+
+	last_bridge = list_last_entry(&encoder->bridge_chain,
+				      struct drm_bridge, chain_node);
+	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							    last_bridge);
+	if (WARN_ON(!last_bridge_state))
+		return -EINVAL;
+
+	if (last_bridge->funcs->atomic_get_output_bus_fmts) {
+		const struct drm_bridge_funcs *funcs = last_bridge->funcs;
+
+		out_bus_fmts = funcs->atomic_get_output_bus_fmts(last_bridge,
+							last_bridge_state,
+							crtc_state,
+							conn_state,
+							&num_out_bus_fmts);
+		if (!num_out_bus_fmts)
+			return -ENOTSUPP;
+		else if (!out_bus_fmts)
+			return -ENOMEM;
+	} else {
+		num_out_bus_fmts = 1;
+		out_bus_fmts = kzalloc(sizeof(*out_bus_fmts), GFP_KERNEL);
+		if (!out_bus_fmts)
+			return -ENOMEM;
+
+		if (conn->display_info.num_bus_formats &&
+		    conn->display_info.bus_formats)
+			out_bus_fmts[0] = conn->display_info.bus_formats[0];
+		else
+			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
+	}
+
+	for (i = 0; i < num_out_bus_fmts; i++) {
+		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
+					       conn_state, out_bus_fmts[i]);
+		if (ret != -ENOTSUPP)
+			break;
+	}
+
+	kfree(out_bus_fmts);
+
+	return ret;
+}
+
+static void
+drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
+				      struct drm_connector *conn,
+				      struct drm_atomic_state *state)
+{
+	struct drm_bridge_state *bridge_state, *next_bridge_state;
+	struct drm_bridge *next_bridge;
+	u32 output_flags;
+
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	next_bridge = drm_bridge_chain_get_next_bridge(bridge);
+
+	/*
+	 * Let's try to apply the most common case here, that is, propagate
+	 * display_info flags for the last bridge, and propagate the input
+	 * flags of the next bridge element to the output end of the current
+	 * bridge when the bridge is not the last one.
+	 * There are exceptions to this rule, like when signal inversion is
+	 * happening at the board level, but that's something drivers can deal
+	 * with from their &drm_bridge_funcs.atomic_check() implementation by
+	 * simply overriding the flags value we've set here.
+	 */
+	if (!next_bridge) {
+		output_flags = conn->display_info.bus_flags;
+	} else {
+		next_bridge_state = drm_atomic_get_new_bridge_state(state,
+								next_bridge);
+		output_flags = next_bridge_state->input_bus_cfg.flags;
+	}
+
+	bridge_state->output_bus_cfg.flags = output_flags;
+
+	/*
+	 * Propage the output flags to the input end of the bridge. Again, it's
+	 * not necessarily what all bridges want, but that's what most of them
+	 * do, and by doing that by default we avoid forcing drivers to
+	 * duplicate the "dummy propagation" logic.
+	 */
+	bridge_state->input_bus_cfg.flags = output_flags;
+}
+
+/**
+ * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output format to
+ *						  the input end of a bridge
+ * @bridge: bridge control structure
+ * @bridge_state: new bridge state
+ * @crtc_state: new CRTC state
+ * @conn_state: new connector state
+ * @output_fmt: tested output bus format
+ * @num_input_fmts: will contain the size of the returned array
+ *
+ * Helper that propagate the output format to the input end of bridge.
+ * Particularly useful for dummy bridge elements like the panel_bridge.
+ *
+ * RETURNS:
+ * a valid format array of size @num_input_fmts, or NULL if the allocation
+ * failed or if @num_input_fmts is set to 0
+ */
+u32 *
+drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 1;
+	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = output_fmt;
+	return input_fmts;
+}
+EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
+
 /**
  * drm_atomic_bridge_chain_check() - Do an atomic check on the bridge chain
  * @bridge: bridge control structure
  * @crtc_state: new CRTC state
  * @conn_state: new connector state
  *
- * Calls &drm_bridge_funcs.atomic_check() (falls back on
+ * First trigger a bus format negotiation before calling
+ * &drm_bridge_funcs.atomic_check() (falls back on
  * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_check()
@@ -659,12 +897,29 @@ int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
 				  struct drm_crtc_state *crtc_state,
 				  struct drm_connector_state *conn_state)
 {
+	struct drm_connector *conn = conn_state->connector;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_bridge *iter;
+	int ret;
+
+	ret = drm_atomic_bridge_chain_select_bus_fmts(bridge, crtc_state,
+						      conn_state);
+	if (ret)
+		return ret;
 
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		int ret;
 
+		/*
+		 * Bus flags are propagated by default. If a bridge needs to
+		 * tweak the input bus flags for any reason, it should happen
+		 * in its &drm_bridge_funcs.atomic_check() implementation such
+		 * that preceding bridges in the chain can propagate the new
+		 * bus flags.
+		 */
+		drm_atomic_bridge_propagate_bus_flags(iter, conn,
+						      crtc_state->state);
+
 		ret = drm_atomic_bridge_check(iter, crtc_state, conn_state);
 		if (ret)
 			return ret;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3fb518494640..d37aaf34b882 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -34,15 +34,43 @@ struct drm_bridge;
 struct drm_bridge_timings;
 struct drm_panel;
 
+/**
+ * struct drm_bus_cfg - bus configuration
+ * @fmt: format used on this bus. This field should not be directly modified
+ *	 by drivers (&drm_atomic_bridge_chain_select_bus_fmts() takes care of
+ *	 the bus format negotiation).
+ * @flags: DRM_BUS_ flags used on this bus. Drivers should set the output bus
+ *	   flags to the input bus flags of the next bridge element (unless they
+ *	   have a good reason not to, like a passive signal inversion between
+ *	   those 2 elements). Input bus flags can be different from the output
+ *	   ones if there's some kind of conversion happening inside the bridge,
+ *	   but most of the times it's safe to just propagate the output bus
+ *	   flags to the input end.
+ *	   This bus flags selection/propagation should be done in the driver
+ *	   &drm_bridge_funcs.atomic_check() hook.
+ *
+ * Encodes the bus format and bus flags used by one end of the bridge or
+ * by the encoder output.
+ */
+struct drm_bus_cfg {
+	u32 fmt;
+	u32 flags;
+};
+
 /**
  * struct drm_bridge_state - Atomic bridge state object
  * @base: inherit from &drm_private_state
  * @bridge: the bridge this state refers to
+ * @input_bus_info: input bus information
+ * @output_bus_info: output bus information
  */
 struct drm_bridge_state {
 	struct drm_private_state base;
 
 	struct drm_bridge *bridge;
+
+	struct drm_bus_cfg input_bus_cfg;
+	struct drm_bus_cfg output_bus_cfg;
 };
 
 static inline struct drm_bridge_state *
@@ -393,6 +421,69 @@ struct drm_bridge_funcs {
 	void (*atomic_destroy_state)(struct drm_bridge *bridge,
 				     struct drm_bridge_state *state);
 
+	/**
+	 * @atomic_get_output_bus_fmts:
+	 *
+	 * Return the supported bus formats on the output end of a bridge.
+	 * The returned array must be allocated with kmalloc() and will be
+	 * freed by the caller, if the allocation fails, NULL should be
+	 * returned. num_output_fmts must be set to the returned array size.
+	 * Formats listed in the returned array should be listed in decreasing
+	 * preference order (the core will try all formats until it finds one
+	 * that works).
+	 *
+	 * This method is only called on the last element of the bridge chain
+	 * as part of the bus format negotiation process that happens in
+	 * &drm_atomic_bridge_chain_select_bus_fmts().
+	 * This method is optional. When not implemented, the core will
+	 * fallback to &drm_connector.display_info.bus_formats[0] if
+	 * &drm_connector.display_info.num_bus_formats > 0,
+	 * MEDIA_BUS_FMT_FIXED otherwise.
+	 */
+	u32 *(*atomic_get_output_bus_fmts)(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state,
+					   unsigned int *num_output_fmts);
+
+	/**
+	 * @atomic_get_input_bus_fmts:
+	 *
+	 * Return the supported bus formats on the input end of a bridge for
+	 * a specific output bus format.
+	 * The returned array must be allocated with kmalloc() and will be
+	 * freed by the caller, if the allocation fails, NULL should be
+	 * returned. num_output_fmts must be set to the returned array size.
+	 * Formats listed in the returned array should be listed in decreasing
+	 * preference order (the core will try all formats until it finds one
+	 * that works).
+	 *
+	 * This method is called on all element of the bridge chain as part of
+	 * the bus format negotiation process that happens in
+	 * &drm_atomic_bridge_chain_select_bus_fmts().
+	 * This method is optional. When not implemented, the core will bypass
+	 * bus format negotiation on this element of the bridge without
+	 * failing, and the previous element in the chain will be passed
+	 * MEDIA_BUS_FMT_FIXED as its output bus format.
+	 *
+	 * Bridge drivers that need to support being linked to bridges that are
+	 * not supporting bus format negotiation should handle the
+	 * output_fmt == MEDIA_BUS_FMT_FIXED case appropriately, by selecting a
+	 * sensible default value or extracting this information from somewhere
+	 * else (FW property, &drm_display_mode, &drm_display_info, ...)
+	 *
+	 * Note: even if input format selection on the first bridge has no
+	 * impact on the negotiation process (bus format negotiation stops once
+	 * we reach the first element of the chain), drivers are expected to
+	 * return accurate input formats.
+	 */
+	u32 *(*atomic_get_input_bus_fmts)(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state,
+					  u32 output_fmt,
+					  unsigned int *num_input_fmts);
+
 	/**
 	 * @atomic_check:
 	 *
@@ -407,6 +498,13 @@ struct drm_bridge_funcs {
 	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
 	 * one of them should be provided.
 	 *
+	 * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
+	 * &drm_bridge_state.input_bus_cfg.flags it should should happen in
+	 * this function. By default those fields are set to the next bridge
+	 * &drm_bridge_state.input_bus_cfg.flags value or
+	 * &drm_connector.display_info.bus_flags if the bridge is the last
+	 * element in the chain.
+	 *
 	 * RETURNS:
 	 * zero if the check passed, a negative error code otherwise.
 	 */
@@ -594,6 +692,14 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
 
+u32 *
+drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts);
+
 void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
 				      struct drm_bridge_state *state);
 struct drm_bridge_state *
-- 
2.21.0

