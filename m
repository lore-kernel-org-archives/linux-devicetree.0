Return-Path: <SRS0=Te14=7U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A944BC433E1
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 16:31:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86FA22078B
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 16:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hgMmXQrm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgFGQbU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 7 Jun 2020 12:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgFGQbG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 7 Jun 2020 12:31:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5B9C08C5C5
        for <devicetree@vger.kernel.org>; Sun,  7 Jun 2020 09:31:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z9so17470962ljh.13
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2020 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZN8pb1DxbDLuAa3GwJ440N0/6Zk96TU9nPo+rlxSNXs=;
        b=hgMmXQrmQr4gLMphT0IR3nsiRZgO+DUmJ3Jk8kWCmvJJkWdlGe8cAbh9VOYwOIqVjD
         V4oz0SXiDfTtEt7QnN+7tS0C5/r5ys9CSB/0SevtYjrYtp+38gyPGwdqDNJ7ZOeIRtVs
         rXO/zgcXzFu4ryb6uENXqD1Zw5RNVpBLPtqtsQkhq7uApRlntzg+xFh27ORacmkgvkn9
         RD0QTa6dONTYPTxsL/gB44FSKAZ2oGXG+7Hj7o/Bl3/Dx+IWIMZqNbWs4hfnyUDNKXuV
         TFjRWiJfOjfyo0jFcRelceUsoPmgmZrKsuZUzx0znCkiFpDlDW7F+25HnPgiLYjAaRrk
         VQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZN8pb1DxbDLuAa3GwJ440N0/6Zk96TU9nPo+rlxSNXs=;
        b=Bgn4ZKnw3ZfTVxOlgkb2H/pudCfzy8mNbnEOlFQbosNv6dPPBECKtyA8C6gGFLTVjV
         AcDOOFgtXeiiYWBvIG8GVYhvdnCP0asBgZ5CzaSXMqdel9C+VdklEvHbtetuCdQQL4ym
         PzzjrBDG0FCT45LUZkcH5ZzJ6PyyuOfk+NXuV+DA0Mc99OJksMhWK3AaErCmbCBQBnwC
         Mhc7Q+27JpXeZKJVYQYYxi6GKb3AA1XccJiVUqzjezOxh9t+7L7NmqYz89ta7Rp6cfNb
         4UUZyDPIA80SumBdf+Ri5nIKt30il7P3Q5RTIJltANHVLatVYv1LyGq8RYMxxN+rVJ81
         muDg==
X-Gm-Message-State: AOAM533GbhLafiIAqG9lDFeD+IRuUqO7L1QgX45QDT6rKyY7ePmj7K9Z
        7Q7BduOsoYleGzs12KqltcScf+HnM8PbMA==
X-Google-Smtp-Source: ABdhPJwKvDoJhrs1A3GxUZPAsk4YJqgk84ISg9RDQ8bOuu1WO9sTe68xjvI+5fEFyJEEzp396jhkgg==
X-Received: by 2002:a2e:87da:: with SMTP id v26mr8806511ljj.14.1591547464950;
        Sun, 07 Jun 2020 09:31:04 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:31:04 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 08/10] media: i2c: imx290: Add support to enumerate all frame sizes
Date:   Sun,  7 Jun 2020 19:30:23 +0300
Message-Id: <20200607163025.8409-9-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Add support to enumerate all frame sizes supported by IMX290. This is
required for using with userspace tools such as libcamera.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index c654a9a8fb08..fd147fac5ef2 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -528,6 +528,28 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx290_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct imx290 *imx290 = to_imx290(sd);
+	const struct imx290_mode *imx290_modes = imx290_modes_ptr(imx290);
+
+	if ((fse->code != imx290_formats[0].code) &&
+	    (fse->code != imx290_formats[1].code))
+		return -EINVAL;
+
+	if (fse->index >= imx290_modes_num(imx290))
+		return -EINVAL;
+
+	fse->min_width = imx290_modes[fse->index].width;
+	fse->max_width = imx290_modes[fse->index].width;
+	fse->min_height = imx290_modes[fse->index].height;
+	fse->max_height = imx290_modes[fse->index].height;
+
+	return 0;
+}
+
 static int imx290_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_pad_config *cfg,
 			  struct v4l2_subdev_format *fmt)
@@ -873,6 +895,7 @@ static const struct v4l2_subdev_video_ops imx290_video_ops = {
 static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
 	.init_cfg = imx290_entity_init_cfg,
 	.enum_mbus_code = imx290_enum_mbus_code,
+	.enum_frame_size = imx290_enum_frame_size,
 	.get_fmt = imx290_get_fmt,
 	.set_fmt = imx290_set_fmt,
 };
-- 
2.17.1

