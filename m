Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CD0C33CB6
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 09:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC52B2253D
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 09:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgAWJxn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 04:53:43 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43954 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbgAWJxm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 04:53:42 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0071D293D07;
        Thu, 23 Jan 2020 09:53:39 +0000 (GMT)
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
Subject: [PATCH v8 05/12] drm/bridge: Add an ->atomic_check() hook
Date:   Thu, 23 Jan 2020 10:53:26 +0100
Message-Id: <20200123095333.2085810-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123095333.2085810-1-boris.brezillon@collabora.com>
References: <20200123095333.2085810-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

So that bridge drivers have a way to check/reject an atomic operation.
The drm_atomic_bridge_chain_check() (which is just a wrapper around
the ->atomic_check() hook) is called in place of
drm_bridge_chain_mode_fixup() (when ->atomic_check() is not implemented,
the core falls back on ->mode_fixup(), so the behavior should stay
the same for existing bridge drivers).

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed by: Jernej Skrabec <jernej.skrabec@siol.net>
Tested-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v7:
* Fix a NULL pointer dereference
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 +++---
 drivers/gpu/drm/drm_bridge.c        | 66 +++++++++++++++++++++++++++++
 include/drm/drm_bridge.h            | 29 ++++++++++++-
 3 files changed, 100 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ad8eae98d9e8..afe14f72a824 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -437,12 +437,12 @@ mode_fixup(struct drm_atomic_state *state)
 		funcs = encoder->helper_private;
 
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		ret = drm_bridge_chain_mode_fixup(bridge,
-					&new_crtc_state->mode,
-					&new_crtc_state->adjusted_mode);
-		if (!ret) {
-			DRM_DEBUG_ATOMIC("Bridge fixup failed\n");
-			return -EINVAL;
+		ret = drm_atomic_bridge_chain_check(bridge,
+						    new_crtc_state,
+						    new_conn_state);
+		if (ret) {
+			DRM_DEBUG_ATOMIC("Bridge atomic check failed\n");
+			return ret;
 		}
 
 		if (funcs && funcs->atomic_check) {
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 18d2c42491ca..dd3a2a9f87d3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -572,6 +572,72 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
+static int drm_atomic_bridge_check(struct drm_bridge *bridge,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	if (bridge->funcs->atomic_check) {
+		struct drm_bridge_state *bridge_state;
+		int ret;
+
+		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							       bridge);
+		if (WARN_ON(!bridge_state))
+			return -EINVAL;
+
+		ret = bridge->funcs->atomic_check(bridge, bridge_state,
+						  crtc_state, conn_state);
+		if (ret)
+			return ret;
+	} else if (bridge->funcs->mode_fixup) {
+		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
+					       &crtc_state->adjusted_mode))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * drm_atomic_bridge_chain_check() - Do an atomic check on the bridge chain
+ * @bridge: bridge control structure
+ * @crtc_state: new CRTC state
+ * @conn_state: new connector state
+ *
+ * Calls &drm_bridge_funcs.atomic_check() (falls back on
+ * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
+ * starting from the last bridge to the first. These are called before calling
+ * &drm_encoder_helper_funcs.atomic_check()
+ *
+ * RETURNS:
+ * 0 on success, a negative error code on failure
+ */
+int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
+{
+	struct drm_encoder *encoder;
+	struct drm_bridge *iter;
+
+	if (!bridge)
+		return 0;
+
+	encoder = bridge->encoder;
+	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+		int ret;
+
+		ret = drm_atomic_bridge_check(iter, crtc_state, conn_state);
+		if (ret)
+			return ret;
+
+		if (iter == bridge)
+			break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c971ba143e3e..04815ab948dd 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -111,7 +111,9 @@ struct drm_bridge_funcs {
 	 * this function passes all other callbacks must succeed for this
 	 * configuration.
 	 *
-	 * The @mode_fixup callback is optional.
+	 * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
+	 * is not called when &drm_bridge_funcs.atomic_check() is implemented,
+	 * so only one of them should be provided.
 	 *
 	 * NOTE:
 	 *
@@ -368,6 +370,28 @@ struct drm_bridge_funcs {
 	void (*atomic_destroy_state)(struct drm_bridge *bridge,
 				     struct drm_bridge_state *state);
 
+	/**
+	 * @atomic_check:
+	 *
+	 * This method is responsible for checking bridge state correctness.
+	 * It can also check the state of the surrounding components in chain
+	 * to make sure the whole pipeline can work properly.
+	 *
+	 * &drm_bridge_funcs.atomic_check() hooks are called in reverse
+	 * order (from the last to the first bridge).
+	 *
+	 * This method is optional. &drm_bridge_funcs.mode_fixup() is not
+	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
+	 * one of them should be provided.
+	 *
+	 * RETURNS:
+	 * zero if the check passed, a negative error code otherwise.
+	 */
+	int (*atomic_check)(struct drm_bridge *bridge,
+			    struct drm_bridge_state *bridge_state,
+			    struct drm_crtc_state *crtc_state,
+			    struct drm_connector_state *conn_state);
+
 	/**
 	 * @atomic_reset:
 	 *
@@ -535,6 +559,9 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
 void drm_bridge_chain_enable(struct drm_bridge *bridge);
 
+int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state);
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 				     struct drm_atomic_state *state);
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
-- 
2.24.1

