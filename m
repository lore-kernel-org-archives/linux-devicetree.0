Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E1DC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 17:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3B2721655
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 17:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izFt0W2M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbfLLRRs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 12:17:48 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33461 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730007AbfLLRRs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 12:17:48 -0500
Received: by mail-vs1-f68.google.com with SMTP id n27so2133099vsa.0
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 09:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CijgkspoW+Zx0cv79pbBAewbwbnWZo70qA6UYTTivFQ=;
        b=izFt0W2M0YcSKzLsV4yVFMo83/9Bi7CNsmOd7wqhtC0wKO7e9lzCZ4ZJU9K5dBxYe5
         lUcnFjZMD+4NCbwWuWHtGNfJ8luAdIKT15V/TQ+crseI7sFghWGnnBpA2mZvD5e1FbTc
         vImLFayb+z1EiX4up0Pgv3teheXmiZRdpPqLeBOsy1ptxDyihONnn95OFiVCpA+XrEff
         rOK+HoGi149MOqKpEIQ6F39vRKIZk8nzXLUz/p+7N/hFLbLelrTOzX5CQZHL/ff6MI+B
         UsDLCtNFQH/YULIKvdGZdQKM8b31hk9NypBlJxhY6FZuwGXAv5Htu71pDIYtCxQ+fYI0
         o6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CijgkspoW+Zx0cv79pbBAewbwbnWZo70qA6UYTTivFQ=;
        b=h9SaWh5IjrXzFintAjySC1+i02o50M+o0dfts71wjD2E7wTfOnRw1wbKnIcOGb4e9W
         z154MfnmxfZAiGeO87T2Mx645jHxPfjrSnej1K1GRzKpeqhpNbi+ZBUxr/yWlNwFASyz
         jIUjZV/Opq1R1N+OpO291j4DNbVbhnjALqIHPMPT0kinAHDzM/okXp9/KabcP2Ta1fU2
         9FPb6LPyIXN9FIUpX4nYAwOEOTcX6s8y25+WO9df1RKkJhY0lS9bcDQS5QlwYBT/45GN
         yDBwXyzfLmOPzZlHJbY3C+z/EL9Aps/Bdl0BSvJo5ZsJxX0zDioc2Ytpcpy1MljKfD0n
         I6cA==
X-Gm-Message-State: APjAAAUfKmx8lYR1z8x+wlf/IGF/uTquZwgUJzSIECP5AyqXKmYN6aI3
        io4t9DVlEvFBd7DaECPQ+6A=
X-Google-Smtp-Source: APXvYqx3GkJFaKMqjZwAqosQgKdhI4zg6EhrtnZZgpPXVoTOZeAnJouyEY519jviMhD/DD+pwccuOA==
X-Received: by 2002:a67:ae43:: with SMTP id u3mr8212717vsh.44.1576171066958;
        Thu, 12 Dec 2019 09:17:46 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id g140sm4246759vkf.18.2019.12.12.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 09:17:46 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] ARM: dts: imx51-babbage: Fix the DVI output description
Date:   Thu, 12 Dec 2019 14:17:03 -0300
Message-Id: <20191212171704.23604-1-festevam@gmail.com>
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
 arch/arm/boot/dts/imx51-babbage.dts | 64 ++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-babbage.dts b/arch/arm/boot/dts/imx51-babbage.dts
index ed6a3ce874b2..1f05afa7579c 100644
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
@@ -115,6 +113,31 @@
 		};
 	};
 
+	encoder {
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
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -128,6 +151,17 @@
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&tfp410_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-- 
2.17.1

