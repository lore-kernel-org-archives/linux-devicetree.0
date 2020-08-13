Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDB7C433EA
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCDE220829
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dZzlVRMc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgHMB3p (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 21:29:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57532 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbgHMB3o (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 21:29:44 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B365618A7;
        Thu, 13 Aug 2020 03:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597282178;
        bh=0MJXmtEOSfpT4GzXXxLVyhw31wcTrvCIzdjEpjQWjNk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dZzlVRMcHkAb4fmN8TC0XiOkuHDGuIQYiBNpK7YZNR+BQ3tfjp6Oq48krhKi4c1qO
         iEa8of+G1SEOwj4gn/q2d70+DZCQUtwp6eSzwyljt0VH5AxcEse7x4sKR7MCZc+aDc
         fjLRwPER1qBBPUv++hD6PfGhtFXgioZPZoPJxY6I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 8/8] drm: mxsfb: Add support for the bus-width DT property
Date:   Thu, 13 Aug 2020 04:29:10 +0300
Message-Id: <20200813012910.13576-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A new bus-width DT property has been introduced in the bindings to allow
overriding the bus width. Support it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c |  8 ++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 8c549c3931af..fab3aae8cf73 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -95,10 +95,36 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
 	struct drm_connector_list_iter iter;
+	struct device_node *ep;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
+	u32 bus_width = 0;
 	int ret;
 
+	ep = of_graph_get_endpoint_by_regs(drm->dev->of_node, 0, 0);
+	if (!ep)
+		return -ENODEV;
+
+	of_property_read_u32(ep, "bus-width", &bus_width);
+	of_node_put(ep);
+
+	switch (bus_width) {
+	case 16:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+		break;
+	case 18:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+		break;
+	case 24:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case 0:
+		break;
+	default:
+		DRM_DEV_ERROR(drm->dev, "Invalid bus-width %u", bus_width);
+		return -ENODEV;
+	}
+
 	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
 					  &bridge);
 	if (ret)
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index 399d23e91ed1..c4f7a8a0c891 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -32,6 +32,8 @@ struct mxsfb_drm_private {
 	struct clk			*clk_axi;
 	struct clk			*clk_disp_axi;
 
+	u32				bus_format;
+
 	struct drm_device		*drm;
 	struct {
 		struct drm_plane	primary;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index b721b8b262ce..6d512f346918 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -50,11 +50,15 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
 	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
-	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	u32 bus_format;
 	u32 ctrl, ctrl1;
 
-	if (mxsfb->connector->display_info.num_bus_formats)
+	if (mxsfb->bus_format)
+		bus_format = mxsfb->bus_format;
+	else if (mxsfb->connector->display_info.num_bus_formats)
 		bus_format = mxsfb->connector->display_info.bus_formats[0];
+	else
+		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Using bus_format: 0x%08X\n",
 			     bus_format);
-- 
Regards,

Laurent Pinchart

