Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235B5C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 19:10:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE45524672
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 19:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pZ8uPDUy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbfLRTKu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 14:10:50 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37469 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfLRTKu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 14:10:50 -0500
Received: by mail-pf1-f193.google.com with SMTP id p14so1737793pfn.4
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 11:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c+shghrwvHSuaCCAe91cOcF/cABrNe9ZFXBpEs6T1pk=;
        b=pZ8uPDUyofDjdToN5t1zFX7EOUoQHgElefAtWAY2a0xE3C+UzywVgYFh1cRo//8ldK
         dkxGA87VEybp7sOpx7eGEyvPyE02cVpzJh0Sz7GwLzhuxvhmE39bwoNFOrYIt6IIko8w
         59oJZCYsccwqdnIMNu4JjudoACBiEOxWsVD3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c+shghrwvHSuaCCAe91cOcF/cABrNe9ZFXBpEs6T1pk=;
        b=gzs8pocL6QwYyjU6fjp5fYxzC3Nmf9uS840+5NjufK+g5OZWHd/exGkKHYzP2g1AuK
         e9/ZcYgPrRKHqJQqa//lK4iaKASMFyS5bGjjXvUCaTK4edyuLlYt2PPjCNvlAhkgyHG8
         2V1Ds2xeV6lOBOMHFCcb+AKgxGTRm4BRgXh533Cuv5ud1odimE5O4IzX48YkZpylCF5z
         bQrl+q0m0NgstHVW8xM88laYHgdH5zELmYXEh8IDgnwidIwYr8jNpslMC0+wa9Fi8Gv+
         YjXFD/4Bvu3ZMK+EYX/4hpg1ixsPmbNq3PYlLsSmcLGUsyEHQVjFKwZoZt1OQD2bcmw8
         KLyg==
X-Gm-Message-State: APjAAAXC8jaRqFr3lO5hMvBnUZScl3cgrzRoKTEsvA0GHvpOdMe95ayk
        bdx+NAVqFUiluvJ70VIm5eChlA==
X-Google-Smtp-Source: APXvYqzWo+135srItLCIbQetR6+zfji/31rxO3bMV0dn+U+qlizWEE04ek5zqZbLuYJfUG+Gr29Dsw==
X-Received: by 2002:a62:c541:: with SMTP id j62mr4808803pfg.237.1576696249620;
        Wed, 18 Dec 2019 11:10:49 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:78ea:e014:edb4:e862])
        by smtp.gmail.com with ESMTPSA id q7sm3745855pjd.3.2019.12.18.11.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 11:10:49 -0800 (PST)
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
Subject: [PATCH v13 5/7] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date:   Thu, 19 Dec 2019 00:40:15 +0530
Message-Id: <20191218191017.2895-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191218191017.2895-1-jagan@amarulasolutions.com>
References: <20191218191017.2895-1-jagan@amarulasolutions.com>
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
Changes for v13:
- update the changes since has_mod_clk is dropped in previous patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index de8955fbeb00..8669d5f0e744 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1264,6 +1264,7 @@ static const struct dev_pm_ops sun6i_dsi_pm_ops = {
 
 static const struct of_device_id sun6i_dsi_of_table[] = {
 	{ .compatible = "allwinner,sun6i-a31-mipi-dsi" },
+	{ .compatible = "allwinner,sun50i-a64-mipi-dsi" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
-- 
2.18.0.321.gffc6fa0e3

