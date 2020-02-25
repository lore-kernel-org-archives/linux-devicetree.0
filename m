Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292EDC35DFA
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 07:31:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01C7724670
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 07:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHquTiE8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbgBYHbl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 02:31:41 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41508 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729403AbgBYHbl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 02:31:41 -0500
Received: by mail-pl1-f195.google.com with SMTP id t14so5129342plr.8
        for <devicetree@vger.kernel.org>; Mon, 24 Feb 2020 23:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6MeNT2LBtvvWRJ8skAFje3DzrXRMuYy+VgIgQTPNC+Q=;
        b=rHquTiE8TUja3dt4Mjut7qSrPx8UbwPjZAQBsFOjEe81TYZcG1QzVdDP5cPVCiNSRr
         UtdvehGce5clYBhp3qyoLcr/SjcGnOr9Y1mN3MlCj+dcXvHGpQAJmtyqsoPWxResXyLd
         g0zlZeB16O/TTvlRcfD/4aQb1MwwVBF8pMBeQIc7rBmQUUKJyR6tKt5joehB6IJKWjwh
         x1GFw/mfJuZelPLVtq5tRMkF8kf0zqkyvJsUBPS7mx1QA/BP7fB58BYjX0enTUZFVZ23
         IZY+7r+MOOVqzY6kL9hD6kmviGRGQZxjcZvijNMMcI8fWJVY2feHH5Uv7C3FANoNTlVa
         E5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6MeNT2LBtvvWRJ8skAFje3DzrXRMuYy+VgIgQTPNC+Q=;
        b=YLoNt4OccYGkc2CUYfR1B8w+uM7tv8I1Ker+fHevhhi27YUfiq3QW7R16Ju/yOyoto
         ROLwhAHzxeP14lgBQX6u1V4nRhugRqKJZe49ENu4S809cQK4Bk/FpcPM2cCpFY1E1nOt
         6dT79VwqAjesnsbDKaxCccJd3x6B31I9urV+4vT+yQLlzpSJbSx4kOfFFpbvJ2WCcfhD
         Ys5ayAjY7HsaB+0VjRY5MSb+wz0Zb91FzXMeIEJfQ2Pxs32KEVVczigimA8nhOtSuQMq
         Dd7yn8Coo3VryHkwQ+py5J3tLfT7IG4Y7xgT3ZY4lIXWQoNnPLkYdjhqV7sLUMLa5sK3
         dfKA==
X-Gm-Message-State: APjAAAVMBZLLFx/eHM2qR5kwtstyRCmZN9cse3wqQbjb2rJ41HOM58AF
        DRWpafVXRyBg7WsG1fgqbhlUrQ==
X-Google-Smtp-Source: APXvYqzJsp59Rs0HcueeuzygtiN8ttUYqfXk8tRf9Kt50g+PItQ8Lj0vSK/QmgfO/K2DCrAwmNc1Sg==
X-Received: by 2002:a17:90b:3c9:: with SMTP id go9mr3647591pjb.7.1582615899920;
        Mon, 24 Feb 2020 23:31:39 -0800 (PST)
Received: from localhost ([103.195.202.114])
        by smtp.gmail.com with ESMTPSA id a17sm9056906pgv.11.2020.02.24.23.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 23:31:39 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] dt-bindings: thermal: tsens: Make dtbs_check pass for msm8996 tsens
Date:   Tue, 25 Feb 2020 13:01:22 +0530
Message-Id: <7b7291509e02c3100cb765cc846c6df4b5540037.1582615616.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582615616.git.amit.kucheria@linaro.org>
References: <cover.1582615616.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

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

