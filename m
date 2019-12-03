Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248A0C43215
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 064202154A
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfLCOP0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 09:15:26 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58948 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfLCOP0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 09:15:26 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 388A52800D3;
        Tue,  3 Dec 2019 14:15:24 +0000 (GMT)
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
        devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 02/11] drm/bridge: Introduce drm_bridge_get_next_bridge()
Date:   Tue,  3 Dec 2019 15:15:06 +0100
Message-Id: <20191203141515.3597631-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203141515.3597631-1-boris.brezillon@collabora.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

And use it in drivers accessing the bridge->next field directly.
This is part of our attempt to make the bridge chain a double-linked list
based on the generic list helpers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v4:
* Rename the helper
* Add R-bs

Changes in v3:
* Inline drm_bridge_chain_get_next_bridge() (Suggested by Laurent)

Changes in v2:
* Kill the last/first helpers (they're not really needed)
* Drop the !bridge || !bridge->encoder test
---
 drivers/gpu/drm/drm_encoder.c          |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c    |  6 ++++--
 drivers/gpu/drm/omapdrm/omap_drv.c     |  4 ++--
 drivers/gpu/drm/omapdrm/omap_encoder.c |  3 ++-
 include/drm/drm_bridge.h               | 13 +++++++++++++
 5 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 80d88a55302e..fcd3af1ac432 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -171,7 +171,7 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
 		struct drm_bridge *next;
 
 		while (bridge) {
-			next = bridge->next;
+			next = drm_bridge_get_next_bridge(bridge);
 			drm_bridge_detach(bridge);
 			bridge = next;
 		}
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ee3a5e9c10c4..5e4a4dbda443 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1238,16 +1238,18 @@ static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
 				    struct drm_display_mode *mode)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+	struct drm_bridge *next_bridge;
 
 	dev_dbg(hdmi->dev, "xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
 		mode->hdisplay, mode->vdisplay, mode->vrefresh,
 		!!(mode->flags & DRM_MODE_FLAG_INTERLACE), mode->clock * 1000);
 
-	if (hdmi->bridge.next) {
+	next_bridge = drm_bridge_get_next_bridge(&hdmi->bridge);
+	if (next_bridge) {
 		struct drm_display_mode adjusted_mode;
 
 		drm_mode_copy(&adjusted_mode, mode);
-		if (!drm_bridge_chain_mode_fixup(hdmi->bridge.next, mode,
+		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
 						 &adjusted_mode))
 			return MODE_BAD;
 	}
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index b3e22c890c51..d2750f60f519 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -217,8 +217,8 @@ static int omap_display_id(struct omap_dss_device *output)
 	} else if (output->bridge) {
 		struct drm_bridge *bridge = output->bridge;
 
-		while (bridge->next)
-			bridge = bridge->next;
+		while (drm_bridge_get_next_bridge(bridge))
+			bridge = drm_bridge_get_next_bridge(bridge);
 
 		node = bridge->of_node;
 	} else if (output->panel) {
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 24bbe9f2a32e..4f2165a37795 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -126,7 +126,8 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	for (dssdev = output; dssdev; dssdev = dssdev->next)
 		omap_encoder_update_videomode_flags(&vm, dssdev->bus_flags);
 
-	for (bridge = output->bridge; bridge; bridge = bridge->next) {
+	for (bridge = output->bridge; bridge;
+	     bridge = drm_bridge_get_next_bridge(bridge)) {
 		if (!bridge->timings)
 			continue;
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 726435baf4ad..46fc17c63a44 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -409,6 +409,19 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous);
 
+/**
+ * drm_bridge_get_next_bridge() - Get the next bridge in the chain
+ * @bridge: bridge object
+ *
+ * RETURNS:
+ * the next bridge in the chain after @bridge, or NULL if @bridge is the last.
+ */
+static inline struct drm_bridge *
+drm_bridge_get_next_bridge(struct drm_bridge *bridge)
+{
+	return bridge->next;
+}
+
 bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
 				 struct drm_display_mode *adjusted_mode);
-- 
2.23.0

