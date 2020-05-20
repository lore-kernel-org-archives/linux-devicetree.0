Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAF2C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 08:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F3AE207FB
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 08:49:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UgV20lxE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgETItV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 04:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgETItS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 04:49:18 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9A1C05BD43
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 01:49:17 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r22so1100269pga.12
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5/GPOSvzOGmCtBHrtawLleBNjihEJLwhFje0r/gyBuU=;
        b=UgV20lxE+m+5SQqLGTghEUwbTUIM9gsx3aohb5041IPILli+i+DueRkw4rs3CjRGxL
         LZS5e2UCfwkwAMonLsL3niejayYElFI+pPozSt58oS1qocOOL7IlVKiYeT/toB8tkEjV
         wMz+aKUDq8VAhC0/BzUvqi272zqkPk5rMwZdJKtMR2GOI5HKU8bvFYTTAp/GDmaxI2YO
         BlQkxKE+5rSWht00tp+BRAjus+zrmgdOja0SNtIMKGtKvCDLJlZOGld8f9lntRvNW1RJ
         ya2kpYX94mnL0y2m1esWiPualqY7/k5Rqdyh8hlEUOET73J2UFTjSHqL6Yq1vd5DMDWx
         PtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/GPOSvzOGmCtBHrtawLleBNjihEJLwhFje0r/gyBuU=;
        b=VXo9Bmw6y3fxfekvODMStFkR1qZ4SVB6snEBihIT/5lFBXR1hO84ZR/vUEd8Pe/l4j
         lHYWpDmTncOHauOipEGm7IhuDhX6CKKwOhDQ/Krj1LcVLIeT4Q4uq0257CflNUYvS2dJ
         dtVAuh4PATMEIHA0oFr/mxNGiMqBKNHkunHIaQ9Yc1mSBG0c+lYVS/BJrxRHkdkan2yE
         Yu+8teSGhY0EF01xyaROnxtWio/6K8I4Yu3aesmd6Z6jTou72uyp7LAQ1XZhX//8tiLQ
         VFk5w9CUbT2DZr3jl6eSJt06SPjnb13eaDgi6UJfOdSJaMr0x7yJO4qqg+oCO7J41T4r
         RttQ==
X-Gm-Message-State: AOAM532Y/AIUx2X4RJy6Fer90lrfb9oKKCAm4nxqm7CfS+ek6In3FKWR
        15K/MZNVAss+aLwjx3eF4+a9
X-Google-Smtp-Source: ABdhPJzj9bk9hZCRxZo8oW53zgCLOrVhCvadLVA3ohiWT2uJcdRzK8qBIb25Ia1yGDIjiBKPe55flw==
X-Received: by 2002:a63:4b0c:: with SMTP id y12mr3054903pga.56.1589964556662;
        Wed, 20 May 2020 01:49:16 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:91e:dd0a:7c30:1f7e:ebdb:aa2a])
        by smtp.gmail.com with ESMTPSA id a5sm1629332pfk.210.2020.05.20.01.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:49:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for Qualcomm IPCC driver
Date:   Wed, 20 May 2020 14:18:54 +0530
Message-Id: <20200520084854.19729-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
References: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add MAINTAINERS entry for Qualcomm IPCC driver and its binding.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..cc2fb991cc0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14013,6 +14013,14 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/iommu/qcom_iommu.c
 
+QUALCOMM IPCC MAILBOX DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+F:	drivers/mailbox/qcom-ipcc.c
+F:	include/dt-bindings/mailbox/qcom-ipcc.h
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
 M:	Sean Tranchetti <stranche@codeaurora.org>
-- 
2.26.GIT

