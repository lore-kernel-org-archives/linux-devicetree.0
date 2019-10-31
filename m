Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDFECA9ECB
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 18:38:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4845320650
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 18:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oF10FdkH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbfJaSie (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 14:38:34 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45628 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729508AbfJaSid (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 14:38:33 -0400
Received: by mail-pf1-f196.google.com with SMTP id c7so4937057pfo.12
        for <devicetree@vger.kernel.org>; Thu, 31 Oct 2019 11:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=srw60QlGCW1mVn48ORh0gXVEibw1bp8x1qlk8iY4/Hk=;
        b=oF10FdkHO6Tc7ljOlcDWQxppYy2RkWbouChfPj8FeZs6sA9SjMDo/A5mm0+l66rA7P
         SMzq9SeD0t41nrbanWcMLG8TyAqFr58cgaeW/gqN6c38ZiDa8IaXm0KqROvLXTZ9mUop
         02kwp53lpcruSCf2JG3MkCMJQl3I3TdtDmgpks2GilWjpERuaVaaBLxWo+8Dh6abEVfl
         XxCKmy+rOvXGrEMoh/QY9U32buGO4cQVbMBnLfm9RJUh78DSzzKX5dP9+ZvhM4lGh9TN
         kBjKvfCOxqeFjzPCRR74Dw5sSNXKnl3iEf9mEvottYdr6dbDJL88dhaqod/5h57THHPv
         vCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=srw60QlGCW1mVn48ORh0gXVEibw1bp8x1qlk8iY4/Hk=;
        b=BVOrokfTNnBSzANh6pYbKIcBlfE3fDcti9aT1/KUcch9+AG9cpvVB4yRLHWk+KgeIW
         BTLhybFo3FLQMUMPf05rLxi2JFQqU2kBa9vz+vyQ5KlwOJEQZL+qekChYI5KM93ALVz8
         sLfs4DmQvbPVtmSuJs/qe/4QlpoV5jgmEsFDLayKvr+BJoGKg28S/gSjFNcI+Iy8q7kt
         pZYi4A2k+lrkyi63YNYAmEibF5Lh2imZuFtoU04ffCvXpes3IsBQ4MfKK8YDN5nZ9ZZY
         DSQ2bmUBt8i88diZv+huz1rtS9QQ1lTaAP9iexciTkPT/9Y1cMv63GkAIfEqPij7/xjm
         AO0w==
X-Gm-Message-State: APjAAAUI3jZ32p7n9FvlYDaKu7doRQxAWzmfzY1DZoZCq6ptlwOEkrbG
        FRt2nwirCH9hEoV4H0RKftD2Yg==
X-Google-Smtp-Source: APXvYqzmhdYPekOrOPTQnecbd9Rdymuy1l+RBvth/dqpkcHCfzB+AjZyT/g9i1Jmc4564rfE1vRQyA==
X-Received: by 2002:a63:1812:: with SMTP id y18mr7630642pgl.302.1572547112563;
        Thu, 31 Oct 2019 11:38:32 -0700 (PDT)
Received: from localhost ([49.248.58.234])
        by smtp.gmail.com with ESMTPSA id v6sm3788502pgv.24.2019.10.31.11.38.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 11:38:32 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v7 10/15] arm64: dts: msm8998: thermal: Add interrupt support
Date:   Fri,  1 Nov 2019 00:07:34 +0530
Message-Id: <2735b57bb1e9477926bfef6f6b8ff84b926f5a1b.1572526427.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c6f81431983e..489d631a9610 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -816,8 +816,9 @@
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
 			reg = <0x010ab000 0x1000>, /* TM */
 			      <0x010aa000 0x1000>; /* SROT */
-
 			#qcom,sensors = <14>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -825,8 +826,9 @@
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
 			reg = <0x010ae000 0x1000>, /* TM */
 			      <0x010ad000 0x1000>; /* SROT */
-
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

