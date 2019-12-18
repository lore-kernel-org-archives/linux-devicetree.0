Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D050DC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 13:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A26F024650
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 13:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uHc+lthr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfLRNYU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 08:24:20 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43334 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727419AbfLRNYU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 08:24:20 -0500
Received: by mail-lj1-f196.google.com with SMTP id a13so2112079ljm.10
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sRlbBOojW7v2VRLaDWPeR8d17hgWrl9wNZOspFmUuFU=;
        b=uHc+lthrXnMaFPsJZUtTjTk7JbzmnIRVKIq5hRLMJXUwM8249UZ6vrg2//+LI0OA43
         JopK3irKcBtCHJ9tfTVEyVvhdCDPWqZR4HVXis5Qr+w0a8QSsaKzm9J1U2bfZxjuWsYF
         4LGBx7uQJr3rEH19OqoH/J/8EqhcXY4iaX8Cs+CoL+gDy1QcGipKP+537M5s2+EhKEtN
         Ap7pwTAH2mKuVK0fZob6J626ttwghPIhF2cmxlDq+FVM27c2Nkf2pqPI17mKGCZjNV3X
         gX6GIhV7dB1+gdnNDBA+MhHeTnNTYz1Dm6T3sy/cw6bnhROfGrKAtTeGjE6jlbRiHvDT
         RjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sRlbBOojW7v2VRLaDWPeR8d17hgWrl9wNZOspFmUuFU=;
        b=ccYUKtjWdJzkpOml6LGtZPq09iBXAZHk2LTVYuZvfuv/sAMPGo60zRtsnmW/UAop0c
         57VIuEfNB0EdDEuSmPwNVpM9vsjsR59MKWxDny0MO32OR4FpubcIgwuiYAX+FXUPqGkB
         Q/pJ/606qZ8yp1lAPg8uKq9fAyPlIuiLcijiC2m/YBVCtOqxE+ovGe21UppQPDqVDgZn
         p/+y/arwHttZZRA564P2KBP1dSFi3PMlg3b/UKGFRhWgAY/wjCsJAFY56pGH8YzZE1nQ
         ivmO5X8sJcK4veLTUyioxOHf0xLMlVKKBN8eAz0VpuzOf7zRAg80drNtH+L53zNFNMyq
         +wNQ==
X-Gm-Message-State: APjAAAU7oza5BTBxlLM23zapID2zg81b2lGlGTnk5pJkmPp0VTtzrD1u
        1LmvhCamNmMeBN5gsxQLK9iyow==
X-Google-Smtp-Source: APXvYqzecFt0moBmPL8ikUZivK+jtqmVvDhxKvoCDMXGy57D05+r6CFrgDnsaCce7deFS1237+ltOQ==
X-Received: by 2002:a2e:8698:: with SMTP id l24mr1794175lji.94.1576675457674;
        Wed, 18 Dec 2019 05:24:17 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:24:17 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 11/12] arm64: dts: sdm845: follow venus-sdm845v2 DT binding
Date:   Wed, 18 Dec 2019 15:22:50 +0200
Message-Id: <20191218132251.24161-12-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
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

