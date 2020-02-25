Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1197CC35DF5
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 12:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDB552084E
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 12:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EpBw6538"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730604AbgBYMIo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 07:08:44 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36867 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbgBYMIo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 07:08:44 -0500
Received: by mail-pl1-f193.google.com with SMTP id q4so1287523pls.4
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 04:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WPkKnyITMi7kXeWtbSlS/aIAUZOsi+vJbY5BLkxXdmQ=;
        b=EpBw6538rnAvkt2GJlJB2sFwMEpU+JHMH9OIxpEBoxI13fUpcFrldhEepNuSMMOLfU
         XYzWiDBt2TNO1/UK5UoKBkdeClU51ocNdXx9fSmeTfhKNt10DT0Dhp8UIQIVwNHSLL0u
         HRQluTrB29LpziFReImfOnqQ+cpr7rPrcumQmfDGfPqCsUl7eObphCuWFwZ1wQx08ENS
         xr3iuAiFLcQCeKkl1JYlxCLLOennjXG281tkqBDG8HzVxuvetLgi2+iDIJMqY3DA/zYv
         Qa5SKYV1zIpv6zeIzq91CeczSXYjsm4ro79V1Y78NS66sAuxwjkBxki8SlwZHXIXwvry
         4PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WPkKnyITMi7kXeWtbSlS/aIAUZOsi+vJbY5BLkxXdmQ=;
        b=dacjrq/99P9slw4AmgxZGhDJ1bD7CcxmYrWcGPIR+gCgNRIpqnCfiJ1UE+kFhXB4dO
         w2SXxQWNlHD7/HPSklEr7E6DMm32RQmpI26SNMkCrJ+ZsBU+bImvNjFb0icG8PJz4b95
         gxxK9cmD2Z60V4To3IGFQkYiFbjDFpqovGWAWvkkCv3cJB2t001qWMh6AU+TucHYOUWZ
         mUbBjU3Td9Xl2kXxsyGW4bN2x+/ZWBZL5uD+QAt6DR+QJsZKlvvjuPUxGpEVXymFdm0A
         afe/fGAiLXn01xPC+A41u8275luk2I16n/yK/CPLKFIrBdFuTj629O1c8H18bNy9k1nt
         5Q2w==
X-Gm-Message-State: APjAAAWZsnavFTcCC048RAWqp7OLg7fZyM7lccL9+IVth9PpdaUbaslV
        JJlnivEawON319SXQ09HT7aGsw==
X-Google-Smtp-Source: APXvYqzSXHtUg1rAdmq8DqLm/jer+WoTdPtlDSk8bCpUE7WDHqnB1AdPOkApe299Vzns2CmCYgsVvw==
X-Received: by 2002:a17:90a:ac18:: with SMTP id o24mr4939205pjq.33.1582632522438;
        Tue, 25 Feb 2020 04:08:42 -0800 (PST)
Received: from localhost ([103.195.202.114])
        by smtp.gmail.com with ESMTPSA id w128sm15175130pgb.55.2020.02.25.04.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 04:08:41 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: thermal: tsens: Make dtbs_check pass for msm8916 tsens
Date:   Tue, 25 Feb 2020 17:38:28 +0530
Message-Id: <33b60b91ee43359d7507054e9b95c3078fd5cda3.1582632110.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582632110.git.amit.kucheria@linaro.org>
References: <cover.1582632110.git.amit.kucheria@linaro.org>
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

/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml:
thermal-sensor@4a9000: compatible: ['qcom,msm8916-tsens'] is not valid
under any of the given schemas (Possible causes of the failure):
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml:
thermal-sensor@4a9000: compatible: ['qcom,msm8916-tsens'] is too short
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml:
thermal-sensor@4a9000: compatible:0: 'qcom,msm8916-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml:
thermal-sensor@4a9000: compatible:0: 'qcom,msm8916-tsens' is not one of
['qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,sdm845-tsens']

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f31064f2374..1748ea3f4b4f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -860,7 +860,7 @@
 		};
 
 		tsens: thermal-sensor@4a9000 {
-			compatible = "qcom,msm8916-tsens";
+			compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
 			reg = <0x4a9000 0x1000>, /* TM */
 			      <0x4a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
-- 
2.20.1

