Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2445C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A14AF20679
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIRvt2hI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgFDAnk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 20:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgFDAnj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 20:43:39 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83286C03E96D
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 17:43:38 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c11so5122139ljn.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 17:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lf2AkgbZNNBLszG0Yic70a6dubyQ2Qb8wbjXSRCkiy4=;
        b=FIRvt2hI9pF83v+VUTI3gFpqZ2LhQZyoRHgtcOuRSRNyRPocoaHuxMtGwhuHqYVoo5
         vJJhSUXr4gVXnLZkk8SOaiCUE47PhvWqWbOVcLgCGNbP4VyRCqPG2ksxgsgc1atcnizL
         jvNdwcziPfIGHJpPfTOnw2dAztZxO9rTSLiIDxmF3NhtymgFE4QMQ1oQZypXEuuXOgjm
         1mu4RU4od4DuVJWjifSXUMXkiL4h7rzY1ke+WgKCLue30jOXzLYDLOKEpVFOhzzYvHOY
         avaBK+wuwxmdq00vq19TUXfC35TbJMbZm7U5T+7DpLc/QxVWK+oAs2CAhwTKv1ThW8BD
         EGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lf2AkgbZNNBLszG0Yic70a6dubyQ2Qb8wbjXSRCkiy4=;
        b=cy5VUhXYafJzsF4Rt5ZGzlBwtCPz+gSBmPwSVmDoxx/HWvonTyuQ76GFLDEEJI+ltm
         /DO2wAPz0l2hhZs6cL4Hw1khTO0PX6OjVeC0FKPW6c+nE4PH8xntqaHo/5TybsLhLMgV
         kS5RuvM2cQ6LiDK0jRT/xyue9pe8aRf41HiQWrOPsTvaItILmqee6VwsUkKL9FSMOxw6
         YqgH+3Bi/ygYWWb0Su9SxroGEoi8RYamXB9m9gRo6lsYkU022BQkqGjV+EGNsxifPU+u
         BPgjfVnCyQn7PGjKRJXN7dlbpwxuOhpqLiOYqW2aFvKsMPleWSiZwnHNLwj3QkqiFO4u
         DslA==
X-Gm-Message-State: AOAM531lEoO6JNrtLWrhFjm5dI4ktw1oeUsrYFPTNO4A8UiwsLOEwuiz
        VQ4kwREhcI+wZ3mT8uI2PHQCOA==
X-Google-Smtp-Source: ABdhPJy/QFf3BjDD2Vmrs7DO/JnE1fQxk2CfAIaD+dKQyNNaoN3pIR1k1G1zp9qZsqCnVOzP2BM0pg==
X-Received: by 2002:a2e:5415:: with SMTP id i21mr860383ljb.233.1591231416931;
        Wed, 03 Jun 2020 17:43:36 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 3/7] arm64: dts: qcom: sm8250-mtp: include pmic files
Date:   Thu,  4 Jun 2020 03:43:27 +0300
Message-Id: <20200604004331.669936-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Include files describing used PMIC chips, GPIOs, power on, etc nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 0bc4b1e037c4..c20ae91d3026 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -7,6 +7,10 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+#include "pm8009.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8250 MTP";
-- 
2.26.2

