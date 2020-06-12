Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E02C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2F462081A
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wO7KwHdt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgFLNzh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 09:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726517AbgFLNyq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 09:54:46 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E920C03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:54:45 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 126so905324lfn.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rt6ATyUj+kngO18ntOXAOOJDegUILp5okUOOJZj7u30=;
        b=wO7KwHdto8wlA0AV82uro7r1mK8DBbXdgWCWNK/MHmIEZNZswGO4HSzn48aJdHLwZo
         4FzLRbwhsBUHqDFgtuTSNvdAopkP1kXPR+tNGagHOodO2CH/OX2VB5P7t78pzMNaba2l
         2lvPmRYZ+er5+r7VhVBhp9YYNQuuUZfLmedjZWePBXNM/U7o23C0oYHsLdS0dG2rbGgA
         0pkFdjWn4K8I4Tp9zZGgXDov0m97rJ24qVbVgJIxdYQ23STL5mCFH0uN1cZ7c42GB7pK
         c5OsfvVDrRMsrf216jVMdXeqlb8U3vtsT9ZC1P1QvU9lnF0YT1AQyoxT5PAE9w9C6+p6
         AY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rt6ATyUj+kngO18ntOXAOOJDegUILp5okUOOJZj7u30=;
        b=M/1FYXm7HDfMYpY7/Hk2oQqlLs+BsG8kvEpUXYIDoatk3fkSNBC9dojQwa4j6lGRLk
         xQvVkxAO5qjiHM2UL1U0gKd3MCpWLNKjNPtnhgW+P/1DO/yKc5rP1PBoUFTrFDSrtea/
         oMT1yvHr7A09Re2sOTaSE7Kplfirj1MaDg7R+QS+KkYbO9szjTdl8v4LN717R/AJZiJ4
         CwU7pbyqB8P/Y8ttgFvrqgHCTh4IPjmd4eebvApsbQ2Hf/eF+pm1lxdBxtoScvo77BVZ
         pplYQipjlUO9/rmVsqKCM/E4tN1GlM5itDM/U0cgOrbU8rxdT7lWhUXPZY+jkOuTfRgF
         Hk3g==
X-Gm-Message-State: AOAM532nsks/NkYWb4TSgxD4DN2ReMR3QXEm28GpJePFtAGPpL0iek2S
        1gnaaQwZ5A5f3DtgzwdIre9reC5mMWF4fg==
X-Google-Smtp-Source: ABdhPJwV3q5S6l7asf3glLNkw33gfxAahHfBbXmsX8m8y7tdd0ypHlX1K1zB1nF2jJOXj6UeKr7sxA==
X-Received: by 2002:a05:6512:488:: with SMTP id v8mr7079139lfq.205.1591970083855;
        Fri, 12 Jun 2020 06:54:43 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id a1sm2414415lfi.36.2020.06.12.06.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:54:43 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v5 09/10] media: i2c: imx290: Move the settle time delay out of loop
Date:   Fri, 12 Jun 2020 16:53:54 +0300
Message-Id: <20200612135355.30286-10-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612135355.30286-1-andrey.konovalov@linaro.org>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org>
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

