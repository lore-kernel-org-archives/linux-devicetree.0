Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D27FC4CECE
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7465620575
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JlzDOlI0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731143AbgCKTPj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 15:15:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34045 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731257AbgCKTPJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 15:15:09 -0400
Received: by mail-wr1-f66.google.com with SMTP id z15so4139156wrl.1
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fbg485QKna2b69d8FHcT3LYQMvhx0JZtSFBQiPdMzVM=;
        b=JlzDOlI0yDSSMkIg6ar9CLb9t31EZmXDy15Ow0IJLfQQ4tLxMvEND+RLhVuafmTBE8
         +vaTfnD/vLmH50r2pK8JW+Z/+lh0j9Zynd4C7bvXVFruOHacPSoAhowGkaOOfDkpvtqe
         kyqN0kesd408XNFClw5wx6Kl8COU5zEnObcLiDVmKAJ1q7P1Dcfbisb8xVvNZZFytCfL
         12gLkmPqqsn+8JMXuzcFmBsOAiKwxrHVVG/L45O5r6BAFPij/6WfuIhc4BEBUPqZ750g
         Ag+A2ryg4RBuZiGOZ1fdjSyRPUl2wz+hwgYtBhuHhm+ezFPLKu7HAjW+NYi61mSHcx8+
         Ej2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fbg485QKna2b69d8FHcT3LYQMvhx0JZtSFBQiPdMzVM=;
        b=WLL6rAesLv2+pkhsw553qYCtpfYQ7HevjtGLqGPTaCYY8WXVpgMY8CnjxQy4ie6DgM
         L8Rnn8e7nqTIfZ0O9l6wR+1qyJZjeybBM8D1OtlYqRPX00jN2fREtlRu6vtNZgutMZ7Y
         f3qTJyPam6ptrhTK+X/FOV/GQJ6c92UEdZ6k1PwyUp2kGviJuxw8Gnk8bWAcleBzQdvD
         lzHMXu86xGvnPcz8sVzEOKvW9Nt2/aHDIIbfGmZkpvuZHpiEd6cmZa1ar74ND1gqoHrL
         NWR8H8WtOwsOdTW3gcsd6gqiApZhbD0O+JZnCegLCfWATIsP0s+ZQ6zXjHC8bXP6qu+I
         7rOQ==
X-Gm-Message-State: ANhLgQ0JoqhAisxikuevnAcFXKKqmqVNkiTB0Pzy8C7pgotELRVdNfJd
        omTo89qtyGFXAWXiart+Ylbeqg==
X-Google-Smtp-Source: ADFU+vv1nYKfcNDhvjwMYTymxjutUmijFvLu33jJ/7akEhBtdcYxLiY+yQ36d0nm00t477+td91huw==
X-Received: by 2002:a5d:4049:: with SMTP id w9mr2384540wrp.158.1583954107275;
        Wed, 11 Mar 2020 12:15:07 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c85sm9687437wmd.48.2020.03.11.12.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:15:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Wed, 11 Mar 2020 19:15:15 +0000
Message-Id: <20200311191517.8221-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

VBUS is supplied by an external regulator controlled by a GPIO pin. This
patch models the regulator as regulator-usb3-vbus.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index cb893ca76901..4b529a6077d2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -33,6 +33,18 @@ vdd_esmps3_3p3: vdd-esmps3-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	usb3_vbus_reg: regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_BOOST_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pms405_gpios 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_vbus_boost_pin>;
+		vin-supply = <&vph_pwr>;
+		enable-active-high;
+	};
 };
 
 &blsp1_uart3 {
-- 
2.25.1

