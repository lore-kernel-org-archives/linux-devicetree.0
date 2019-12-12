Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0285AC00454
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 19:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C31382253D
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 19:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n/trhhKh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730761AbfLLTzJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 14:55:09 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39113 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730750AbfLLTzJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 14:55:09 -0500
Received: by mail-pg1-f194.google.com with SMTP id b137so71832pga.6
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 11:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xipc9AXS94+c5lbtEsh/KKCpzfOdW798Fs9Zb0D/PIM=;
        b=n/trhhKh1SRnTbMZInQL3F/fYF7cApqpFLu8db8hCAxCkIS54227TZO5d952kgkFaT
         Nt1BP4QBL1oo0zD8u62AcYIyafCRJlI0QVSV9hQqSpSO3fb/6wSDfAQbBwMhxantExaC
         76utHdSG20yv5dEzWHT6d6/yK+IYkvlvmIoUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xipc9AXS94+c5lbtEsh/KKCpzfOdW798Fs9Zb0D/PIM=;
        b=OiZAByoECM1MTtdiUOArD/CK+9TdeGSKd9c12cAiXqYPSW8C2EMeERvcNh0nQqyn9Z
         CzH12u9GSp/DwpRNqwojVpqepejXgSsz8IKr1PwXRcYipSEHg3E/evOvdWvT381McRSG
         9S/ORT90elli7uS1drXzlS1XDU9k9lYjrzZSEw1CAdD6L2RmPhKNkzHAYOvQ8+IplU8v
         uxbSibapjwcbrIQEn6fVx3D7xvV4HdlYD41kTDm0AiRl1/XlAmONDLuNshkCWCFd+19d
         vPVxn7QNIVe+hIfEd6mip+8Pm5BnQFHXJrl5Y7PtM+E3bPoCxo+xcp3ITUqd3V7+3QAe
         Aqnw==
X-Gm-Message-State: APjAAAUuBQ6hIjqx7a2FwTHX4xvf7dBpavwp9N269wP40vtS4u3JdTAx
        I1VY4PIzdXHbrHl0eK70AiHaIg==
X-Google-Smtp-Source: APXvYqzhuJPokwvUPye5ga1VPMjxotcugrUG9Ne+S1EX+edBcYRP2JJip+UdhFedyIJD4uuWm7WuJQ==
X-Received: by 2002:a63:4b50:: with SMTP id k16mr12623072pgl.386.1576180508286;
        Thu, 12 Dec 2019 11:55:08 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u26sm7929974pfn.46.2019.12.12.11.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 11:55:07 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rajeshwari <rkambl@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Fix order of nodes
Date:   Thu, 12 Dec 2019 11:55:01 -0800
Message-Id: <20191212115443.1.I55198466344789267ed1eb5ec555fd890c9fc6e1@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SC7180 device tree nodes should be ordered by address. Re-shuffle
some nodes which currently don't follow this convention.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Bjorn/Andy: if this is considered correct could it be landed quickly,
to have a sane baseline for other patches and minimize conflicts?


 arch/arm64/boot/dts/qcom/sc7180.dtsi | 74 ++++++++++++++--------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 63a7bfb7f5125..286a4b2aeced9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -619,16 +619,6 @@
 			};
 		};
 
-		pdc: interrupt-controller@b220000 {
-			compatible = "qcom,sc7180-pdc", "qcom,pdc";
-			reg = <0 0xb220000 0 0x30000>;
-			qcom,pdc-ranges = <0 480 15>, <17 497 98>,
-					  <119 634 4>, <124 639 1>;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&intc>;
-			interrupt-controller;
-		};
-
 		tlmm: pinctrl@3500000 {
 			compatible = "qcom,sc7180-pinctrl";
 			reg = <0 0x03500000 0 0x300000>,
@@ -932,33 +922,6 @@
 			status = "disabled";
 		};
 
-		system-cache-controller@9200000 {
-			compatible = "qcom,sc7180-llcc";
-			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
-			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		tsens0: thermal-sensor@c263000 {
-			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
-			reg = <0 0x0c263000 0 0x1ff>, /* TM */
-				<0 0x0c222000 0 0x1ff>; /* SROT */
-			#qcom,sensors = <15>;
-			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
-			#thermal-sensor-cells = <1>;
-		};
-
-		tsens1: thermal-sensor@c265000 {
-			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
-			reg = <0 0x0c265000 0 0x1ff>, /* TM */
-				<0 0x0c223000 0 0x1ff>; /* SROT */
-			#qcom,sensors = <10>;
-			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
-			#thermal-sensor-cells = <1>;
-		};
-
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sc7180-qusb2-phy";
 			reg = <0 0x088e3000 0 0x400>;
@@ -1007,6 +970,13 @@
 			};
 		};
 
+		system-cache-controller@9200000 {
+			compatible = "qcom,sc7180-llcc";
+			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -1051,6 +1021,36 @@
 			};
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sc7180-pdc", "qcom,pdc";
+			reg = <0 0xb220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 15>, <17 497 98>,
+					  <119 634 4>, <124 639 1>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
+			reg = <0 0x0c263000 0 0x1ff>, /* TM */
+				<0 0x0c222000 0 0x1ff>; /* SROT */
+			#qcom,sensors = <15>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
+			reg = <0 0x0c265000 0 0x1ff>, /* TM */
+				<0 0x0c223000 0 0x1ff>; /* SROT */
+			#qcom,sensors = <10>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
+			#thermal-sensor-cells = <1>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c440000 0 0x1100>,
-- 
2.24.1.735.g03f4e72817-goog

