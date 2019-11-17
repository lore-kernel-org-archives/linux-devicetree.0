Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC535C432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 17:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CEE020850
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 17:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si15IJlZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfKQR4Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 12:56:24 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39364 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbfKQR4X (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 17 Nov 2019 12:56:23 -0500
Received: by mail-wr1-f68.google.com with SMTP id l7so16765662wrp.6
        for <devicetree@vger.kernel.org>; Sun, 17 Nov 2019 09:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uYh5k1atIFrZcosKykvNKMIaFl60XNRIm3qhmbiz4ng=;
        b=Si15IJlZ5t3Zw8gwoQfsgZUMqHEOtQXVTKZamQU7JFD+rfOYyZ9mSx0p/851W1TqtJ
         ua//wSldEGVWvRYcJerge4AD3k2fCGNpqll07Ez2HQb/ahiU87vqAuv7cKmez20ahMr9
         B4xIck/cYz+0mDsQ2FUJWqn0p8gxXI760AuYaz4RTkWBcG51ELaykgexrQzVb6MXLE89
         c6qQqREsQAG45sTky7U2r0KRwcw9KlxFyzmS+o4z46TGM1bwGjz22hpeRxFzr+2zlJls
         S6ySng6mGpAxtMATviXmNJu+1X3wg/k63ZlTdQap7VV5LDeG4IhOWF3gbi4L/VLomjZQ
         S8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uYh5k1atIFrZcosKykvNKMIaFl60XNRIm3qhmbiz4ng=;
        b=Sjx3/HA3BpbXJp2JU6W4axzx0G1rU0UkorQbLJWXlKQu85RWeN2LfqdJRDoLZ18FEo
         IIDsyVBGYwXvqS2X5heJA4vLdoaFJJlZboaF/Dw3sBcAXtn3N0JYCYznsQPGfwgoQxl8
         BXRqNBMIvLBcu1HRwpOxz6NTC66LW9cXtUZ/vHy4Q2mezz+dEGjuC0qCMqssko97B85i
         kzZgV/C64AOFTv8WNYLt2m6aDVyKQDbbP+hEonAU0I4RSER0ts1I0shkIkxe45gjztwr
         2UZcDyssxNIi/UrzH0626mLTNujITII5buiUfF+h0EhJBQzrZ7hKemVv3qguI1d3YN3r
         jmIw==
X-Gm-Message-State: APjAAAWR0SqWx+1TreWmmTfIOXOsY/G+YfEyUKSSIrQuB5LBdo0WaeWW
        Rm37M/1MhA1AoSp673ALLvE=
X-Google-Smtp-Source: APXvYqyYyURrONlIBMzLFqhxoQUMIDJGHrnlAOx+9cp+dtk2u27RJOXQb2BTJuUDNCNFs+niS1fxpg==
X-Received: by 2002:a5d:4b05:: with SMTP id v5mr7323484wrq.210.1574013382444;
        Sun, 17 Nov 2019 09:56:22 -0800 (PST)
Received: from localhost ([37.238.189.25])
        by smtp.gmail.com with ESMTPSA id g4sm19058110wru.75.2019.11.17.09.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 09:56:22 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH 3/4] arm64: dts: meson-gxbb: add support for Videostrong KII Pro
Date:   Sun, 17 Nov 2019 20:56:05 +0300
Message-Id: <20191117175606.5050-4-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
References: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds support for the Videostrong KII Pro tv box which is based on the gxbb-p201 reference design

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
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
index 000000000000..b63dabb7bf97
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+/* Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
+*/
+
+/dts-v1/;
+
+#include "meson-gxbb-p20x.dtsi"
+
+/ {
+	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	model = "Videostrong KII Pro";
+
+
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
+
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0>, <10000>, <1000000>;
+	snps,reset-active-low;
+};
+
+
-- 
2.23.0

