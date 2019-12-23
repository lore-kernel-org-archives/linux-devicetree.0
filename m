Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48BBC2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 11:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BEE72063A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 11:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4l5DT24"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfLWLeS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 06:34:18 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44151 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfLWLeF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Dec 2019 06:34:05 -0500
Received: by mail-lf1-f67.google.com with SMTP id v201so12342068lfa.11
        for <devicetree@vger.kernel.org>; Mon, 23 Dec 2019 03:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sRlbBOojW7v2VRLaDWPeR8d17hgWrl9wNZOspFmUuFU=;
        b=d4l5DT24Y38W5mGuPJIynJ4QPy5y2AWXpfgy1NN3L/MYUmQX19hnKTTiPzFkalQ9Mn
         PgyRbz56ibJ1HYrr7UfrDjkHeXb40tsZdYSFwRRS3BuRxDe2BsmwolxenveHq6hPUruv
         Xy7PCG415Tej4ov7zYhfhSmb9vQHj05DFGuUWvmLwEwJZm+V7KN5LN9XDXsaK4AOPICJ
         D4waAR3nseEIP22O3paOsc50esLW1/Ln3N51JGKwiw4/BLhSltqxp1dirTucsmhovzk9
         UwU5u7lk3FKJaQ119nGK3AsNrPL7AummJd/0hqvuOagRfVuePG5e3XMUyBIPvyBSh8CM
         X8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sRlbBOojW7v2VRLaDWPeR8d17hgWrl9wNZOspFmUuFU=;
        b=aYKFJtAYUHKaAOu4sihRJ7I5jh6M20dFfxLw8pygOklEVUOlwAdvnhTQdOMmVrg6NL
         iMDuShrILoX5nBTI8zIznLhkztOhJiJOZkY2qlw2aTpLVcOA7JlsIuBKnKZWwNtPc09c
         DY8rAz0D3HFLl8ZVOHEASle8wYuJryhkgCX/Q4r/t+8dUrn3zZXrPmud3Kk8z+g556fC
         vTC+5LOncOU17iARrKLJBF7WIQ8TEHQSo3BZzLeuDbJDldWihMy4iXm8bb/cJyv3/GEV
         T+OgPZqoygnT2+u4ZaepoW4rwGWhe0LpXHJgyuMQhRTh0yvHWBz58MemXhii96gbZV5d
         Kz0Q==
X-Gm-Message-State: APjAAAX0YGyvhn6Mb3wULu3bEj2ySaS5jth8gklXE8a7TFnX9Q5lA+Tc
        qVlcIBcxLGyEBbhrF0vyqrth9g==
X-Google-Smtp-Source: APXvYqxF0S28L1/Zi6H0Gem2KPIrjcbUfKLbJmevhwSHRFRhcsmkmzWRZmEGRfdJYYuWSay6RfkSyg==
X-Received: by 2002:a19:888:: with SMTP id 130mr16914253lfi.167.1577100842992;
        Mon, 23 Dec 2019 03:34:02 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id g15sm8381500ljk.8.2019.12.23.03.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 03:34:02 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 11/12] arm64: dts: sdm845: follow venus-sdm845v2 DT binding
Date:   Mon, 23 Dec 2019 13:33:10 +0200
Message-Id: <20191223113311.20602-12-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Move all pmdomain and clock resources to Venus DT node. And make
possible to support dynamic core assignment on v4.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..c5784951d408 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2568,32 +2568,33 @@
 		};
 
 		video-codec@aa00000 {
-			compatible = "qcom,sdm845-venus";
+			compatible = "qcom,sdm845-venus-v2";
 			reg = <0 0x0aa00000 0 0xff000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&videocc VENUS_GDSC>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>,
+					<&videocc VCODEC1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
 			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
 				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
-				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
-			clock-names = "core", "iface", "bus";
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+				      "vcodec0_core", "vcodec0_bus",
+				      "vcodec1_core", "vcodec1_bus";
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
 			memory-region = <&venus_mem>;
 
 			video-core0 {
 				compatible = "venus-decoder";
-				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
-					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
-				clock-names = "core", "bus";
-				power-domains = <&videocc VCODEC0_GDSC>;
 			};
 
 			video-core1 {
 				compatible = "venus-encoder";
-				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
-					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
-				clock-names = "core", "bus";
-				power-domains = <&videocc VCODEC1_GDSC>;
 			};
 		};
 
-- 
2.17.1

