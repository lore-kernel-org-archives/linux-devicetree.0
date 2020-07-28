Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1A1C433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 20:12:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D50220656
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 20:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbgG1UMz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 16:12:55 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:56321 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728365AbgG1UMy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 16:12:54 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BGSXN21JPz1rt4G;
        Tue, 28 Jul 2020 22:12:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BGSXN1hCcz1qrgD;
        Tue, 28 Jul 2020 22:12:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id OHtkq9POG9_6; Tue, 28 Jul 2020 22:12:51 +0200 (CEST)
X-Auth-Info: lGXjcFGVCzYqnYucj7HX8wu5hDVJDesVUOuUk4MBRfo=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz [86.49.101.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 28 Jul 2020 22:12:51 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: [PATCH 3/3] drm/panel: simple: Add Chefree CH101OLHLWH-002 panel
Date:   Tue, 28 Jul 2020 22:12:42 +0200
Message-Id: <20200728201242.4336-3-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728201242.4336-1-marex@denx.de>
References: <20200728201242.4336-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the Chefree CH101OLHLWH-002 10.1" (1280x800)
color TFT LCD panel, connected over LVDS.

Timings are taken from the datasheet version P0.5.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 298e3a26d9ee..a8e1f6306923 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1414,6 +1414,36 @@ static const struct panel_desc cdtech_s070wv95_ct16 = {
 	},
 };
 
+static const struct display_timing chefree_ch101olhlwh_002_timing = {
+	.pixelclock = { 68900000, 71100000, 73400000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 65, 80, 95 },
+	.hback_porch = { 64, 79, 94 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 7, 11, 14 },
+	.vback_porch = { 7, 11, 14 },
+	.vsync_len = { 1, 1, 1 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc chefree_ch101olhlwh_002 = {
+	.timings = &chefree_ch101olhlwh_002_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 135,
+	},
+	.delay = {
+		.enable = 200,
+		.disable = 200,
+	},
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode chunghwa_claa070wp03xg_mode = {
 	.clock = 66770,
 	.hdisplay = 800,
@@ -3845,6 +3875,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "cdtech,s070wv95-ct16",
 		.data = &cdtech_s070wv95_ct16,
+	}, {
+		.compatible = "chefree,ch101olhlwh-002",
+		.data = &chefree_ch101olhlwh_002,
 	}, {
 		.compatible = "chunghwa,claa070wp03xg",
 		.data = &chunghwa_claa070wp03xg,
-- 
2.27.0

