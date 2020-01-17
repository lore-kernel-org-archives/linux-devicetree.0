Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F37C33C9E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47B8E21D7D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579302534;
	bh=fLmOK2381ND8gSrUPDoY6LeZ9Bc9uOZdPF4YfGiytqc=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=HkOXsa+vLV7Xat24GYePguO7WeWVDwVBmwlHZalwfCUzHV/UBLRgl0zT41PnTMOSy
	 djXxC4b4ZMun8yqa8wi//0mu0nvSKKoNsCo1dh8aC7FAMZMeMIMvHw8nq55tyU3K5r
	 Kgg3dqOaVh4/ts/HwbZbm/4838DvLthymC/6g3Yo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgAQXIy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 18:08:54 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42291 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgAQXIx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 18:08:53 -0500
Received: by mail-ot1-f67.google.com with SMTP id 66so23976249otd.9
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 15:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cqgz/m/rHOwX/YU/6r2tkfWixNMLLHpkXsNnKidD6mI=;
        b=iFj3WNf4+zSzQPfOPG84dqjdbJ3hLecv4bBpTd2+B27S6yc5CK/7RkAEJ33sUnfHRB
         YxiZDixJYhj3w//EVPMqfgTAiD+U82kL59D0A8+rO/mzF46NR0C8LVExj96aLugsIoRQ
         pdo4pzO8LCIHpAwDjKhHKAP93IQXJNiUC2KubSlx7JhnYHRFZsAcS3R+2CryMe/T/qrw
         5a0WsN85NUBW9sQwIYWuLe64tRdxdsq7RNMJ/g7q/8YRaDNnl7Dwt0bqCGX3Uysa0cCC
         tNQoDSfGMyvJhB1Y0iFSUr1rQB6Iv/cu2FWha/ggY/hRvgeycM8PRP1DI4iMR1DFCq/p
         H6WA==
X-Gm-Message-State: APjAAAWQS4YEcqjggdjHs0fxnSc9wtlrLXVxuPOkzr2gFliypWQ6Jp10
        wSYFoUn8OYVDKKFJN0KCqur/n7Q=
X-Google-Smtp-Source: APXvYqwpMofXMtXSkvcfYmRsRs877ZC8quW0DzWQrsLWEEQG6x/Dj0WxQDOdDPfrfLiOaST5/w3bKA==
X-Received: by 2002:a05:6830:1e46:: with SMTP id e6mr7519888otj.245.1579302532822;
        Fri, 17 Jan 2020 15:08:52 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id a6sm9584007otd.81.2020.01.17.15.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 15:08:52 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] arm: rockchip: dts: Kill off "simple-panel" compatibles
Date:   Fri, 17 Jan 2020 17:08:51 -0600
Message-Id: <20200117230851.25434-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

"simple-panel" is a Linux driver and has never been an accepted upstream
compatible string, so remove it.

Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/rk3288-evb.dtsi                          | 2 +-
 arch/arm/boot/dts/rk3288-veyron-edp.dtsi                   | 2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts                 | 2 +-
 arch/arm/boot/dts/rk3288-veyron-tiger.dts                  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index 2afd686b2033..018802df4c0e 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -97,7 +97,7 @@
 	};
 
 	panel: panel {
-		compatible = "lg,lp079qx1-sp0v", "simple-panel";
+		compatible = "lg,lp079qx1-sp0v";
 		backlight = <&backlight>;
 		enable-gpios = <&gpio7 RK_PA4 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&lcd_cs>;
diff --git a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
index 300a7e32c978..32c0f10765dd 100644
--- a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
@@ -54,7 +54,7 @@
 	};
 
 	panel: panel {
-		compatible = "innolux,n116bge", "simple-panel";
+		compatible = "innolux,n116bge";
 		status = "okay";
 		power-supply = <&panel_regulator>;
 		backlight = <&backlight>;
diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index c833716dbe48..95db0eb8d639 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -70,7 +70,7 @@
 };
 
 &panel {
-	compatible = "auo,b101ean01", "simple-panel";
+	compatible = "auo,b101ean01";
 
 	/delete-node/ panel-timing;
 
diff --git a/arch/arm/boot/dts/rk3288-veyron-tiger.dts b/arch/arm/boot/dts/rk3288-veyron-tiger.dts
index bebb230e592f..069f0c2c1fdf 100644
--- a/arch/arm/boot/dts/rk3288-veyron-tiger.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-tiger.dts
@@ -53,7 +53,7 @@
 };
 
 &panel {
-	compatible = "auo,b101ean01", "simple-panel";
+	compatible = "auo,b101ean01";
 
 	/delete-node/ panel-timing;
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
index 9dd3b171e91d..e6c1c94c8d69 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
@@ -18,7 +18,7 @@
 		     "google,bob", "google,gru", "rockchip,rk3399";
 
 	edp_panel: edp-panel {
-		compatible = "boe,nv101wxmn51", "simple-panel";
+		compatible = "boe,nv101wxmn51";
 		backlight = <&backlight>;
 		power-supply = <&pp3300_disp>;
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index b8066868a3fe..2bbef9fcbe27 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -39,7 +39,7 @@
 	};
 
 	edp_panel: edp-panel {
-		compatible = "sharp,lq123p1jx31", "simple-panel";
+		compatible = "sharp,lq123p1jx31";
 		backlight = <&backlight>;
 		power-supply = <&pp3300_disp>;
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index 808ea77f951d..b4d8f60b7e44 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -84,7 +84,7 @@
 	};
 
 	edp_panel: edp-panel {
-		compatible ="lg,lp079qx1-sp0v", "simple-panel";
+		compatible ="lg,lp079qx1-sp0v";
 		backlight = <&backlight>;
 		enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-- 
2.20.1

