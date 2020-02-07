Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B15DC2D0B1
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 05:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3143F22522
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 05:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EfIrgn8K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgBGF1D (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 00:27:03 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34420 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgBGF1B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Feb 2020 00:27:01 -0500
Received: by mail-pl1-f196.google.com with SMTP id j7so535073plt.1
        for <devicetree@vger.kernel.org>; Thu, 06 Feb 2020 21:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6xpmN6rVRpQ9+/BKl26/gWkRoJrUlmctwTSJRjJCc9M=;
        b=EfIrgn8KJTdEPRV6t2D01u2C1tbZ2N5L+zz7+zq66y1iSVivuP8DBp9QrRPb2KxMeQ
         /ektvloYsjEAqIXPfLcxnAAUqVeqhAJibeu5lQbfMyCx5VI1xcyHGPq//k6mqcmQ0gfS
         CPinmVfCOSlqIHxC/KFn8Uqs9YBoRyqsFwy9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6xpmN6rVRpQ9+/BKl26/gWkRoJrUlmctwTSJRjJCc9M=;
        b=DP7dbQLjkV6xKkk9UWca5QFVV0fjEGdUfNETDgTbvJH/iPgtkMAwHVBFIOCSnbsrEI
         EGFN/gIVM+INMd4dNziQdkxqw7DrDb6U05idxs0mNyMcFYs0nW+vfQ2psKzKk9/jHMeh
         sF+bLl6O5oqDF/HhY989C7qs42sEtI1USuLv4/l4OviVCRSHxNUyx/NxoHWeDiPAwJTg
         bvh4JDzearXzS3E0h5uxX6GhZIQfUzh/PgDInoEOg0LaW1H3Q69eb2B7vuBq2twPhw+X
         VFPXUuypEgsDFc0Dnsfc0xsMmYgxtYsvs2rIh2WciHXHS1UoeaplUbxjJv/6iFGw+QMr
         fa1w==
X-Gm-Message-State: APjAAAUThOGyASXhX+uLtEHEb6Z6SgRhGEB2GROK4KbYHnpSpXUYhGmo
        2MbQSP5/3WgH9EdfIMbIxOOSQQ==
X-Google-Smtp-Source: APXvYqzX299A08Kcu0qlzSD8JRvc5zkotFDW+fzSDBqKgJ0Ds/rXQnBQim49TnwlSOj3Rct3QjyFZg==
X-Received: by 2002:a17:902:b682:: with SMTP id c2mr8017343pls.127.1581053219763;
        Thu, 06 Feb 2020 21:26:59 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 21:26:59 -0800 (PST)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        ulf.hansson@linaro.org
Subject: [PATCH v4 3/7] drm/panfrost: Improve error reporting in panfrost_gpu_power_on
Date:   Fri,  7 Feb 2020 13:26:23 +0800
Message-Id: <20200207052627.130118-4-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

It is useful to know which component cannot be powered on.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---

Was useful when trying to probe Bifrost GPU, to understand what
issue we are facing.

v4:
 - No change
v3:
 - Rebased on https://patchwork.kernel.org/patch/11325689/

 drivers/gpu/drm/panfrost/panfrost_gpu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 460fc190de6e815..856f2fd1fa8ed27 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -308,17 +308,20 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
 		val, val == pfdev->features.l2_present, 100, 1000);
+	if (ret)
+		dev_err(pfdev->dev, "error powering up gpu L2");
 
 	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
-	ret |= readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
+	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
 		val, val == pfdev->features.shader_present, 100, 1000);
+	if (ret)
+		dev_err(pfdev->dev, "error powering up gpu shader");
 
 	gpu_write(pfdev, TILER_PWRON_LO, pfdev->features.tiler_present);
-	ret |= readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
+	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
 		val, val == pfdev->features.tiler_present, 100, 1000);
-
 	if (ret)
-		dev_err(pfdev->dev, "error powering up gpu");
+		dev_err(pfdev->dev, "error powering up gpu tiler");
 }
 
 void panfrost_gpu_power_off(struct panfrost_device *pfdev)
-- 
2.25.0.341.g760bfbb309-goog

