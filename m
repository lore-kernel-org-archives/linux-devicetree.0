Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97452CA9EB7
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E1D921928
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406876AbfJWPpU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37680 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406858AbfJWPpT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:19 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5E54B28F905;
        Wed, 23 Oct 2019 16:45:17 +0100 (BST)
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
Subject: [PATCH v3 01/21] drm/vc4: Declare the DSI encoder as a bridge element
Date:   Wed, 23 Oct 2019 17:44:52 +0200
Message-Id: <20191023154512.9762-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Encoder drivers will progressively transition to the drm_bridge
interface in place of the drm_encoder one.

Let's start with the VC4 driver, and use the ->pre_{enable,disable}()
hooks to get rid of the hack resetting encoder->bridge.next (which was
needed to control the encoder/bridge enable/disable sequence).

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* Embed a drm_bridge object in vc4_dsi since drm_encoder no longer has
  a dummy bridge

Changes in v2:
* New patch (replaces "drm/vc4: Get rid of the dsi->bridge field")
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 88 +++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index c9ba83ed49b9..49f8a313e759 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -498,7 +498,11 @@ struct vc4_dsi {
 
 	struct mipi_dsi_host dsi_host;
 	struct drm_encoder *encoder;
-	struct drm_bridge *bridge;
+
+	/* Embed a bridge object so we can implement bridge funcs instead of
+	 * encoder ones.
+	 */
+	struct drm_bridge bridge;
 
 	void __iomem *regs;
 
@@ -543,6 +547,11 @@ struct vc4_dsi {
 	struct debugfs_regset32 regset;
 };
 
+static inline struct vc4_dsi *bridge_to_vc4_dsi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct vc4_dsi, bridge);
+}
+
 #define host_to_dsi(host) container_of(host, struct vc4_dsi, dsi_host)
 
 static inline void
@@ -747,16 +756,11 @@ dsi_esc_timing(u32 ns)
 	return DIV_ROUND_UP(ns, ESC_TIME_NS);
 }
 
-static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
+static void vc4_dsi_bridge_post_disable(struct drm_bridge *bridge)
 {
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	struct device *dev = &dsi->pdev->dev;
 
-	drm_bridge_disable(dsi->bridge);
-	vc4_dsi_ulps(dsi, true);
-	drm_bridge_post_disable(dsi->bridge);
-
 	clk_disable_unprepare(dsi->pll_phy_clock);
 	clk_disable_unprepare(dsi->escape_clock);
 	clk_disable_unprepare(dsi->pixel_clock);
@@ -764,6 +768,13 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 	pm_runtime_put(dev);
 }
 
+static void vc4_dsi_bridge_disable(struct drm_bridge *bridge)
+{
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
+
+	vc4_dsi_ulps(dsi, true);
+}
+
 /* Extends the mode's blank intervals to handle BCM2835's integer-only
  * DSI PLL divider.
  *
@@ -777,12 +788,11 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
  * higher-than-expected clock rate to the panel, but that's what the
  * firmware does too.
  */
-static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
+static bool vc4_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
+				      const struct drm_display_mode *mode,
+				      struct drm_display_mode *adjusted_mode)
 {
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	struct clk *phy_parent = clk_get_parent(dsi->pll_phy_clock);
 	unsigned long parent_rate = clk_get_rate(phy_parent);
 	unsigned long pixel_clock_hz = mode->clock * 1000;
@@ -816,11 +826,11 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 	return true;
 }
 
-static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
+static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 {
+	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	struct device *dev = &dsi->pdev->dev;
 	bool debug_dump_regs = false;
 	unsigned long hs_clock;
@@ -1054,8 +1064,12 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	vc4_dsi_ulps(dsi, false);
+}
 
-	drm_bridge_pre_enable(dsi->bridge);
+static void vc4_dsi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
+	bool debug_dump_regs = false;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		DSI_PORT_WRITE(DISP0_CTRL,
@@ -1072,8 +1086,6 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 			       DSI_DISP0_ENABLE);
 	}
 
-	drm_bridge_enable(dsi->bridge);
-
 	if (debug_dump_regs) {
 		struct drm_printer p = drm_info_printer(&dsi->pdev->dev);
 		dev_info(&dsi->pdev->dev, "DSI regs after:\n");
@@ -1290,10 +1302,12 @@ static const struct mipi_dsi_host_ops vc4_dsi_host_ops = {
 	.transfer = vc4_dsi_host_transfer,
 };
 
-static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
-	.disable = vc4_dsi_encoder_disable,
-	.enable = vc4_dsi_encoder_enable,
-	.mode_fixup = vc4_dsi_encoder_mode_fixup,
+static const struct drm_bridge_funcs vc4_dsi_bridge_funcs = {
+	.pre_enable = vc4_dsi_bridge_pre_enable,
+	.enable = vc4_dsi_bridge_enable,
+	.disable = vc4_dsi_bridge_disable,
+	.post_disable = vc4_dsi_bridge_post_disable,
+	.mode_fixup = vc4_dsi_bridge_mode_fixup,
 };
 
 static const struct of_device_id vc4_dsi_dt_match[] = {
@@ -1445,6 +1459,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct vc4_dsi_encoder *vc4_dsi_encoder;
+	struct drm_bridge *next_bridge;
 	struct drm_panel *panel;
 	const struct of_device_id *match;
 	dma_cap_mask_t dma_mask;
@@ -1561,7 +1576,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->bridge);
+					  &panel, &next_bridge);
 	if (ret) {
 		/* If the bridge or panel pointed by dev->of_node is not
 		 * enabled, just return 0 here so that we don't prevent the DRM
@@ -1576,10 +1591,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	if (panel) {
-		dsi->bridge = devm_drm_panel_bridge_add_typed(dev, panel,
+		next_bridge = devm_drm_panel_bridge_add_typed(dev, panel,
 							      DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(dsi->bridge))
-			return PTR_ERR(dsi->bridge);
+		if (IS_ERR(next_bridge))
+			return PTR_ERR(next_bridge);
 	}
 
 	/* The esc clock rate is supposed to always be 100Mhz. */
@@ -1598,19 +1613,20 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_init(drm, dsi->encoder, &vc4_dsi_encoder_funcs,
 			 DRM_MODE_ENCODER_DSI, NULL);
-	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
 
-	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL);
+	/* Declare ourself as the first bridge element. */
+	dsi->bridge.funcs = &vc4_dsi_bridge_funcs;
+	ret = drm_bridge_attach(dsi->encoder, &dsi->bridge, NULL);
+	if (ret) {
+		dev_err(dev, "bridge attach failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_bridge_attach(dsi->encoder, next_bridge, &dsi->bridge);
 	if (ret) {
 		dev_err(dev, "bridge attach failed: %d\n", ret);
 		return ret;
 	}
-	/* Disable the atomic helper calls into the bridge.  We
-	 * manually call the bridge pre_enable / enable / etc. calls
-	 * from our driver, since we need to sequence them within the
-	 * encoder's enable/disable paths.
-	 */
-	dsi->encoder->bridge = NULL;
 
 	if (dsi->port == 0)
 		vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
@@ -1629,7 +1645,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
-	if (dsi->bridge)
+	if (dsi->bridge.next)
 		pm_runtime_disable(dev);
 
 	vc4_dsi_encoder_destroy(dsi->encoder);
-- 
2.21.0

