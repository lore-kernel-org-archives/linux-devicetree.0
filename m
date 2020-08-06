Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F42C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 17:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 767CA221E2
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 17:51:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rDkRS6zy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgHFRva (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728597AbgHFQc1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 12:32:27 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B16C02B8C3
        for <devicetree@vger.kernel.org>; Thu,  6 Aug 2020 09:31:36 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id 88so44571361wrh.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2020 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0z+nN4Q2Lop7WGeqT2R4X33dK+rJ9oWoUAFXO5nbng=;
        b=rDkRS6zy1V+kPfp+/a8fkd3XWxVI36H7Hci5dkKNDtqe7glv3N01cuhkrd9149KBrp
         KqkqRLtj4VFf4J5D2yIR5qFHExE+56hq+F86aoeNqR2YTFyg7+29Ftq/JxxICKK+t/uP
         4EPyBAPK3afS2C+RGssubuyDS1X2VmflQyupcqs/imRgPFfht4CL/pZM4ZF4AA1UXQGC
         c8Tnhq57i6SnofcJ0PgQ8/HJ/vTN3fSezs9s2+IHsj1Jk3e9KBmEQ6ODk4hf6J6NNrGc
         oWcMJ/dxevSCE/kW447IzlLPCiXDgDxe91/zr8mttDdVpDTbNrgVWUE09FqwZJr4IOoH
         sT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0z+nN4Q2Lop7WGeqT2R4X33dK+rJ9oWoUAFXO5nbng=;
        b=ltkCgJ24SoJDfq9zjEJP4IPFjbgEa12nZMMRIVJU0sUKyPAWQMkGwtHpTXZ4Uyw37h
         Z6mcdAD9svbyB3GxnVe07X9hCBzPu8VUefl9pKcpQn8e78aah8QZ54nzpJILxjtmCvsV
         BMXv0dH3LryrTXQ53mBUHMQPVAlgkj5tFz7Q+ZWHC3BtSFiqP1+ppW206t1O7a7Orm9e
         +MvrgutkPS2NzCqoG/k5O69CySabP2dZKGvN/0fBjjHod5QKE278iZmwde85fCtGw7wM
         gKiziFtcy7DCqcPsOnqCJ5WMxFrJyscmwJTjjTWRIjDQTzQyQKJl19dL2c+mHuconTsH
         UkSg==
X-Gm-Message-State: AOAM532jY0GhMTLOGslbHsq583Pe/Y0PBal0RtSxUZ6HIJcyRlGTnI1+
        QajJHHcX0Yud7BG11bSg95wdtg==
X-Google-Smtp-Source: ABdhPJxEWkKxjmYT87kSQKI/wM2IQuf7tTYF26VwCw7rIKhm7CGMFJ0ShTSmBNzBxRiYEhaR4GamdA==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr8195593wrm.275.1596731495462;
        Thu, 06 Aug 2020 09:31:35 -0700 (PDT)
Received: from localhost.localdomain ([87.120.218.65])
        by smtp.googlemail.com with ESMTPSA id i66sm7468537wma.35.2020.08.06.09.31.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 09:31:34 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org,
        sibis@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        georgi.djakov@linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] interconnect: qcom: sdm845: Replace xlate with xlate_extended
Date:   Thu,  6 Aug 2020 19:31:23 +0300
Message-Id: <20200806163126.22667-5-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806163126.22667-1-georgi.djakov@linaro.org>
References: <20200806163126.22667-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Use the qcom_icc_xlate_extended() in order to parse tags, that are
specified as an additional arguments to the path endpoints in DT.

Tested-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/sdm845.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
index f6c7b969520d..3b81dbb71b0b 100644
--- a/drivers/interconnect/qcom/sdm845.c
+++ b/drivers/interconnect/qcom/sdm845.c
@@ -469,7 +469,7 @@ static int qnoc_probe(struct platform_device *pdev)
 	provider->set = qcom_icc_set;
 	provider->pre_aggregate = qcom_icc_pre_aggregate;
 	provider->aggregate = qcom_icc_aggregate;
-	provider->xlate = of_icc_xlate_onecell;
+	provider->xlate_extended = qcom_icc_xlate_extended;
 	INIT_LIST_HEAD(&provider->nodes);
 	provider->data = data;
 
