Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE84C8300B
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 13:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DE102076D
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 13:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SX28jIAa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgD3NZT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 09:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726808AbgD3NZT (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 09:25:19 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95147C035494
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 06:25:18 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id q124so2730845pgq.13
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XTBlmhkri6TiYDFterPGpataxQ1L0ZfDDr5My4ZNVYI=;
        b=SX28jIAaSq3H+R+hHlrq1bMCxhM220Au9myWZXA9Xpb1rV+4BK89hYosNiPKWicDp0
         lzielamSZOAD9M8bzsdNEAE3x1i2KOm79G1ZNdiGPnlP7mP8od5fhDZ39kUz7uhAUPrw
         q4tprD6TjzTrzu0AAE9sTTVdE1FbKMnZcbKFCYiMqkDsMheIJ67G/yTbJLFKASFlK/Q6
         BU75zdeJtlf6/VVf1Ir8ymFIo8RgdxZOVgt9gG9zmn5kfMzDyMrY1RWfZ4IHsj+6I8J3
         kLfBgB0oiA0nn3tQBQd6x8VqO/HSRT50rDoQ1mHje8rB7AD9rQJeeLe0jvu46PgdbpCX
         8fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XTBlmhkri6TiYDFterPGpataxQ1L0ZfDDr5My4ZNVYI=;
        b=HTYpr6wIsu3cQLQtBLOT72ig6BhoZLecmFT4Ro9oMKGeDqLUSaMgE/HRhNuEHg9S4j
         EYLZJRi9neaAStX6Sj4hXA5LoepvNY2YVajCpgT5Qy2PU0QVjn92kr584ZXlm4XEGMBz
         qyP3PxZVwPgpwelAVXpyzAk4tY+gulRw0Qlo0jcoUMdRNN3X8+1RbSB0RYQR5WCUrDAa
         apq+4x/RTRGk3kI2eB/Gby7Nx5KgoacTzorxMYzpEiYO2tD2HWFoDcjbK4fnt5IMXbJR
         AWjNUX4Fbz5JWknzcE4aqd2dglDeLvROLUbNccOUXUbNxnhVfnDS52g+WZARb59HpfaZ
         ZZHg==
X-Gm-Message-State: AGi0PubPFHxNC/PFv6jEocD1LK4emhzpWueQCMrE+m27ZYhyPhuvEio1
        nXdkgrYFSuH1k/nbehsXhi2ZAQ==
X-Google-Smtp-Source: APiQypKGEDLBdyzLjZFpAv8Ya3P+JqT3A0dW/8c1QsRriQxtstlVqtyvoi4fuSJvx7vrVJy6COHL8g==
X-Received: by 2002:a63:43c7:: with SMTP id q190mr3225670pga.189.1588253117994;
        Thu, 30 Apr 2020 06:25:17 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id o125sm3146547pgo.74.2020.04.30.06.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 06:25:17 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:25:13 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/2] arm64: dts: uniphier: Add support for Akebi96
Message-Id: <20200430222513.0adeb8bcc8e05501b730b0b0@linaro.org>
In-Reply-To: <158824887998.2799.1402930732677315138.stgit@localhost>
References: <158824887998.2799.1402930732677315138.stgit@localhost>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the device tree for Akebi96. Akebi96 is a 96boards certified
development board based on UniPhir LD20.
( https://www.96boards.org/product/akebi96/ )

This board has;
- MAX3421 USB-SPI chip on SPI port3 (for USB gadget port)
- Simple frame buffer with 1080p fixed resolution.
- I2S port which is connected to aout1b instead of aout1.
- 3 serial ports, only serial3 has CTS/RTS.
- No NAND, only eMMC on the board.
- OP-TEE installed firmware.

Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 Changes in v5:
  - Remove unneeded RGMII setting from eth node.
  - Remove unused "vbus" interrupt and add interrupt-names property
    to max3420-udc node.
  - Add the address to framebuffer.
 Changes in v4:
  - Fix to remove unnecessary "aout1" from pinctrl_aout1.
---
 arch/arm64/boot/dts/socionext/Makefile             |    1 
 .../boot/dts/socionext/uniphier-ld20-akebi96.dts   |  189 ++++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts

diff --git a/arch/arm64/boot/dts/socionext/Makefile b/arch/arm64/boot/dts/socionext/Makefile
index d45441249cb5..dda3da33614b 100644
--- a/arch/arm64/boot/dts/socionext/Makefile
+++ b/arch/arm64/boot/dts/socionext/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_UNIPHIER) += \
 	uniphier-ld11-global.dtb \
 	uniphier-ld11-ref.dtb \
+	uniphier-ld20-akebi96.dtb \
 	uniphier-ld20-global.dtb \
 	uniphier-ld20-ref.dtb \
 	uniphier-pxs3-ref.dtb
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
new file mode 100644
index 000000000000..1b7a1284d184
--- /dev/null
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+//
+// Device Tree Source for Akebi96 Development Board
+//
+// Derived from uniphier-ld20-global.dts.
+//
+// Copyright (C) 2015-2017 Socionext Inc.
+// Copyright (C) 2019-2020 Linaro Ltd.
+
+/dts-v1/;
+#include <dt-bindings/gpio/uniphier-gpio.h>
+#include "uniphier-ld20.dtsi"
+
+/ {
+	model = "Akebi96";
+	compatible = "socionext,uniphier-ld20-akebi96",
+		     "socionext,uniphier-ld20";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		spi3 = &spi3;
+		ethernet0 = &eth;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0 0x80000000 0 0xc0000000>;
+	};
+
+	framebuffer@c0000000 {
+		compatible = "simple-framebuffer";
+		reg = <0 0xc0000000 0 0x02000000>;
+		width = <1920>;
+		height = <1080>;
+		stride = <7680>;
+		format = "a8r8g8b8";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		memory@c0000000 {
+			reg = <0 0xc0000000 0 0x02000000>;
+			no-map;
+		};
+	};
+
+	sound {
+		compatible = "audio-graph-card";
+		label = "UniPhier LD20";
+		dais = <&spdif_port0
+			&comp_spdif_port0>;
+	};
+
+	spdif-out {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+
+		port@0 {
+			spdif_tx: endpoint {
+				remote-endpoint = <&spdif_hiecout1>;
+			};
+		};
+	};
+
+	comp-spdif-out {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+
+		port@0 {
+			comp_spdif_tx: endpoint {
+				remote-endpoint = <&comp_spdif_hiecout1>;
+			};
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+};
+
+&serial0 {
+	/* Onboard USB-UART */
+	status = "okay";
+};
+
+&serial2 {
+	/* LS connector UART1 */
+	status = "okay";
+};
+
+&serial3 {
+	/* LS connector UART0 */
+	status = "okay";
+};
+
+&spdif_hiecout1 {
+	remote-endpoint = <&spdif_tx>;
+};
+
+&comp_spdif_hiecout1 {
+	remote-endpoint = <&comp_spdif_tx>;
+};
+
+&eth {
+	status = "okay";
+	phy-handle = <&ethphy>;
+};
+
+&mdio {
+	ethphy: ethphy@0 {
+		reg = <0>;
+	};
+};
+
+&usb {
+	status = "okay";
+};
+
+&pcie {
+	status = "okay";
+};
+
+&i2c0 {
+	/* LS connector I2C0 */
+	status = "okay";
+};
+
+&i2c1 {
+	/* LS connector I2C1 */
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	usb-over-spi@0 {
+		compatible = "maxim,max3421-udc";
+		reg = <0>;
+		spi-max-frequency = <12500000>;
+		interrupt-parent = <&gpio>;
+		interrupt-names = "udc";
+		interrupts = <0 2>;
+	};
+};
+
+&gpio {
+	/* IRQs for Max3421 */
+	xirq0 {
+		gpio-hog;
+		gpios = <UNIPHIER_GPIO_IRQ(0) 1>;
+		input;
+	};
+	xirq10 {
+		gpio-hog;
+		gpios = <UNIPHIER_GPIO_IRQ(10) 1>;
+		input;
+	};
+};
+
+&pinctrl_aout1 {
+	groups = "aout1b";
+};
+
+&pinctrl_uart3 {
+	groups = "uart3", "uart3_ctsrts";
+};

