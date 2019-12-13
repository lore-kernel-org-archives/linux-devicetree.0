Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894BBC5072B
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF5FA24718
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6xLarDs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfLMN6u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 08:58:50 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33580 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727489AbfLMN6u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 08:58:50 -0500
Received: by mail-pl1-f193.google.com with SMTP id c13so1294147pls.0
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 05:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0pSL7+6Hfic6QamJwgv8SnmNlOMYhYlW3BzhIK7N/pE=;
        b=e6xLarDs9kfv5A7ccrZSG4Janl78yrPDHvawA5PnhtHZ+7+iphzeBKwPtRXUTGxszO
         Tu7l+HeoAnYG61sNVR5YPMjpxtAQwfh0RjeISvAvmajbctn1tUbnQ/TVEKP8+SBbdoYU
         9sjFHPM6LhcnSetBfIQXMkxESYH4Qqf1obBcNEZtzXhhMSNzKGLkBs+3jpe1s/+EaqmT
         Yp7c09HZDq+hRwgH9KTdhbCMDscQVApKeE7LV1mKgPVSNi59Q/YsTJuVLHP4DTAVzfr5
         BmOn+j2lSUwxya2lructw3cKIHH4Cga/ol/E+ZXIH1eJl7ZVhZOpQyAJUF5fCDqCnyRC
         SMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0pSL7+6Hfic6QamJwgv8SnmNlOMYhYlW3BzhIK7N/pE=;
        b=qjXfj1CxkBOd3LGx7m6IvhXhd8nqYWrI2hAJs+bTiznbJX4R7bsU9rYN9/JH15mANw
         OzDMr/ceJgvsNdJs/DvfVuF3t4/VpFyd6avRlDvqtMBVuhomznOVP2XyVaGaTlYDiWFV
         6sB/W+G3GBRpRmNVmgNXtScketfedCO3Idp/qCvBcv9b/MIcwdqjmuVKng2oA6SkTIYV
         wn//R0nUm8HUuK4WHw7BTh0nEErgysupvICJWei3fVlLtklke5Is+hrYO/5BofJS9uHJ
         3ocrYJKXhDi7cgjjvfTtFAumUEAOaCmSxYSlQBvEVLqVL+HSIKO2aJQhVFTbqqas/vsU
         upew==
X-Gm-Message-State: APjAAAXxEu0KLxAGgBij2/BixD34c87XzWGUZn31uX3qE99AnSj6oJLu
        6G88m+C0dgBxEiRbV+8YhRI=
X-Google-Smtp-Source: APXvYqzhlxxZQ4K1aCD0j18ML2PufVmV+xW9yLZRqMg/AjI1PiTcYhuuvAMy7LsRWotBHgMTxu41bA==
X-Received: by 2002:a17:90a:b002:: with SMTP id x2mr16298438pjq.38.1576245529285;
        Fri, 13 Dec 2019 05:58:49 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id y6sm10778538pgc.10.2019.12.13.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:58:48 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     robh+dt@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] ARM: dts: imx51-babbage: Fix the DVI output description
Date:   Fri, 13 Dec 2019 10:58:37 -0300
Message-Id: <20191213135838.28697-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

imx51-babbage has a TFP410 chip that receives 24-bit RGB parallel
input and convert it to DVI.

Fix the device tree description to reflect the real hardware.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use "dvi-connector" compatible

 arch/arm/boot/dts/imx51-babbage.dts | 64 ++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-babbage.dts b/arch/arm/boot/dts/imx51-babbage.dts
index ed6a3ce874b2..552196d8a60a 100644
--- a/arch/arm/boot/dts/imx51-babbage.dts
+++ b/arch/arm/boot/dts/imx51-babbage.dts
@@ -58,29 +58,27 @@
 
 	display1: disp1 {
 		compatible = "fsl,imx-parallel-display";
+		#address-cells = <1>;
+		#size-cells = <0>;
 		interface-pix-fmt = "rgb24";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ipu_disp1>;
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: dvi {
-				clock-frequency = <65000000>;
-				hactive = <1024>;
-				vactive = <768>;
-				hback-porch = <220>;
-				hfront-porch = <40>;
-				vback-porch = <21>;
-				vfront-porch = <7>;
-				hsync-len = <60>;
-				vsync-len = <10>;
-			};
-		};
 
-		port {
+		port@0 {
+		reg = <0>;
+
 			display0_in: endpoint {
 				remote-endpoint = <&ipu_di0_disp1>;
 			};
 		};
+
+		port@1 {
+			reg = <1>;
+
+			parallel_display_out: endpoint {
+				remote-endpoint = <&tfp410_in>;
+			};
+		};
 	};
 
 	display2: disp2 {
@@ -115,6 +113,42 @@
 		};
 	};
 
+	dvi-connector {
+		compatible = "dvi-connector";
+		digital;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&tfp410_out>;
+			};
+		};
+	};
+
+	dvi-encoder {
+		compatible = "ti,tfp410";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				tfp410_in: endpoint {
+					remote-endpoint = <&parallel_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				tfp410_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
-- 
2.17.1

