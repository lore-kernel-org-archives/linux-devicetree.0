Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE147C3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:13:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8308324671
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gs/z4tk4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730349AbgAOON3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:13:29 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44463 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgAOON3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:13:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id q10so15890163wrm.11
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OAQIBEtAB539ew/tof0mNoTYE3sNhscOlsV6pfoQF5g=;
        b=gs/z4tk4uFXXpj/yR4pB6Y9QVxyxwScRANH5ordeJtq8PSbgKFB4RS0FmPEndaNOby
         idsxHHb+xh0XR7tA+nsp+f73HnB0SIKRMWzbLQIy1MPD1zYGnGc7Gi4on33Dqg3SxtSs
         I2mFJf47QTsU0r37z588nkk1sKl//Rc6r0f2EX90EmZnJ0EWSkQbeaeYMYrUGiPtrFFF
         EFQUQQIEXBhARL4asIi7vRhf4bjU67B4PLotwT6jfw8+IDgEu33xSFja/esqsDtDexMN
         KEanjCsHPesyOLZrnA3QKbuklE1CMcHj4VRrrtH3qijobgMMNtwEf/Q/CRDyD6rdsKfo
         i6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OAQIBEtAB539ew/tof0mNoTYE3sNhscOlsV6pfoQF5g=;
        b=e6s8cHJ8ozVkHfzhy+dvcd3ABr5VFV8b38wde0IHc1rgwbms7ARdWb9a51Ok3iZLI8
         slWl6mf7mLhc5f3gl1aOqm25yJEYzRvYTwx5Oin8EqftxcN+HKdjGdjmyPMJNooKTVf+
         0N4mSL6ulQ7jNPCvRsZdCKS3FZ/HognrLOX9zymlJ77YqWqbDcvo8eF6YQ+FEj4XsqAP
         iE4d0pE0lmMsudKWWyYWWT1i0OrqHSLK8VTF0iEQwtoCT9ZQIiZcRD03G15vwmcGHyoL
         m6Kq0ebU90fJzE3BvQxY8ummjQiIT8TX6h2b1CY6bYVZhfzMs8uZg3klD2vzS+Bjhx6v
         z1Ew==
X-Gm-Message-State: APjAAAUGvNlmDP2l+a0BSn68PZndy4htcoxkQ4E8sTwIWO4RiOFf6XnF
        TeQnSoM1OqIfiQWLZVWu736m6Q==
X-Google-Smtp-Source: APXvYqzBNIB6sLizgF8/elzXx2JKJwR3Qm2h8MtVZZ6TJ6hyaGw3jAbQWdFFHKTn2qlDFLT5G/I1vQ==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr32581677wrq.348.1579097607065;
        Wed, 15 Jan 2020 06:13:27 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:26 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 16/19] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Wed, 15 Jan 2020 14:13:30 +0000
Message-Id: <20200115141333.1222676-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index abfb2a9a37e9..01ef59e8e5b7 100644
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
2.24.0

