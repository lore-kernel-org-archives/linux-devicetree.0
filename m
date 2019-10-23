Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB2DCA9EB7
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23A162086D
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436487AbfJWPpc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436464AbfJWPpc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:32 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4E57E28F96E;
        Wed, 23 Oct 2019 16:45:30 +0100 (BST)
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
Subject: [PATCH v3 15/21] drm/imx: pd: Use bus format/flags provided by the bridge when available
Date:   Wed, 23 Oct 2019 17:45:06 +0200
Message-Id: <20191023154512.9762-16-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Now that bridges can expose the bus format/flags they expect, we can
use those instead of the relying on the display_info provided by the
connector (which is only valid if the encoder is directly connected
to bridge element driving the panel/display).

We also explicitly expose the bus formats supported by our encoder by
filling encoder->output_bus_caps with proper info.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Hi Philipp,

I think I addressed all your comments except the addition of
SYNC_DRIVE_POSEDGE/NEGEDGE flags, which would require changing
ipu_crtc_mode_set_nofb() to take those flags into account or
turning those flags into their PIXDATA counterpart. If you don't mind,
I'd like to leave that for later.

Regards,

Boris

Changes in v3 (all suggested by Philipp):
* Adjust to match core changes
* Propagate output format to input format
* Pick a default value when output_fmt = _FIXED
* Add missing BGR888 and GBR888 fmts to imx_pd_bus_fmts[]

Changes in v2:
* Adjust things to match the new bus-format negotiation infra
---
 drivers/gpu/drm/imx/parallel-display.c | 174 +++++++++++++++++++++----
 1 file changed, 150 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 35518e5de356..28ae083df3ca 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -24,6 +24,7 @@
 struct imx_parallel_display {
 	struct drm_connector connector;
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct device *dev;
 	void *edid;
 	int edid_len;
@@ -31,7 +32,7 @@ struct imx_parallel_display {
 	u32 bus_flags;
 	struct drm_display_mode mode;
 	struct drm_panel *panel;
-	struct drm_bridge *bridge;
+	struct drm_bridge *next_bridge;
 };
 
 static inline struct imx_parallel_display *con_to_imxpd(struct drm_connector *c)
@@ -44,6 +45,11 @@ static inline struct imx_parallel_display *enc_to_imxpd(struct drm_encoder *e)
 	return container_of(e, struct imx_parallel_display, encoder);
 }
 
+static inline struct imx_parallel_display *bridge_to_imxpd(struct drm_bridge *b)
+{
+	return container_of(b, struct imx_parallel_display, bridge);
+}
+
 static int imx_pd_connector_get_modes(struct drm_connector *connector)
 {
 	struct imx_parallel_display *imxpd = con_to_imxpd(connector);
@@ -89,37 +95,151 @@ static struct drm_encoder *imx_pd_connector_best_encoder(
 	return &imxpd->encoder;
 }
 
-static void imx_pd_encoder_enable(struct drm_encoder *encoder)
+static void imx_pd_bridge_enable(struct drm_bridge *bridge)
 {
-	struct imx_parallel_display *imxpd = enc_to_imxpd(encoder);
+	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
 
 	drm_panel_prepare(imxpd->panel);
 	drm_panel_enable(imxpd->panel);
 }
 
-static void imx_pd_encoder_disable(struct drm_encoder *encoder)
+static void imx_pd_bridge_disable(struct drm_bridge *bridge)
 {
-	struct imx_parallel_display *imxpd = enc_to_imxpd(encoder);
+	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
 
 	drm_panel_disable(imxpd->panel);
 	drm_panel_unprepare(imxpd->panel);
 }
 
-static int imx_pd_encoder_atomic_check(struct drm_encoder *encoder,
-				       struct drm_crtc_state *crtc_state,
-				       struct drm_connector_state *conn_state)
+static const u32 imx_pd_bus_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_BGR888_1X24,
+	MEDIA_BUS_FMT_GBR888_1X24,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
+	MEDIA_BUS_FMT_RGB565_1X16,
+};
+
+static u32 *
+imx_pd_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state,
+					 unsigned int *num_output_fmts)
+{
+	struct drm_display_info *di = &conn_state->connector->display_info;
+	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
+	u32 *output_fmts;
+
+	if (!imxpd->bus_format && !di->num_bus_formats)
+		*num_output_fmts = ARRAY_SIZE(imx_pd_bus_fmts);
+	else
+		*num_output_fmts = 1;
+
+	output_fmts = kcalloc(*num_output_fmts, sizeof(*output_fmts),
+			      GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	if (!imxpd->bus_format && di->num_bus_formats)
+		output_fmts[0] = di->bus_formats[0];
+	else if (!imxpd->bus_format)
+		memcpy(output_fmts, imx_pd_bus_fmts,
+		       ARRAY_SIZE(imx_pd_bus_fmts));
+	else
+		output_fmts[0] = imxpd->bus_format;
+
+	return output_fmts;
+}
+
+static u32 *
+imx_pd_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+	if (output_fmt == MEDIA_BUS_FMT_FIXED) {
+		/*
+		 * The next bridge does not support bus format negotiation,
+		 * let's use the default RGB888 value.
+		 */
+		*num_input_fmts = 1;
+		output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+	} else if (!imxpd->bus_format) {
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(imx_pd_bus_fmts); i++) {
+			if (imx_pd_bus_fmts[i] == output_fmt) {
+				*num_input_fmts = 1;
+				break;
+			}
+		}
+	} else if (imxpd->bus_format == output_fmt) {
+		*num_input_fmts = 1;
+	}
+
+	if (!*num_input_fmts)
+		return NULL;
+
+	input_fmts = kcalloc(*num_input_fmts, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = output_fmt;
+	return input_fmts;
+}
+
+static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
 {
 	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
 	struct drm_display_info *di = &conn_state->connector->display_info;
-	struct imx_parallel_display *imxpd = enc_to_imxpd(encoder);
+	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
+	struct drm_bridge_state *next_bridge_state = NULL;
+	struct drm_bridge *next_bridge;
+	u32 bus_flags, bus_fmt;
+	unsigned int i;
 
-	if (!imxpd->bus_format && di->num_bus_formats) {
-		imx_crtc_state->bus_flags = di->bus_flags;
-		imx_crtc_state->bus_format = di->bus_formats[0];
-	} else {
-		imx_crtc_state->bus_flags = imxpd->bus_flags;
-		imx_crtc_state->bus_format = imxpd->bus_format;
+	next_bridge = drm_bridge_chain_get_next_bridge(bridge);
+	if (next_bridge)
+		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+								    next_bridge);
+
+	if (next_bridge_state)
+		bus_flags = next_bridge_state->input_bus_cfg.flags;
+	else if (!imxpd->bus_format && di->num_bus_formats)
+		bus_flags = di->bus_flags;
+	else
+		bus_flags = imxpd->bus_flags;
+
+	bus_fmt = bridge_state->input_bus_cfg.fmt;
+	for (i = 0; i < ARRAY_SIZE(imx_pd_bus_fmts); i++) {
+		if (imx_pd_bus_fmts[i] == bus_fmt)
+			break;
 	}
+
+	if (i == ARRAY_SIZE(imx_pd_bus_fmts))
+		return -EINVAL;
+
+	if (bus_flags &
+	    ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
+	      DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
+	      DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE))
+		return -EINVAL;
+
+	bridge_state->output_bus_cfg.flags = bus_flags;
+	bridge_state->input_bus_cfg.flags = bus_flags;
+	imx_crtc_state->bus_flags = bus_flags;
+	imx_crtc_state->bus_format = bridge_state->input_bus_cfg.fmt;
 	imx_crtc_state->di_hsync_pin = 2;
 	imx_crtc_state->di_vsync_pin = 3;
 
@@ -143,10 +263,12 @@ static const struct drm_encoder_funcs imx_pd_encoder_funcs = {
 	.destroy = imx_drm_encoder_destroy,
 };
 
-static const struct drm_encoder_helper_funcs imx_pd_encoder_helper_funcs = {
-	.enable = imx_pd_encoder_enable,
-	.disable = imx_pd_encoder_disable,
-	.atomic_check = imx_pd_encoder_atomic_check,
+static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
+	.enable = imx_pd_bridge_enable,
+	.disable = imx_pd_bridge_disable,
+	.atomic_check = imx_pd_bridge_atomic_check,
+	.atomic_get_input_bus_fmts = imx_pd_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,
 };
 
 static int imx_pd_register(struct drm_device *drm,
@@ -166,11 +288,13 @@ static int imx_pd_register(struct drm_device *drm,
 	 */
 	imxpd->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_helper_add(encoder, &imx_pd_encoder_helper_funcs);
 	drm_encoder_init(drm, encoder, &imx_pd_encoder_funcs,
 			 DRM_MODE_ENCODER_NONE, NULL);
 
-	if (!imxpd->bridge) {
+	imxpd->bridge.funcs = &imx_pd_bridge_funcs;
+	drm_bridge_attach(encoder, &imxpd->bridge, NULL);
+
+	if (!imxpd->next_bridge) {
 		drm_connector_helper_add(&imxpd->connector,
 				&imx_pd_connector_helper_funcs);
 		drm_connector_init(drm, &imxpd->connector,
@@ -181,8 +305,9 @@ static int imx_pd_register(struct drm_device *drm,
 	if (imxpd->panel)
 		drm_panel_attach(imxpd->panel, &imxpd->connector);
 
-	if (imxpd->bridge) {
-		ret = drm_bridge_attach(encoder, imxpd->bridge, NULL);
+	if (imxpd->next_bridge) {
+		ret = drm_bridge_attach(encoder, imxpd->next_bridge,
+					&imxpd->bridge);
 		if (ret < 0) {
 			dev_err(imxpd->dev, "failed to attach bridge: %d\n",
 				ret);
@@ -227,7 +352,8 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	imxpd->bus_format = bus_format;
 
 	/* port@1 is the output port */
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel, &imxpd->bridge);
+	ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel,
+					  &imxpd->next_bridge);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.21.0

