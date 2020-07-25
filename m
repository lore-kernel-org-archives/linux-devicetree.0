Return-Path: <SRS0=7Os6=BE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A0EC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 21:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 967A220771
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 21:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgGYVN4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 17:13:56 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:45725 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgGYVNz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 17:13:55 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BDf295TNkz1rt4N;
        Sat, 25 Jul 2020 23:13:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BDf295GNfz1qxpQ;
        Sat, 25 Jul 2020 23:13:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Hx59tOOreTfX; Sat, 25 Jul 2020 23:13:52 +0200 (CEST)
X-Auth-Info: KlNTHwIfMgS9hWZg06oB8tHCmLe1ND/xqgM93WeJeM0=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz [86.49.101.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 25 Jul 2020 23:13:52 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: [PATCH 3/3] drm/panel: simple: Add DT bindings for Powertip PH800480T013
Date:   Sat, 25 Jul 2020 23:13:35 +0200
Message-Id: <20200725211335.5717-3-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725211335.5717-1-marex@denx.de>
References: <20200725211335.5717-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for Powertip PH800480T013 800x480 parallel LCD, this
one is used in the Raspberry Pi 7" touchscreen display unit.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index af6ea5480c81..6bf6604ca78e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2986,6 +2986,27 @@ static const struct panel_desc pda_91_00156_a0  = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
+	.clock = 24750,
+	.hdisplay = 800,
+	.hsync_start = 800 + 54,
+	.hsync_end = 800 + 54 + 2,
+	.htotal = 800 + 54 + 2 + 44,
+	.vdisplay = 480,
+	.vsync_start = 480 + 49,
+	.vsync_end = 480 + 49 + 2,
+	.vtotal = 480 + 49 + 2 + 22,
+};
+
+static const struct panel_desc powertip_ph800480t013_idf02  = {
+	.modes = &powertip_ph800480t013_idf02_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+};
 
 static const struct drm_display_mode qd43003c0_40_mode = {
 	.clock = 9000,
@@ -3998,6 +4019,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "pda,91-00156-a0",
 		.data = &pda_91_00156_a0,
+	}, {
+		.compatible = "powertip,ph800480t013-idf02",
+		.data = &powertip_ph800480t013_idf02,
 	}, {
 		.compatible = "qiaodian,qd43003c0-40",
 		.data = &qd43003c0_40,
-- 
2.27.0

