Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DA3C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 19:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA355217D6
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 19:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zT92KeHe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfK2TGM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 14:06:12 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44024 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbfK2TGM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 14:06:12 -0500
Received: by mail-pf1-f194.google.com with SMTP id h14so4811370pfe.10
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 11:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DmYsGklBxODi9ZXzG+eZphEo00SJ3Wr36G+fPUJuOQI=;
        b=zT92KeHeKw8smYn0Wg/ZkYYS3HUIgVo/BEAonyLQotvdGPO9EoJrWytsnE7ricRaJE
         4dmmdhb4xHRJX+WKgQfGSe87j8EJk7d7XspMM+7qbebFTHlJavhgkTy6RXPJIaYDb3yq
         tVRGekzSoLjKN/4vMCyMr7qynj7lOQCKfGYNmezHByEt4fVM9QbjTQBUo7G0A08urYjl
         XoQ071BJ4RlUh7bgcrpKik6D9P4l8BWS+I0XZ394b7OO5cadlj2iKTCWi/c1DMJkZIcX
         JpxqJ/nOA8jViQj6VyS4RXGUJUOm+kheO8cyp1mOWT4beaJ0EXk16are4Eoazv7Vf1SR
         Ufbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DmYsGklBxODi9ZXzG+eZphEo00SJ3Wr36G+fPUJuOQI=;
        b=pHbzW38RzNYdx+HPSUf88i/HrkUfQPzDbPv9psrPqp3EKg8tJHJfwGBZOE6ojbBz0X
         eRd3d5q1xVOVOg2SII/4H962KTte3ArRt42gMcmjoHt/v0OiZIxhSUayELzLfYTckn19
         HJrIctlJfBPiv+5XgDMiOb2E+G2Wjgzl9ntPe2RL+cT8vg3G5zMcfRNFv3knQ8hFH6mo
         opb/V18HsFk/viA12mlY8ynTPvvTsY5KitMQs7/hDxDcAB6TOdBo5oybgXZfZsw/YfMa
         EWI8sjm14TvnNTCm4pz1TNNK//ckPenYumZl7tG2ij356P6v1J2MT3L8kHhDcp0C4T+g
         BH0Q==
X-Gm-Message-State: APjAAAUMU2E3aP+fZf9kmgeZ/FL9kWqd7xQbT/hAXrbGOFHr5dTiUGdO
        D8guqGP9qAQj8Yn/Ls1bn2PX
X-Google-Smtp-Source: APXvYqzgig8XcKY6Z1Z5e1HRzFl4a4lC8ZhYAuK/3i+SnVPkIq/8PDUl4lpssyMcnNT2yb5tWXM7Mg==
X-Received: by 2002:a65:5307:: with SMTP id m7mr18546705pgq.113.1575054370197;
        Fri, 29 Nov 2019 11:06:10 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:638d:cc55:d006:f721:cde2:1059])
        by smtp.gmail.com with ESMTPSA id h9sm25159974pgk.84.2019.11.29.11.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 11:06:09 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] media: i2c: imx290: Add RAW12 mode support
Date:   Sat, 30 Nov 2019 00:35:39 +0530
Message-Id: <20191129190541.30315-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

IMX290 is capable of outputting frames in both Raw Bayer (packed) 10 and
12 bit formats. Since the driver already supports RAW10 mode, let's add
the missing RAW12 mode as well.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index e218c959a729..d5bb3a59ac46 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -75,6 +75,7 @@ struct imx290 {
 	struct clk *xclk;
 	struct regmap *regmap;
 	int nlanes;
+	u8 bpp;
 
 	struct v4l2_subdev sd;
 	struct v4l2_fwnode_endpoint ep;
@@ -98,6 +99,7 @@ struct imx290_pixfmt {
 
 static const struct imx290_pixfmt imx290_formats[] = {
 	{ MEDIA_BUS_FMT_SRGGB10_1X10 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12 },
 };
 
 static const struct regmap_config imx290_regmap_config = {
@@ -265,6 +267,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
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
 static const s64 imx290_link_freq[] = {
 	IMX290_DEFAULT_LINK_FREQ,
@@ -550,6 +564,21 @@ static int imx290_write_current_format(struct imx290 *imx290,
 			dev_err(imx290->dev, "Could not set format registers\n");
 			return ret;
 		}
+
+		imx290->bpp = 10;
+
+		break;
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		ret = imx290_set_register_array(imx290, imx290_12bit_settings,
+						ARRAY_SIZE(
+							imx290_12bit_settings));
+		if (ret < 0) {
+			dev_err(imx290->dev, "Could not set format registers\n");
+			return ret;
+		}
+
+		imx290->bpp = 12;
+
 		break;
 	default:
 		dev_err(imx290->dev, "Unknown pixel format\n");
@@ -910,6 +939,9 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_err;
 	}
 
+	/* Default bits per pixel value */
+	imx290->bpp = 10;
+
 	mutex_init(&imx290->lock);
 
 	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
-- 
2.17.1

