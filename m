Return-Path: <SRS0=DJdz=7G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5010C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 19:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A54BA20899
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 19:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cuqs1pzV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387807AbgEXTZn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 May 2020 15:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388229AbgEXTZl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 May 2020 15:25:41 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A0AC08C5C0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2020 12:25:40 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id r125so9338051lff.13
        for <devicetree@vger.kernel.org>; Sun, 24 May 2020 12:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ythenNMgCasy/26fjGx9+1WbKj8OM9GaH/NHc6AXhOM=;
        b=cuqs1pzV9wFff2GzAa77a4DoEBOaiwUw4k6/Z5KiNk0rPbw2WWyS87P6oE987eiUQY
         dvFFcbBp3yAMwXas2jEHznl6OFbqR/glhEu7tjtzqv+AihXa/K9aVZ9wKqE9C3qDu6Tf
         iOy2cw+Im3uOdJdsrheiW7bJGH8bgwHa5jzwSC0bZE649ZGdSLvLvllqMKYn5/wPUqEd
         aR6SLXLiJ6w5zAuwDbPp0nCu4VoWqHjhT9v67s22giW0KTfTuSNcTu7U0ExBx5TorhW/
         Y9bZc50QE3GpJhp6lfvQ0y2K4HWFw3Q9QeeCWvvXR4EPplzkihdAw0xE5vLuBQleYb1m
         I7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ythenNMgCasy/26fjGx9+1WbKj8OM9GaH/NHc6AXhOM=;
        b=FBGKXgE7Q1xaxraQcSrWDQ1NNLeu+6CfYtAiXTVqzk5mstsEftH2+kuYFckGTtlFKC
         llZSYSlrNZpES/xLulV1PmL0q2BL1fkMg0VzgR26PSMsJWqtZs3I3gpNEqG1zpjcuetQ
         XxUWawsYOmEIT3cJLsaA/nEsjaRVSmRv+06XZvEEekivDWyJpWCd09p7x54WsBOgYCqc
         UHHHHaLcqxednBBHhM+Ed7Uws0xc1tuTJmp5DoCQqChmLQDSdA7dr0Q5pY2Z1oW0utOu
         gLuGIZEJrMzGTzc4Fipdd3orlz2oUbM+rXbexBtiKykVewHDy1ukYuPQpHUXqM+ZcjwK
         cAiw==
X-Gm-Message-State: AOAM530XnV444rJT2PR0bL2KkOSinMIHfqPQQ/8ewlt5gMmSQudexgYo
        msirHEtxwHToxSr9bFCcqG2CHfAs5XWu/A==
X-Google-Smtp-Source: ABdhPJyLX3K9NnfpRP83wKssyR/D1UCw4Vs0QqPtZAFmHi4f7xcRBgxDMaLRhHDA/s5sdZNPyS0D5Q==
X-Received: by 2002:ac2:5597:: with SMTP id v23mr12527697lfg.42.1590348339139;
        Sun, 24 May 2020 12:25:39 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:38 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 02/10] media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
Date:   Sun, 24 May 2020 22:24:57 +0300
Message-Id: <20200524192505.20682-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This macro is defined as SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn),
so imx290_power_off must be the 1st arg, and imx290_power_on the 2nd.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 2d8c38ffe2f0..d0322f9a8856 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -648,7 +648,7 @@ static int imx290_power_off(struct device *dev)
 }
 
 static const struct dev_pm_ops imx290_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx290_power_on, imx290_power_off, NULL)
+	SET_RUNTIME_PM_OPS(imx290_power_off, imx290_power_on, NULL)
 };
 
 static const struct v4l2_subdev_video_ops imx290_video_ops = {
-- 
2.17.1

