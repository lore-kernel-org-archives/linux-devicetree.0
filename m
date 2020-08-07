Return-Path: <SRS0=8zDs=BR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E8EC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Aug 2020 09:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CA44221E5
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Aug 2020 09:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZJhlgW2q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgHGJsu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Aug 2020 05:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgHGJst (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Aug 2020 05:48:49 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2F1C061574
        for <devicetree@vger.kernel.org>; Fri,  7 Aug 2020 02:48:49 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id p1so814771pls.4
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2020 02:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpgEOhtDJgg+JHNnGT0zB8AHGVroP0sa6vGC4+WgrY0=;
        b=ZJhlgW2q36OOGZfDH+aVuJIJqLtDiPY1IJ+JNpipBmkcUcKzKRt6W4wJ9BloVTvOI7
         S/gMa9lcyz/lfgdM6Jsrjt9JdqHC+rH2sgidwu+hyAKgQEU7JKmKxS/opbT5jYDum0Qt
         x9ikHjOy3sAPQTU304WZPw/t3AWt0PNOmc5vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpgEOhtDJgg+JHNnGT0zB8AHGVroP0sa6vGC4+WgrY0=;
        b=FjVJAXMpq6NRirWEwGdMfav45B1GKFg9osfWwD/WAgwp6calt3++fbUiH1MDkKWcVL
         V6/zRhtXP2iCk1dOrLYwfdhJHkUH7XRwObp/2QSblX2I3ecAz01bHtlL6DCVlSjrrzg9
         yhnbXT6zj2/vU9BxSRslSvu1rX/Be9di6QgJbERkL7c+O7iaJyO4nEtFe2zNfdUXrHjo
         B4EeKxrt9L7CLFhNi1H6gdN4xecgS7H7q5/AxLqwhbNPjEsjVO21ffqngnsZYQWb3bLh
         LH/14+0b4XR0HCHekmNHgHmW7eC9M+QSyUBkviN8ymXNk67QZVqJ5DFhnPKjPusxemgG
         G4VA==
X-Gm-Message-State: AOAM5313UxWK2c6j1mW/31Df1WZ5MI3dp+UHHAwGTb90HE8sIlSnp/5y
        XDCOzzox72dvpQTbjExSkTFdYg==
X-Google-Smtp-Source: ABdhPJyg5UtwKC7zV3jZtggtU8N93mFESleKSGSjH8oAPMxRiMaRKLJZ6mf65Li05MZ3czJpw5k4/A==
X-Received: by 2002:a17:90a:2110:: with SMTP id a16mr12756782pje.104.1596793728986;
        Fri, 07 Aug 2020 02:48:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:6097:2d32:26bb:64fe])
        by smtp.gmail.com with ESMTPSA id d65sm11412112pfc.97.2020.08.07.02.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 02:48:48 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 3/4] arm64: dts: rockchip: Add Radxa ROCK Pi 4B support
Date:   Fri,  7 Aug 2020 15:18:25 +0530
Message-Id: <20200807094826.12019-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807094826.12019-1-jagan@amarulasolutions.com>
References: <20200807094826.12019-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

RockPI 4B has AP6256 Wifi/BT, so enable them in 4B dts
instead of enable in common dtsi.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4, v3:
- none
Changes for v2:
- update commit message
- add radxa,rockpi4b

 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../boot/dts/rockchip/rk3399-rock-pi-4.dtsi   | 23 ----------
 .../boot/dts/rockchip/rk3399-rock-pi-4b.dts   | 42 +++++++++++++++++++
 3 files changed, 43 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 42f9e1861461..8832d05c2571 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -34,6 +34,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-roc-pc-mezzanine.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock-pi-4a.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock-pi-4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock960.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-v2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
index e163f438f836..678a336010bf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
@@ -584,17 +584,6 @@ &sdio0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
 	sd-uhs-sdr104;
-	status = "okay";
-
-	brcmf: wifi@1 {
-		compatible = "brcm,bcm4329-fmac";
-		reg = <1>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PA3 GPIO_ACTIVE_HIGH>;
-		interrupt-names = "host-wake";
-		pinctrl-names = "default";
-		pinctrl-0 = <&wifi_host_wake_l>;
-	};
 };
 
 &sdmmc {
@@ -663,18 +652,6 @@ u2phy1_host: host-port {
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
-	status = "okay";
-
-	bluetooth {
-		compatible = "brcm,bcm43438-bt";
-		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
-		device-wakeup-gpios = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
-		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
-		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&bt_host_wake_l &bt_wake_l &bt_enable_h>;
-	};
 };
 
 &uart2 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts
new file mode 100644
index 000000000000..f0055ce2fda0
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Akash Gajjar <Akash_Gajjar@mentor.com>
+ * Copyright (c) 2019 Pragnesh Patel <Pragnesh_Patel@mentor.com>
+ */
+
+/dts-v1/;
+#include "rk3399-rock-pi-4.dtsi"
+
+/ {
+	model = "Radxa ROCK Pi 4B";
+	compatible = "radxa,rockpi4b", "radxa,rockpi4", "rockchip,rk3399";
+};
+
+&sdio0 {
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_l>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&rk808 1>;
+		clock-names = "ext_clock";
+		device-wakeup-gpios = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_l &bt_wake_l &bt_enable_h>;
+	};
+};
-- 
2.25.1

