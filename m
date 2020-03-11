Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2555DC2BB1D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:15:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B88C20736
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6VLu240"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731111AbgCKTPw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 15:15:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42471 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731244AbgCKTPH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 15:15:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id v11so4111555wrm.9
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3BfHSzn4UCeA2FP5LolQzAR+/B6SLs4bxqX8bC/4tNE=;
        b=r6VLu240RNeUWsOOl/nPDVFRYxuT3S+GA+WHQHy7Qk7RE4h3c4+0YKO6YBXyDbZzT4
         Xz22tvQTRnWpAe8YTCxuecuzAiFNpSQT+6MYPQROStcQB93+7tvEpPZ/0sl75U4kFQRl
         +LoQAG0h1kPrR0dq4ibDKX0pDuuwordljTWwhmhiFijm17jrT49Fb+k9dFDsvYefArYT
         iWKoffTcpa83MvIOUi93QzR4aXISdImP1AY/3D5XBgkNbyTyswnpkK1+fIGBUSeoMxYH
         3FNQWn3r9lSIig4ZamF8nFb7j67hYLU38XyBMeAZL+mRwKIrJfKmmLZCFI+gjnoNX89R
         Q6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3BfHSzn4UCeA2FP5LolQzAR+/B6SLs4bxqX8bC/4tNE=;
        b=Ppv7YNeVcaG/iVF+HwTYmvw5WH/dS0ToGcHrIjCxPTZIRtn0G1aj//XNr1QdLeSyN3
         EOX/evIl4SbTvK7C9IkowYbKasT4nMJd68XPEpQJmC/jctVCSCDUwB7M2M4tY3gsHQtE
         WYg7FBfyPvZf1TEQpUDlcT08mMVRrfuYzPJi9CUlEZKYwWZfdjtqvmBFGFyszz9UdiYn
         w1oHAfA+rBPWJUnW72BZMKTvSGYw1w2TzMkhBs3Ln1BN+UnncKgPxNuv3NzAA8U/06Vy
         qOCIGCuCPLC4n/U8rngcyRz+wXFrC8g4J1zaAMX/CB3HzO/KISVNPwF7yVAVyqEGowq7
         i5XA==
X-Gm-Message-State: ANhLgQ2RWdTGLYHy3mL9O1q9qanTF2GviOY+f5XvRVb7X1CrucbZHeJ/
        8ngSD6NxuRwu927NVThZc9oAlQ==
X-Google-Smtp-Source: ADFU+vuGmQZPjPDr1rIXs8EjGenquDs/gL0Bo11Ca0LpJc0B56nEbdNtKiu0Ui9qgntKs9aBD/Kq4g==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr6094375wru.246.1583954104420;
        Wed, 11 Mar 2020 12:15:04 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c85sm9687437wmd.48.2020.03.11.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:15:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: qcom: qcs404-evb: Define VBUS pins
Date:   Wed, 11 Mar 2020 19:15:13 +0000
Message-Id: <20200311191517.8221-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Defines VBUS detect and VBUS boost for the QCS404 EVB.

Detect:
VBUS present/absent is presented to the SoC via a GPIO on the EVB. Define
the pin mapping for later use by gpio-usb-conn.

Boost:
An external regulator is used to trigger VBUS on/off via GPIO. This patch
defines the relevant GPIO in the EVB dts.

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
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 522d3ef72df5..62ef9c34b04e 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -4,6 +4,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include "qcs404.dtsi"
 #include "pms405.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	aliases {
@@ -271,6 +273,26 @@ rclk {
 	};
 };
 
+&pms405_gpios {
+	usb_vbus_boost_pin: usb-vbus-boost-pin {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			power-source = <1>;
+		};
+	};
+	usb3_vbus_pin: usb3-vbus-pin {
+		pinconf {
+			pins = "gpio12";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			input-enable;
+			bias-pull-down;
+			power-source = <1>;
+		};
+	};
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
-- 
2.25.1

