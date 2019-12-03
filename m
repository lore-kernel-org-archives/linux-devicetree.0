Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4736C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 05:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A72E52068E
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 05:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CsBQbbk3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbfLCFYJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 00:24:09 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:43246 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbfLCFYF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 00:24:05 -0500
Received: by mail-pj1-f65.google.com with SMTP id g4so1018323pjs.10
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 21:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=uC4Bl0qQMP+1vSYZwhrmDHQhbcFrxWT9l8fOqCUV/2M=;
        b=CsBQbbk33gwSnGTheESyeysKYf5sXnfg5mZVFnO0DaOw2FrrxXsCZTUBhUS/MrDmrP
         xVJsth6AadZWqmV4Cn4jnVRF5YTOi8prYKzDcQQXIq11NQhRCeNijr9gQhIzk8Q5YrjC
         aqHhpgAtaZFym1+lC7ZBR+uSsLZH+/MjroeeuZi9MkRiNabtAHU6GSl6otUCcOYnDShf
         A8TGRHlbu8P5X4OrSmpaOVuFrxhQkejScB+1zzLtgUvQGe1JLdaBKW+f/cLcMGV0HG/5
         sfcHMxgnT4oDpY80QZ6aWaJyWYFiHRnZmHyef0Kg3WDmMDxBCtCQFFIQsvjcpm2Dbb2S
         yBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=uC4Bl0qQMP+1vSYZwhrmDHQhbcFrxWT9l8fOqCUV/2M=;
        b=cYcxiOsGF8di50kcwRA20Kk90I50vp3vNdexfX6zDBERBUqBrFs1tIjXnAMQso4ydo
         uNXDsFFhbzWKuHfe/sDjlhcn47B36ICWHTdfAu7DdYGWKAK1FnKSpnr11ZdyfVPgakxj
         qYAV5ek/5UedN2neKKiVzQ6YhACTkGtkK+V+D4Utsm0xbjLc2ujn1moCOyQ1VqbBOTeG
         0cFfakzjw4iceRaKgtIzhLEpHhpBaIawSaXtuw+viB6+aftmHs1aBVzbSlHpfUKKhCGt
         TQQt+xvZlo8bMla0NJqtpAl6zNdWoPYUkHzRsZg4UufTjRBKKmq9cYkreufLPNhgf8AC
         oYgA==
X-Gm-Message-State: APjAAAUio/hluqV81dGMCqRHHO4KrhlWQ4EEtH96ocu06purse0k6zgw
        MR9AZjDAkLLrmffoO5aQdLce7A==
X-Google-Smtp-Source: APXvYqzAkPb+58kmN+jZ+GoeV3AgIBAOA1Hp2v7nvCCOaOjQLYETIKHjGrMPFYLkgjefi6AmYAf02A==
X-Received: by 2002:a17:902:126:: with SMTP id 35mr3273197plb.105.1575350643416;
        Mon, 02 Dec 2019 21:24:03 -0800 (PST)
Received: from localhost ([14.96.109.134])
        by smtp.gmail.com with ESMTPSA id l18sm1415986pff.79.2019.12.02.21.24.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 21:24:02 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 7/9] arm64: dts: sdm845: thermal: Add critical interrupt support
Date:   Tue,  3 Dec 2019 10:53:28 +0530
Message-Id: <2e01f6891b5cbdc5dec754e7e3afc737ecbaa87a.1575349416.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Register critical interrupts for each of the two tsens controllers

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Message-Id: <3686bd40c99692feb955e936b608b080e2cb1826.1568624011.git.amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936fe..8986553cf2eb6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2950,8 +2950,9 @@
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <13>;
-			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2960,8 +2961,9 @@
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <8>;
-			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

