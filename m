Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E57C4BA10
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 11:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6132A24656
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 11:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtHw7wnt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgBZL6Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 06:58:25 -0500
Received: from mail-pf1-f170.google.com ([209.85.210.170]:34312 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgBZL6Z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 06:58:25 -0500
Received: by mail-pf1-f170.google.com with SMTP id i6so1365331pfc.1
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 03:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+p6H2ZNLGX3Lb58Cw5KgycQ+ehTxEdhQmQiKBPEVO+U=;
        b=FtHw7wntugTsPmJA8Hv3zkGUse9AWcGVV8zfyXX1B0JrMASYVUKJakSuXEn1KrB/Pt
         QIJPr2O0Db6sMohzyf4Gk4QUWD+CRjxabGbVkiPvunYbGWjEWNad+6L8k3MGD6rPIzeg
         crg5ft/qyvJbZXcpAL8TjXfOurxwlVVEEKwYbD/7h/MDXb14KLx2HFo4j06Y0BUKMg2u
         nbPImhLQkdKGl91GVn+9aTwGlss+u2DuzQeOi/3j+kw32pQmUaJv88hrUaQha80g1+H6
         Ez7IWRDcccSudwp3zpclmLEeKUTmJf0mZrlGSCnykgJl6Lv7vcQNmZKd+Zwx19ATFELr
         WGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+p6H2ZNLGX3Lb58Cw5KgycQ+ehTxEdhQmQiKBPEVO+U=;
        b=KuZKtFDQPMe7lz50vaeCoxm0cfAgmJW46Xlk7wgSIp4LT0pFcpd6MCLulq+QRfIdj8
         UbgUWEfTwTYYDVI40xC/nZSgGYR2GB8e2aJejEC8b5YytrkaEGzb2cC3TCqPw3+lxfZt
         1nxVMryFXB6ApNNsMRfvjMnRVs2nvc3mpLN/qDVhOqRbjsm0TPRVa4K3+Qp4RorrYBoa
         eww1A8peCSu2d5ZEbLcbI+sgeNWxRoaxofJO+6hyBY+KGEznlhkeSL1gTTN700KaaP1m
         XrVX8dqUkDnP4ov4ZOwgSVAI8n2jxb4kO/9aT3WTxLGUvCOTc3ROVaY9vt/QqN9dqlpI
         POqw==
X-Gm-Message-State: APjAAAWpWtMXLYvPaS4GRC3HsPG15STLF1thkyy/nEmKlldZvxU0XiOM
        9TlGy8PpnlUy8xvrCY8JIm4z4w==
X-Google-Smtp-Source: APXvYqywc/mWcONmOZQDx7IkryRxv4cAGf6uuMuuBdzU/6cdnFQDr+fm+1zRmkgIXjTHYcL43CXdfA==
X-Received: by 2002:a63:5423:: with SMTP id i35mr3544009pgb.179.1582718303501;
        Wed, 26 Feb 2020 03:58:23 -0800 (PST)
Received: from localhost ([2401:4900:1b38:7f42:3530:df3:7e53:a029])
        by smtp.gmail.com with ESMTPSA id c188sm2893557pfb.151.2020.02.26.03.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:58:22 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] dt-bindings: thermal: tsens: Add qcom,tsens-v2 to msm8996.dtsi compatible
Date:   Wed, 26 Feb 2020 15:01:13 +0530
Message-Id: <4e337c4a4194bb15f9efec67821f38504de1704c.1582705101.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582705101.git.amit.kucheria@linaro.org>
References: <cover.1582705101.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The qcom-tsens binding requires a SoC-specific and a TSENS
family-specific binding to be specified in the compatible string.

Since them family-specific binding is not listed in the .dtsi file, we
see the following warnings in 'make dtbs_check'. Fix them.

/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is not valid
under any of the given schemas (Possible causes of the failure):
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is too short
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']

/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is not valid
under any of the given schemas (Possible causes of the failure):
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is too short
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7ae082ea14ea..f157cd4f53b4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -446,7 +446,7 @@
 		};
 
 		tsens0: thermal-sensor@4a9000 {
-			compatible = "qcom,msm8996-tsens";
+			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
 			reg = <0x004a9000 0x1000>, /* TM */
 			      <0x004a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
@@ -457,7 +457,7 @@
 		};
 
 		tsens1: thermal-sensor@4ad000 {
-			compatible = "qcom,msm8996-tsens";
+			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
 			reg = <0x004ad000 0x1000>, /* TM */
 			      <0x004ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
-- 
2.20.1

