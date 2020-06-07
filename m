Return-Path: <SRS0=Te14=7U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D12C433E1
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 16:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F1882073B
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 16:31:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dv/XUq+W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgFGQbG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 7 Jun 2020 12:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbgFGQbD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 7 Jun 2020 12:31:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66D9C08C5C4
        for <devicetree@vger.kernel.org>; Sun,  7 Jun 2020 09:31:02 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id x18so1022959lji.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2020 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VUUHzTYdCTkEy8qJLKBgOAUld/T0D8KqCFLo4EbK13A=;
        b=dv/XUq+WdfVan0lSFHWk+qgDn/wSsMi9bV9WLipNALihtYxVDlZ5TyFZOdJFDN3/7H
         cDRzz/M5jcdpPR0vOKqIQo3pOs0vxr1rXvXeelKgzgktgDvHHxQvMq7ghf+eDhjhO5mH
         Ip8cJ/kSPzI840wrR3SNLc/gSWwoO/KfEAH70YodQrITPITS12uNAiO+gBH9xshBz7H+
         BN2BhGK7Gp+AMqrmFiaK3VZlQ8NxPKjkdt1yScsfYogANa2qcXuCTUwyXxtEhPlGaaJS
         L5/bkNPRpdusnIzTCW8LOuGRDRkVroIRt5AWG5LJxmfx1F8fV5FfpuysqAjt6aQQb/N+
         jHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VUUHzTYdCTkEy8qJLKBgOAUld/T0D8KqCFLo4EbK13A=;
        b=Pj/w40cCBUxqPrh2ebHCxFg+3a+GW3xc6gw075AL6GmWVIPZ1ohDgNj8G932IyfMCf
         im78cLM9Vr5Vg74u6kxYxREduTP3yRh6LoXVfD4Z5CatCJUlyN/lZHWHcZ01/P0jutHB
         nLKrjTAD3BWMni68VQExnsoRZo2UG1CaYgAE+iRhTztJTnzirEifx5M5HkV3wXlxuL9d
         ZgHHda6HFbgBfs2xnMESONxULuq9oz5ceS4jjTO536cZfDf98hHjCQXt+hC9kTsYCpIE
         ASe6wYxcnkmu8AZmhi4qNDn0s3qMCpzjHrSrcWEUzuZUHCX030woq7gKzv3YbWvRUTfb
         juWg==
X-Gm-Message-State: AOAM533h4D0nnL9wRwgwon1tFBaoV6FK2NFqqKNlNP7PaX2aaOFRUSjI
        7Ei1kj/wZNecSbpvrTMk1VgCzg==
X-Google-Smtp-Source: ABdhPJwUO3GSSqzVk9B3bZCVYJUf3X9ZKgSM1/1T9D2s9BR1VOO8qfvlTsbykFp1BPj6WrWXZNVl0w==
X-Received: by 2002:a2e:2f0f:: with SMTP id v15mr8348721ljv.219.1591547461316;
        Sun, 07 Jun 2020 09:31:01 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:31:00 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 07/10] media: i2c: imx290: Add RAW12 mode support
Date:   Sun,  7 Jun 2020 19:30:22 +0300
Message-Id: <20200607163025.8409-8-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

IMX290 is capable of outputting frames in both Raw Bayer (packed) 10 and
12 bit formats. Since the driver already supports RAW10 mode, let's add
the missing RAW12 mode as well.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 67725a5aabd3..c654a9a8fb08 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -67,6 +67,7 @@ struct imx290 {
 	struct clk *xclk;
 	struct regmap *regmap;
 	u8 nlanes;
+	u8 bpp;
 
 	struct v4l2_subdev sd;
 	struct v4l2_fwnode_endpoint ep;
@@ -86,10 +87,12 @@ struct imx290 {
 
 struct imx290_pixfmt {
 	u32 code;
+	u8 bpp;
 };
 
 static const struct imx290_pixfmt imx290_formats[] = {
-	{ MEDIA_BUS_FMT_SRGGB10_1X10 },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
 };
 
 static const struct regmap_config imx290_regmap_config = {
@@ -257,6 +260,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
 	{ 0x300b, 0x00},
 };
 
+static const struct imx290_regval imx290_12bit_settings[] = {
+	{ 0x3005, 0x01 },
+	{ 0x3046, 0x01 },
+	{ 0x3129, 0x00 },
+	{ 0x317c, 0x00 },
+	{ 0x31ec, 0x0e },
+	{ 0x3441, 0x0c },
+	{ 0x3442, 0x0c },
+	{ 0x300a, 0xf0 },
+	{ 0x300b, 0x00 },
+};
+
 /* supported link frequencies */
 #define FREQ_INDEX_1080P	0
 #define FREQ_INDEX_720P		1
@@ -478,7 +493,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		} else {
 			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
 			msleep(10);
-			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
+			if (imx290->bpp == 10)
+				imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
+						 0x3c);
+			else /* 12 bits per pixel */
+				imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
+						 0xf0);
 			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
 		}
 		break;
@@ -550,7 +570,7 @@ static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
 
 	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
 	pixel_rate = link_freq * 2 * nlanes;
-	do_div(pixel_rate, 10);
+	do_div(pixel_rate, imx290->bpp);
 	return pixel_rate;
 }
 
@@ -587,6 +607,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	} else {
 		format = &imx290->current_format;
 		imx290->current_mode = mode;
+		imx290->bpp = imx290_formats[i].bpp;
 
 		if (imx290->link_freq)
 			__v4l2_ctrl_s_ctrl(imx290->link_freq,
@@ -631,6 +652,15 @@ static int imx290_write_current_format(struct imx290 *imx290)
 			return ret;
 		}
 		break;
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		ret = imx290_set_register_array(imx290, imx290_12bit_settings,
+						ARRAY_SIZE(
+							imx290_12bit_settings));
+		if (ret < 0) {
+			dev_err(imx290->dev, "Could not set format registers\n");
+			return ret;
+		}
+		break;
 	default:
 		dev_err(imx290->dev, "Unknown pixel format\n");
 		return -EINVAL;
-- 
2.17.1

