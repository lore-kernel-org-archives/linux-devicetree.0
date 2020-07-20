Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D02C433E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 10:56:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5515B2068F
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 10:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MM+l6kte"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgGTK4B (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 06:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgGTK4B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 06:56:01 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114BDC0619D2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 03:56:01 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gc9so10044504pjb.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87hFulUMTLYcYtfb5/q1HiR84qe1kMeDg6xrZ7BQkqI=;
        b=MM+l6kteqQzEpnQ/ywvSjIFlpM9azD+mxwXxGGlCUwlkklIaJBa9+GDaW7Htux8/Ze
         N6XiO0NF+0Rt5PgioLbTBsUPJWJT7tSKInjVLe88qAYGJsoTaJ0xKY5i5+7lLVFUhPGq
         6ZfRVWeLAL/lW1q+B4w9Ofv9plQJdHNYspXjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87hFulUMTLYcYtfb5/q1HiR84qe1kMeDg6xrZ7BQkqI=;
        b=XWK2qfmNbiDTXKat1j+Q/up5e8BWBYVuQstlAsUozNUv4wCzO2VCwUYY4zv778L6pK
         mbXY6NwCczRFYfNqQK+auPTDKaT8jenFCDBBc3DI/ErQdf5aoEohTlU3qD70kC5ak9yr
         tSFrQjok0yxRNsqG4nXyEQRTHjKN3wYCpVLgbB3Rt6Iml3f+p92afoWo1nUmM+ggoHCx
         dIKABmAj9L2A7LsPM7Y6cNxl+ErAQqecFxPjs8oCnf1tFD/qpD6Vjumgmo1BVwWnlr/2
         DeSo9ytKHj2SdgBJZuU7Vb34vTpq6h6b+tZnvG7f94NfgBv+u2Dy9E0kDB9yOdck2QoF
         ItGA==
X-Gm-Message-State: AOAM530nksUKd8SS31Ta/3gdwxNaeiHWlWOL4Dw1H+aKOoIlOyn5erQQ
        cAq5e0ot8YBAqvscfDpcPi2zjQ==
X-Google-Smtp-Source: ABdhPJzjoQNKzZ+yDhrVCkGBwPkfdrqM2z3JHRSN3Qbebmu8oZ0F7c5A9NPns6yP/9LViF/8Ba/LMA==
X-Received: by 2002:a17:90a:a0a:: with SMTP id o10mr22464206pjo.12.1595242560305;
        Mon, 20 Jul 2020 03:56:00 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:8c21:db7b:4558:fba3])
        by smtp.gmail.com with ESMTPSA id j5sm13984721pgi.42.2020.07.20.03.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 03:55:59 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 1/3] arm64: dts: rockchip: Mark rock-pi-4 as rock-pi-4a dts
Date:   Mon, 20 Jul 2020 16:25:29 +0530
Message-Id: <20200720105531.367671-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rock PI 4 has 3 variants of hardware platforms called
RockPI 4A, 4B, and 4C.

- Rock PI 4A has no Wif/BT.
- Rock PI 4B has AP6256 Wifi/BT, PoE.
- Rock PI 4C has AP6256 Wifi/BT, PoE, miniDP, USB Host enable
  GPIO pin change compared to 4B, 4C

So move common nodes, properties into dtsi file and include
on respective variant dts files.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/rockchip/Makefile               |  2 +-
 .../{rk3399-rock-pi-4.dts => rk3399-rock-pi-4.dtsi} |  3 ---
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dts  | 13 +++++++++++++
 3 files changed, 14 insertions(+), 4 deletions(-)
 rename arch/arm64/boot/dts/rockchip/{rk3399-rock-pi-4.dts => rk3399-rock-pi-4.dtsi} (99%)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index b87b1f773083..42f9e1861461 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -33,7 +33,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-pinebook-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-roc-pc-mezzanine.dtb
-dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock-pi-4.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock-pi-4a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock960.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-v2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
similarity index 99%
rename from arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dts
rename to arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
index 3923ec01ef66..c39334b139cc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
@@ -11,9 +11,6 @@
 #include "rk3399-opp.dtsi"
 
 / {
-	model = "Radxa ROCK Pi 4";
-	compatible = "radxa,rockpi4", "rockchip,rk3399";
-
 	chosen {
 		stdout-path = "serial2:1500000n8";
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dts
new file mode 100644
index 000000000000..d96dd3ebd3e0
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dts
@@ -0,0 +1,13 @@
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
+	model = "Radxa ROCK Pi 4A";
+	compatible = "radxa,rockpi4", "rockchip,rk3399";
+};
-- 
2.25.1

