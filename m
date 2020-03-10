Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A205C10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EF582146E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+ar7slh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgCJSIl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:08:41 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35284 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgCJSIl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:08:41 -0400
Received: by mail-qk1-f195.google.com with SMTP id d8so9226806qka.2
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Bnd+dV97Of1gzlLSXuML0/e/DO8s77XB3KGyM9X9Y78=;
        b=q+ar7slh9UUin4VNa0tQmCpbNTemq39L5IHKC84JTVR3nZVOwMMm2Ac7FnlSj81YLB
         a/naKkWCewRYQx/0Bq7WjMkWteQ2UimBpMAZeXZfnLk6Ck/hGVHzoCrS0sASZ7eFCgxg
         CX3NX3l78UJDQ7Z835Qxb3aELpXfsOeKJgZlIzCMJHqFXbP7s50dRhFBXkPBF29IUJ6i
         cIH4rNbexEptClgn9Xf862u4C5TFDNij0rznf8J5cuIP1eacpxqaNdXYt3Xboo5nVA9w
         eP+Js3L7Kv7S2mrTM8XPrWWS1+asPUW9uWDqbma+dMSTTkHOpohvF/Y+nWP7zjry+nUr
         iUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Bnd+dV97Of1gzlLSXuML0/e/DO8s77XB3KGyM9X9Y78=;
        b=PGboB6O5i9RFSEuaKSSPqYGsonJ8WEajqxDocZzunV331by4zx6sGAg4bSU9esCDH0
         345IAEdozXmKWsLJzolWP3HDhIRFJzzTQMEw02K+kDELD8QnbKQWgUT168i4hmfJ9qEj
         0VwGrBnFhmZwurJtMROz4Ldf1IRLlXEXix8swzrhCJ5hr0VLIbTNTibZ7GfqS0GcumUq
         39OzLWK1KnrS0iKnl4vBvyJgkO66Kv3/OBjBUTuwUl8cozwb4aCoaGOZx0bWnRW1Sz9g
         61T1HGl9dhTImRvja8g1nEaU7/OxLUbQDtfRRoHZn3OK58BMYpUIzbr+fNma2705bTEz
         TdhQ==
X-Gm-Message-State: ANhLgQ1H5Caqibfu898xZToQVyX48tzNTSirTyYmTEzIVVhzvwE//yIX
        ARFSkPhe4y5AW3MapDHkFUA=
X-Google-Smtp-Source: ADFU+vvEmO075gFXxYZT46n3yw54rkxtqO3eJ3ClbukU3dn1bolj+MSAfJhnnbOiAYIe5o5xtdR5vg==
X-Received: by 2002:a37:6cc7:: with SMTP id h190mr21402942qkc.358.1583863718547;
        Tue, 10 Mar 2020 11:08:38 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 127sm17848821qkj.97.2020.03.10.11.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:08:37 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     otavio.salvador@ossystems.com.br, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 3/5] ARM: dts: imx7d-pico: Add support for the nymph baseboard
Date:   Tue, 10 Mar 2020 15:08:23 -0300
Message-Id: <20200310180825.10111-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310180825.10111-1-festevam@gmail.com>
References: <20200310180825.10111-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the imx7d pico board with nymph baseboard combination.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use audio-codec as the codec node name

 arch/arm/boot/dts/Makefile             |  1 +
 arch/arm/boot/dts/imx7d-pico-nymph.dts | 84 ++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7d-pico-nymph.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 38a71988ac2a..c46416725a63 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -619,6 +619,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-nitrogen7.dtb \
 	imx7d-pico-dwarf.dtb \
 	imx7d-pico-hobbit.dtb \
+	imx7d-pico-nymph.dtb \
 	imx7d-pico-pi.dtb \
 	imx7d-sbc-imx7.dtb \
 	imx7d-sdb.dtb \
diff --git a/arch/arm/boot/dts/imx7d-pico-nymph.dts b/arch/arm/boot/dts/imx7d-pico-nymph.dts
new file mode 100644
index 000000000000..104a85254adb
--- /dev/null
+++ b/arch/arm/boot/dts/imx7d-pico-nymph.dts
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright 2015 Technexion Ltd.
+//
+// Author: Wig Cheng  <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+/dts-v1/;
+
+#include "imx7d-pico.dtsi"
+/ {
+	model = "TechNexion PICO-IMX7 and NYMPH baseboard";
+	compatible = "technexion,imx7d-pico-nymph", "fsl,imx7d";
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	sound {
+		compatible = "fsl,imx-audio-sgtl5000";
+		model = "imx7d-sgtl5000";
+		audio-cpu = <&sai1>;
+		audio-codec = <&sgtl5000>;
+		audio-routing =
+			"LINE_IN", "Line In Jack",
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+	};
+
+	sys_mclk: clock-sys-mclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+};
+
+&i2c1 {
+	clock_frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	sgtl5000: audio-codec@a {
+		reg = <0x0a>;
+		compatible = "fsl,sgtl5000";
+		clocks = <&sys_mclk>;
+		VDDA-supply = <&reg_2p5v>;
+		VDDIO-supply = <&reg_3p3v>;
+	};
+
+	adc@52 {
+		compatible = "ti,adc081c";
+		reg = <0x52>;
+		vref-supply = <&reg_2p5v>;
+	};
+};
+
+&i2c2 {
+	clock_frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&iomuxc {
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14
+		>;
+	};
+};
-- 
2.17.1

