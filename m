Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3FFC2D0C7
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 16:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FC2E206A5
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 16:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfQbZHcv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbfLKQrZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 11:47:25 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54586 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730939AbfLKQrY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 11:47:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so7882417wmj.4
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=E3PYmv9+m7+3cAT1JW/rJqeLk+vNpRNUBln9Sx/2fnE=;
        b=HfQbZHcvWPo/ltn/OdAhyQfSAAiy4S/MAnbsaZwMVmsfREH31U1BK9F3whypA1pqmK
         VEoulZJa7KPSzFnXm+2+iXOKeq+hlIa/XUMW4vs/+0S4L4MchqoG8RBNp2wEpz6Caxlo
         hLy4czk9pv416tPbdTQaofSQDWW/jPmRRZ3tEvYIborHOuEl4UEPqs8fH3HyOagcyIwg
         duhg0MNCqB835kkSLj5/8SZxnVMFypHko8ntLoh/zLhtxdm2hvkeHIKj13VF7jklbk3l
         QdP2YNIx9a4VkoZARC3E3GIthaI6CyqOhmjZxPnqtGhNCtH0e34LFk5ljUv+mtrVCPBp
         ozLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=E3PYmv9+m7+3cAT1JW/rJqeLk+vNpRNUBln9Sx/2fnE=;
        b=gu8YwJCeKXV7nkZN84M/FaXPuZa+Tlr+//dYLdWWcFVQbKq7WoR2ezqLIUZXg0R/rF
         wuUH5ZZiXPkPnQVMXr7tlFehh55lgg4ykBoDPT83nE5KNMcbdxqQYd7KDgp83+AL7/CQ
         j+2U1cwYhyoEgpK0DfFjBQ/qaAMpmdOz+JCaIw/XKSFI/ejGbbFXfXUTPMHRW4bsXftq
         XssYuNTqrBHSHEdymQYLS2Opr3hxFpafNc7l4nsleVZlKQYMJezDum3iuPqmasTPfp/1
         yvLDaeW20aViM+FHXXuLSt30V7VC79HKWZZg9uQwakULVFoLGcJBKL4RETf0amrE6Z8m
         vqZQ==
X-Gm-Message-State: APjAAAU7CgJvryXLo0RgE8MS1bT2aFrV9dCuFh2AuCKwmroDa4AAF44h
        A0YbLbF2HKkHFK95qWZLfUL77A==
X-Google-Smtp-Source: APXvYqyhUlNuE7g0enMZGRL0wsWrZrOS76tdCt/yqH/dew4kGEd0rk9nFfYmRiolW7xSKlFmLQjPYw==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr174wmh.136.1576082842223;
        Wed, 11 Dec 2019 08:47:22 -0800 (PST)
Received: from localhost.localdomain (amontpellier-651-1-319-58.w92-133.abo.wanadoo.fr. [92.133.198.58])
        by smtp.gmail.com with ESMTPSA id a20sm3001309wmd.19.2019.12.11.08.47.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 11 Dec 2019 08:47:21 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robh+dt@kernel.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        amit.pundir@linaro.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] arm: dts: qcom: db410c: Enable USB OTG support
Date:   Wed, 11 Dec 2019 17:50:14 +0100
Message-Id: <1576083014-5842-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Dragonboard-410c is able to act either as USB Host or Device.
The role can be determined at runtime via the USB_HS_ID pin which is
derived from the micro-usb port VBUS pin.

In Host role, SoC USB D+/D- are routed to the onboard USB 2.0 HUB.
In Device role, SoC USB D+/D- are routed to the USB 2.0 micro B port.
Routing is selected via USB_SW_SEL_PM gpio.

In device role USB HUB can be held in reset.

chipidea driver expects two extcon device pointers, one for the
EXTCON_USB event and one for the EXTCON_USB_HOST event. Since
the extcon-usb-gpio device is capable of generating both these
events, point two times to this extcon device.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi           | 11 ++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
index ec2f0de..aff218c 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
@@ -8,6 +8,15 @@
 		pinconf {
 			pins = "gpio3";
 			function = PMIC_GPIO_FUNC_NORMAL;
+			input-disable;
+			output-high;
+		};
+	};
+
+	usb_hub_reset_pm_device: usb_hub_reset_pm_device {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
 			output-low;
 		};
 	};
@@ -22,6 +31,16 @@
 		};
 	};
 
+	usb_sw_sel_pm_device: usb_sw_sel_pm_device {
+		pinconf {
+			pins = "gpio4";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			power-source = <PM8916_GPIO_VPH>;
+			input-disable;
+			output-low;
+		};
+	};
+
 	pm8916_gpios_leds: pm8916_gpios_leds {
 		pinconf {
 			pins = "gpio1", "gpio2";
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index e12a36c..037e26b 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -358,14 +358,15 @@
 		};
 
 		usb@78d9000 {
-			extcon = <&usb_id>;
+			extcon = <&usb_id>, <&usb_id>;
 			status = "okay";
 			adp-disable;
 			hnp-disable;
 			srp-disable;
-			dr_mode = "host";
-			pinctrl-names = "default";
-			pinctrl-0 = <&usb_sw_sel_pm>;
+			dr_mode = "otg";
+			pinctrl-names = "default", "device";
+			pinctrl-0 = <&usb_sw_sel_pm &usb_hub_reset_pm>;
+			pinctrl-1 = <&usb_sw_sel_pm_device &usb_hub_reset_pm_device>;
 			ulpi {
 				phy {
 					v1p8-supply = <&pm8916_l7>;
@@ -504,7 +505,7 @@
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		vbus-gpio = <&msmgpio 121 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&msmgpio 121 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
-- 
2.7.4

