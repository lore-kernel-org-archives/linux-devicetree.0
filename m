Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432D6C43215
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 11:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 195592075A
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 11:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsq+eUHC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfK3L6l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 06:58:41 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37182 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfK3L6l (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 06:58:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so7190682wru.4
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 03:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wJnAulGaEs0kwajuzzoZi3o9NE282edT8FDUbrTNB/Q=;
        b=Gsq+eUHCohMOH2HelHScGMIwxinfpeyYxfsSreZLSSe6VBTrRvn7rjtHwr4vBUvVl6
         VB0TX7KdzHt39TYFPG0jW/mZRgYx7afUbBnIVezTf3KeWjddKispUiEpJ/kk6ZERRLJ3
         y3U/tFQG+iDfYSqBTJUWuBPFx97/V3sBOLNNUjX310vsyTM4rurQ9q2Nn+teNOeSCY3X
         EyOvF1eCDx3G7bto+kdYNoTWlRueqLT8UxHBMMhrCZdFd457wQHUEwy9jZLKxOaLt0WB
         yGcLcBu2lFjWrUbkhxnryQuP5iGwnEFf68LnPHtFD+AxZ8EfQ7DIrFji558Xv1L/DPe3
         dr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wJnAulGaEs0kwajuzzoZi3o9NE282edT8FDUbrTNB/Q=;
        b=eIlWAfDLMTliNZdZ6GiEKFRJ0J5YPH6PCObw85ZWfxeixNmt+2a1Qv9x0xEfC1NHm/
         lKzNWSA4pnlUhSWv/k+PmU/EGbaFEl4Yqx+t+/3UZE/P3Ylg2FQz7Sb1YuwbWw6NVQjN
         I9jMZkZamMTbYWo7eHoUUicMeH0Fx3y+8mQIaPAr0pBe03fELsmgvid4cHvyltk4EMI4
         Hs70g5J+dWSnkMMeJ52pVlq4eQUkdOWly1mOM1x+o39NNzP55vQdjkL7LmPhfVkckQd/
         sbatLIJb/YvGoqDE8OYYtWDLfOsNb+SkBYfMTcjw9yMyngQXeWBMwKY6HFwWJV+aS/wf
         ugKg==
X-Gm-Message-State: APjAAAXAPvhnpzCMbHlr62l3KcspWueU8dbe59JkvmLHCbypptDjNdsn
        LKVD7NpOLhMklHqX6yoXGhJuJdj3ChcDeA==
X-Google-Smtp-Source: APXvYqxFvldbUOY7B3clouvxCLT9YvEsNn3pWvokFqq7xalCS7TmE202z/6lWunJ26MvwI3XsA9f6w==
X-Received: by 2002:adf:e2c1:: with SMTP id d1mr48072698wrj.130.1575115119314;
        Sat, 30 Nov 2019 03:58:39 -0800 (PST)
Received: from localhost ([37.238.189.59])
        by smtp.gmail.com with ESMTPSA id d12sm6442651wrp.62.2019.11.30.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 03:58:38 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 2/2] arm64: dts: meson-gxbb: add support for
Date:   Sat, 30 Nov 2019 14:58:24 +0300
Message-Id: <20191130115824.31778-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds support for the Videostrong KII Pro tv box which is
based on the gxbb-p201 reference design

The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
which was merged recently into torvalds tree

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 84afecba9ec0..a795a170dcab 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
new file mode 100644
index 000000000000..5d120e6ca338
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxbb-p20x.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+/ {
+	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	model = "Videostrong KII Pro";
+
+	leds {
+		compatible = "gpio-leds";
+		red {
+			label = "status";
+			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <20>;
+
+		button@0 {
+			label = "reset";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+};
+
+
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4335a0";
+	};
+};
+
+
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_rmii_pins>;
+	pinctrl-names = "default";
+
+	phy-handle = <&eth_phy0>;
+	phy-mode = "rmii";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			/* IC Plus IP101GR (0x02430c54) */
+			reg = <0>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
--
2.24.0

