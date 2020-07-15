Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75822C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 08:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5568A2067D
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 08:35:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="D99E52J1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730155AbgGOIfC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 04:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730120AbgGOIfC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 04:35:02 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2459C061755
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 01:35:01 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d4so2730567pgk.4
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Gf+3b18Fng3ehSSzSlGlAKgiKsSEaA+C81WsDyFW3w=;
        b=D99E52J1/iq4tAHPaGEuMRclM3XBiOV7ywlMdDOotpuwldvPhBvAoAx+ygB/L1RviV
         pCSOlM21XWp8hkl9ltf+NwiMEZUWobaG2KdzMGV4Wrm9VwYqlXHp0xv0WjDOWhRPogig
         R23Ki4rlSqAuFyXlVzoOF/smMfIl2YD7+K5j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Gf+3b18Fng3ehSSzSlGlAKgiKsSEaA+C81WsDyFW3w=;
        b=R1K9K4lTeBsgRFTmw1ZaPaNX6ahYAiU60cKG3CikUgr3cEjipv8BmW6UF/Y/Xj2ALN
         JlfHMMsb+lAedIyXqXDGE68Uy88+rEgL2z1W1yXKYiVXIIuMZi6C9+fC4ZLqjiRTkcXe
         450rzfcC83uUkX8DBjaeCDoDlNX03Pr/rTHc7HkYWDsDpTdqc3cr+Mfa1RzuTBfQCqnX
         6a88Jt51pagmn7JVP2776j+tZDBT58MvU3Y/AMdU6rgxH2bSCArdy2qHAlHRpS14zUrh
         kljyeleCZQ6FtVujnUROEqrYEIO+TWrl3yOfIKf+lxZ7PXB4cXSPKFAFwDrcIrDpL+4D
         LkBw==
X-Gm-Message-State: AOAM532Jo9Ni7vokHK0W+Ol1a04EphDmVKHqVYa9i2hlXKke7BS8MGYw
        b9h2Wsjns4RMrH8iS9mCt2fVYQ==
X-Google-Smtp-Source: ABdhPJxRCFCn4iico0x9z8Q/KtWrdVTCJYE4/x2rneR9/RFp7MAaB7H84QREPyZJWuLxOVdY1X5hBQ==
X-Received: by 2002:a62:88d4:: with SMTP id l203mr7603870pfd.205.1594802101431;
        Wed, 15 Jul 2020 01:35:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:9887:56a8:c916:cfdb])
        by smtp.gmail.com with ESMTPSA id m92sm1467584pje.13.2020.07.15.01.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 01:35:00 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v6 4/7] arm64: dts: rk3399pro: vmarc-som: Move common properties into Carrier
Date:   Wed, 15 Jul 2020 14:04:15 +0530
Message-Id: <20200715083418.112003-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715083418.112003-1-jagan@amarulasolutions.com>
References: <20200715083418.112003-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some of gmac, sdmmc node properties are common across rk3288 and
rk3399pro SOM's so move them into Carrier dtsi.

Chosen node is specific to rk3399pro configure SBC, so move it into
RockPI N10 dts.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- spilt of previous version Trivial patch

 .../dts/rockchip-radxa-dalang-carrier.dtsi    | 18 ++++++++++++----
 .../dts/rockchip/rk3399pro-rock-pi-n10.dts    |  4 ++++
 .../dts/rockchip/rk3399pro-vmarc-som.dtsi     | 21 +++++--------------
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi b/arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi
index 00b200a62263..450e5bb5af0b 100644
--- a/arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi
+++ b/arch/arm/boot/dts/rockchip-radxa-dalang-carrier.dtsi
@@ -8,8 +8,11 @@
 #include <dt-bindings/pwm/pwm.h>
 
 / {
-	chosen {
-		stdout-path = "serial2:1500000n8";
+	clkin_gmac: external-gmac-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clkin_gmac";
+		#clock-cells = <0>;
 	};
 
 	vcc12v_dcin: vcc12v-dcin-regulator {
@@ -33,6 +36,15 @@ vcc5v0_sys: vcc5v0-sys-regulator {
 };
 
 &gmac {
+	assigned-clock-parents = <&clkin_gmac>;
+	clock_in_out = "input";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_pins>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 50000>;
+	tx_delay = <0x28>;
+	rx_delay = <0x11>;
 	status = "okay";
 };
 
@@ -48,10 +60,8 @@ &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
 	cap-sd-highspeed;
-	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	vqmmc-supply = <&vccio_sd>;
-	max-frequency = <150000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts b/arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts
index 539f4005386d..369de5dc0ebd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts
@@ -15,4 +15,8 @@ / {
 	model = "Radxa ROCK Pi N10";
 	compatible = "radxa,rockpi-n10", "vamrs,rk3399pro-vmarc-som",
 		     "rockchip,rk3399pro";
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index d8fa8127d9dc..37ed95d5f7e9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -11,13 +11,6 @@
 
 / {
 	compatible = "vamrs,rk3399pro-vmarc-som", "rockchip,rk3399pro";
-
-	clkin_gmac: external-gmac-clock {
-		compatible = "fixed-clock";
-		clock-frequency = <125000000>;
-		clock-output-names = "clkin_gmac";
-		#clock-cells = <0>;
-	};
 };
 
 &cpu_l0 {
@@ -42,17 +35,8 @@ &emmc_phy {
 
 &gmac {
 	assigned-clocks = <&cru SCLK_RMII_SRC>;
-	assigned-clock-parents = <&clkin_gmac>;
-	clock_in_out = "input";
 	phy-supply = <&vcc_lan>;
-	phy-mode = "rgmii";
-	pinctrl-names = "default";
-	pinctrl-0 = <&rgmii_pins>;
 	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 10000 50000>;
-	tx_delay = <0x28>;
-	rx_delay = <0x11>;
 };
 
 &i2c0 {
@@ -335,6 +319,11 @@ &sdhci {
 	status = "okay";
 };
 
+&sdmmc {
+	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
+	max-frequency = <150000000>;
+};
+
 &tsadc {
 	rockchip,hw-tshut-mode = <1>;
 	rockchip,hw-tshut-polarity = <1>;
-- 
2.25.1

