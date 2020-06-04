Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEE0C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 992C520679
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCwwAKq0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgFDAni (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 20:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgFDAnh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 20:43:37 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300C6C08C5C0
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 17:43:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a9so1534240ljn.6
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jK4gLNB0iAkstlca7qoP4zJlhYvGOTtNahstZSraRpg=;
        b=cCwwAKq08vlmsQEaK2dSt46t4VXNA2dZ+afSQLj43FfFMNgP5oshgzO4bPqLHTfWrO
         cReCcNsaLKMiz2Vu7bL66S67G2C9lsVn5ymXO63P6d6Si7EnmuDux8zLrfluHh5Bewf5
         j/CTjcJXuy3kRqATbcruSyZuIxlvPSUNmEfFnjh8pjXAikvwDZTUvOMzuEiL/B6f2AeQ
         MWsiT7AbPywwgyfLWPApInfWucQGv+ZK5X0xUlyCxcak9XsrcD+rhjlCWfy7/ESWQ6as
         qlbwW8Uowh/otcJQNpjtQkWETxrpg89d0K1YOJULEWDjUwY43xrZsGHm3rvD8Q2R8WC+
         6oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jK4gLNB0iAkstlca7qoP4zJlhYvGOTtNahstZSraRpg=;
        b=pVMQ7UC7kACn1DkwhHOc0/LgPCNmFzdFk4jE3WRZVomu+opbT/nTIHZ4AG7KSfYUL2
         cOZOcYG919N1g9nkU2PL4HK6jcsQj97kWrrxFNUKyB+tWXOfgrO8s3TSRq+YKQADFmx5
         FqjKX/x7y8Z4fBa3b7JASkGM47aXGt+1RIyjM+lnKGnDpX6RyIdI97fTUPLLdKmP88Fu
         wq09DezW4/1khfk9qyEb1BJqe6EScdPryCYhef3BOY0dRuJZMpCgrm4Kk/BWOVOSy0PK
         KyPu0tvrFyTPBDPSv8y8t6y9VUcRU22y+7deIj0KezS5DnUnpgwtVlujZcXKpBec7IO3
         j+Kw==
X-Gm-Message-State: AOAM532k8FkFMyjAgXiuxnV3EDnrNZib4OmSnRPe/8qEkRZZ/KKm9Ou1
        KfvmxLqXTc62lRemOeFhDfPn1w==
X-Google-Smtp-Source: ABdhPJzGQH/1wlwxWBwOnsU2Po1UuVjpSQkfwVV0LUI8KJh2OlSnivi8UeOwMY0Y2msbWHKE8UmB/A==
X-Received: by 2002:a2e:83c9:: with SMTP id s9mr281773ljh.166.1591231415709;
        Wed, 03 Jun 2020 17:43:35 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 2/7] arm64: dts: qcom: sm8250: change spmi node label
Date:   Thu,  4 Jun 2020 03:43:26 +0300
Message-Id: <20200604004331.669936-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PMIC dtsi files (pm8150*.dtsi) expect to have spmi_bus label, rather
than just spmi. Rename spmi label accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1e2862bbfb11..9dd27aecdfda 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -991,7 +991,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		spmi: qcom,spmi@c440000 {
+		spmi_bus: qcom,spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x0001100>,
 			      <0x0 0x0c600000 0x0 0x2000000>,
-- 
2.26.2

