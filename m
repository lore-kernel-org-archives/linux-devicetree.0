Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC689C43215
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:13:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A26E92084F
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E21AyAUx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLBNNI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 08:13:08 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37790 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbfLBNNI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 08:13:08 -0500
Received: by mail-qk1-f194.google.com with SMTP id m188so441061qkc.4
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 05:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nqsNsDAlfaHTVi7gXs+J0cgWQCujlySbWnmTJDgLkIs=;
        b=E21AyAUx4D2620GlCE76wSOzVg3ZpqtoxK8IiLbTjss55nv921Dg2mmHm5SMmCxhRD
         y9T8qK31+OnQr3MnigQOD6aQjGC0ZfnADAFJ7nlS+8thnATuirGl3yErLZTNikOdDa/1
         3Dhe4FzdNRvi/kYxJ3SHzD5SAsukcXxKk5Y55LZhF1BivNyPXzWFaanTzFkoKEBlKmGV
         wftzAKLg3kU6U7ZDhOFEWdi9g7au/WiXlxwQgr8IJV1o2Yl+pu2RzvN5aOzrualE0yOV
         cYbBNqzVo2pGqJze2iSLdwoHS5lSAoIJhw1JGcDkjIu8WwIp5OTI8FJOqtLkRr2Cr/yC
         zzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nqsNsDAlfaHTVi7gXs+J0cgWQCujlySbWnmTJDgLkIs=;
        b=QUFr1K0hd/i9qc2pcS6dI6JG9Jf6AxOnbJ03wp7YxIMV45YAWfSYoXuOpdysJqfPE0
         sYGPSFD2hTjNmXvsb98tNi1HHenlxTLjMbICCE7S80k6VZjOpKuw4zoawvOlUVcitk/Y
         Hg90RAAKHgOZwDEZafOjXRz51JK/i46qbV5D5/Pk+HssEkXHfYpaoxcfGVtUe1+zo2+u
         DCF1EG6ypz40xLHC50uxhCtp4PsPAiRCWBTbguE1gVDSxUFLfOixJF9o4nGNjJ687y4W
         zN4CSWLOoKrykn/vtnZ53FzQe7QTwx9855Wdsvr+jJU8evdreyC7tNu+qSzqT9WUQRb3
         qHHQ==
X-Gm-Message-State: APjAAAUjrHPSrwh0r9aDKG7vKGEhS9jtDNcyyNqPynJ6oYdhCAefYgz+
        dzHxrvwDKrLcG53+mYggJ+w=
X-Google-Smtp-Source: APXvYqw1kNfkatheWD7IeaL5TwrXuu/ydS7h0Pl3FNZAeC7yVzTJakuzxXacLbXBTA4476kKSRr2vw==
X-Received: by 2002:a05:620a:12e7:: with SMTP id f7mr31643556qkl.322.1575292386641;
        Mon, 02 Dec 2019 05:13:06 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id x8sm14170893qki.60.2019.12.02.05.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 05:13:05 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH RESEND v2 2/2] ARM: dts: imx7ulp-com: Add initial support for i.MX7UP COM board
Date:   Mon,  2 Dec 2019 10:13:18 -0300
Message-Id: <20191202131318.11404-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202131318.11404-1-festevam@gmail.com>
References: <20191202131318.11404-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Embedded Artists COM board is based on NXP i.MX7ULP.

It has a BD70528 PMIC from Rohm with discrete DCDC powering option and
improved current observability (compared to the existing NXP i.MX7ULP EVK).

Add the initial support for the board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Fix W=1 dtc warning:
arch/arm/boot/dts/imx7ulp-com.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

 arch/arm/boot/dts/Makefile        |  1 +
 arch/arm/boot/dts/imx7ulp-com.dts | 79 +++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7ulp-com.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e352598c05ae..07949ad31a6b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -611,6 +611,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7s-mba7.dtb \
 	imx7s-warp.dtb
 dtb-$(CONFIG_SOC_IMX7ULP) += \
+	imx7ulp-com.dtb \
 	imx7ulp-evk.dtb
 dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-moxa-uc-8410a.dtb \
diff --git a/arch/arm/boot/dts/imx7ulp-com.dts b/arch/arm/boot/dts/imx7ulp-com.dts
new file mode 100644
index 000000000000..c0ff354730ba
--- /dev/null
+++ b/arch/arm/boot/dts/imx7ulp-com.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2019 NXP
+
+/dts-v1/;
+
+#include "imx7ulp.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Embedded Artists i.MX7ULP COM";
+	compatible = "ea,imx7ulp-com", "fsl,imx7ulp";
+
+	chosen {
+		stdout-path = &lpuart4;
+	};
+
+	memory@60000000 {
+		device_type = "memory";
+		reg = <0x60000000 0x4000000>;
+	};
+};
+
+&lpuart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart4>;
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg1_id>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	status = "okay";
+};
+
+&usdhc0 {
+	assigned-clocks = <&pcc2 IMX7ULP_CLK_USDHC0>;
+	assigned-clock-parents = <&scg1 IMX7ULP_CLK_APLL_PFD1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc0>;
+	non-removable;
+	bus-width = <8>;
+	no-1-8-v;
+	status = "okay";
+};
+
+&iomuxc1 {
+	pinctrl_lpuart4: lpuart4grp {
+		fsl,pins = <
+			IMX7ULP_PAD_PTC3__LPUART4_RX	0x3
+			IMX7ULP_PAD_PTC2__LPUART4_TX	0x3
+		>;
+	};
+
+	pinctrl_usbotg1_id: otg1idgrp {
+		fsl,pins = <
+			IMX7ULP_PAD_PTC13__USB0_ID	0x10003
+		>;
+	};
+
+	pinctrl_usdhc0: usdhc0grp {
+		fsl,pins = <
+			IMX7ULP_PAD_PTD1__SDHC0_CMD	0x43
+			IMX7ULP_PAD_PTD2__SDHC0_CLK	0x10042
+			IMX7ULP_PAD_PTD3__SDHC0_D7	0x43
+			IMX7ULP_PAD_PTD4__SDHC0_D6	0x43
+			IMX7ULP_PAD_PTD5__SDHC0_D5	0x43
+			IMX7ULP_PAD_PTD6__SDHC0_D4	0x43
+			IMX7ULP_PAD_PTD7__SDHC0_D3	0x43
+			IMX7ULP_PAD_PTD8__SDHC0_D2	0x43
+			IMX7ULP_PAD_PTD9__SDHC0_D1	0x43
+			IMX7ULP_PAD_PTD10__SDHC0_D0	0x43
+			IMX7ULP_PAD_PTD11__SDHC0_DQS	0x42
+		>;
+	};
+};
-- 
2.17.1

