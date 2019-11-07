Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC73FC6197
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 00:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DDB0206DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 00:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="giGLYDsp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732595AbfKGAW4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 19:22:56 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40897 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732501AbfKGAWz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 19:22:55 -0500
Received: by mail-pg1-f194.google.com with SMTP id 15so402724pgt.7
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 16:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DeQmt4uNFQlcdJU+lnHrpKJXh0m7NA3EyMol7F5dCYM=;
        b=giGLYDsp5nBEBpAmVbLK6sFyoxa5/UJ50tE8VoCfPrp6W3M/UEiX2KvdIeLEJ2pbEq
         rqmChMG2jWXKMEGjGYb38PCDIBQtczjqxf7xMLdCaAxl1XCgnvZS82lnXyOYv0h7ZRNS
         dg3kA6sRy2wiHGJjn9Tw9Ow5ZpTJZLdCaQ3CvoZXGzODnkyhFk2KRsiDGB6NyDV4FV5K
         v8Y/iB6QWdFj/ObvfItlW9S433OjBXvJyigpI6uzjL4yhyETF+cS9yUuGlb9nga5u+Bu
         xtkP8RKhDxFA9O8y0j/ImYgUOV45yyR85um6frL1KUZN20RK607Eb/IR2RaFFDfsi8iq
         Mv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DeQmt4uNFQlcdJU+lnHrpKJXh0m7NA3EyMol7F5dCYM=;
        b=YfA1GeSclYEvyQMuIImwfkiEmDbWBVZdVZDFIP2l1EqzjMx3N1568NK1RH6fx06/Gc
         6p68Aoq4ROjoK5darAkBIPxRemXxzng+9xKm4UEeBkaTVyJXprKgYSSVwVS0zuiYgCdx
         Fjx0A+zbvlxL8J2L/XldwpN5P7lTQaI2VK6QarQiXkbV4k9Ws8PQRiMBKDfqm2eIak5a
         uWsG6BjkwvUW12/3gI37PmC5DbBsnXxDiDycFi+zLn+sad7T9OCZOQQ+kEqTNq6sMzEN
         Yg9++oSIXCMmpWwSi25YQh1g3NWuP4lUCPILS8Mmlji1K8orP48+FQtmjQybzNPvu6fH
         cVDw==
X-Gm-Message-State: APjAAAXOsg0eMQ2Lfb//bKWrOdEM3VWM8mwkczdtvbR8N19u77Bsnw5/
        0VUXZzQcUpEXcjWZxxgP+ofIGuNiPnQ=
X-Google-Smtp-Source: APXvYqz8xp/n+GG3rQ0DsX2EunuYmwa5YkczlJhRcO9OZcM9dxMuttEfln8l+1pTXxfN4SKHx2XLxg==
X-Received: by 2002:a63:4622:: with SMTP id t34mr778490pga.359.1573086174966;
        Wed, 06 Nov 2019 16:22:54 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i13sm155272pfo.39.2019.11.06.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:22:54 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: db845c: Enable PCIe controllers
Date:   Wed,  6 Nov 2019 16:22:47 -0800
Message-Id: <20191107002247.1127689-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
References: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable the two PCIe controllers found on the Dragonboard845c.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up Vinod's R-b

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index f5a85caff1a3..c314b5d55796 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -340,6 +340,39 @@
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&pcie0 {
+	status = "okay";
+	perst-gpio = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	enable-gpio = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+
+	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_default_state>;
+};
+
+&pcie0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
+
+&pcie1 {
+	status = "okay";
+	perst-gpio = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+};
+
+&pcie1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
@@ -382,6 +415,31 @@
 };
 
 &tlmm {
+	pcie0_default_state: pcie0-default {
+		clkreq {
+			pins = "gpio36";
+			function = "pci_e0";
+			bias-pull-up;
+		};
+
+		reset-n {
+			pins = "gpio35";
+			function = "gpio";
+
+			drive-strength = <2>;
+			output-low;
+			bias-pull-down;
+		};
+
+		wake-n {
+			pins = "gpio37";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_pwren_state: pcie0-pwren {
 		pins = "gpio90";
 		function = "gpio";
@@ -390,6 +448,39 @@
 		bias-disable;
 	};
 
+	pcie1_default_state: pcie1-default {
+		perst-n {
+			pins = "gpio102";
+			function = "gpio";
+
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		clkreq {
+			pins = "gpio103";
+			function = "pci_e1";
+			bias-pull-up;
+		};
+
+		wake-n {
+			pins = "gpio11";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-n {
+			pins = "gpio75";
+			function = "gpio";
+
+			drive-strength = <16>;
+			bias-pull-up;
+			output-high;
+		};
+	};
+
 	sdc2_default_state: sdc2-default {
 		clk {
 			pins = "sdc2_clk";
-- 
2.23.0

