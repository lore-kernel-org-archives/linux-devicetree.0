Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AFDC433E2
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:28:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10BA625234
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgxoW93h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbgFUT2b (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730036AbgFUT2b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 15:28:31 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B18C061797
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:28:30 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c17so16883077lji.11
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rr0BOI8BzffYBcJ3FrPC0MKxNzbBaaA0ciNFW/6okKs=;
        b=WgxoW93hkrr52DkMnv53XZXZ/WRm4lRtO0An32UplYwfNbG97G89CBt/RhSS+yZ0bd
         2zXwmAnGs9mCmwjD29AZ1CgmNXbSslJQyDE+hDVmY2D1rDsFdztX29NVrHBkqvpeM0vn
         xQVzqbGkX6PRfMscHhj7sOgL5Pmfu3bQZqeVzl6wHagiKa7WVDLu2lIFbUpbcjOdT7ko
         N84MLvuCXnoMEPzDm4T7QkhNOk0PgORc9dljfVKhd+5AO4fV8lbQxVBMQqZh0qo54W+f
         HbrHwYJ4xrfW6gDpGW4mM5ZTQzNjWmwjmF9ro33DcNkiUbvccgWzEZKm/Vjyx80lIDNN
         HRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rr0BOI8BzffYBcJ3FrPC0MKxNzbBaaA0ciNFW/6okKs=;
        b=HMgg3y1zKB9Gdb83LnexOtcd1H4QBO6WmJnLPZsYttpQOk1CatRKui4LZTpCGqKwtZ
         NMEVBeM7OQBjLHbjuUzBed5iOnTxvXcPVPhGIG3wY10md+3StebiOx7VuA82BmEc/HtY
         2WUsAIyHQ+hb7Rmp/snG/OmILr74+Mz9eARgcz8yFgLa8pyv40Tpqm5lgiC/3eEluhfo
         35fNsjNJNiDhV7k9IcAQKFqYbVKA4wHeSJqpW03orPrCg6B70xiiloJhvMlKktFVKNLS
         2qWRsGyhOhLPlQnH7whjPEbEytzLUnJpqIbVeL1qkvO2OTEJUl9LYJVuexO8KlK01ZJ/
         89+A==
X-Gm-Message-State: AOAM532MCy0aB3nJYedlxW8vBkREAJLajj+dDG5f19zQLW+/b3dPb+hk
        3IiVI9Qn1koSPi3pqHHABd8f0Q==
X-Google-Smtp-Source: ABdhPJzXfgAQsOez41P5lPnddZ1hczYxxo5UrbDD/5fGrlZBR4UfjYdSt5yRQSA68UTaV/ec1QKRCw==
X-Received: by 2002:a2e:970c:: with SMTP id r12mr6764967lji.145.1592767709125;
        Sun, 21 Jun 2020 12:28:29 -0700 (PDT)
Received: from eriador.lan ([188.162.65.109])
        by smtp.gmail.com with ESMTPSA id o201sm2917205lff.8.2020.06.21.12.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:28:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 3/3] arm64: dts: qcom: pm8150x: add thermal alarms and thermal zones
Date:   Sun, 21 Jun 2020 22:28:24 +0300
Message-Id: <20200621192824.2069145-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
References: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add temperature alarm and thermal zone configuration to all three
pm8150 instances. Configuration is largely based on the msm-4.19 tree.
These alarms use main adc of the pmic. Separate temperature adc is not
supported yet.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi  | 42 +++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 44 +++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 44 +++++++++++++++++++++++++--
 3 files changed, 122 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index c0b197458665..1b6406927509 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -9,6 +9,37 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 
+/ {
+	thermal-zones {
+		pm8150 {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8150_temp>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8150_0: pmic@0 {
 		compatible = "qcom,pm8150", "qcom,spmi-pmic";
@@ -30,6 +61,15 @@ pwrkey {
 			};
 		};
 
+		pm8150_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm8150_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8150_adc: adc@3100 {
 			compatible = "qcom,spmi-adc5";
 			reg = <0x3100>;
@@ -38,8 +78,6 @@ pm8150_adc: adc@3100 {
 			#io-channel-cells = <1>;
 			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 
-			status = "disabled";
-
 			ref-gnd@0 {
 				reg = <ADC5_REF_GND>;
 				qcom,pre-scaling = <1 1>;
diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 40b5d75a4a1d..e112e8876db6 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -8,6 +8,37 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm8150b {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8150b_temp>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@2 {
 		compatible = "qcom,pm8150b", "qcom,spmi-pmic";
@@ -22,7 +53,16 @@ power-on@800 {
 			status = "disabled";
 		};
 
-		adc@3100 {
+		pm8150b_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x2 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm8150b_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8150b_adc: adc@3100 {
 			compatible = "qcom,spmi-adc5";
 			reg = <0x3100>;
 			#address-cells = <1>;
@@ -30,8 +70,6 @@ adc@3100 {
 			#io-channel-cells = <1>;
 			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 
-			status = "disabled";
-
 			ref-gnd@0 {
 				reg = <ADC5_REF_GND>;
 				qcom,pre-scaling = <1 1>;
diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index cf05e0685d10..62139538b7d9 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -8,6 +8,37 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm8150l {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8150l_temp>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@4 {
 		compatible = "qcom,pm8150l", "qcom,spmi-pmic";
@@ -22,7 +53,16 @@ power-on@800 {
 			status = "disabled";
 		};
 
-		adc@3100 {
+		pm8150l_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm8150l_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8150l_adc: adc@3100 {
 			compatible = "qcom,spmi-adc5";
 			reg = <0x3100>;
 			#address-cells = <1>;
@@ -30,8 +70,6 @@ adc@3100 {
 			#io-channel-cells = <1>;
 			interrupts = <0x4 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 
-			status = "disabled";
-
 			ref-gnd@0 {
 				reg = <ADC5_REF_GND>;
 				qcom,pre-scaling = <1 1>;
-- 
2.27.0

