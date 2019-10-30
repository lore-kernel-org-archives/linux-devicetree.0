Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC1CC47E49
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 12:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 978202087E
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 12:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bUK5vScp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfJ3MYp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 08:24:45 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46308 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfJ3MYh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 08:24:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id n15so2038305wrw.13
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uHR3w+XBYFJ6E7sqILU7UFRv7/0zoe1778Y28SVOjco=;
        b=bUK5vScpjfx3HzKxA5ujQJ9hr+ixSdirjp2P5aQ9GiOkjkSwh5tRXftGQuv4HVWFDA
         ZMcb6ftOHIbnF2DMQ7pZgUc6uNPgoiond7T4MR/MejGrAIKzVApGzCRPNYb7I6d8A8/7
         /bdEvLR2Y1ekldYd22cEGEaQ++qyAFS/PcVwpEhbWSPqn6WVBxfkMXecNQipKllwVQQz
         oY0neB0aVtVqMMaexHQTjqMaHckDbiftfZx108zEqWxYZS3EfHW+BmEnsvMqrvfD4u3T
         /rLCCag9miIRvzCZdWHhH/BP5rfuBJ3JDNpLxjR+Mqa2jGeP7WfklJkQQy/uZVWaIFb+
         AEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uHR3w+XBYFJ6E7sqILU7UFRv7/0zoe1778Y28SVOjco=;
        b=azmagvlyOmQGUhpeYSvTkaU/mNZH8b43M3OOBvBr24OjGzG6+kC2hXuWgbGyIw665W
         9MDpybkscXU9a7+arO4Uy9gRVnfPZEtYllooK1rHvDKfs88CkbXa4ty1i+GHsZOUulUP
         YF42IAyhN2xYFRwX4fobWuQxCf9HMsQKjTN/PiwcmG5jrGX7mBM1FHGWoamC5Wg8HGSa
         t5z7xB4zVHEi5BYpPCG/VPG9FgaEnXJbNBjedOjhbp2pmf2YH1DBHxhMxV0TGJChsrY9
         NpnD9ig0MTy6a1QOIE5np3Ad0bsaGe38CQC9pPCOSEjI9V/ggwbpsqqpeiqyzHebDmJZ
         4fIg==
X-Gm-Message-State: APjAAAWrcNItQ1xr1PpCcDg9u5S6PuT+C828SgD18MU/TT5+qwptM3PN
        HfD/W+87j5yA7jp9T5EyeaIl5g==
X-Google-Smtp-Source: APXvYqx+XNc5QFCpaI7jaxlz/nbapSWNGNzUKMzQMuuNkYCj80iDX0vROwl5FfDwZlFuknLoqySYsw==
X-Received: by 2002:adf:828c:: with SMTP id 12mr24243912wrc.40.1572438274843;
        Wed, 30 Oct 2019 05:24:34 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id p13sm2075919wma.41.2019.10.30.05.24.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 30 Oct 2019 05:24:34 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mark.rutland@arm.com, mripard@kernel.org, robh+dt@kernel.org,
        wens@csie.org, jernej.skrabec@siol.net
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 3/3] ARM64: dts: allwinner: add pineh64 model A
Date:   Wed, 30 Oct 2019 12:24:15 +0000
Message-Id: <1572438255-26107-4-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572438255-26107-1-git-send-email-clabbe@baylibre.com>
References: <1572438255-26107-1-git-send-email-clabbe@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds the model A of the PineH64.
The model A has the same size of the pine64 and has a PCIE slot.

The only devicetree difference with the pineH64 model B, is the PHY
regulator and the HDMI connector node.
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../devicetree/bindings/arm/sunxi.yaml        |  5 ++++
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun50i-h6-pine-h64-modelA.dts   | 30 +++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA.dts

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 9a1e4992b9e9..0059925a3395 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -594,6 +594,11 @@ properties:
           - const: pine64,pine64-plus
           - const: allwinner,sun50i-a64
 
+      - description: Pine64 PineH64 model A
+        items:
+          - const: pine64,pine-h64-modelA
+          - const: allwinner,sun50i-h6
+
       - description: Pine64 PineH64 model B
         items:
           - const: pine64,pine-h64-modelB
diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d2418021768b..6bda5d9961c8 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -26,4 +26,5 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-modelA.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA.dts
new file mode 100644
index 000000000000..8c6b8978db1a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2019 Corentin LABBE <clabbe@baylibre.com>
+ */
+
+#include "sun50i-h6-pine-h64.dts"
+
+/ {
+	model = "Pine H64 model A";
+	compatible = "pine64,pine-h64-modelA", "allwinner,sun50i-h6";
+
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+};
+
+&hdmi_connector {
+	ddc-en-gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
+};
+
+&emac {
+	phy-supply = <&reg_gmac_3v3>;
+};
-- 
2.23.0

