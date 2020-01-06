Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E6EC33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 14:34:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C67642072E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 14:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wgpmWl5r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgAFOeU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 09:34:20 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33306 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgAFOeU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 09:34:20 -0500
Received: by mail-wm1-f65.google.com with SMTP id d139so12090026wmd.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 06:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BW7/Q9SmgXjEBag6ESTozzDx23tCYhAdUPOI1fzi/oc=;
        b=wgpmWl5rRKey8Iyqtw+LPx64rvQYR3iymW74UbODYAGEbT6JvT3nnZuBpEZhlv4G+X
         bzow8ioFwLtW1zWeZ4KYIj6OwfszheexmuD2DOI3C5z3qx++74dI/dyMDPH5rdnmJHYN
         IP1NGsCf81fyn1RW6lUzjiN4GJj9ePryxpJS5Lvn5XofS4TU18R7+E5nFrZ8eyxB49Lx
         5WslIuDIFN0tTAGO0v7V/1G3xAcZjHlmvrLlUuhfaUYxE2s55i6Vw0blwYWnAiXtqtx1
         mCMXnsQbC0H8CIQtNCQ54+oaraNAXobtAEvuIaxxMKXoai9oKYUtEK+iWRFKEVhiwHTn
         bD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BW7/Q9SmgXjEBag6ESTozzDx23tCYhAdUPOI1fzi/oc=;
        b=h3BMHJjznyYmguPhMkP4Ch2v+4DBnNSSiVNakLKrLBk8Obh0q2PhZw2H8nqiDz/w3W
         x/Pp2LjRI2mal5ceq7jZ8M5oJg8BB1L3hMn2NXQwJ/q2GPOMLNHIee2fpj0aXd06svvg
         m4TmpZqGdtZ5RkxclrY5i8Bs9Z/1rVEqutrQ8Q06YNmYG8V9tfbJ7gn7T5C23PR5VPeQ
         P8RsgDQbtlMaktmUot/HCJ1aRrCH3QQAWx6ofauVNFNab2cuArQdDti5GnRM3Dxb5OGk
         A5j0GqO0gBp5Hq61j8da3NWqMubKugCp7/xc0ES0GdvU67mq568plPlx607o0cmN3EUe
         R17A==
X-Gm-Message-State: APjAAAXnzZ1xA4Nu/I18wwuupZiQYCEcl0wr20pOx8dwsCWP8u0yhX0U
        4ehJBA39at5+6bT9AwqKIpIJ4A==
X-Google-Smtp-Source: APXvYqyxTOefNlEN0fsommmgULqg7qhx9ya/d/KNccmrmZhorWxKFRzqN2NxcLqA7TMZrpgT7KcGVA==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr36430553wma.89.1578321257034;
        Mon, 06 Jan 2020 06:34:17 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v17sm73297659wrt.91.2020.01.06.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 06:34:16 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH v6 2/4] drm/bridge: Patch atomic hooks to take a drm_bridge_state
Date:   Mon,  6 Jan 2020 15:34:07 +0100
Message-Id: <20200106143409.32321-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200106143409.32321-1-narmstrong@baylibre.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

This way the drm_bridge_funcs interface is consistent with the rest of
the subsystem.

The only driver implementing those hooks (analogix DP) is patched too.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes in v6:
* Also fixed rcar-du/rcar_lvds.c same as analogix/analogix_dp_core.c

Changes in v5:
* None

Changes in v4:
* Rename func params into old_bridge_state
* Add Laurent's Rb

Changes in v3:
* Old state clarification moved to a separate patch

Changes in v2:
* Pass the old bridge state
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 41 +++++++------
 drivers/gpu/drm/drm_bridge.c                  | 61 +++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  5 +-
 include/drm/drm_bridge.h                      |  8 +--
 4 files changed, 80 insertions(+), 35 deletions(-)

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
index a213c9042f2c..872e159fcb42 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -501,10 +501,19 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 
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
@@ -535,10 +544,20 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 
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
@@ -567,10 +586,19 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 
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
@@ -600,10 +628,19 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 
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
index 8ffa4fbbdeb3..b8b22dc55bdb 100644
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
+				     struct drm_bridge_state *state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index fc7c71f4de55..52d3ed150618 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -282,7 +282,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
-				  struct drm_atomic_state *old_state);
+				  struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_enable:
@@ -307,7 +307,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
-			      struct drm_atomic_state *old_state);
+			      struct drm_bridge_state *old_bridge_state);
 	/**
 	 * @atomic_disable:
 	 *
@@ -330,7 +330,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
-			       struct drm_atomic_state *old_state);
+			       struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_post_disable:
@@ -356,7 +356,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
-				    struct drm_atomic_state *old_state);
+				    struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_duplicate_state:
-- 
2.22.0

