Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3750BC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 06:22:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 131EF2076A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 06:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7rhER9V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634818AbgDOGWs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 02:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393545AbgDOGWT (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 02:22:19 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3E8C0610D5
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 23:22:19 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g2so885499plo.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 23:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m0wKJOnOp7WnSwAhhU9/YwBjXZo896nHbiajmhX/TkI=;
        b=X7rhER9V+7D6xbrDFU5DyH6dKQUob8pQjifY3E+BOrJAbC90Wl9+qWdKont6wNvyRL
         wRlM/Yof+1XQ1RbYJ4gPkJZoCogepwr8C+vcziATrQtSqM0rC0dMvjYW53NEcns2gaXm
         Q4aFN5LSYyLt/25CSC5OojAbDmBSjIoIxNpgiKtXEUlqHF4HTM+iRCM3l6ioft0bDdHD
         yAOqAzmWDBXpTYfLwh0zrlVuqpeKpvo9mGXZH41BfzI+E9zZn3L3k3lLBkO2zU3XSgH9
         66qEpZgkyeQyHv3spFbB8HfWdqVWNhgymKgr7YDvXpAnhV39VzvASbbDBZ7uQ+f37ppA
         bnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0wKJOnOp7WnSwAhhU9/YwBjXZo896nHbiajmhX/TkI=;
        b=oyB9cpCQOZbY/+6CGB+dObW5DxKe7SODXX2av02kH3S3oeA3lHmcTQu8at7JDbB0aj
         a01+wGGY9XqiOHwsW5lSN10evuImEAiTzUmtwU7pY1+shJ1WHnkHCiLvgR0I92zSbEWh
         r9ASAnB0+LxxwszeOTraJtS/dbhYOOboRvLvwH7vEUnulS360uZlfHFYkePyE988H3+q
         w0oEx/3+r/Dazm72F8kir2Rhxwklhubr0nmsBiQgTk2yRSTclm9iXotaXQTGnetxVF9/
         ulQ+PGm7NNwmBREaqiOsh4QBt9rq779GJl86VAiq/kRyGwBEf4I39QV9dqK1V4WY6eVw
         llQQ==
X-Gm-Message-State: AGi0PuaT/zWTM2iXRD/L9j6/8G98nCV/OFUSWsUQb+Q9IIYgEgCnvObg
        GDA0Ly6JFQ0+99YYSlTmvaM9SA==
X-Google-Smtp-Source: APiQypLBvo8HG6RqaxwQaTA2YJFeNp3xTsShLNtx1gsmY1f1yHP5m1Ijxq1G2gYLXswby7M/CyILNw==
X-Received: by 2002:a17:902:7c8f:: with SMTP id y15mr3390229pll.202.1586931738637;
        Tue, 14 Apr 2020 23:22:18 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id nu13sm14032899pjb.22.2020.04.14.23.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:22:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: qcom: rpmhpd: Add SM8250 power domains
Date:   Tue, 14 Apr 2020 23:21:53 -0700
Message-Id: <20200415062154.741179-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200415062154.741179-1-bjorn.andersson@linaro.org>
References: <20200415062154.741179-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmhpd.c                     | 19 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 12 ++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index ba605310abeb..8058955fb3b9 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sc7180-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sm8150-rpmhpd
+      - qcom,sm8250-rpmhpd
 
   '#power-domain-cells':
     const: 1
diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 4d264d0672c4..7baa39a91412 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -166,6 +166,24 @@ static const struct rpmhpd_desc sm8150_desc = {
 	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
 };
 
+static struct rpmhpd *sm8250_rpmhpds[] = {
+	[SM8250_CX] = &sdm845_cx,
+	[SM8250_CX_AO] = &sdm845_cx_ao,
+	[SM8250_EBI] = &sdm845_ebi,
+	[SM8250_GFX] = &sdm845_gfx,
+	[SM8250_LCX] = &sdm845_lcx,
+	[SM8250_LMX] = &sdm845_lmx,
+	[SM8250_MMCX] = &sm8150_mmcx,
+	[SM8250_MMCX_AO] = &sm8150_mmcx_ao,
+	[SM8250_MX] = &sdm845_mx,
+	[SM8250_MX_AO] = &sdm845_mx_ao,
+};
+
+static const struct rpmhpd_desc sm8250_desc = {
+	.rpmhpds = sm8250_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm8250_rpmhpds),
+};
+
 /* SC7180 RPMH powerdomains */
 static struct rpmhpd *sc7180_rpmhpds[] = {
 	[SC7180_CX] = &sdm845_cx,
@@ -187,6 +205,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
 	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
+	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ }
 };
 
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 3f74096d5a7c..dc146e44228b 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -28,6 +28,18 @@
 #define SM8150_MMCX	9
 #define SM8150_MMCX_AO	10
 
+/* SM8250 Power Domain Indexes */
+#define SM8250_CX	0
+#define SM8250_CX_AO	1
+#define SM8250_EBI	2
+#define SM8250_GFX	3
+#define SM8250_LCX	4
+#define SM8250_LMX	5
+#define SM8250_MMCX	6
+#define SM8250_MMCX_AO	7
+#define SM8250_MX	8
+#define SM8250_MX_AO	9
+
 /* SC7180 Power Domain Indexes */
 #define SC7180_CX	0
 #define SC7180_CX_AO	1
-- 
2.24.0

