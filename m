Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5456FC432C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26D7A20732
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2HcumSg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfK3Txr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 14:53:47 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34890 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbfK3Txr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 14:53:47 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so7029849wro.2
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 11:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qEJfZCeBJSuM1wQNJg197wMpa2YEmeZTan6JdMtsXfk=;
        b=N2HcumSgHhuRAqMJtdw+wwJo7f4WJ9p1rfzaKWAXf/oEy0uqchKr0lneqs1MNsU37l
         ByfOPAxn5bEwtSjwBafDO+IatLkPEmODgbN/7C3gbwzx+4mpgPzkCz+yKAtbWyEsDdEd
         ET0QHhtsp4+TUOJx9uD5mN93rKNzMN9wjtbddqJjepfuGFHT7QfFG0urC3QsB/czXZs6
         R7+9QGv1ct+HA/tYO1bc2qF476IrBGCGWHoVGXYUCGeqDzh3YL8EfJn62U0iCFRoA4Dv
         Aa09qCsfxxktASC8G1FfIH/kmXA1xjyFwQIfM9ROJU4SliB7RYriwGWjLC3zdFH7Gn8R
         gQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qEJfZCeBJSuM1wQNJg197wMpa2YEmeZTan6JdMtsXfk=;
        b=O6L55dgQ3MSop5k3/82W0dEapKWdQHtvL8Vhou1x3iC12BGW2BmwzdSxA/EY4hkW1j
         ak0H6ok6Xt2zboHTCvSJDLXc0KfoFrvfXC1t6vK27P5iJTbX8DUO0B7YjNe46vzCbjIj
         VbLmqbUZazuOvlRDI5h/nLBlddyWVPMbXj0F3KUQGcYJfCeuzOCaFrr6Dd3pqVM3UI5k
         Omjaprz4bverRfNybslAAqfXxNTRSGSR2kfV1KCO6f62Ndawa7AbZ/WmawPgXWgVa4bv
         Icjr5kcO6cteTKOrVIp3HTOOGwGP2IcYUXTfT3q6RaJPB9k9tf0Agd8dNtbCiUnq1dPn
         nkIA==
X-Gm-Message-State: APjAAAUz/ckG3VZegLLgeUOYAY5gq2NmcWgVku4RfBZubyPGsf438Lkv
        4fbIv6+P6J3+X6pfC51kU6Ts/OLU4EQ=
X-Google-Smtp-Source: APXvYqw2wwX4rs9Q64IJg8+tP0B5RHOBkk/BN6MnAyMt/7om6fzliAYbNeiPrXsRNhZxkLk5241uPw==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr5168426wrw.277.1575143625042;
        Sat, 30 Nov 2019 11:53:45 -0800 (PST)
Received: from localhost ([37.238.188.27])
        by smtp.gmail.com with ESMTPSA id f19sm34329929wrf.23.2019.11.30.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 11:53:44 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 3/3] arm64: dts: meson-gxbb: add support for Videostrong KII Pro
Date:   Sat, 30 Nov 2019 22:53:35 +0300
Message-Id: <20191130195335.17740-4-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds support for the Videostrong KII Pro tv box which is
based on the gxbb-p201 reference design

Device specifications:
- SOC: Amlogic S905
- RAM: 2GB DDR3
- Storage: 16GB
- Connectivity:
	- 10/100M Ethernet (IC Plus IP101GR)
	- 802.11 b/g/n/ac Wi-Fi (Ampak AP6335 BT/WIFI combo)
	- Bluetooth 4.0 (Ampak AP6335 BT/WIFI combo)
- Video out: HDMI 2.0 up to 4K @ 60Hz, and 3.5mm AV (composite video) jack
- Audio out: HDMI, AV (stereo audio) and optical S/PDIF
- Tuner: AVL6862 DVB-C/T/T2 + DVB-S/S2 demod and Rafael Micro R848 tuner
- Ports:
	- x1 micro SD card slot up to 32GB
	- 4x USB 2.0 host ports
- Misc:
    - Power button and LED, IR receiver

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
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
index 000000000000..2f1f829450a2
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -0,0 +1,78 @@
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
+#include <dt-bindings/leds/common.h>
+/ {
+	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	model = "Videostrong KII Pro";
+
+	leds {
+		compatible = "gpio-leds";
+		status {
+			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <20>;
+
+		button-reset {
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

