Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8A7C33CB6
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:08:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D43FC21D7D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579302538;
	bh=vS3iA4TB65bf5/vaCvPNjE1wThziKySuII9/DZ3pNG0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=m4Z7vRItuIWJiesjCwMnyAF9JOFy9D2jQlFFva7PD6YMhdRZhF+qLQE80kx8js03R
	 fBewKSyegJlN9SY6oSf4RlJ/Q/VqQ1bjd6HvkEyzA1p6wGw2tpZaTCcdRVP4PAnbq2
	 M0LNgHMElOlUk1o/oIbOG3NgJ0RffVpn5z9Z4PyY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgAQXI6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 18:08:58 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34216 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgAQXI6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 18:08:58 -0500
Received: by mail-ot1-f68.google.com with SMTP id a15so24008166otf.1;
        Fri, 17 Jan 2020 15:08:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=94GQShhvWdaezHHeSsdM0E7CTMl3mSSdpwqDu2xRo+w=;
        b=PRm11yTZboDzJtwakameBvrDlkRlgtNQ2JnKwZ1LRE/flCLFCLvwgzCasLV6FymHn1
         cjIFuHHPIDhtVX6aK/3XNiVAJ2lNUGS7HyJju8Mxay64wwr/YLmW96Hi0z5P/xgoymzq
         /0KBAUWgKZkJ+NcMRZoHvrJf0VNsrONPZPTL/IlDqQ+/nwisLItkOPy29fgji5F2ZCG5
         Gt7LChYAtaxPfeLMErE13lqDkH11T+tckNGHXuxrrYEpF1ps8OfOhgnwYajrX8tbK7Un
         kiIMUs1b+ryvWu3tkxVqgk9y7f6Fcjl291gTd4Epw0h9IGWc9pSJDd3lUOfu/PfE0LgH
         GC+w==
X-Gm-Message-State: APjAAAXnXR//HjKX34ZgSOEXftexMxVXJqrmiax0u5V3CcrCO3civnQT
        v9rZomut1uymqNEovpYI02ZNlJk=
X-Google-Smtp-Source: APXvYqysWQKmsKsv8z2BVx1eAbiuPdwoPMm2gS99Cd4el1DowGIIlLCpxjLLyA65KViHnexj+7XHBQ==
X-Received: by 2002:a9d:73ca:: with SMTP id m10mr8156144otk.312.1579302536695;
        Fri, 17 Jan 2020 15:08:56 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id w72sm8279868oie.49.2020.01.17.15.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 15:08:56 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH] arm: tegra: dts: Kill off "simple-panel" compatibles
Date:   Fri, 17 Jan 2020 17:08:55 -0600
Message-Id: <20200117230855.25567-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

"simple-panel" is a Linux driver and has never been an accepted upstream
compatible string, so remove it.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts         | 3 +--
 arch/arm/boot/dts/tegra124-venice2.dts         | 2 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts  | 2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts     | 2 +-
 arch/arm/boot/dts/tegra20-harmony.dts          | 2 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts      | 2 +-
 arch/arm/boot/dts/tegra20-paz00.dts            | 2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts         | 2 +-
 arch/arm/boot/dts/tegra20-ventana.dts          | 2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts      | 2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts | 2 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi          | 2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts  | 2 +-
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 2 +-
 14 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 97a5c3504bbe..8e48792ecdc8 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -46,8 +46,7 @@
 			avdd-dsi-csi-supply = <&avdd_1v2_reg>;
 
 			panel@0 {
-				compatible = "panasonic,vvx10f004b00",
-					     "simple-panel";
+				compatible = "panasonic,vvx10f004b00";
 				reg = <0>;
 
 				power-supply = <&avdd_lcd_reg>;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 7309393bfced..9004fb6dcede 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -1087,7 +1087,7 @@
 	};
 
 	panel: panel {
-		compatible = "lg,lp129qe", "simple-panel";
+		compatible = "lg,lp129qe";
 
 		backlight = <&backlight>;
 		ddc-i2c-bus = <&dpaux>;
diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
index 3c0f2681fcde..37ad508b61d9 100644
--- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
@@ -223,7 +223,7 @@
 		 * edt,et057090dhu: EDT 5.7" LCD TFT
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
-		compatible = "edt,et057090dhu", "simple-panel";
+		compatible = "edt,et057090dhu";
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index d8004d68efa0..af4740847769 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -205,7 +205,7 @@
 		 * edt,et057090dhu: EDT 5.7" LCD TFT
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
-		compatible = "edt,et057090dhu", "simple-panel";
+		compatible = "edt,et057090dhu";
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 1d96d92b72a7..02cd67ea2503 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -665,7 +665,7 @@
 	};
 
 	panel: panel {
-		compatible = "auo,b101aw03", "simple-panel";
+		compatible = "auo,b101aw03";
 
 		power-supply = <&vdd_pnl_reg>;
 		enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index cda5448c2ace..c73510cd501c 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -57,7 +57,7 @@
 	};
 
 	panel: panel {
-		compatible = "innolux,n156bge-l21", "simple-panel";
+		compatible = "innolux,n156bge-l21";
 
 		power-supply =  <&vdd_1v8_reg>, <&vdd_3v3_reg>;
 		enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 85fce5bc72d6..0151cdd09ffb 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -558,7 +558,7 @@
 	};
 
 	panel: panel {
-		compatible = "samsung,ltn101nt05", "simple-panel";
+		compatible = "samsung,ltn101nt05";
 
 		ddc-i2c-bus = <&lvds_ddc>;
 		power-supply = <&vdd_pnl_reg>;
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index f91441683aad..376ecb6435f4 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -826,7 +826,7 @@
 	};
 
 	panel: panel {
-		compatible = "chunghwa,claa101wa01a", "simple-panel";
+		compatible = "chunghwa,claa101wa01a";
 
 		power-supply = <&vdd_pnl_reg>;
 		enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index f44551e2d9d0..022649119821 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -611,7 +611,7 @@
 	};
 
 	panel: panel {
-		compatible = "chunghwa,claa101wa01a", "simple-panel";
+		compatible = "chunghwa,claa101wa01a";
 
 		power-supply = <&vdd_pnl_reg>;
 		enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 749fc6d1ff70..b39c26806bf2 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -195,7 +195,7 @@
 		 * edt,et057090dhu: EDT 5.7" LCD TFT
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
-		compatible = "edt,et057090dhu", "simple-panel";
+		compatible = "edt,et057090dhu";
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
index 0be50e881684..e29dca92ba0a 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
@@ -196,7 +196,7 @@
 		 * edt,et057090dhu: EDT 5.7" LCD TFT
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
-		compatible = "edt,et057090dhu", "simple-panel";
+		compatible = "edt,et057090dhu";
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 7ce61edd52f5..9048fdf4ad54 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -432,7 +432,7 @@
 	};
 
 	panel: panel {
-		compatible = "chunghwa,claa101wb01", "simple-panel";
+		compatible = "chunghwa,claa101wb01";
 		ddc-i2c-bus = <&panelddc>;
 
 		power-supply = <&vdd_pnl1_reg>;
diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 5965150ecdd2..8e106e784dce 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -159,7 +159,7 @@
 		 * edt,et057090dhu: EDT 5.7" LCD TFT
 		 * edt,et070080dh6: EDT 7.0" LCD TFT
 		 */
-		compatible = "edt,et057090dhu", "simple-panel";
+		compatible = "edt,et057090dhu";
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index a0385a386a3f..9f3206c63900 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -990,7 +990,7 @@
 	};
 
 	panel: panel {
-		compatible = "innolux,n116bge", "simple-panel";
+		compatible = "innolux,n116bge";
 		backlight = <&backlight>;
 		ddc-i2c-bus = <&dpaux>;
 	};
-- 
2.20.1

