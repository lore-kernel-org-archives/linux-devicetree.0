Return-Path: <SRS0=DJdz=7G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65886C433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 21:06:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41C4C207D8
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 21:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="afegZJP7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388362AbgEXVGw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 May 2020 17:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388212AbgEXVG1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 May 2020 17:06:27 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C47C061A0E
        for <devicetree@vger.kernel.org>; Sun, 24 May 2020 14:06:26 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id m44so12543790qtm.8
        for <devicetree@vger.kernel.org>; Sun, 24 May 2020 14:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IB735CxnLdulpWhY5dVCVlHnjZEUj+47Z7loFw0bHLc=;
        b=afegZJP77KSu+LmrLUf+eCMqlJypfVqSkrH8f3euV1CGZ5WuywPBReDBbp8/2MWEMb
         +zJjuFPf9RVzCMg0angUKn9U6lupAsSIQm92WTYRB1n9ozOHtRzjeNzTtuxds5vLHB2h
         IN0qSVLKeNm/owbAHgx71qST9loLJnWv2uXDKWuBfI7AvRkgSKWoDzRH90Hwow8J2uoK
         pAeC0zK0410Qpmj9qrSh6UIv0NGt0eLCXzmQ9bsBDr/YatarefYesBPmLGmlooBi9Gsc
         YZma+3XVp9QEbT47iLGeSNLsDulP8tLMtf+XHLnkYBvoa6fHvYUi/qt/juIybvDbti7y
         EBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IB735CxnLdulpWhY5dVCVlHnjZEUj+47Z7loFw0bHLc=;
        b=m5l9rPPH49QYvaoGoTLE1Gzi+j3h7uH1ERe4QElZpZyNjWCc6PprA2Tg+7ra1CJc04
         D3S8laSvNYI8l/F5P0/DmCMRLUgaJlwaNAsoUttTX/CKaPh49fJwowrJNoEEPjosjSbp
         FCZd/jD1FPKOHB5piQfo01DBiJHNzZjvWdTBur2pqShcX856eCbtIUZqdzloMbWCIAay
         f1vcKFqEHcDbmqPj3V+QsTV7I20vLOFqMqsT+Qdb0wsePYFcNQSOlw3bmuJOnCrI3hCH
         KSLq2Am4bGW0yR7A+tvF3GdBluBNfi5bjr68vSk8b9bxhTvYLNmc0vdkbl41BHVkjhUv
         5dsg==
X-Gm-Message-State: AOAM532Mz20FJpukp5b1Zyz0DPcZKGB5BDTAWCxXPM3CDDh0OqWc8Mm2
        LkPIr2aB3svqVTl4CJL7LfAk9Q==
X-Google-Smtp-Source: ABdhPJzm337i7AHVG8c2KaAAOBpmSSoD0D+hRZRsAXhyZSd7oibA7DcfFbEF4y8GebXWmC6GpxbGaQ==
X-Received: by 2002:ac8:3529:: with SMTP id y38mr11483010qtb.315.1590354386108;
        Sun, 24 May 2020 14:06:26 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g51sm4401769qtb.69.2020.05.24.14.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:06:25 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH 05/10] dt-bindings: clock: Introduce SM8150 QCOM Graphics clock bindings
Date:   Sun, 24 May 2020 17:06:06 -0400
Message-Id: <20200524210615.17035-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200524210615.17035-1-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SM8150 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 include/dt-bindings/clock/qcom,gpucc-sm8150.h | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h

diff --git a/include/dt-bindings/clock/qcom,gpucc-sm8150.h b/include/dt-bindings/clock/qcom,gpucc-sm8150.h
new file mode 100644
index 000000000000..e7cac7fe9739
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sm8150.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8150_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8150_H
+
+/* GPU_CC clock registers */
+#define GPU_CC_AHB_CLK				0
+#define GPU_CC_CRC_AHB_CLK			1
+#define GPU_CC_CX_APB_CLK			2
+#define GPU_CC_CX_GMU_CLK			3
+#define GPU_CC_CX_QDSS_AT_CLK			4
+#define GPU_CC_CX_QDSS_TRIG_CLK			5
+#define GPU_CC_CX_QDSS_TSCTR_CLK		6
+#define GPU_CC_CX_SNOC_DVM_CLK			7
+#define GPU_CC_CXO_AON_CLK			8
+#define GPU_CC_CXO_CLK				9
+#define GPU_CC_GMU_CLK_SRC			10
+#define GPU_CC_GX_GMU_CLK			11
+#define GPU_CC_GX_QDSS_TSCTR_CLK		12
+#define GPU_CC_GX_VSENSE_CLK			13
+#define GPU_CC_PLL1				14
+#define GPU_CC_PLL_TEST_CLK			15
+#define GPU_CC_SLEEP_CLK			16
+
+/* GPU_CC Resets */
+#define GPUCC_GPU_CC_CX_BCR			0
+#define GPUCC_GPU_CC_GFX3D_AON_BCR		1
+#define GPUCC_GPU_CC_GMU_BCR			2
+#define GPUCC_GPU_CC_GX_BCR			3
+#define GPUCC_GPU_CC_SPDM_BCR			4
+#define GPUCC_GPU_CC_XO_BCR			5
+
+/* GPU_CC GDSCRs */
+#define GPU_CX_GDSC				0
+#define GPU_GX_GDSC				1
+
+#endif
-- 
2.26.1

