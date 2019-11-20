Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64B5C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEA5C2067D
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZ0tvPHt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbfKTQt3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 11:49:29 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53292 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729344AbfKTQt3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 11:49:29 -0500
Received: by mail-wm1-f67.google.com with SMTP id u18so320799wmc.3
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 08:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmSi8EVrgfkOwDbdlBJAaLzmI4f0gNbA0ZY/mXAh7Y0=;
        b=iZ0tvPHt+6sLoiKx5i9QaG23U+NP0Z8FlKj8secF60emaLvyEdt7mHazIOi9yiEdxO
         5PLpwpThoWbBhN6K8dSUiicm/t1pMoaQ8s1lNdRCH8L7Q7SWq/hrxjXXJ3o0yAzBbg63
         7NG8dJvw8AHsDsbklaEFA4efQR3PzCj/jhmA5ujvrk6dC2MLk2K9r+0GSLsr/q2YiuOn
         UFzqeNCBjzLTUGUS+AbZaEEtA73zMAWGbtc/QtVfeCZxcbXnf95b8koiYNq2lIBzrpWo
         boND2XPDZXKZ59bEFaRIRXM2n/XfUere3zVvwuPG12C97UFNKS7JvVvnYlbyJV1CurjM
         B9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmSi8EVrgfkOwDbdlBJAaLzmI4f0gNbA0ZY/mXAh7Y0=;
        b=F2dduJgBtzlcIrEtrBgSM8vuehjP2x6OyC13KdKGET6M7TWurCNc6sBkDbJTGeRFY9
         j9E9emur9o3Ehozw78XMf+AM/PolEx1vjoaTgLLuQJgSHAUBPrFGwFpPMwKlqPwvv2zQ
         qPzDCgRpDro2h8eXguH39qrSnt2zppwJ4Ce5RhRBtfSNnluOJ2vTGIqW+/xbTzqes3hL
         bKn18ZG3ou/xLHxHgb6NeshWe0tZcLABYHQnJnN2IuyiZwFA9i7bq4MQZF5U3oC3kN6f
         RX/uIhRhZDjyhL7zeOQgOqTy21WcKg8hE9W0TcLtY5vEUirepU3o088C1ZgQRQYBmC8L
         yr5A==
X-Gm-Message-State: APjAAAX5Xz84nueWn9lVEFph59jwqLa4oCy8/ITV9QiHt9BMoMsikcOq
        TQa58gZ/HuyUNsO/MYnB5iA=
X-Google-Smtp-Source: APXvYqxhZ8lbeO9GoFwdNyav9xP6d7aReSI2RiAJWQN6bakutR1VLRCdWpMDrWQ9q5bSTazIjuvOlQ==
X-Received: by 2002:a05:600c:3cd:: with SMTP id z13mr4377825wmd.105.1574268565764;
        Wed, 20 Nov 2019 08:49:25 -0800 (PST)
Received: from localhost ([37.238.189.2])
        by smtp.gmail.com with ESMTPSA id b66sm7466599wmh.39.2019.11.20.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 08:49:25 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] arm64: dts: meson-gxbb: add support for Videostrong KII Pro
Date:   Wed, 20 Nov 2019 19:49:16 +0300
Message-Id: <20191120164916.31698-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
References: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds support for the Videostrong KII Pro tv box which is
based on the gxbb-p201 reference design

The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
which was sent as a patch and under review

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
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
index 000000000000..2aa0b01aeb6c
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxbb-p20x.dtsi"
+
+/ {
+	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	model = "Videostrong KII Pro";
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

