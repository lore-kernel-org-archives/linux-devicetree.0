Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70872CA9EC4
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 19:18:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43E6420659
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 19:18:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1ODh14rv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730457AbfJ2TSH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 15:18:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40132 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730777AbfJ2TR5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 15:17:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so14912249wro.7
        for <devicetree@vger.kernel.org>; Tue, 29 Oct 2019 12:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AAulUeuPoNsDEk+GpMMDiBhDeKpmWFc9M5uJieeLJLI=;
        b=1ODh14rvo5xWA3XTcbFwAcohrgWPKKEIhrJ9qXpXyFKPUP/jEVNjCwAOeI7MlUkAvV
         EuD5nrIYCP/1CP0Wo+DFTzlFeGybPS8ZrsGxWrj0vL63zWrGlyFIl1edd+XvQO0YPlUD
         IY8MaOK/6FgscbFlbfFYxCsEe+UCnMvcIxIfgWGuFof6Pys2eCZN9rBtbHnn/vjcnsvt
         pYAnp4BII3w06r9PGjgjUIkcF+YdxrBtOa0PNyqei5tYIKpUOew1zVfzPqwE5LIHkEBC
         prkyxNSOYh3/yKufLSIEWKAjIkw+IYEeNJrI8N5tLH8sEPAEZ20hDlGu6uu53vs5rv+H
         G/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AAulUeuPoNsDEk+GpMMDiBhDeKpmWFc9M5uJieeLJLI=;
        b=cRiJ9wguVU2SHtU2vjsJ2Z5X8EaE2i6gsM3N2E4HtZ133oSlyiNxpqyj1yrB2B9vCx
         neUWywiQyLr7CvIS8qGN4zsQQHzkztWZrkUzf/85RqCkQZeOJjHU+jQrlL3x/4AXZl1W
         uBtNP6JaB99bXKMd7Ty5TCy5e+6f3YCs/biEfE/QQNps7k08ecY4VIaIPdr5Z0YyBzd+
         KctVkHLv9RClGlmoiE3+bW7qIXc4yfhrOaZnefAw8I/7LRzSp6fjUrkYsh7dKBmE+AKR
         t6Gqa81Nfl1MVMnhbMpSse84iDctkcnF0+n6sALBtCV12ke0qCV/907K2RzWuD9pQz1r
         wBYQ==
X-Gm-Message-State: APjAAAX7KynrmOWMN3hxLH6fXqccGE5X5zrCf0rWP05U4mVNairqpLlP
        1CxLf7HAKkcWaPN33aPwwnnQmQ==
X-Google-Smtp-Source: APXvYqxXvT4pPfgw5H95OQqjEpql/EvCng+c+MiGqCGq2JPf0FQULJFHd6h+PrmYIwknwF8Jqd2e+w==
X-Received: by 2002:adf:da4a:: with SMTP id r10mr22236971wrl.356.1572376676357;
        Tue, 29 Oct 2019 12:17:56 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id v128sm5493043wmb.14.2019.10.29.12.17.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 29 Oct 2019 12:17:55 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mark.rutland@arm.com, maxime.ripard@bootlin.com,
        robh+dt@kernel.org, wens@csie.org, jernej.skrabec@siol.net
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 2/2] ARM64: dts: allwinner: add pineh64 model A
Date:   Tue, 29 Oct 2019 19:17:43 +0000
Message-Id: <1572376663-22023-3-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572376663-22023-1-git-send-email-clabbe@baylibre.com>
References: <1572376663-22023-1-git-send-email-clabbe@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds the model A of the PineH64.
The model A has the same size of the pine64 and has a PCIE slot.

The only devicetree difference with the pineH64 model B, is the PHY
regulator.
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../devicetree/bindings/arm/sunxi.yaml        |  5 ++++
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun50i-h6-pine-h64-modelA.dts   | 26 +++++++++++++++++++
 3 files changed, 32 insertions(+)
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
index 000000000000..fef47687c85e
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA.dts
@@ -0,0 +1,26 @@
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
+&emac {
+	phy-supply = <&reg_gmac_3v3>;
+};
-- 
2.21.0

