Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A06C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F6172065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwU30ot7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgENQMW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 12:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgENQMW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 12:12:22 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B44C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:12:22 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r22so1417581pga.12
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mOIbZMU3Oqa+Dg2aziM3n4kF2vGK6hWpxfNawd5Nsu0=;
        b=BwU30ot7YCQG9NZPoBFw4wKb+41wNIIOch4RB+wtj0tn4DTl/fOHuHh/60hJQBGnwh
         pYvBvBpfp9CScrFFNS4nr9QQ+RiYl6v4GCrWTaqe+zkzbzKnzPHFDSa1h/VIp95+9hGE
         G6w4trABgsGm2jMi/kCwhN8pjLhek70rDKAqu8N21Lv6JMDNy+gQz4AcFh+C4Hnkog5e
         UvCBbKH60pkTnoODo9daDuW/jCuibXAfKFGejIHlZVxXHCX4Q5gHfNrLmkZyGzRstoyr
         k5XTttf2vuLYR4Ylqa3TVMIKsag/tpzLHXd2yWXZJzNJVAaR54xpflyUNXEMg4uSa6FI
         huwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mOIbZMU3Oqa+Dg2aziM3n4kF2vGK6hWpxfNawd5Nsu0=;
        b=DsofJnDCmdzgAoO5w7qCg84yc4qNGKL3/XMtUZRpCU+QRmQlUehDPkGXt0V4RDEFxF
         hp83PxuOCCAA4jj+im9hPXuaXuJ8E4WuYGXgy9I42P341ai/LnZvYXqYXS5g+NUcnObq
         sCfQ9CSgVe1Qoi9QazqJBzDBXF+kIx1jGLktMzJNPzoockSIDZ5rrJYVdd6b2anHLdfi
         ZIxcxLYa+57SdbFF8vsYxlWHdyRytl0aOxtnOzZCz8L42W1LIR0k4uD1MRqSUR+TYuFU
         9CIaWEWUNY42xCmkIxEixWN1TyQeu6VBRIqnuBbccocGzmup399S66qTmy/npHx9XZ8F
         4T8w==
X-Gm-Message-State: AOAM5301f1koToaiJX3YUs5zhuNgbsxlucMRQRPlSi0Y5zXLtYqg7RE8
        2xcsherJo+y/KAkdmaJqfKE=
X-Google-Smtp-Source: ABdhPJwvdtggt2b8J6sAudZPYpXwOhIVEjURNrj352xFZESrZQdWvUad1EMYYTo0GKeiMTDOjwEkxw==
X-Received: by 2002:a62:5f81:: with SMTP id t123mr5424784pfb.79.1589472741838;
        Thu, 14 May 2020 09:12:21 -0700 (PDT)
Received: from localhost.localdomain ([106.215.24.137])
        by smtp.gmail.com with ESMTPSA id t5sm2331755pgp.80.2020.05.14.09.12.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 09:12:21 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v1 9/9] arm64: dts: actions: Add uSD support for Cubieboard7
Date:   Thu, 14 May 2020 21:40:57 +0530
Message-Id: <1589472657-3930-10-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds uSD support for Cubieboard7 board based on Actions Semi
S700 SoC. SD0 is connected to uSD slot. Since there is no PMIC support
added yet, fixed regulator has been used as a regulator node.

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
Changes since RFC:
	* No change.
---
 arch/arm64/boot/dts/actions/s700-cubieboard7.dts | 41 ++++++++++++++++++++++++
 arch/arm64/boot/dts/actions/s700.dtsi            |  1 +
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
index 63e375cd9eb4..ec117eb12f3a 100644
--- a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
+++ b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
@@ -13,6 +13,7 @@
 
 	aliases {
 		serial3 = &uart3;
+		mmc0 = &mmc0;
 	};
 
 	chosen {
@@ -28,6 +29,23 @@
 		device_type = "memory";
 		reg = <0x1 0xe0000000 0x0 0x0>;
 	};
+
+	/* Fixed regulator used in the absence of PMIC */
+	vcc_3v1: vcc-3v1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.1V";
+		regulator-min-microvolt = <3100000>;
+		regulator-max-microvolt = <3100000>;
+	};
+
+	/* Fixed regulator used in the absence of PMIC */
+	sd_vcc: sd-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.1V";
+		regulator-min-microvolt = <3100000>;
+		regulator-max-microvolt = <3100000>;
+		regulator-always-on;
+	};
 };
 
 &i2c0 {
@@ -81,6 +99,14 @@
 			bias-pull-up;
 		};
 	};
+
+	mmc0_default: mmc0_default {
+		pinmux {
+			groups = "sd0_d0_mfp", "sd0_d1_mfp", "sd0_d2_d3_mfp",
+				 "sd0_cmd_mfp", "sd0_clk_mfp";
+			function = "sd0";
+		};
+	};
 };
 
 &timer {
@@ -90,3 +116,18 @@
 &uart3 {
 	status = "okay";
 };
+
+/* uSD */
+&mmc0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_default>;
+	cd-gpios = <&pinctrl 120 GPIO_ACTIVE_LOW>;
+	no-sdio;
+	no-mmc;
+	no-1-8-v;
+	bus-width = <4>;
+	vmmc-supply = <&sd_vcc>;
+	vqmmc-supply = <&sd_vcc>;
+};
+
diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 3f1fc3e48415..8a541dd48f61 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/actions,s700-cmu.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/actions,s700-reset.h>
 
-- 
2.7.4

