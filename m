Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56691CA9EBD
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3608D2086D
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436476AbfJWPpd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38070 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436474AbfJWPpd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:33 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1F33528F911;
        Wed, 23 Oct 2019 16:45:31 +0100 (BST)
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
Subject: [PATCH v3 16/21] drm/bridge: lvds-encoder: Implement basic bus format negotiation
Date:   Wed, 23 Oct 2019 17:45:07 +0200
Message-Id: <20191023154512.9762-17-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some LVDS encoder might support several input/output bus formats. Add
a way to describe the one used on a specific design by adding optional
'data-mapping' properties to the input/output ports.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* Use bus-width for the rgb24/rgb18 distinction
* Adjust code to match core changes
* Get rid of of_get_data_mapping()
* Don't implement ->atomic_check() (the core now takes care of bus
  flags propagation)

Changes in v2:
* Make the bus-format negotiation logic more generic
---
 drivers/gpu/drm/bridge/lvds-encoder.c | 72 +++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
index e2132a8d5106..a2a8f7f4ac97 100644
--- a/drivers/gpu/drm/bridge/lvds-encoder.c
+++ b/drivers/gpu/drm/bridge/lvds-encoder.c
@@ -6,6 +6,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
@@ -16,6 +17,8 @@ struct lvds_encoder {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *powerdown_gpio;
+	u32 output_fmt;
+	u32 input_fmt;
 };
 
 static int lvds_encoder_attach(struct drm_bridge *bridge)
@@ -48,10 +51,40 @@ static void lvds_encoder_disable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 1);
 }
 
+static u32 *lvds_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state,
+					   u32 output_fmt,
+					   unsigned int *num_input_fmts)
+{
+	struct lvds_encoder *lvds_encoder = container_of(bridge,
+							 struct lvds_encoder,
+							 bridge);
+	u32 *input_fmts;
+
+	if (output_fmt == MEDIA_BUS_FMT_FIXED ||
+	    output_fmt == lvds_encoder->output_fmt)
+		*num_input_fmts = 1;
+	else
+		*num_input_fmts = 0;
+
+	if (!*num_input_fmts)
+		return NULL;
+
+	input_fmts = kcalloc(*num_input_fmts, sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = lvds_encoder->input_fmt;
+	return input_fmts;
+}
+
 static struct drm_bridge_funcs funcs = {
 	.attach = lvds_encoder_attach,
 	.enable = lvds_encoder_enable,
 	.disable = lvds_encoder_disable,
+	.atomic_get_input_bus_fmts = lvds_atomic_get_input_bus_fmts,
 };
 
 static int lvds_encoder_probe(struct platform_device *pdev)
@@ -62,11 +95,16 @@ static int lvds_encoder_probe(struct platform_device *pdev)
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_encoder *lvds_encoder;
+	const char *output_data_mapping = NULL;
+	u32 input_bus_width = 0;
 
 	lvds_encoder = devm_kzalloc(dev, sizeof(*lvds_encoder), GFP_KERNEL);
 	if (!lvds_encoder)
 		return -ENOMEM;
 
+	lvds_encoder->input_fmt = MEDIA_BUS_FMT_FIXED;
+	lvds_encoder->output_fmt = MEDIA_BUS_FMT_FIXED;
+
 	lvds_encoder->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							       GPIOD_OUT_HIGH);
 	if (IS_ERR(lvds_encoder->powerdown_gpio)) {
@@ -77,6 +115,25 @@ static int lvds_encoder_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	port = of_graph_get_port_by_id(dev->of_node, 0);
+	if (!port) {
+		dev_dbg(dev, "port 0 not found\n");
+		return -ENXIO;
+	}
+
+	of_node_put(port);
+
+	if (of_property_read_u32(port, "bus-width", &input_bus_width)) {
+		lvds_encoder->input_fmt = MEDIA_BUS_FMT_FIXED;
+	} else if (input_bus_width == 18) {
+		lvds_encoder->input_fmt = MEDIA_BUS_FMT_RGB666_1X18;
+	} else if (input_bus_width == 24) {
+		lvds_encoder->input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+	} else {
+		dev_dbg(dev, "unsupported bus-width)\n");
+		return -ENOTSUPP;
+	}
+
 	/* Locate the panel DT node. */
 	port = of_graph_get_port_by_id(dev->of_node, 1);
 	if (!port) {
@@ -84,6 +141,21 @@ static int lvds_encoder_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	of_property_read_string(port, "data-mapping", &output_data_mapping);
+	if (!output_data_mapping) {
+		lvds_encoder->output_fmt = MEDIA_BUS_FMT_FIXED;
+	} else if (!strcmp(output_data_mapping, "jeida-18")) {
+		lvds_encoder->output_fmt = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
+	} else if (!strcmp(output_data_mapping, "jeida-24")) {
+		lvds_encoder->output_fmt = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	} else if (!strcmp(output_data_mapping, "vesa-24")) {
+		lvds_encoder->output_fmt = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
+	} else {
+		of_node_put(port);
+		dev_dbg(dev, "unsupported output data-mapping\n");
+		return -ENOTSUPP;
+	}
+
 	endpoint = of_get_child_by_name(port, "endpoint");
 	of_node_put(port);
 	if (!endpoint) {
-- 
2.21.0

