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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F77EC10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 203EC2146E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vXTPk45r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgCJSIh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:08:37 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39924 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgCJSIh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:08:37 -0400
Received: by mail-qk1-f193.google.com with SMTP id e16so13657268qkl.6
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MAwiIeVOcnoMYt3o32Tzb8UHM7XHKlcBrRbJnonZbrc=;
        b=vXTPk45r/waYQvFQgOKwzBSHAL9zHE46iO890ebFvG+9LCfJi6R1+fOauXE8VMTLKJ
         2HkiliowpPB9edJM4y0GqQiVYQWny6XzRi8Z6jxofD23h/ZzdPFrWSvGjmkKvc/xe0ab
         6ap/OvAz3nnv8QeeaXuV/B8Ak3rv8MLD8wRt0EA5n3dzCqhC9QlafiMAwic1g6UJ5IgJ
         /96wt7TQDaqRMwrxEzW3x2DBEsC0CyaT8wkB+L4/yBIN1VyW0f8AQvEVY9m2GbMINwK4
         k/xR2fC1e/yAvJiOuQOdtHi3O9jNSEDARM2px1TU12Us3SOKLLb61rD+S9s2iihs0f+5
         iWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MAwiIeVOcnoMYt3o32Tzb8UHM7XHKlcBrRbJnonZbrc=;
        b=VICSvHyIcW9qe/fAImbcfc5qFFDOkThyGM2cIIiO4vxVMWPQejtxmBhqdiXWxS9TFW
         FOq8Bu6jV+F7+EKTX81YNQjb65mWCpJdU9Fk49Gbl9sQqlHyNYvInTZ1GzlaZlWWx58T
         Y1iArSWb8mRcY75zVrH+Gn8r+um28W4hTV+pPzJ+p190/RKTJTVNJ5+k3oRZ6Nm7dAzi
         ILTZ5Q9GzePoviPEyYTQULiEy/hcEQDsd7V8uFWYrsoqhodTHwbwCMNk0h6SsqrBnq2v
         X9QbiOQHlkjHAbXpeiL3IMKwMm23MJrMfQXRRA9jKoFjvPyLFB4XKuIjrc/Z+YiXQ7U1
         f3vg==
X-Gm-Message-State: ANhLgQ0u6ptO96VKlNztncZ7LCaFM2uhBG7J+tQPVwBEp8P031wIgi+2
        z0x5mUfexeHJZb0Yo07vo7o=
X-Google-Smtp-Source: ADFU+vtHvDDPVh4+vaatEZehwcpoGE/VhOPXZuUGJCaIYY8nsgPQBYdZ4HFQo8bq+aUzrPWJwtrOMA==
X-Received: by 2002:a37:27c1:: with SMTP id n184mr20361283qkn.67.1583863715150;
        Tue, 10 Mar 2020 11:08:35 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 127sm17848821qkj.97.2020.03.10.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:08:34 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     otavio.salvador@ossystems.com.br, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/5] ARM: dts: imx7d-pico: Add support for the dwarf baseboard
Date:   Tue, 10 Mar 2020 15:08:22 -0300
Message-Id: <20200310180825.10111-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310180825.10111-1-festevam@gmail.com>
References: <20200310180825.10111-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the imx7d pico board with dwarf baseboard combination.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use audio-codec as the codec node name

 arch/arm/boot/dts/Makefile             |  1 +
 arch/arm/boot/dts/imx7d-pico-dwarf.dts | 87 ++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7d-pico-dwarf.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 566c6d1cfc46..38a71988ac2a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -617,6 +617,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-mba7.dtb \
 	imx7d-meerkat96.dtb \
 	imx7d-nitrogen7.dtb \
+	imx7d-pico-dwarf.dtb \
 	imx7d-pico-hobbit.dtb \
 	imx7d-pico-pi.dtb \
 	imx7d-sbc-imx7.dtb \
diff --git a/arch/arm/boot/dts/imx7d-pico-dwarf.dts b/arch/arm/boot/dts/imx7d-pico-dwarf.dts
new file mode 100644
index 000000000000..5162fe227d1e
--- /dev/null
+++ b/arch/arm/boot/dts/imx7d-pico-dwarf.dts
@@ -0,0 +1,87 @@
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
+	model = "TechNexion PICO-IMX7D and DWARF baseboard";
+	compatible = "technexion,imx7d-pico-dwarf", "fsl,imx7d";
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
+	pressure-sensor@60 {
+		compatible = "fsl,mpl3115";
+		reg = <0x60>;
+	};
+};
+
+&i2c4 {
+	clock_frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	pca9554: io-expander@25 {
+		compatible = "nxp,pca9554";
+		gpio-controller;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		reg = <0x25>;
+	};
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5x06";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pca9554 4 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+	};
+};
+
+&iomuxc {
+	pinctrl_touchscreen: touchscreengrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14
+		>;
+	};
+};
-- 
2.17.1

