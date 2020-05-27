Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30C5C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 05:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B4DC207E8
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 05:50:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nkhktc7S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgE0FuC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 01:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgE0Ft5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 01:49:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C0FC03E979
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 22:49:57 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t8so1038424pju.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=as0Avzsp9Lss0eL+csu6Dp2X/hKJ+kMXkkrxdlCrJlE=;
        b=Nkhktc7SvwvP8N8qABeMIx8UgBdpMV1D3I6WRmZqX31rmI3SdQW2Z/4nFPgtady2H+
         PKRBKet8JlKSegfedkX4WkW0i//ywNjRO0nz9Z+DzCdGjVY6BFYm+8R7hpko+9mZDroE
         b20lJWlyVU6bOaBUL3QR+JMrP/PBs4nKSo/YdeVrXA9ZXNbadjZbLBSWsfWTOJcu7S0O
         7J62xkoUpKnaXZN8AddXPmMASPoX+RVVv61VvveKSEo+b+A5biSa3mEi0Xvm06dfxYHi
         Pz4gnG7R6RT6XSlR4FzbQnkI1hkiGgsw89FjA+92k0hM82nP+zSaWgct2iQ5g2LcDh+Z
         B+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=as0Avzsp9Lss0eL+csu6Dp2X/hKJ+kMXkkrxdlCrJlE=;
        b=gfXVJmTdYrqzL2u9lY3VQUGCG2fqjJ5+m9g89Uv9zT9oeKYpMapi4w1A2SXvvsKrtp
         itfBEMfUfBfXvZHVacXJK8ORjN6FebDgozARyXUdjMTIM9dAOR7MnmL1aiBP3lCw3eOH
         ik/guxkIwjHvqip2KJfR5cuCM1ohtP01+kc/AlTjqawgCuqSf4OdRpXn02G4iyTfQZP2
         hnD73b8eplD0PMeTe43Ly3EE7NmGMoP0WtCOM1K0p38LWtUgKP6SXhEAJL2/Gqo2OXJA
         ANibOFq8hiqXREY1y/6Sv4Qi8NFuBcppi4dfwqVBHn2mLpgEwqPkPCX35ruoBOtDDqJl
         B6Yg==
X-Gm-Message-State: AOAM533KVyxCY2EEryLgLXlBmIydbAukT0T+fdXmcpHRbvHfbC4MvcDN
        d6KLyHaitjfBHNejrl0FMHhBFg==
X-Google-Smtp-Source: ABdhPJyRFD/dhEqWn2wwPDso7aUk2XkdhWCscbLBHCjfyMj9qM+q+Y9PvayyO2sipz96iJ6+J5j4ag==
X-Received: by 2002:a17:902:d894:: with SMTP id b20mr4404621plz.156.1590558596594;
        Tue, 26 May 2020 22:49:56 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 206sm1015873pfy.97.2020.05.26.22.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 22:49:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v6 4/5] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
Date:   Tue, 26 May 2020 22:48:48 -0700
Message-Id: <20200527054850.2067032-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
References: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a simple-mfd representing IMEM on QCS404 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Picked up reviewed-bys

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index c685a1664810..b654b802e95c 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1097,6 +1097,21 @@ blsp2_spi0: spi@7af5000 {
 			status = "disabled";
 		};
 
+		imem@8600000 {
+			compatible = "simple-mfd";
+			reg = <0x08600000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0x08600000 0x1000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.26.2

