Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB32CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B109121D7F
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GCFIrxMG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730314AbfJYR5O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 13:57:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44641 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbfJYR5O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 13:57:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id q16so1378646pll.11
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P+ShWs2FSM+vAO8pDJrhjeu0D2BHwDqE1SNacXjaIBI=;
        b=GCFIrxMGvDu4anO9yWv5FSLPtn8GCu9UGwWlSFs+9Savi7Bbo5hViLED9RYTD7MP6H
         54jW5B3P3KfDJv9wUhchHXM4A2Thg4kojn3iT/MQ8+92+dzX/eXAyN+wqpiDReGizoaR
         Bc2Per+UzIOICEBJHScoH1tu4uvnM1QLWBU7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P+ShWs2FSM+vAO8pDJrhjeu0D2BHwDqE1SNacXjaIBI=;
        b=fxuofDfQYMYiNmosVReGr/Y39mJVz+jyx4AEks1ZTlz+ZmCwS9q1zmrYDhXcvO4Vkt
         uLy7qbq+mD9CgjEaTjRowW7sQy34TmADQPayH64LMvr3giDwYwEye2aZERGUFTYpTxCd
         iKQGwOa//G2Tv9zh245c49dUMt/O4O/+w3elLF2TNeIUJy/z/YPzMlZvHr/ZG5J6KrtU
         VLETPaBreYiqfl/XQ5nUwUvmlJtBZM7qicsmJdI01Tjc7l+qSLF0zEyKJh2uJIhBSI3V
         s7NGfRXQl89W2hoxJSXOZB2oz6frgbnfh9qPU0GJBocRnwPYo8gt5gWtcI9qAF5r0AJW
         YZRg==
X-Gm-Message-State: APjAAAV6fv6D2UmOeqvGjFW0+YcZ6cia6tfjun2xdttttiRrL+GjnVNp
        veUZDkfuE+G9T201E/nbE76c7w==
X-Google-Smtp-Source: APXvYqy2y4it2bBHhmVAciL+iQ/Bchja3gPtyMwHbnVNaDVG+gfU16WxFFqSrCI2gyiaQnXpjxrzxQ==
X-Received: by 2002:a17:902:6b45:: with SMTP id g5mr5151240plt.336.1572026233355;
        Fri, 25 Oct 2019 10:57:13 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
        by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 10:57:12 -0700 (PDT)
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
Subject: [PATCH v11 5/7] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date:   Fri, 25 Oct 2019 23:26:23 +0530
Message-Id: <20191025175625.8011-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
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
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index eacdfcff64ad..4dda96e0febd 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1251,11 +1251,18 @@ static const struct sun6i_dsi_variant sun6i_a31_mipi_dsi = {
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

