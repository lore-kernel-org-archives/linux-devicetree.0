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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0689AC10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B482C21D56
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i284gh0G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgCJSIu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:08:50 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38871 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgCJSIu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:08:50 -0400
Received: by mail-qt1-f194.google.com with SMTP id e20so10372191qto.5
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Msnc9Y4k+kbSs9CVJvPamHVeSnLaFQ20YxGPSNKy1vU=;
        b=i284gh0GNxGJ9fG3wZXrXFZbwN/nLwB+W4BHUfnF5vP3OEroVfwd7/Kbax+BplLMqc
         WwQF7qzsw36TDOj5gOyVLBNVOoozSjTw8wgGsmhP9xsEXBFo0cb7H6punW696KeikyJD
         t18u9cDMog90v1QLl3+VtEDZciYJhvbKoA18+flmpTouh+r5nUzkgBjsrs8rezeo/f/6
         NIgkyjssIgAr7X+3ad7pRKKK+KjgUBGkIE2jVLeWKaCACqUp3Ohy4XefcQRE1r/rfVvr
         SLj22cvGL6H/3tDi3AJaZDMdYSxYZ9ol1DgoSnT3vzmhJA+pAALK2gjN2QKGb400di+2
         cIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Msnc9Y4k+kbSs9CVJvPamHVeSnLaFQ20YxGPSNKy1vU=;
        b=PLr2BFuwBLlwWAtFKWBC6bYWPYpAE/3zFFI386NX8aw1S6XRnUvv/HhHXu+sP81zou
         dF/Lf7Z1jjbrzQR7+3Dg4P8I6bdV4kZT42ye0c/J+/q/7bEXtHsYa5tjcGCTgIG6PRUQ
         Wp2Tzddx15ayBNf8Yv9QH33XFbvaY6KJhMGmjy0GzZWecVMu+NUiprGf29t0AaQ3zFb3
         3/BXQwB6Le/o2bWOzkYuAv4NUaT+PT7wc3+MwR2Kv4RL3YE+UF+wFH3sVJd1ma8iUYvV
         i/KxHvies6AGjM1lVaIyHgj7OG4rWg7VH0uY0ff1mgi4q0G7wbdbYx4VTpah9etHIwtx
         NpxQ==
X-Gm-Message-State: ANhLgQ2WGgx/sYvo36049zjMR0NScu7++rAF93yzrLfNZ2MCVEmjGxN/
        iPeUkL1xSpYi1yRswxY4LuQ=
X-Google-Smtp-Source: ADFU+vtlKPZ6aD3G4+IA8US2bgdMuEW9Lr/bDT9GZHapaGdMikmk/25W9+eeYuwmscjvdp8rOxGjfQ==
X-Received: by 2002:ac8:3978:: with SMTP id t53mr20560835qtb.367.1583863726069;
        Tue, 10 Mar 2020 11:08:46 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 127sm17848821qkj.97.2020.03.10.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:08:45 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     otavio.salvador@ossystems.com.br, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 5/5] ARM: dts: imx6qdl: Add imx6qdl-pico support
Date:   Tue, 10 Mar 2020 15:08:25 -0300
Message-Id: <20200310180825.10111-5-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310180825.10111-1-festevam@gmail.com>
References: <20200310180825.10111-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for all the imx6qdl-pico variants.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 arch/arm/boot/dts/Makefile                 |   8 +
 arch/arm/boot/dts/imx6dl-pico-dwarf.dts    |  17 +
 arch/arm/boot/dts/imx6dl-pico-hobbit.dts   |  17 +
 arch/arm/boot/dts/imx6dl-pico-nymph.dts    |  17 +
 arch/arm/boot/dts/imx6dl-pico-pi.dts       |  17 +
 arch/arm/boot/dts/imx6q-pico-dwarf.dts     |  17 +
 arch/arm/boot/dts/imx6q-pico-hobbit.dts    |  17 +
 arch/arm/boot/dts/imx6q-pico-nymph.dts     |  17 +
 arch/arm/boot/dts/imx6q-pico-pi.dts        |  17 +
 arch/arm/boot/dts/imx6qdl-pico-dwarf.dtsi  |  45 ++
 arch/arm/boot/dts/imx6qdl-pico-hobbit.dtsi |  37 ++
 arch/arm/boot/dts/imx6qdl-pico-nymph.dtsi  |  54 ++
 arch/arm/boot/dts/imx6qdl-pico-pi.dtsi     |  31 ++
 arch/arm/boot/dts/imx6qdl-pico.dtsi        | 617 +++++++++++++++++++++
 14 files changed, 928 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-pico-dwarf.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-pico-hobbit.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-pico-nymph.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-pico-pi.dts
 create mode 100644 arch/arm/boot/dts/imx6q-pico-dwarf.dts
 create mode 100644 arch/arm/boot/dts/imx6q-pico-hobbit.dts
 create mode 100644 arch/arm/boot/dts/imx6q-pico-nymph.dts
 create mode 100644 arch/arm/boot/dts/imx6q-pico-pi.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-pico-dwarf.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-pico-hobbit.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-pico-nymph.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-pico-pi.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-pico.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4b1759f2cb9b..062734f250c1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -446,6 +446,10 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-nitrogen6x.dtb \
 	imx6dl-phytec-mira-rdk-nand.dtb \
 	imx6dl-phytec-pbab01.dtb \
+	imx6dl-pico-dwarf.dtb \
+	imx6dl-pico-hobbit.dtb \
+	imx6dl-pico-nymph.dtb \
+	imx6dl-pico-pi.dtb \
 	imx6dl-rex-basic.dtb \
 	imx6dl-riotboard.dtb \
 	imx6dl-sabreauto.dtb \
@@ -529,6 +533,10 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-phytec-mira-rdk-emmc.dtb \
 	imx6q-phytec-mira-rdk-nand.dtb \
 	imx6q-phytec-pbab01.dtb \
+	imx6q-pico-dwarf.dtb \
+	imx6q-pico-hobbit.dtb \
+	imx6q-pico-nymph.dtb \
+	imx6q-pico-pi.dtb \
 	imx6q-pistachio.dtb \
 	imx6q-rex-pro.dtb \
 	imx6q-sabreauto.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-pico-dwarf.dts b/arch/arm/boot/dts/imx6dl-pico-dwarf.dts
new file mode 100644
index 000000000000..659a8e8714ea
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-pico-dwarf.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-pico-pi.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX6 DualLite/Solo Board and Dwarf baseboard";
+	compatible = "technexion,imx6dl-pico", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6dl-pico-hobbit.dts b/arch/arm/boot/dts/imx6dl-pico-hobbit.dts
new file mode 100644
index 000000000000..d7403c5c4337
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-pico-hobbit.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-pico-hobbit.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX6 DualLite/Solo Board and Hobbit baseboard";
+	compatible = "technexion,imx6dl-pico", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6dl-pico-nymph.dts b/arch/arm/boot/dts/imx6dl-pico-nymph.dts
new file mode 100644
index 000000000000..b282dbf953aa
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-pico-nymph.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-pico-pi.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX6 DualLite/Solo Board and Nymph baseboard";
+	compatible = "technexion,imx6dl-pico", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6dl-pico-pi.dts b/arch/arm/boot/dts/imx6dl-pico-pi.dts
new file mode 100644
index 000000000000..b7b1c07f96f3
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-pico-pi.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-pico-pi.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX6 DualLite/Solo Board and PI baseboard";
+	compatible = "technexion,imx6dl-pico", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6q-pico-dwarf.dts b/arch/arm/boot/dts/imx6q-pico-dwarf.dts
new file mode 100644
index 000000000000..618d2743e1e9
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-pico-dwarf.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-pico-pi.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX6 Quad Board and Dwarf baseboard";
+	compatible = "technexion,imx6q-pico", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/imx6q-pico-hobbit.dts b/arch/arm/boot/dts/imx6q-pico-hobbit.dts
new file mode 100644
index 000000000000..7a666507b456
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-pico-hobbit.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-pico-hobbit.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX6 Quad Board and Hobbit baseboard";
+	compatible = "technexion,imx6q-pico", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/imx6q-pico-nymph.dts b/arch/arm/boot/dts/imx6q-pico-nymph.dts
new file mode 100644
index 000000000000..fe5a7becc9e5
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-pico-nymph.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-pico-pi.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX6 Quad Board and Nymph baseboard";
+	compatible = "technexion,imx6q-pico", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/imx6q-pico-pi.dts b/arch/arm/boot/dts/imx6q-pico-pi.dts
new file mode 100644
index 000000000000..9413f0a68f54
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-pico-pi.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-pico-pi.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX6 Quad Board and PI baseboard";
+	compatible = "technexion,imx6q-pico", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/imx6qdl-pico-dwarf.dtsi
new file mode 100644
index 000000000000..3a968782e854
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-pico-dwarf.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+//
+// Copyright 2017 NXP
+
+#include "imx6qdl-pico.dtsi"
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+};
+
+&i2c1 {
+	mpl3115@60 {
+		compatible = "fsl,mpl3115";
+		reg = <0x60>;
+	};
+};
+
+&i2c2 {
+	io-expander@25 {
+		compatible = "nxp,pca9554";
+		reg = <0x25>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+	};
+
+};
+
+&iomuxc {
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6qdl-pico-hobbit.dtsi b/arch/arm/boot/dts/imx6qdl-pico-hobbit.dtsi
new file mode 100644
index 000000000000..144c4727fbc7
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-pico-hobbit.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+//
+// Copyright 2017 NXP
+
+#include "imx6qdl-pico.dtsi"
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+};
+
+&i2c2 {
+	status = "okay";
+
+	adc081c: adc@50 {
+		compatible = "ti,adc081c";
+		reg = <0x50>;
+		vref-supply = <&reg_3p3v>;
+	};
+};
+
+&iomuxc {
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/imx6qdl-pico-nymph.dtsi
new file mode 100644
index 000000000000..3d56a4216448
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-pico-nymph.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+
+#include "imx6qdl-pico.dtsi"
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+};
+
+&i2c1 {
+	adc@52 {
+		compatible = "ti,adc081c";
+		reg = <0x52>;
+		vref-supply = <&reg_2p5v>;
+	};
+};
+
+&i2c2 {
+	io-expander@25 {
+		compatible = "nxp,pca9554";
+		reg = <0x25>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+	};
+};
+
+&i2c3 {
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&pcie {
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6qdl-pico-pi.dtsi b/arch/arm/boot/dts/imx6qdl-pico-pi.dtsi
new file mode 100644
index 000000000000..b823dce62e63
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-pico-pi.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+//
+// Copyright 2017 NXP
+
+#include "imx6qdl-pico.dtsi"
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+};
+
+&hdmi {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_PIXCLK__GPIO5_IO18	0x1b0b0
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6qdl-pico.dtsi b/arch/arm/boot/dts/imx6qdl-pico.dtsi
new file mode 100644
index 000000000000..39dfd90c2c6b
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-pico.dtsi
@@ -0,0 +1,617 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//
+// Copyright 2018 Technexion Ltd.
+//
+// Author: Wig Cheng <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	reg_2p5v: regulator-2p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P5V";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	reg_usb_otg_vbus: regulator-usb-otg-vbus {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbotg_vbus>;
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
+	};
+
+	codec_osc: clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+
+	sound {
+		compatible = "fsl,imx-audio-sgtl5000";
+		model = "imx6-pico-sgtl5000";
+		ssi-controller = <&ssi1>;
+		audio-codec = <&sgtl5000>;
+		audio-routing =
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+		mux-int-port = <1>;
+		mux-ext-port = <3>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm4 0 50000 0>;
+		brightness-levels = <0 36 72 108 144 180 216 255>;
+		default-brightness-level = <6>;
+		status = "okay";
+	};
+
+	reg_lcd_3v3: regulator-lcd-3v3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_lcd>;
+		regulator-name = "lcd-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	lcd_display: disp0 {
+		compatible = "fsl,imx-parallel-display";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu1>;
+		status = "okay";
+
+		port@0 {
+			reg = <0>;
+
+			lcd_display_in: endpoint {
+				remote-endpoint = <&ipu1_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lcd_display_out: endpoint {
+				remote-endpoint = <&lcd_panel_in>;
+			};
+		};
+	};
+
+	panel {
+		compatible = "vxt,vl050-8048nt-c01";
+		backlight = <&backlight>;
+		power-supply = <&reg_lcd_3v3>;
+
+		port {
+			lcd_panel_in: endpoint {
+				remote-endpoint = <&lcd_display_out>;
+			};
+		};
+	};
+};
+
+&audmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_audmux>;
+	status = "okay";
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&can2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&clks {
+	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
+			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
+				 <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>;
+	phy-mode = "rgmii-id";
+	phy-reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&hdmi {
+	ddc-i2c-bus = <&i2c2>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	sgtl5000: audio-codec@a {
+		#sound-dai-cells = <0>;
+		reg = <0x0a>;
+		compatible = "fsl,sgtl5000";
+		clocks = <&codec_osc>;
+		VDDA-supply = <&reg_2p5v>;
+		VDDIO-supply = <&reg_1p8v>;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5x06";
+		reg = <0x38>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio5 27 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		wakeup-source;
+	};
+
+	camera@3c {
+		compatible = "ovti,ov5645";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov5645>;
+		reg = <0x3c>;
+		clocks = <&clks IMX6QDL_CLK_CKO2>;
+		clock-names = "xclk";
+		clock-frequency = <24000000>;
+		vdddo-supply = <&reg_1p8v>;
+		vdda-supply = <&reg_2p8v>;
+		vddd-supply = <&reg_1p5v>;
+		enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5645_to_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint = <&lcd_display_in>;
+};
+
+&mipi_csi {
+	status = "okay";
+
+	port@0 {
+		reg = <0>;
+
+		mipi_csi2_in: endpoint {
+			remote-endpoint = <&ov5645_to_mipi_csi2>;
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+		};
+	};
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_reset>;
+	reset-gpio = <&gpio5 21 GPIO_ACTIVE_LOW>;
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+&pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm3>;
+	status = "okay";
+};
+
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+	status = "okay";
+};
+
+&ssi1 {
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&uart2 {  /* Bluetooth module */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usbh1 {
+	status = "okay";
+};
+
+&usbotg {
+	vbus-supply = <&reg_usb_otg_vbus>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg>;
+	disable-over-current;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	cd-gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&usdhc2 {  /* Wifi/BT  */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <4>;
+	no-1-8-v;
+	keep-power-in-suspend;
+	non-removable;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	bus-width = <8>;
+	no-1-8-v;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_MCLK__GPIO5_IO19	0x4001b0b5 /* PICO_P24 */
+			MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x4001b0b5 /* PICO_P26 */
+			MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20	0x4001b0b5 /* PICO_P28 */
+			MX6QDL_PAD_CSI0_DAT8__GPIO5_IO26	0x4001b0b5 /* PICO_P30 */
+			MX6QDL_PAD_CSI0_DAT9__GPIO5_IO27	0x4001b0b5 /* PICO_P32 */
+			MX6QDL_PAD_CSI0_DAT14__GPIO6_IO00	0x4001b0b5 /* PICO_P34 */
+			MX6QDL_PAD_CSI0_DAT12__GPIO5_IO30	0x4001b0b5 /* PICO_P42 */
+			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x4001b0b5 /* PICO_P44 */
+			MX6QDL_PAD_CSI0_DAT15__GPIO6_IO01	0x4001b0b5 /* PICO_P48 */
+		>;
+	};
+
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x110b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI		0x100b1
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK		0x100b1
+			MX6QDL_PAD_EIM_EB2__GPIO2_IO30		0x000f0b0
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_OE__ECSPI2_MISO		0x1b0b1
+			MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI		0x1b0b1
+			MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK		0x1b0b1
+			MX6QDL_PAD_EIM_RW__GPIO2_IO26		0x000f0b0
+			MX6QDL_PAD_EIM_LBA__GPIO2_IO27		0x000f0b0
+		>;
+	};
+
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b0b0
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b0b0
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b0b0
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b0b0
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b0b0
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b0b0
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b0b0
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b0b0
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b0b0
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b0b0
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b0b0
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b0b0
+			MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN	0x1b0b0
+			MX6QDL_PAD_ENET_RXD1__GPIO1_IO26	0x1f0b1
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x1b0b0
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX	0x1b0b0
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX	0x1b0b0
+			MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX	0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x4001b8b1
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__I2C3_SCL		0x4001b8b1
+			MX6QDL_PAD_EIM_D18__I2C3_SDA		0x4001b8b1
+		>;
+	};
+
+	pinctrl_ipu1: ipu1grp {
+		fsl,pins = <
+			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK	0x10
+			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15		0x10
+			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02		0x10
+			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03		0x10
+			MX6QDL_PAD_DI0_PIN4__IPU1_DI0_PIN04		0x10
+			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00	0x10
+			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01	0x10
+			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02	0x10
+			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03	0x10
+			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04	0x10
+			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05	0x10
+			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06	0x10
+			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07	0x10
+			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08	0x10
+			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09	0x10
+			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10	0x10
+			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11	0x10
+			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12	0x10
+			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13	0x10
+			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14	0x10
+			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15	0x10
+			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16	0x10
+			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17	0x10
+			MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18	0x10
+			MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19	0x10
+			MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20	0x10
+			MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21	0x10
+			MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22	0x10
+			MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23	0x10
+		>;
+	};
+
+	pinctrl_ov5645: ov5645grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06		0x0b0b0
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08		0x0b0b0
+			MX6QDL_PAD_GPIO_3__CCM_CLKO2		0x000b0
+		>;
+	};
+
+	pinctrl_pcie_reset: pciegrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x130b0
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_9__PWM1_OUT		0x1b0b1
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_1__PWM2_OUT		0x1b0b1
+		>;
+	};
+
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT1__PWM3_OUT		0x1b0b1
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT2__PWM4_OUT		0x1b0b1
+		>;
+	};
+
+	pinctrl_reg_lcd: reglcdgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT3__GPIO2_IO11		0x1b0b0
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
+			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA	0x1b0b1
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA	0x1b0b1
+			MX6QDL_PAD_SD4_DAT5__UART2_RTS_B	0x1b0b1
+			MX6QDL_PAD_SD4_DAT6__UART2_CTS_B	0x1b0b1
+			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA	0x1b0b1
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
+			MX6QDL_PAD_EIM_D23__UART3_CTS_B		0x1b0b1
+			MX6QDL_PAD_EIM_D31__UART3_RTS_B		0x1b0b1
+		>;
+	};
+
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
+		>;
+	};
+
+	pinctrl_usbotg_vbus: usbotgvbusgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22		0x1b0b0
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__SD1_CMD		0x17071
+			MX6QDL_PAD_SD1_CLK__SD1_CLK		0x17071
+			MX6QDL_PAD_SD1_DAT0__SD1_DATA0		0x17071
+			MX6QDL_PAD_SD1_DAT1__SD1_DATA1		0x17071
+			MX6QDL_PAD_SD1_DAT2__SD1_DATA2		0x17071
+			MX6QDL_PAD_SD1_DAT3__SD1_DATA3		0x17071
+			MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1b0b0
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_EIM_DA9__GPIO3_IO09		0xb0b1
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
+		>;
+	};
+};
-- 
2.17.1

