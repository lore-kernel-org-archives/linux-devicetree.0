Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB600C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 16:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6358220658
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 16:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="qY/eIwjW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388590AbgDAQiU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 12:38:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40208 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388459AbgDAQiT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Apr 2020 12:38:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id u10so830710wro.7
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2020 09:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u01MPjpNUTMHsez0F0H9AHhzrsoSor9pky3lmIVAZDI=;
        b=qY/eIwjWTJXKU3CMhFdA1LcoLfpQ+XQGJxcAMpPitVGg7GUr0q+Gip5HQYnBJNykG9
         wzz+YsTE/68V7BAzrlqRdKXR+UcQpvqQzlvHstuYoLqTYH3L7t8BZ+sQw9U7pEC/VSQt
         UR+LYCtHGoOWedutWOaIJRVahsrvvioBitka8d8IdFfNA9XIDizaRUypbKgO5cVl4j4L
         6uObLc8/uVhhZX1T8sTRUM0PcUKWt21lfBJp7yip+pP2GrjDNE37T+NNWw9qRtuHSOm3
         CbN1UCpp1mrbdVowPqp0QPh7VVmEZQlw8rl3aVyGP9DZLiyYOJmKdIoYZ0W/190EAnHY
         /rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u01MPjpNUTMHsez0F0H9AHhzrsoSor9pky3lmIVAZDI=;
        b=dMdQEBD7kyqhOkO2nBgXbuQZzLk+u3NGrT2bfu+OKsBCJG5MuuuAYBjJzKcBwppXJD
         DH4Kx1pnIrq982ToAz07OgVers5DRWWZ0XVcIKm2zbB8D9qfhzMpOlEsLkJHnlul5DV5
         MulkV50WXVQD2ebZtX40wc3Mdp6lMEikSQ7lgC7Nbwravmwm0A+8HPhV7CUIxPcfrWNK
         XSefY3e7v7QF/ZEf2SJid2R4i50ZDN/q7r7xPWEKayYJOLPJMeW5DRMJWY7+7isCTqes
         a4sdF1j3pWIMfRl1/ivuiZmk6uq5AsC8Xso163u9cx5kHTtnsniy721Mh0gPhaS7QZgl
         T8vQ==
X-Gm-Message-State: ANhLgQ09NRiGD5yTYWxh65xkJ5lLzKNMFOsndJwmUxaQpRDzpkSx7mxF
        1v1HwMYlmCObDl3lQxnD+GsxQw==
X-Google-Smtp-Source: ADFU+vu1nqgecFP77p8CwVLBYzELE8ooG1GeOW2OyfzUyCSFMSM9HZ3jS1LNuW/MdP4VWhz9/hi/7w==
X-Received: by 2002:adf:e403:: with SMTP id g3mr25456194wrm.333.1585759097402;
        Wed, 01 Apr 2020 09:38:17 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-209.xnet.hr. [88.207.97.209])
        by smtp.googlemail.com with ESMTPSA id t5sm3763573wrr.93.2020.04.01.09.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 09:38:14 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v6 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Date:   Wed,  1 Apr 2020 18:35:45 +0200
Message-Id: <20200401163542.83278-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401163542.83278-1-robert.marko@sartura.hr>
References: <20200401163542.83278-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: John Crispin <john@phrozen.org>

Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 20 +++++
 arch/arm/boot/dts/qcom-ipq4019.dtsi           | 74 +++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index 418f9a022336..2ee5f05d5a43 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -109,5 +109,25 @@ wifi@a000000 {
 		wifi@a800000 {
 			status = "ok";
 		};
+
+		usb3_ss_phy: ssphy@9a000 {
+			status = "ok";
+		};
+
+		usb3_hs_phy: hsphy@a6000 {
+			status = "ok";
+		};
+
+		usb3: usb3@8af8800 {
+			status = "ok";
+		};
+
+		usb2_hs_phy: hsphy@a8000 {
+			status = "ok";
+		};
+
+		usb2: usb2@60f8800 {
+			status = "ok";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index bfa9ce4c6e69..ee45253361cb 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -576,5 +576,79 @@ wifi1: wifi@a800000 {
 					  "legacy";
 			status = "disabled";
 		};
+
+		usb3_ss_phy: ssphy@9a000 {
+			compatible = "qcom,usb-ss-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0x9a000 0x800>;
+			reg-names = "phy_base";
+			resets = <&gcc USB3_UNIPHY_PHY_ARES>;
+			reset-names = "por_rst";
+			status = "disabled";
+		};
+
+		usb3_hs_phy: hsphy@a6000 {
+			compatible = "qcom,usb-hs-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0xa6000 0x40>;
+			reg-names = "phy_base";
+			resets = <&gcc USB3_HSPHY_POR_ARES>, <&gcc USB3_HSPHY_S_ARES>;
+			reset-names = "por_rst", "srif_rst";
+			status = "disabled";
+		};
+
+		usb3@8af8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x8af8800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&gcc GCC_USB3_MASTER_CLK>,
+				 <&gcc GCC_USB3_SLEEP_CLK>,
+				 <&gcc GCC_USB3_MOCK_UTMI_CLK>;
+			clock-names = "master", "sleep", "mock_utmi";
+			ranges;
+			status = "disabled";
+
+			dwc3@8a00000 {
+				compatible = "snps,dwc3";
+				reg = <0x8a00000 0xf8000>;
+				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				dr_mode = "host";
+			};
+		};
+
+		usb2_hs_phy: hsphy@a8000 {
+			compatible = "qcom,usb-hs-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0xa8000 0x40>;
+			reg-names = "phy_base";
+			resets = <&gcc USB2_HSPHY_POR_ARES>, <&gcc USB2_HSPHY_S_ARES>;
+			reset-names = "por_rst", "srif_rst";
+			status = "disabled";
+		};
+
+		usb2@60f8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x60f8800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&gcc GCC_USB2_MASTER_CLK>,
+				 <&gcc GCC_USB2_SLEEP_CLK>,
+				 <&gcc GCC_USB2_MOCK_UTMI_CLK>;
+			clock-names = "master", "sleep", "mock_utmi";
+			ranges;
+			status = "disabled";
+
+			dwc3@6000000 {
+				compatible = "snps,dwc3";
+				reg = <0x6000000 0xf8000>;
+				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_hs_phy>;
+				phy-names = "usb2-phy";
+				dr_mode = "host";
+			};
+		};
 	};
 };
-- 
2.26.0

