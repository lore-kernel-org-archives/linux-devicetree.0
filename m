Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2929C35246
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 21:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5EBA214D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 21:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MYxAB1ed"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgA3VNR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 16:13:17 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37560 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgA3VNE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jan 2020 16:13:04 -0500
Received: by mail-pg1-f194.google.com with SMTP id q127so2297401pga.4
        for <devicetree@vger.kernel.org>; Thu, 30 Jan 2020 13:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ff1yK3ORakl74BFXMoZy6txxvHuVUK88xYRXUF98dsA=;
        b=MYxAB1edcjlV6r/3BRKpapRWzUXehQ29kOd29k5MBGHzND9GlxROrJQyIw5k5YFgF6
         B7IaftbP1+NpMz7JGzE9cl/pb+g7t3+X+0TQQLBVsjavJtf3nn+Zo7kxntoKd54vMw20
         S8UFTnVFKywHQ4kUI+2pKV242C4MwnqMEu2PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ff1yK3ORakl74BFXMoZy6txxvHuVUK88xYRXUF98dsA=;
        b=cuBqHbevgyOZC9oXvp6YDZY17tTnvLxJrdwk1mNi24OA48snWFCS67HFL8naq3NmGh
         jKUz0WHtEHjnralYChJMvMBCiLjZcUX8bG6yc8c6k/Do6G0U7EZZx1cBx8kA5BzBoxQu
         6YijeqcbwImHLiJZ+ewm0HYbnPLqYZ1dx4PXpqzqwL2X7veubOiQI789mav4P1OCuV9k
         h86jiUJjjxkjF4ITSYbc3BB6pQj9WWYWgnOEFG62WZJTeQbYTGTS7h1hSz9O0wByw79t
         bMez3d6jKNu+Le67ufi7scDpPBWM9JMK3AfUw0TpaYNFA1bnRbi1oJ+seRt3ISpbIxec
         1wJQ==
X-Gm-Message-State: APjAAAW5D3D7PwODMZUEYlsh88UqXBb3qYD1Vv4FtxMhalr8tx5dMbiW
        OdHwE7DAsZstr9dB78+WbechFA==
X-Google-Smtp-Source: APXvYqyPIzl14PPWapV9S3IqahdjaaFm9DzOevoItp7H+rnGagyA7gSPikF2rQBRt3T+MZi3CIWMTw==
X-Received: by 2002:a63:5fce:: with SMTP id t197mr6742454pgb.173.1580418784027;
        Thu, 30 Jan 2020 13:13:04 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:13:03 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/15] clk: qcom: Use ARRAY_SIZE in videocc-sc7180 for parent clocks
Date:   Thu, 30 Jan 2020 13:12:29 -0800
Message-Id: <20200130131220.v3.13.If37e4b1b5553ac9db5ea51e84a6eec286cdf209e@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

It's nicer to use ARRAY_SIZE instead of hardcoding.  Had we always
been doing this it would have prevented a previous bug.  See commit
74c31ff9c84a ("clk: qcom: gpu_cc_gmu_clk_src has 5 parents, not 6").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("clk: qcom: Use ARRAY_SIZE in videocc-sc7180...") new for v3.

Changes in v2: None

 drivers/clk/qcom/videocc-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 653fc4e6bb6f..c363c3cc544e 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -76,7 +76,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_data = video_cc_parent_data_1,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.25.0.341.g760bfbb309-goog

