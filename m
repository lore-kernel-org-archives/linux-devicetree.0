Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC658C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8959F20835
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tTPvo9D/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgFLNzo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 09:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgFLNyo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 09:54:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69980C08C5C4
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:54:43 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c17so11141637lji.11
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZN8pb1DxbDLuAa3GwJ440N0/6Zk96TU9nPo+rlxSNXs=;
        b=tTPvo9D/MvRXBYX/MuHpkfqpCLq6atXifgP7LV4e3/6UtF3iJJK1XIhlokPt2be/6X
         rw06kE/rT6je/Hm8AxKVhHSpwcD+crQqHu6WtC9W7UQF6Ct8K8ketGlK08BDO8RJN6Hj
         IvQgKQDZG+OK05stM197t5SLomRYn6ffu/eNGlE19PdVcXVDW1LXmeX7EmruPAx49R7l
         Nyz88Fqrv44x2YQC55PAOcnj54GBa9z/VouaaLk4m6Ek0tPFwMoeqebHz1NxqFI4JA5m
         oI+x8tjGs4Afg7PiQMsAj4KTf/VfwO7cMmc2fojYCf0abdsoKvQ4+N+QlrcJ4khYofCr
         Opyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZN8pb1DxbDLuAa3GwJ440N0/6Zk96TU9nPo+rlxSNXs=;
        b=sUkcGI+9KjrMjCIB5rwmcWr7K8HZjJzOm7cE7TVHO//tWusXNNWj7s/HHqwzPBjTbf
         u52/fmsJKqqvEnZBswPPIMFaSLXIVi7ZXv3QlrF8/DuFcTUgi0/9vfz/cXNhcPW1lRRF
         3vY0wVdcAuJC0MOB914jDqYo5zGVMU+rNbxjztdzgxRWW5PGygaLKMt6DrX0KM0DJzxz
         T1hmkaaOeMjMCkaqRpdrkix1xMVNjgWyaBe0ySaFxr6izXA3yiWOIKf5pbRnnm1GYznz
         lmTPFtfyRvEjiQmT/DHSqCyU+2kvgnV7Pn6MCWKdw2G596erINV+4yCjGGrwxGs3TCXX
         lRgg==
X-Gm-Message-State: AOAM5339p3xvYID1KTWqpD4Dngw8XloZRw6aT6qOg1bOmonoSMe7Wm+2
        wMCEeRTNx6CpWVhiMEz+r4oKTg==
X-Google-Smtp-Source: ABdhPJyd0K77IMACgsooS/25EwC76SwVSTRSStSbsi4StlxM/eYk+QNKB3QOHNFROB4+6VQH2CxZbw==
X-Received: by 2002:a05:651c:50d:: with SMTP id o13mr7303244ljp.181.1591970081900;
        Fri, 12 Jun 2020 06:54:41 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id a1sm2414415lfi.36.2020.06.12.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:54:41 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v5 08/10] media: i2c: imx290: Add support to enumerate all frame sizes
Date:   Fri, 12 Jun 2020 16:53:53 +0300
Message-Id: <20200612135355.30286-9-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612135355.30286-1-andrey.konovalov@linaro.org>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org>
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

