Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E281C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B571206A4
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLWy5sO0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgFLNyc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 09:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgFLNyY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 09:54:24 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2579C08C5C3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:54:22 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z206so5530783lfc.6
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i8QHZ+71uR5r8C2iVrz+FnYiMnJAkGWgVhEcbxpdOK0=;
        b=XLWy5sO0x6NyMihD9u77RPeoTa4IN3p4476KrhEB3C21R7zGrViSArupp8vODWeY08
         MZAA3SwN3S2SA6wiLKAnZTnaJ+tnvDIHdd39DowB98xoNi9Z2TOoma4aoiU4O4Mc8mgG
         SL95B7uIT4Lv994CBMH+AHawfTt3QilccsXJTsPxr1d2BgD2APHJ2Ea0FappE9lUlgbx
         oP4EKJSze9ktQAMIfGqxnt/MEijNdd0DgnDnaSSi00JB79vNii1CxJVUdcAFn2d9MAPg
         goz06Sx8j18T6Dbu7MOOnB1zls/Ow3l8Ceedxl5NwZEHsZo1HCQnTsc1Q0BgLt3746aB
         swMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i8QHZ+71uR5r8C2iVrz+FnYiMnJAkGWgVhEcbxpdOK0=;
        b=KE2SouzC1RjfQlNxPEskDRagp+Vpfj5s/t13UEUVeWLsd5c0Vzm/EgJv23+u2E0I5Y
         wC7q5DOpG4Jn2k9ETTodi2/jIvJSdqZr3zYuGTHp6K5t7naOYaz1S/h4LJabZxxW2T8V
         Trz23j4jVQ05szfqoeObNjPCyX7kMozBaI8tCxWkmvtWVC5XgmwYAC/qjOsG74tLi9Ce
         Q59NrDXpd1vUhAqImAaiWnbuGdEB2iqNrTPh/k//7Yu6woytuAVegaQoHgCRGteKbid5
         qrHPuMMNytnFKWWKdg5wlewBTP9CgyYSBR8FeUikq8bSu7RsNooBT+0AbRwqIgJURRFI
         iadg==
X-Gm-Message-State: AOAM5307LCC3wigc4xFvJeRNUKFvJOZ1MElWAXFP+idl2+JpXvnISti8
        UQcAOzMiXasJQZVySuN7I/KMHA==
X-Google-Smtp-Source: ABdhPJwO0Af920iLi+MZmruEfnVsbizcM52UCA3GXDnT0F2vvjwJGqBUDC4wL8C8SVGin7D00Fgkvw==
X-Received: by 2002:a19:cbd7:: with SMTP id b206mr6991562lfg.163.1591970061110;
        Fri, 12 Jun 2020 06:54:21 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id a1sm2414415lfi.36.2020.06.12.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:54:20 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v5 02/10] media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
Date:   Fri, 12 Jun 2020 16:53:47 +0300
Message-Id: <20200612135355.30286-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612135355.30286-1-andrey.konovalov@linaro.org>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The macro is defined as SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn),
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

