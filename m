Return-Path: <SRS0=DJdz=7G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62180C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 19:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42A422075F
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 19:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBFl+FYP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387854AbgEXT0V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 May 2020 15:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388344AbgEXTZy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 May 2020 15:25:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569DDC08C5C2
        for <devicetree@vger.kernel.org>; Sun, 24 May 2020 12:25:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k5so18522175lji.11
        for <devicetree@vger.kernel.org>; Sun, 24 May 2020 12:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ArHIpbhBZ4QboXR1B47LETKKz8hPypHrPsMnuHhW5Pc=;
        b=oBFl+FYPXCF2nyxMWUbG5bRYxOeXrnLcwNIOcNbWk5ote7fWi1iuH6oIHUNBiMytjf
         Lqb144emRs2uKuETQJHJ2h+qwGb7j3Gs0fzmlSKrXbKmxGi192Z4hTbMU+tvRx/lPlhm
         rI8UWpO2x/VZpLDOCAmwB7vORkosPtFSeqPZ2rlL8PF69L4lyvn5HN8oNKWKDtvNiqVU
         ZzhJphVkNtcB1hPa5X1uOcsystaTuCU3yCmwTvETURKyYsb0vkCWjVXhaUH7Hy1rb9GD
         zr4SsTBhTokVxMCiUD/3pdlEeaXfxxjUuJTamP1EG8nr00iS/PgVG6DaIaQD8gV3kGjo
         Qi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ArHIpbhBZ4QboXR1B47LETKKz8hPypHrPsMnuHhW5Pc=;
        b=YATDAs8urA3bZx7OQy1aVrVjEq0dYfoOu28yaK4YxF6Q7R7/QO1Nh0VQrPxP0BPfCU
         PptZXcqlX2+PQskjZSx1hg5iwelZZgi2Wyh0NcM4Ew6KdS09mevAufSGDq7bFednEALG
         0sYI0+HkjurjEnXcPNde3GYSAhDkpS6qGzSllDTBxMgffpJQ/kphD/tGig7so3XfBKq/
         1MjGG3BbqIfy6K6nOB1Q4VWc8ARyBd7EU0vw7dhnv8pfKBbdcmSx96nrwVs4/G6YWwct
         /j/oLYl6ZtudYJlwwBJSAP2e5y1UObO5a8iAlRiE/FXaoVoZJQOBDx+8nDsL8Pb6FzOL
         BYmQ==
X-Gm-Message-State: AOAM531OputKGvcpA7ETfwTzcFAgJF19c+N8ThZMUGoG0Y6GXpTUF8N8
        2G/e5AcXqbH8M7LxncwETm4lDw==
X-Google-Smtp-Source: ABdhPJxyBtmtLkqVgMFpLolLOPlu5o8eTu0WHSm7CDTFILzmDEAVdYLLTsHq30+ePOwEbD75fjQSVA==
X-Received: by 2002:a2e:8008:: with SMTP id j8mr12789036ljg.72.1590348352874;
        Sun, 24 May 2020 12:25:52 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:52 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 08/10] media: i2c: imx290: Add support to enumerate all frame sizes
Date:   Sun, 24 May 2020 22:25:03 +0300
Message-Id: <20200524192505.20682-9-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
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
 drivers/media/i2c/imx290.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6e70ff22bc5f..88850f3b1427 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -471,6 +471,25 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx290_enum_frame_size(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if ((fse->code != imx290_formats[0].code) &&
+	    (fse->code != imx290_formats[1].code))
+		return -EINVAL;
+
+	if (fse->index >= ARRAY_SIZE(imx290_modes))
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
@@ -850,6 +869,7 @@ static const struct v4l2_subdev_video_ops imx290_video_ops = {
 static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
 	.init_cfg = imx290_entity_init_cfg,
 	.enum_mbus_code = imx290_enum_mbus_code,
+	.enum_frame_size = imx290_enum_frame_size,
 	.get_fmt = imx290_get_fmt,
 	.set_fmt = imx290_set_fmt,
 };
-- 
2.17.1

