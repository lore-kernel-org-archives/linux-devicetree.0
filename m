Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD05C35246
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 13:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CCB024692
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 13:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgA1Nz0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jan 2020 08:55:26 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45150 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgA1NzZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jan 2020 08:55:25 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2EF1229450B;
        Tue, 28 Jan 2020 13:55:24 +0000 (GMT)
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
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v10 08/12] drm/bridge: lvds-codec: Implement basic bus format negotiation
Date:   Tue, 28 Jan 2020 14:55:10 +0100
Message-Id: <20200128135514.108171-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128135514.108171-1-boris.brezillon@collabora.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some DPI -> LVDS encoders might support several input bus width. Add a
DT property to describe the bus width used on a specific design.

v10:
* Add changelog to the commit message

v8 -> v9:
* No changes

v7:
* Fix a use-after-release problem
* Get rid of the data-mapping parsing
* Use kmalloc instead of kcalloc.

v4 -> v6:
* Not part of the series

v3:
* Use bus-width for the rgb24/rgb18 distinction
* Adjust code to match core changes
* Get rid of of_get_data_mapping()
* Don't implement ->atomic_check() (the core now takes care of bus
  flags propagation)

v2:
* Make the bus-format negotiation logic more generic

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 64 ++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 5f04cc11227e..f4fd8472c335 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_panel.h>
 
@@ -19,6 +20,7 @@ struct lvds_codec {
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *powerdown_gpio;
 	u32 connector_type;
+	u32 input_fmt;
 };
 
 static int lvds_codec_attach(struct drm_bridge *bridge)
@@ -48,18 +50,47 @@ static void lvds_codec_disable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
 }
 
+static u32 *
+lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state,
+				     u32 output_fmt,
+				     unsigned int *num_input_fmts)
+{
+	struct lvds_codec *lvds_codec = container_of(bridge,
+						     struct lvds_codec, bridge);
+	u32 *input_fmts;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts) {
+		*num_input_fmts = 0;
+		return NULL;
+	}
+
+	*num_input_fmts = 1;
+	input_fmts[0] = lvds_codec->input_fmt;
+	return input_fmts;
+}
+
 static struct drm_bridge_funcs funcs = {
 	.attach = lvds_codec_attach,
 	.enable = lvds_codec_enable,
 	.disable = lvds_codec_disable,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts = lvds_codec_atomic_get_input_bus_fmts,
 };
 
 static int lvds_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
+	struct device_node *np;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	u32 input_bus_width;
+	int err;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
@@ -69,22 +100,43 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
 	if (IS_ERR(lvds_codec->powerdown_gpio)) {
-		int err = PTR_ERR(lvds_codec->powerdown_gpio);
+		err = PTR_ERR(lvds_codec->powerdown_gpio);
 
 		if (err != -EPROBE_DEFER)
 			dev_err(dev, "powerdown GPIO failure: %d\n", err);
 		return err;
 	}
 
+	np = of_graph_get_port_by_id(dev->of_node, 0);
+	if (!np) {
+		dev_dbg(dev, "port 0 not found\n");
+		return -ENXIO;
+	}
+
+	err = of_property_read_u32(np, "bus-width", &input_bus_width);
+	of_node_put(np);
+
+	if (err) {
+		lvds_codec->input_fmt = MEDIA_BUS_FMT_FIXED;
+	} else if (input_bus_width == 18) {
+		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB666_1X18;
+	} else if (input_bus_width == 24) {
+		lvds_codec->input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+	} else {
+		dev_dbg(dev, "unsupported bus-width value %u on port 0\n",
+			input_bus_width);
+		return -ENOTSUPP;
+	}
+
 	/* Locate the panel DT node. */
-	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
-	if (!panel_node) {
+	np = of_graph_get_remote_node(dev->of_node, 1, 0);
+	if (!np) {
 		dev_dbg(dev, "panel DT node not found\n");
 		return -ENXIO;
 	}
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
+	panel = of_drm_find_panel(np);
+	of_node_put(np);
 	if (IS_ERR(panel)) {
 		dev_dbg(dev, "panel not found, deferring probe\n");
 		return PTR_ERR(panel);
-- 
2.24.1

