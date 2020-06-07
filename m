Return-Path: <SRS0=Te14=7U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D97C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 16:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3C352067B
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 16:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ml+4gVbe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgFGQbU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 7 Jun 2020 12:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727844AbgFGQbJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 7 Jun 2020 12:31:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E86C08C5C7
        for <devicetree@vger.kernel.org>; Sun,  7 Jun 2020 09:31:08 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so17532476ljn.4
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2020 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rt6ATyUj+kngO18ntOXAOOJDegUILp5okUOOJZj7u30=;
        b=ml+4gVbeQHnwks5Iuv1jZCzoHDKLU/b9ovZ9dwJFwQrqiRoSpHXMs18iuG9+NtJiMd
         +Lg5g9KGMG/7imFtj2Drlv+VawBL7qCRfUi3wwnO22W/NN7TNRV+e2UgNm49HMqn7pMq
         VekBB4R5QnczjNrBjx0DQuOEMgygxoqJhh7PyspGiwcKh08+hk+pdqNSz4LrnX/I/h7m
         lY5uwVFqM/O6ITPZcXYb5hmMHlg++05bzStAZrgsRrs0zGuUZisYjqHhBJm05srSn5PS
         0AL/s8Xnbl9sGY5s1qZEvydkYDc0Us9ET1mG6mc6h92tH1usT1ItACDMm+hy+Z9B0beH
         M6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rt6ATyUj+kngO18ntOXAOOJDegUILp5okUOOJZj7u30=;
        b=smNOiqyvTJ9fvRL7gFTzPYv4+3C6D+Ua7VVj6a3SbLwrG3xL9ymYr2fRm9InSU/Ogj
         GBT6TzPphSRJvBsOz7/HsgzdsgH+GlveZRahldzXYLu3+DPtrT99/GWd8kxmCQr9c1QR
         ltf6LaoU1oqFDu542wOKm3qagb1MKyorCxsIhbZHN4dY3VTkEbmFN6AvZgpO0+Du7ch1
         c/aFo3D98liIlphoZk1/BDgV+dvpvgCo4FCtEffCPhBdbGg7MokqWhZwk6zL/UQMK4BV
         QUF1t9VNzBRyWE0OmTm//AjaOfWnMBmCPxdBRg31ir3Lqmmbb4r4qTJrKsCeETp0WMKm
         Rr6g==
X-Gm-Message-State: AOAM532weSKYQIFqRdr2GbIiFK6xMTW80GviZt6lcagvfjjj3H1okVcs
        Iog5P/4AHYN4Pm2kmPxYGpBJzA==
X-Google-Smtp-Source: ABdhPJzAvsjh6tvRZCxTeM3UyEofF++E+CgDNsgqVLM63SFDjmzic+mxo9+95tiJJjm8CU13LJYNeg==
X-Received: by 2002:a2e:584e:: with SMTP id x14mr9077902ljd.106.1591547467090;
        Sun, 07 Jun 2020 09:31:07 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:31:06 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 09/10] media: i2c: imx290: Move the settle time delay out of loop
Date:   Sun,  7 Jun 2020 19:30:24 +0300
Message-Id: <20200607163025.8409-10-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

The 10ms settle time is needed only at the end of all consecutive
register writes. So move the delay to outside of the for loop of
imx290_set_register_array().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index fd147fac5ef2..02001c1b0dfc 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -404,11 +404,11 @@ static int imx290_set_register_array(struct imx290 *imx290,
 		ret = imx290_write_reg(imx290, settings->reg, settings->val);
 		if (ret < 0)
 			return ret;
-
-		/* Settle time is 10ms for all registers */
-		msleep(10);
 	}
 
+	/* Provide 10ms settle time */
+	msleep(10);
+
 	return 0;
 }
 
-- 
2.17.1

