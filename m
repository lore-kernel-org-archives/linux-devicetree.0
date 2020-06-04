Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD846C433E2
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB56E207D5
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hv4X8JRM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbgFDAnn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 20:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728403AbgFDAnm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 20:43:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3181DC08C5C1
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 17:43:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c17so5069517lji.11
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 17:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8BiH+YD2FKWrMy4bD7JxcTUGyvBydk031tokVyLWD4=;
        b=Hv4X8JRMqxKzbSFSO+41odIp10r/X+1Bt1SUySryY6Vqr+8WNrn+Z3Ay5+eWqhw6Cd
         e3cbxBk5Jfxq/JD9Tdoqf+FjaXKY3YIoQH2BtsF16rf9/k7gpeMak2eNBGCxRnUFFS3d
         BTifZK5s6PxtnkJk2XE8Sco4xsoe4RIY8UyxVUOnEeCw8fWeLKMyWISv4z/jKpPKn9DL
         t7hZc9uqPkj0H/daN8LHl4ibYncleMOpgV9uTgQ0yr5DJfQkDXmBIxP08hcZYLtwy0mP
         8pIsxAU8+hng8iu3XMfOpJ9TJEcNOmjD7lrB48q0vuwUlA3tq4EkAp1/NIwz53XZ92KM
         oVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8BiH+YD2FKWrMy4bD7JxcTUGyvBydk031tokVyLWD4=;
        b=bc6HDG0jKOxRmGRyF+qB35JEClrdiGQNRDcFaSKpmiAsC2B/b8z9QDIHJNVB6jkKkT
         pzDTKrC+LnhnWfyhBR2prgFU3CFk/xRp7naV04WGFddJmiZ3nTWRH41UfmUlvEXcxeQB
         gy0K3pVRdSLFGbYUTcY3gK4SLgvY4ENnnp6gDhhF2u1KgBpFImGcEhsLOQowRU8ruAzF
         Tu71eaZbhOgkKVHzixzj+AWspzG0yF3X8J9F+4k2c3/jEFuUfsrKIHbV/TMMzBSPi5TM
         zjC8GhSImpos3BarXov/MI/GHs9RpEWvMWMGDw5Z0nVbUv0WTl2nS+OGcAnXrJ7McWBZ
         Q8Lg==
X-Gm-Message-State: AOAM531HvJutbFUppLup5fTUZw/stbMZacFZ1MlBvLdt/ZIfhMjjVihf
        uI+7vm7DUdVCRuDQUhHtoVu0fFAR/go=
X-Google-Smtp-Source: ABdhPJzfsHQp91kAMcBshgDrYmMhgpb5w56PBUwYOKgIFFfEI8TwDZ1RLE5mnKRDKMefhaanUGtfIg==
X-Received: by 2002:a2e:81c5:: with SMTP id s5mr798337ljg.372.1591231419609;
        Wed, 03 Jun 2020 17:43:39 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 5/7] arm64: dts: qcom: pm8150x: add thermal alarms and thermal zones
Date:   Thu,  4 Jun 2020 03:43:29 +0300
Message-Id: <20200604004331.669936-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm8150.dtsi  | 41 +++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 43 +++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 43 +++++++++++++++++++++++++--
 3 files changed, 119 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index c0b197458665..fee2db42f4cb 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -30,6 +30,15 @@ pwrkey {
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
@@ -38,8 +47,6 @@ pm8150_adc: adc@3100 {
 			#io-channel-cells = <1>;
 			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 
-			status = "disabled";
-
 			ref-gnd@0 {
 				reg = <ADC5_REF_GND>;
 				qcom,pre-scaling = <1 1>;
@@ -85,3 +92,33 @@ pmic@1 {
 		#size-cells = <0>;
 	};
 };
+
+&thermal_zones {
+	pm8150_temp {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+
+		thermal-sensors = <&pm8150_temp>;
+
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip2 {
+				temperature = <145000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 40b5d75a4a1d..e93d16f2d1e0 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -22,7 +22,16 @@ power-on@800 {
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
@@ -30,8 +39,6 @@ adc@3100 {
 			#io-channel-cells = <1>;
 			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 
-			status = "disabled";
-
 			ref-gnd@0 {
 				reg = <ADC5_REF_GND>;
 				qcom,pre-scaling = <1 1>;
@@ -74,3 +81,33 @@ pmic@3 {
 		#size-cells = <0>;
 	};
 };
+
+&thermal_zones {
+	pm8150b_temp {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+
+		thermal-sensors = <&pm8150b_temp>;
+
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip2 {
+				temperature = <145000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index cf05e0685d10..1edf87c95a27 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -22,7 +22,16 @@ power-on@800 {
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
@@ -30,8 +39,6 @@ adc@3100 {
 			#io-channel-cells = <1>;
 			interrupts = <0x4 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 
-			status = "disabled";
-
 			ref-gnd@0 {
 				reg = <ADC5_REF_GND>;
 				qcom,pre-scaling = <1 1>;
@@ -68,3 +75,33 @@ pmic@5 {
 		#size-cells = <0>;
 	};
 };
+
+&thermal_zones {
+	pm8150l_temp {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+
+		thermal-sensors = <&pm8150l_temp>;
+
+		trips {
+			trip0 {
+				temperature = <95000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			trip2 {
+				temperature = <145000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+		};
+
+	};
+};
-- 
2.26.2

