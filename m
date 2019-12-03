Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E69C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 13:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41B052080A
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 13:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="P61OjPv9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfLCNs4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 08:48:56 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41337 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfLCNs4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 08:48:56 -0500
Received: by mail-pg1-f194.google.com with SMTP id x8so1701967pgk.8
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 05:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GvY7EGGLO25a5o48qmefaws4aAtPmG5PqqVM+V2F2v0=;
        b=P61OjPv9p9rdBXwWKpdC3BKZ2eG0qALzjaq4PWVhOv0Imk1pU/XdRKWhc/V7jYac6t
         C5RiQZlWUz54FyBSjjP0vgGT3D9vcDvvz944EqNqD68VIRRtcYY0B3vzz+CPeMCq9XiE
         yKGDB5aamTiO66N04pyDT3FNRkzikQI/7Qqe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GvY7EGGLO25a5o48qmefaws4aAtPmG5PqqVM+V2F2v0=;
        b=nVVJdRVO+X0HTdVrc5/dY79+1+qvy38zXTvSGLje6TsqNYAVZP9sHx6m1HFym6L+DA
         Suel0+mZCG0/3NpXV8VX7jW4DsgyV6T6Nme7kpZ83hW4J+IIZ5TuvuSDFFjQB6clPrFM
         K6Cwbl9PZd3dD/KFahvgdgTofMBgeD5wSdPjzHyFzAxCPyNqzI4Yv6UHd8U4jFjksYvf
         fMafRKLOrLEcnj/z9/Ik54saNwmp95wwXyFt1bYMY0pzq+Ue/uUmwVbeZz+UrWtjObbR
         thmXaFMytFEbtTwXx1QYjZYO3HB+LhQd4M+ruUFU8bSEDrfLcSg3y3UTDxLP4gldWmvp
         OOAQ==
X-Gm-Message-State: APjAAAUkI5YQK4wAyZ8+h6b8t7HNTFdUE7rNqE75NVp2Qgt/QfVO+vqF
        qwEiVccQA+xoIrcCBqGpwgD/IQ==
X-Google-Smtp-Source: APXvYqwm0cu3OUOj7mGNRPnxcAIXp99P9fa7KifqYH6jQUxCZrws2pFbIgmk6iPHa24PSNgZI5cxGA==
X-Received: by 2002:a63:101:: with SMTP id 1mr5341092pgb.336.1575380935648;
        Tue, 03 Dec 2019 05:48:55 -0800 (PST)
Received: from localhost.localdomain ([115.97.190.29])
        by smtp.gmail.com with ESMTPSA id y144sm4397892pfb.188.2019.12.03.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 05:48:55 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     michael@amarulasolutions.com, Icenowy Zheng <icenowy@aosc.io>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v12 5/7] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date:   Tue,  3 Dec 2019 19:18:14 +0530
Message-Id: <20191203134816.5319-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191203134816.5319-1-jagan@amarulasolutions.com>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The MIPI DSI controller in Allwinner A64 is similar to A33.

But unlike A33, A64 doesn't have DSI_SCLK gating so add compatible
for Allwinner A64 with uninitialized has_mod_clk driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
Changes for v12:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 6085ad2eafc3..34a64473dd09 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1270,11 +1270,18 @@ static const struct sun6i_dsi_variant sun6i_a31_mipi_dsi = {
 	.has_mod_clk = true,
 };
 
+static const struct sun6i_dsi_variant sun50i_a64_mipi_dsi = {
+};
+
 static const struct of_device_id sun6i_dsi_of_table[] = {
 	{
 		.compatible = "allwinner,sun6i-a31-mipi-dsi",
 		.data = &sun6i_a31_mipi_dsi,
 	},
+	{
+		.compatible = "allwinner,sun50i-a64-mipi-dsi",
+		.data = &sun50i_a64_mipi_dsi,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
-- 
2.18.0.321.gffc6fa0e3

