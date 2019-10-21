Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C37CA9EB9
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 10:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2CB6214B2
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 10:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LCE4IgXY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfJUKgP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 06:36:15 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44422 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728307AbfJUKgL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 06:36:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id e10so7540707pgd.11
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 03:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=OduEoDNss3AClsOVOILgd3QefK3f48yVM80qRgfoc6I=;
        b=LCE4IgXYNcL1m1VOeylfBui8KVijCrII8487VyiwvEfW40NyjW8qu2EgExyW4J/7mz
         vPgsQtbeUXljiHns5B6jnN3PheCdbJ3Nmt6M9Em72WHKtTnTVrbgAo4+2hVYuUsDG7nG
         NoAoiInr1+s5gZ5EF3xS26bBKYf5GipeO/AuZh9AR5inz6s2ALimAZBY50qJOQ0Owo3V
         QxKDAWmGpQ5/IHyJ+y5RubsOPzU1y2nU4FxXyE1wr1lwVCv1ClhtZML7bP/Cqmop8y0+
         1BwejyOfLrmCgGzaAxuu1G/VdI4Vmrv5NJ+8wOzZ4zWRunIXpnLnouvpDMsF/mYExgXX
         H1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=OduEoDNss3AClsOVOILgd3QefK3f48yVM80qRgfoc6I=;
        b=qTUUWb+1eQv2U74hAckUGPMxZByn68+pZWB1o2dF99nC2yFGn11A1hDMSg5Enu+85A
         HQ22i4ez/EbT3EI5ydWQ1hy06LNPpV8u3gLYKBvYsG2uw/C/gwhoZV/3pryRjzV2nTfu
         DrmbmpwKgTJAGYopLbjlltJ8ncwgx2Q9ErHEGK2M5kFWWb/V2gf4cLrwPNwVDlnKeyvq
         w3JS7KV8aK6fDjU9X36PDH8Y+GyWrhshuuqsfZ8/7S6Sf8boeTGSesNWWAx/33qWkUzn
         s3UISuLhbgXAwRgQGJhkRlod8iGc2tJs0oIkzhxqb/XcaYVosGjbrQMXTAehUJQPN7tf
         k5mQ==
X-Gm-Message-State: APjAAAW6iAUmPvntfONK3StiEUAhQ3z6NLFaTnb3m35LiLMc5ApDsfxu
        mLy0BjsGHki1mXL5Bn+Lkq13Xg==
X-Google-Smtp-Source: APXvYqycQTj+QhwBKEywkZypXg3RK4vljEXGT5VhZKd6LjB0yUOh2sfc5+n042hNk59RHfelztI9Cg==
X-Received: by 2002:a17:90a:eace:: with SMTP id ev14mr28630132pjb.57.1571654170884;
        Mon, 21 Oct 2019 03:36:10 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id x10sm13478847pgl.53.2019.10.21.03.36.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:10 -0700 (PDT)
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
Subject: [PATCH v6 08/15] arm64: dts: sdm845: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:27 +0530
Message-Id: <5a96df48e546576f90081bbde218e7cff88ae8ce.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f406a4340b05e..0990d5761860a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2950,6 +2950,8 @@
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2958,6 +2960,8 @@
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

