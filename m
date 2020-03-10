Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB363C10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A362A2146E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKk1CUnC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgCJSIo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:08:44 -0400
Received: from mail-qv1-f66.google.com ([209.85.219.66]:45712 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgCJSIo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:08:44 -0400
Received: by mail-qv1-f66.google.com with SMTP id du17so5940126qvb.12
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HVlUjwmBfQ/bJDemOmKbR+CIRVB4PM1YQlpjhiqC0yI=;
        b=mKk1CUnChfgQdYp2wwysfFZV+QQCIO46Xxhd6LtCYUycreMsgI6kh0M3iSQ2nljhTh
         oDFC+fdOWjeC90U/scpKtZ9nOL+BAMjpkDHRDwyg6S5fvsFt7zgR6TzNHmRXOlHGocsq
         F44z2iokOdAaPf1rYTW2rI2s5CQNEc8eKHbDjQGMEHmAt9gQRQlSKG/X/waOn7oPtSW2
         zHZdh1WzI2KmLrDuVA5RnEjaSPNNn8eIPNS4hRp9l79EWIfLcq34R9KaCISd0irFb5DG
         hSLFA7XHIQKCdhKI3ZugntF85vDdqNntOYhOEOAAzHRnM3YUQoN6xV55qfO14IcUfYP0
         MUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HVlUjwmBfQ/bJDemOmKbR+CIRVB4PM1YQlpjhiqC0yI=;
        b=VLLGdDmq/SEwffhoakmis1UtNmVScVbtDA46LJRngc3/DqqqpRsd+qiPS2U/ynQ27f
         2eZFPYrhR6mgsF/sBzqZiln3rci5Me75ICe/fXwVCawUF6ZPJ0JlQGZxugUi2lLT68C7
         KxsEwP+OjPL8vnSf7uhXTIPRAfTHn2zVW3uESvIQXoBC3qkm9zqRoTf20Runlg9ASEtW
         8rCjBS9um8nvi2H7gVp1hrhMKkJmY8h7JstlCg8MvqYBMahRXPrIPerzU2FLC12AssLI
         tKPkF6WRTi/tCs4xrv6eWleu0UceueafYks5D0LSHpe4XNJL6yy35ppCS84/trLo3xQH
         6iLw==
X-Gm-Message-State: ANhLgQ2HsMSJfTYd3tzS4Hfk2kHkaRwrvVvCFj0Ez/AKqJt4NP32y2Mo
        ztixc5pFnn9MPmBKyDblXMY=
X-Google-Smtp-Source: ADFU+vsB8ljBbtjiA3BQiIaPALFcdACXvwIoHAq0ZSsjFQYHgKbS+YJhzL+9PwXvQ2zLCwkCGvlcCw==
X-Received: by 2002:a0c:eccb:: with SMTP id o11mr10535111qvq.129.1583863721657;
        Tue, 10 Mar 2020 11:08:41 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 127sm17848821qkj.97.2020.03.10.11.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:08:40 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     otavio.salvador@ossystems.com.br, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 4/5] ARM: dts: imx6ul-pico: Add support for the dwarf baseboard
Date:   Tue, 10 Mar 2020 15:08:24 -0300
Message-Id: <20200310180825.10111-4-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310180825.10111-1-festevam@gmail.com>
References: <20200310180825.10111-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the imx6ul pico board with dwarf baseboard combination.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use audio-codec as the codec node name

 arch/arm/boot/dts/Makefile              |  1 +
 arch/arm/boot/dts/imx6ul-pico-dwarf.dts | 52 +++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-pico-dwarf.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c46416725a63..4b1759f2cb9b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -594,6 +594,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-kontron-n6310-s-43.dtb \
 	imx6ul-liteboard.dtb \
 	imx6ul-opos6uldev.dtb \
+	imx6ul-pico-dwarf.dtb \
 	imx6ul-pico-hobbit.dtb \
 	imx6ul-pico-pi.dtb \
 	imx6ul-phytec-segin-ff-rdk-nand.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-pico-dwarf.dts b/arch/arm/boot/dts/imx6ul-pico-dwarf.dts
new file mode 100644
index 000000000000..162dc259edc8
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ul-pico-dwarf.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright 2015 Technexion Ltd.
+//
+// Author: Wig Cheng  <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+/dts-v1/;
+
+#include "imx6ul-pico.dtsi"
+/ {
+	model = "TechNexion PICO-IMX6UL and DWARF baseboard";
+	compatible = "technexion,imx6ul-pico-dwarf", "fsl,imx6ul";
+
+	sound {
+		compatible = "fsl,imx-audio-sgtl5000";
+		model = "imx6ul-sgtl5000";
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
+&i2c2 {
+	clock_frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
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
-- 
2.17.1

