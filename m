Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135FFC43466
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDCA520791
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQneNRTv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgGMGKF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 02:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729408AbgGMGKA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 02:10:00 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B10C08C5DB
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 23:10:00 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id t11so5536260pfq.11
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 23:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gB83jD2FpTYfBDRkUJH8DvVVofs2yRFQbXc2yeSZvmk=;
        b=mQneNRTvRh7TEV8oSckX8BzrplvT9JWTPgTge++Ykp1B5RphqvW7GoZJ7CuLCG5NUG
         ALY50gHRt/NcNRLiQoXmQFstFkEHgQkNYkl7cQQe6wc1diyCVsgb0FDopMACd33C9vqe
         SGZDpkH8trEfdC9w/dw0KWhHA4PTUTO9iYCas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gB83jD2FpTYfBDRkUJH8DvVVofs2yRFQbXc2yeSZvmk=;
        b=K5qFTMBKIAabBeyE011QN7FnY6+AIv9oHDlV2YWWr5cN7OfB343oLoG0LpQzMkPs4W
         9wcpldmwtwxXCqa7k+RycBX0/KxLn7euVtNlbwkbYZdcnQZ2OcogUY/dquMq+oykz5XE
         WuW70rxw8u37KzQrBTp5CohNBrX7P5AwL6ma8Wzs8LH/byEMZrCbcoTubp8Ps7l9zjHS
         Vhmc6jSndtUsmK6WsMVTsaeGX+M32XZXzHSI5NCkHxfWw6mvUgxBQPEJ41QXH73apPsx
         lMKNegnKGoKG2ctSjHG6oUXViGabNVYJGvpzxEz94+18jKe6Cw17rAr4JQlICM8Eh8Dw
         JmMQ==
X-Gm-Message-State: AOAM530mikN6N7a1a3GDT66OJxOCPmJdaSnnGs8B7aNS3sXxXHZ/ZQlP
        hNEK6Y8rzWp+Y5g1QTZNHJrMXg==
X-Google-Smtp-Source: ABdhPJw7xh/m0JWlcTmFBX/gTdG+Hj4V1YLkVAmb10CsnxvzrbYdCbIFz51djjnYzpvhScMv8yE81Q==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr66187991pgh.255.1594620600025;
        Sun, 12 Jul 2020 23:10:00 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:59 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 16/16] media: mtk-vcodec: venc: fix invalid time per frame in S_PARM
Date:   Mon, 13 Jul 2020 15:08:42 +0900
Message-Id: <20200713060842.471356-17-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

v4l2-compliance expects the driver to adjust the time per frame if it is
invalid (numerator or denominator set to 0). Adjust it to the default
value in these cases.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 09baac2dbc36..82b04714f750 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -200,14 +200,18 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct v4l2_fract *timeperframe = &a->parm.output.timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return -EINVAL;
 
-	ctx->enc_params.framerate_num =
-			a->parm.output.timeperframe.denominator;
-	ctx->enc_params.framerate_denom =
-			a->parm.output.timeperframe.numerator;
+	if (timeperframe->numerator == 0 || timeperframe->denominator == 0) {
+		timeperframe->numerator = MTK_DEFAULT_FRAMERATE_NUM;
+		timeperframe->denominator = MTK_DEFAULT_FRAMERATE_DENOM;
+	}
+
+	ctx->enc_params.framerate_num = timeperframe->denominator;
+	ctx->enc_params.framerate_denom = timeperframe->numerator;
 	ctx->param_change |= MTK_ENCODE_PARAM_FRAMERATE;
 
 	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-- 
2.27.0.383.g050319c2ae-goog

