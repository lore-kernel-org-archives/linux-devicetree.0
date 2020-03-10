Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3E7C10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 06:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 848762467D
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 06:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZjnCK5v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgCJGfV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 02:35:21 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34634 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgCJGfT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 02:35:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id t3so5872100pgn.1
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 23:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v580Rmb03EtLJPoOXCw/wOCBD8/8JxS+MoT154A+lnQ=;
        b=mZjnCK5vkBIEyZzc52Dk5xKX2BfQ4L8Z8HcJx+EiQC03uv4g6+eRRk4jICz1TvlwxF
         pz3aLzoHZks6knnpqS++ZFf5tPuVGESoZ2yZbKadXuqgPzAgqi7/TXMdpEh1O2j3s1Gl
         v4bcGPiX5s/4jbedA5urg6swkCFxd5wBDCicTaB/F0u/DHq/nXl9joKuGBAinkAzS2vc
         Z+js7OfJk7DwI56K2vyUZ5zLBiGliWVM/ngL8cr5PX7aFRPkKp7pnBwqPfRj5NlEAmD2
         UApecdCUqnHxLO5ghE2IOabdpF9QEe0E3KoVuk5IKTDGCTUA9KKQrJhKqsGado8ogL2O
         Gm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v580Rmb03EtLJPoOXCw/wOCBD8/8JxS+MoT154A+lnQ=;
        b=LBNf4QMZb578gCDrIRT64PTFvzXUSCxV5WpnoDDbBIxeQ2V7IQFjlOiYkRWmou/1Ln
         4WEvz3zzHlUIwtv/quP75wsoqEx33YK4AVCDp+B8Os3ZiQ7EgcArrOSHoj0LpzOjypZ2
         4APdAIxAGl1moSMsLA9/bZ+WRGoACdfflMRghZUyXNdkqDgPANrEmptDJxaGpuk1jwgD
         cUkK8xmU4Jv0rCgkGKeC9ddilIMSFk+A7743Xli2IvuS0EzgiKsecMJWxzHOzawH6MNs
         fMDoaL2RYgMB65HAjlb2Qia9LfsOVNCnDYgef/R0zoj1KbW85SL6zNYbv6QIQRFxPuSe
         x4eg==
X-Gm-Message-State: ANhLgQ1SbUjq2QTRRsaIq51DaaZPgSuxPWa2sNhfEEh62H+ldcB3pkT7
        RmLwuHnIyiYEKVFvFNTvk5BDag==
X-Google-Smtp-Source: ADFU+vtPlT2KsyZktOOc6LBt4AUsdDGVs4j2Zjv4y1WWMu5o9XGsVuStyT+MHbY93epK6kNtxoTLhQ==
X-Received: by 2002:aa7:875a:: with SMTP id g26mr20675002pfo.193.1583822118013;
        Mon, 09 Mar 2020 23:35:18 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm1388029pjr.10.2020.03.09.23.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:35:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
Date:   Mon,  9 Mar 2020 23:33:38 -0700
Message-Id: <20200310063338.3344582-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a simple-mfd representing IMEM on SDM845 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Added ranges
- Made size in reg hex

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 061f49faab19..36ed6d8d0863 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3254,6 +3254,21 @@ spmi_bus: spmi@c440000 {
 			cell-index = <0>;
 		};
 
+		imem@146bf000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x146bf000 0 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x146bf000 0x1000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
-- 
2.24.0

