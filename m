Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49557C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 12:55:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1ECBC206F0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 12:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="OJVfdC2z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgAHMz6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 07:55:58 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33397 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgAHMz6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 07:55:58 -0500
Received: by mail-wm1-f67.google.com with SMTP id d139so16461811wmd.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 04:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bdtpbTs9T4GbtVdHi/XNrhbno1vREs2paRznkMKkr6Y=;
        b=OJVfdC2zxbnX5OXOhp8PI+J8q+MT0PB0Bz0xcJ7CnJIDiJAxDPthu/UpowbYL28Hug
         GZnkxFv5mGjCwaktlWCNN3KzWDA/oXyE8+ShwWSXexSk1fAIZZNG04fgfqkxzcEeW2VS
         ssF/fzYTrUX3xOqJ6vAkuzNyyDPe36UEruYH05uz4dOLZtg9lpnoQsDNE2rtAz5Mbvjy
         y/Lr2IivklAmWcfsthwApX6cgAiTnSJ31ArCZcYyjnxpQMdOfV99ROCrfLhl5GpsLdLx
         pH/gIMS5aRVH/lxDI2Y95w3txZu0/QQQ/XXhJ2j9sAXumkBlByPOWs7w1sgKsCO3rcr5
         Ky3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bdtpbTs9T4GbtVdHi/XNrhbno1vREs2paRznkMKkr6Y=;
        b=IXozvdvb7ZmZ8XaJv5H+e6LKnF42Mnk3i12UGg3hA47YuZ+K7IEAf90EGA//plcmNd
         bnrZ+lhl7HEqB76inRNhubEcC3/S3IxBSHBosklRSWFObyoWghCjMH3d0xKXY1aeVNrH
         Zwt6zBRLC94s9ShrS3QNK7tCLIfrsjQQQMmdQGKMnKE0kOLd73XXEszurNA61Gjmybic
         3I11eDGuwC6v88FmGyaIlL9W4Rg/slGXIdoaqFu04oGbD792EfdEjVc70ZSXqJrWqPY1
         GZRoCCDy5nwndOXZUxTym3pYeDYJT+nbYSRgdc0af9zaxwS4uha2uGROrOVoICYfuF5u
         3GUQ==
X-Gm-Message-State: APjAAAVz3U6vwKEEX25Fl66kGtFhoEl8HE1kvkQrRi4RmAh0eKYpibDM
        BIYTBS2TmOqc8m8tBea2qPJJGA==
X-Google-Smtp-Source: APXvYqxuqRgRDpSyCXwMzN5jh6YP1cietWwlaiVE4CDUS7pATCAd4OqdAfXN/s/MZE8G0yEIhUOxLw==
X-Received: by 2002:a1c:2dcd:: with SMTP id t196mr3644438wmt.22.1578488155588;
        Wed, 08 Jan 2020 04:55:55 -0800 (PST)
Received: from localhost.localdomain (93-143-224-199.adsl.net.t-com.hr. [93.143.224.199])
        by smtp.googlemail.com with ESMTPSA id k7sm3598475wmi.19.2020.01.08.04.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 04:55:55 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        Sven Eckelmann <sven.eckelmann@openmesh.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 1/2] ARM: dts: qcom: add gpio-ranges property
Date:   Wed,  8 Jan 2020 13:54:55 +0100
Message-Id: <20200108125455.308969-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Christian Lamparter <chunkeey@gmail.com>

This patch adds the gpio-ranges property to almost all of
the Qualcomm ARM platforms that utilize the pinctrl-msm
framework.

The gpio-ranges property is part of the gpiolib subsystem.
As a result, the binding text is available in section
"2.1 gpio- and pin-controller interaction" of
Documentation/devicetree/bindings/gpio/gpio.txt

For more information please see the patch titled:
"pinctrl: msm: fix gpio-hog related boot issues" from
this series.

Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com> [ipq4019]
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Tested-by: Robert Marko <robert.marko@sartura.hr> [ipq4019]
Cc: Luka Perkov <luka.perkov@sartura.hr>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes since v1:
- Split ARM and ARM64 DTS changes into separate patches

 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 +
 arch/arm/boot/dts/qcom-apq8084.dtsi | 1 +
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 1 +
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 1 +
 arch/arm/boot/dts/qcom-msm8660.dtsi | 1 +
 arch/arm/boot/dts/qcom-msm8960.dtsi | 1 +
 arch/arm/boot/dts/qcom-msm8974.dtsi | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 8b79b4112ee1..2687c4e890ba 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -350,6 +350,7 @@
 			reg = <0x800000 0x4000>;
 
 			gpio-controller;
+			gpio-ranges = <&tlmm_pinmux 0 0 90>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 0a0fb147ebb9..4cc2d33f3d3b 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -401,6 +401,7 @@
 			compatible = "qcom,apq8084-pinctrl";
 			reg = <0xfd510000 0x4000>;
 			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 147>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 72d4e290b543..b6e5203a210b 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -201,6 +201,7 @@
 			compatible = "qcom,ipq4019-pinctrl";
 			reg = <0x01000000 0x300000>;
 			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 100>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 16c0da97932c..4021f661cd11 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -119,6 +119,7 @@
 			reg = <0x800000 0x4000>;
 
 			gpio-controller;
+			gpio-ranges = <&qcom_pinmux 0 0 69>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 356e9535f7a6..347b4f7d7889 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -128,6 +128,7 @@
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,mdm9615-pinctrl";
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 88>;
 			#gpio-cells = <2>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index ec5cbc468bd3..480fc08cbe8e 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -115,6 +115,7 @@
 			reg = <0x800000 0x4000>;
 
 			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 173>;
 			#gpio-cells = <2>;
 			interrupts = <0 16 0x4>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index f2aeaccdc1ad..172ea3c70eac 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -107,6 +107,7 @@
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 152>;
 			#gpio-cells = <2>;
 			interrupts = <0 16 0x4>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 369e58f64145..1689cf925b03 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -707,6 +707,7 @@
 			compatible = "qcom,msm8974-pinctrl";
 			reg = <0xfd510000 0x4000>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 146>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.24.1

