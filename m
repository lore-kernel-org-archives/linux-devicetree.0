Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B359CC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BD81207DD
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mODUumIA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbfKZLWr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 06:22:47 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37069 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728096AbfKZLWr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 Nov 2019 06:22:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id f129so2861898wmf.2
        for <devicetree@vger.kernel.org>; Tue, 26 Nov 2019 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IV9broTjFRnyr+MEV2mvZv/aNrg7F01VM6XYV47tjb8=;
        b=mODUumIADEX4BllknO9Vhna6txq3rBUhdhhb07fCrfRQITBfRq0HQ+pqY6QhCH1Asf
         ohRVvxHf6BoCrFh+uytmadfi6iOujKMT+LEt5JFlcgeQ++vWOtZ7/Px8QrsPemSksqmq
         QT5WgWPBuQa92y9nkCSfz9gzTBkl8B5iB0aD7Xk3XGGjL2UK88VnQRSADN7opdo3pQbR
         bDOMydg5Yt0e0QbcfnrhT1MxzHeOeVgI72dAXhfshK3aRem7NgqyaSyszv5gs6U3IIHW
         07hfrTs6e1OnjrWpOuT4+/8P/E4IeiLo4shedMErQA8eekczrBQWtJXo6AiyupJixMfa
         s8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IV9broTjFRnyr+MEV2mvZv/aNrg7F01VM6XYV47tjb8=;
        b=AWeyjZh6oxIPUhS7lnk3qVumLxFS1Wdb4o0fLsZu7v2h67ZlhO7gSbR3KJOG3FhAtR
         GXXWX1Ferm4DvxVHW5Y8vlFdIQAbQXuDIYDRvXkucT2sBT7JpSyUzi01p/jzQ/PLKiC3
         /D4vDzfH/hnOJ7Zs6GjgAUs+wgKKUC5Pf7aa688R1R9cxKwnILM6lbg6PBDFYqbjxXhZ
         JmvhzpGmM38U2hTq/zTC1P8910AzqCxRR5FAhjFHWtd7KhvrFn7PU3dUkyJEhZKHbyat
         8FiVpjLikoVO1PNRD8DaaDKG0W9FmFcU7L3LLsY1hl+a1s8wm0x9AQR4ddfq2B3ZtHCG
         pdWw==
X-Gm-Message-State: APjAAAUClTVX6MxaqwQBVfei8xC4Qq4Ck2dnj3/HvReSrwtHSc0PUiEy
        Zst8QX9pMvieE5rfR1jgzcMwTBnWo1c=
X-Google-Smtp-Source: APXvYqwfkXJpeQx7xBaGdw7ZPSohrLtBU8R6ur15cLp9h8gB8NX7gpS3qPlPHPNZQvCPedOa82AN5Q==
X-Received: by 2002:a1c:ca:: with SMTP id 193mr3722817wma.111.1574767363488;
        Tue, 26 Nov 2019 03:22:43 -0800 (PST)
Received: from localhost ([37.238.189.12])
        by smtp.gmail.com with ESMTPSA id v19sm15221766wrg.38.2019.11.26.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 03:22:43 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/2] arm64: dts: meson-gxbb: add support for Videostrong KII Pro
Date:   Tue, 26 Nov 2019 14:22:35 +0300
Message-Id: <20191126112235.11390-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126112235.11390-1-mohammad.rasim96@gmail.com>
References: <20191126112235.11390-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
which was merged recently into the bluetooth-next tree [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=e32ec8ea0d79fac75171980f2df5d0af87a08838

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
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
index 000000000000..bf990f3fd88f
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -0,0 +1,58 @@
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
+};
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
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_rmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0>, <10000>, <1000000>;
+	snps,reset-active-low;
+};
-- 
2.24.0

