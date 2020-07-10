Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B152C43462
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 23:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 335A320657
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 23:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YqfD9if0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGJXCr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 19:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgGJXCq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 19:02:46 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6556CC08C5DD
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 16:02:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 72so2857088ple.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 16:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KDlhJEK8bEQDr4AEmZYceY0lLW1c8BenSCxp/VqeSg0=;
        b=YqfD9if0lPwu+n0J/F3oyLF5d7cL9WsuOonWuP7ZQ7PJ7PHL9OzPXYWf5BPO5qfemv
         SwrxE7PTMHZjhNQO4tH9fw+9KDQRmBRGfNSVmqpTEvMVsy78vW07p1D36O+Is2YPUW6P
         wG6iJcV73pywBqYswv6ZmNfhjbzdG/8cq++88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KDlhJEK8bEQDr4AEmZYceY0lLW1c8BenSCxp/VqeSg0=;
        b=KlfCIBvw3xQo8/f5MQihnU2L47Sz+G2H53io2Ijc53Jf/PdxdZr+EbW0fe65hZnmme
         dH0t7ZN3AgLsh027Sdp8JdIaUfvV5aFMq/cZGuZNGvDE72D4gBloLT9Kf0iS9cD+Cloy
         ZgmQikazLJkbcsCk6VvPSzw6yqGsplhiaaRI3hKfcAy9Z2i/3s+Guf8mUMJw0y9jScoB
         Fa/69iGXMEjHyp6BZ8z6vR9/woqZqzZjBWESyJ78slWJbiHXxnU4Hr0BVWHVd7QWjYpF
         hurDKL7wr8lJSHzmQUxGpUMbUrIDy55MiMTo6BmL3uSM5lL4oIOX7q3Pjsdql/4g8UxE
         rKdA==
X-Gm-Message-State: AOAM5301m/5ukWngvrHH6jMYaLguUj9m5oBmYsoPsXucl6r5q0T5OoPp
        mDP4+EL/v+RE584efCOfx3bs/g==
X-Google-Smtp-Source: ABdhPJwSPO3qFeV3DepwLxB8csth6F4T+/Ne+JcPTYmGZnrrv09IRasdUI54wXZe6z/2aXeJ8r0VXw==
X-Received: by 2002:a17:90a:f3ca:: with SMTP id ha10mr7762940pjb.46.1594422165962;
        Fri, 10 Jul 2020 16:02:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:45 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] drm/msm: Use the devm variant of of_platform_populate()
Date:   Fri, 10 Jul 2020 16:02:16 -0700
Message-Id: <20200710160131.1.I3f7862adcb0806d56a8c7260857d887100b06b41@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Let's save ourselves some hassle and use the devm variant of
of_platform_populate() do we don't need to worry about manually
depopulating.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/msm_drv.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f6ce40bf3699..78b09fde9e29 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1208,7 +1208,7 @@ static int add_display_components(struct device *dev,
 	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
 	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
 	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
-		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+		ret = devm_of_platform_populate(dev);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
 			return ret;
@@ -1217,7 +1217,6 @@ static int add_display_components(struct device *dev,
 		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
 		if (!mdp_dev) {
 			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
-			of_platform_depopulate(dev);
 			return -ENODEV;
 		}
 
@@ -1232,8 +1231,6 @@ static int add_display_components(struct device *dev,
 	}
 
 	ret = add_components_mdp(mdp_dev, matchptr);
-	if (ret)
-		of_platform_depopulate(dev);
 
 	return ret;
 }
@@ -1300,30 +1297,21 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 	ret = add_gpu_components(&pdev->dev, &match);
 	if (ret)
-		goto fail;
+		return ret;
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
 	 */
 	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
 	if (ret)
-		goto fail;
-
-	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
-	if (ret)
-		goto fail;
-
-	return 0;
+		return ret;
 
-fail:
-	of_platform_depopulate(&pdev->dev);
-	return ret;
+	return component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
 }
 
 static int msm_pdev_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &msm_drm_ops);
-	of_platform_depopulate(&pdev->dev);
 
 	return 0;
 }
-- 
2.27.0.383.g050319c2ae-goog

