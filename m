Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B0EC433E5
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 08:34:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C17220672
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 08:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YYbdkIb4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgGOIeq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 04:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbgGOIep (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 04:34:45 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1EFC061755
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 01:34:45 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id j19so2708175pgm.11
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kjN8zayeMZG2DU4GzukY5NcBfZcnl9ozMGccHHoLtc4=;
        b=YYbdkIb4NzCVM5ThpHJVKE+9NAsXOXJTj+D6B8nmH5lQdIEXveNyFBeVGCzWHF4Cae
         7afdV4DglRasGGq/V++HxOQzigizkffo3+SKyy8UVaZ7uYW8vs24JXdcLBvn026paZPk
         UGv0PDNSEyd42/LE12glkZusDFK4hpCRLnFXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kjN8zayeMZG2DU4GzukY5NcBfZcnl9ozMGccHHoLtc4=;
        b=bjpQHG4+h6op4IMCAGxzQ2Vf2Hs3B4FjA4H9rfi4fHHHZU8k3NxixHhhhG6AMBwNSn
         eqzh4VsJZqNCu1qRc4i9nfqjxPPG0fP0Wnm7HXAUHRreTM47WLxkrxjPSklDW1c1V2Vy
         iYfnZM+2QojttqkNs0KFrwWf8PBxVxCNxBwcuVGKkA7VIiDXWpoLOwkl1H9pQ28QqOte
         37XDTU67SNkjnq9v6e6oJvlW/0vh7e6RF+6hHAfFH+UmwaZO8tESdZ8b+7h51gTa6Bxs
         fGMB2jBJx0RYYVwA3drnaFLrzIkN+ViD7VbPVKLV7wHq9HwLW/WyRWrZQiCrawo+YiWq
         sNyg==
X-Gm-Message-State: AOAM532ZCHjICkq/4ms7A7uQOXu/8rOXPYdjQiZ3TP014tJ0vXVwMQr/
        J0dMMe/JH14GMg7YTwmJ5P4GMg==
X-Google-Smtp-Source: ABdhPJzY09Yixyw9mcn93UTId1G4FU8OwXFbvjOYbJonZQY2YfJnqUJgR/gCMvQikYHIyDgK1dR9fA==
X-Received: by 2002:a62:1b4e:: with SMTP id b75mr7485926pfb.33.1594802085172;
        Wed, 15 Jul 2020 01:34:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:9887:56a8:c916:cfdb])
        by smtp.gmail.com with ESMTPSA id m92sm1467584pje.13.2020.07.15.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 01:34:44 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v6 1/7] ARM: dts: rockchip: dalang-carrier: Move i2c nodes into SOM
Date:   Wed, 15 Jul 2020 14:04:12 +0530
Message-Id: <20200715083418.112003-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715083418.112003-1-jagan@amarulasolutions.com>
References: <20200715083418.112003-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

I2C nodes and associated slave devices defined in Carrier board
are specific to rk3399pro vmrac SOM.

So, move them into SOM dtsi.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- spilt of previous version Trivial patch

 .../dts/rockchip-radxa-dalang-carrier.dtsi    | 32 -------------------
 .../dts/rockchip/rk3399pro-vmarc-som.dtsi     | 29 +++++++++++++++++
 2 files changed, 29 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi b/arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi
index df3712aedf8a..176b53b8e41a 100644
--- a/arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi
+++ b/arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi
@@ -17,29 +17,6 @@ &gmac {
 	status = "okay";
 };
 
-&i2c1 {
-	status = "okay";
-	i2c-scl-rising-time-ns = <140>;
-	i2c-scl-falling-time-ns = <30>;
-};
-
-&i2c2 {
-	status = "okay";
-	clock-frequency = <400000>;
-
-	hym8563: hym8563@51 {
-		compatible = "haoyu,hym8563";
-		reg = <0x51>;
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-		clock-output-names = "hym8563";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hym8563_int>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
-	};
-};
-
 &pwm0 {
 	status = "okay";
 };
@@ -70,12 +47,3 @@ &uart0 {
 &uart2 {
 	status = "okay";
 };
-
-&pinctrl {
-	hym8563 {
-		hym8563_int: hym8563-int {
-			rockchip,pins =
-				<4 RK_PD6 0 &pcfg_pull_up>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index 0a516334f15f..e11538171e67 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -297,6 +297,29 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	i2c-scl-falling-time-ns = <30>;
+	i2c-scl-rising-time-ns = <140>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	hym8563: hym8563@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "hym8563";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hym8563_int>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &io_domains {
 	status = "okay";
 	bt656-supply = <&vcca_1v8>;
@@ -324,6 +347,12 @@ &tsadc {
 };
 
 &pinctrl {
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <4 RK_PD6 0 &pcfg_pull_up>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins =
-- 
2.25.1

