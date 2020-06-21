Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6CCC433E3
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D82D22571
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqIUCRaN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730487AbgFUTgC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730510AbgFUTgB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 15:36:01 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EE4C061798
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:36:01 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so16932413ljn.4
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9WvajqJ/1LHD/FFd7sUlUX/Ddmif0/Hk8gVsTreaFnU=;
        b=ZqIUCRaNU+xZ/qrM1AG2YnIF0BshcJ+RS6k+0iyhry2XHdUHKJrzQzMc5EZEWNsiVf
         2haYATeAXgATzm3hrDQLaQNyCVp4IGeqqw+Lf5+OQEgjTK+O0HgC/vuw0pYATfnKQJF4
         s6NkLH4md1MyboZrVYkqRSbU9RrI8qkVwq6MFSW4A4iEDSP561uhfrQgE1hQ6KdQzP4r
         9KoZ3nAZl/ohJs/cBDifUvehoRa+zgFWiD9+FMYa6RTaRddemZ8BD0i/MPKrlhv2q3jz
         KXtfioObHFh3UAbxRBQwletgNDKD2UF0kNAoVsGygdXxJi5fgKSxl1pfytoruvOgwxrZ
         qi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9WvajqJ/1LHD/FFd7sUlUX/Ddmif0/Hk8gVsTreaFnU=;
        b=gvppjogiRtVmuoYEqd9HGzdjAjs4zcOh4IdfWONnxrbZDCLjv8fXmndKkM3BVwXMUt
         LINUB8zetPpETfOymWwdIx8FVWeVjAqsfgZVO1J5yvNveHKzuQsn4aHYMKKfj6oBsgsc
         9XtbxNHleMOff61o0FTQg1QhPVB3oZSrPqyMg7KhsTvTEdDW+rawSr1YQPvVyI8bwu6/
         UT5YESZPQH014ea24kdpjXeCNCYfnumjW2NRID79lipKuEuQI3zv8h3W4BwZKycKBF0N
         oC6vOC4VYKU4k+5f+49G2k64ATvekCKjDzW83noTbYtV16+DHteS1+TqtmMnIvng9dDx
         qKIQ==
X-Gm-Message-State: AOAM5333M8Pe72xnIY3nM1U1nS1ZCLzSgqayoHM545xwrV5uHKEJF36L
        hAMdBbwHyhCtjl3t9U61ETXd4YHF2T4=
X-Google-Smtp-Source: ABdhPJznV7z9dVb8BV2/JEvrRRPaux+GV05TUbyafdd1xmZqIRBTstP5ZyE8xE5vqcQpyfWl+hK0lQ==
X-Received: by 2002:a2e:7016:: with SMTP id l22mr7236155ljc.284.1592768159826;
        Sun, 21 Jun 2020 12:35:59 -0700 (PDT)
Received: from eriador.lan ([188.162.65.109])
        by smtp.gmail.com with ESMTPSA id r13sm2917854lfp.80.2020.06.21.12.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:35:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-iio@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: pm8150x: add definitions for adc-tm5 part
Date:   Sun, 21 Jun 2020 22:35:48 +0300
Message-Id: <20200621193549.2070434-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621193549.2070434-1-dmitry.baryshkov@linaro.org>
References: <20200621193549.2070434-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Define adc-tm5 thermal monitoring part. Individual channes and thermal
zones are to be configured in per-device dts files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index 027f55d53584..acb2cb02a73b 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -97,6 +97,16 @@ die-temp@6 {
 			};
 		};
 
+		pm8150_adc_tm: adc-tm@3500 {
+			compatible = "qcom,spmi-adc-tm5";
+			reg = <0x3500>;
+			interrupts = <0x0 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>;
diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index e112e8876db6..8e2f3250c914 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -95,6 +95,16 @@ chg-temp@9 {
 			};
 		};
 
+		pm8150b_adc_tm: adc-tm@3500 {
+			compatible = "qcom,spmi-adc-tm5";
+			reg = <0x3500>;
+			interrupts = <0x2 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pm8150b_gpios: gpio@c000 {
 			compatible = "qcom,pm8150b-gpio";
 			reg = <0xc000>;
diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 62139538b7d9..9f214ceec2b7 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -89,6 +89,16 @@ die-temp@6 {
 			};
 		};
 
+		pm8150l_adc_tm: adc-tm@3500 {
+			compatible = "qcom,spmi-adc-tm5";
+			reg = <0x3500>;
+			interrupts = <0x4 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pm8150l_gpios: gpio@c000 {
 			compatible = "qcom,pm8150l-gpio";
 			reg = <0xc000>;
-- 
2.27.0

