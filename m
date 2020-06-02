Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C3DC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7A8C20835
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoRrDRQ+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgFBQNZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 12:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgFBQNY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 12:13:24 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF15C08C5C0
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 09:13:23 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x13so4011499wrv.4
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YCc3Aqf4BIr9Rnf1jzyRRww8U9DCaXD931Bc2v9LHGk=;
        b=RoRrDRQ+wD+Q30mxCNkTZsCyOMwpWwgQvWv9uanSn6cmrlMar1iPbj8tiWB+vk8o1V
         7YVB1mKdedpI4U0wJXL5Ny/Ecbe/EELxODi1LpHdpLPjTgF8Z0KWV9+LrQGqufNd4xGk
         yQIy7+CkagZgk9IT5nzX0hJR9DPwuPFU1jwu1sNNQtDUpl6Kx5N08ZbbdBqV/ugWzr8z
         gxfxdh5pC0WmkOavqVVUe1uhuVhg1Bzwf+KpkMVSKCXCKHy9Niy+lOcFOoAoSEOZk/oE
         qidriLh1QmHPx2dN5bBd0vyRYMFSQHVii2WsIKQsrH2vG2FMEqMrZoyy5YYKEZpwhjY8
         q52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCc3Aqf4BIr9Rnf1jzyRRww8U9DCaXD931Bc2v9LHGk=;
        b=fTiFLhWSLlzIBs8mVMoJDHsuHSRyVr+rB1UDA9iFTznhaOpfXehpE5v5YmihNhpFuw
         fBfXMAoJAsijB6XjoYgOx9z3s3T8ESxmMhy2rGnb1AfThzckms8NCQdslpZGMzb+R6wN
         SgH4uYGYuOWVtCVG8m5ncclkdsozbRO8jpe6zIMfi3Ukx3dl5+72smEir47aQ7ultTZr
         z1uAhKm8gGa4xE9QzbhO9Evcyj/z++qv9dY1nEYHTU0DOou0zEAUcgUS5ifz5EPhipsp
         Its/gnTXdRHuQ9W0ei6emMgOSNdCV96GTlSrMvyYPM5nRsSW/zwvqoqp8s7HIrVGxm+P
         2xEQ==
X-Gm-Message-State: AOAM530HuEIO/AzPTwa8FHAfrmClwRB0SVl42bbacDG1bcCBgTqVPGtY
        rhckuH6MyGLabq8zPbwnD0U=
X-Google-Smtp-Source: ABdhPJy5ltrqEymhwegMFG4Q9FZ9dFa7xPt8JJj3b23N9OLf5r+kpZ1CgmhluHc2969SgNBk3ZJlvw==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr26912631wrl.265.1591114401767;
        Tue, 02 Jun 2020 09:13:21 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id c140sm291884wmd.18.2020.06.02.09.13.21
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 02 Jun 2020 09:13:21 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
Cc:     Matthew Hagan <mnhagan88@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: NSP: Add common bindings for Meraki MX64/65
Date:   Tue,  2 Jun 2020 17:11:17 +0100
Message-Id: <d2db4e0aafff74cd16b2c2a9b2c86fba7d8f5f84.1591114003.git.mnhagan88@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1591114003.git.mnhagan88@gmail.com>
References: <cover.1591114003.git.mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/bcm958625-mx6x-common.dtsi | 172 +++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-mx6x-common.dtsi

diff --git a/arch/arm/boot/dts/bcm958625-mx6x-common.dtsi b/arch/arm/boot/dts/bcm958625-mx6x-common.dtsi
new file mode 100644
index 000000000000..1e253dd0941a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-mx6x-common.dtsi
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Common Bindings for Cisco Meraki MX64 (Kingpin) and MX65 (Alamo) devices.
+ *
+ * Copyright (C) 2020 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm-nsp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x60000000 0x80000000>;
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		red {
+			label = "pwm:led:red";
+			pwms = <&pwm 1 50000>;
+		};
+
+		green {
+			label = "pwm:led:green";
+			pwms = <&pwm 2 50000>;
+		};
+
+		blue {
+			label = "pwm:led:blue";
+			pwms = <&pwm 3 50000>;
+		};
+	};
+};
+
+&L2 {
+        arm,io-coherent;
+        prefetch-data = <1>;
+        prefetch-instr = <1>;
+};
+
+&uart0 {
+	clock-frequency = <62500000>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	eeprom: at24@50 {
+		compatible = "atmel,24c64";
+		pagesize = <32>;
+		reg = <0x50>;
+	};
+};
+
+&amac2 {
+	status = "okay";
+};
+
+&nand {
+	nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-on-flash-bbt;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		nand-ecc-strength = <24>;
+		nand-ecc-step-size = <1024>;
+
+		brcm,nand-oob-sector-size = <27>;
+
+		partition@0 {
+			label = "U-boot";
+			reg = <0x00 0x80000>;
+			read-only;
+		};
+
+		partition@80000 {
+			label = "Shmoo";
+			reg = <0x80000 0x80000>;
+			read-only;
+		};
+
+		partition@100000 {
+			label = "bootkernel1";
+			reg = <0x100000 0x300000>;
+		};
+
+		partition@400000 {
+			label = "senao_nvram";
+			reg = <0x400000 0x100000>;
+		};
+
+		partition@500000 {
+			label = "bootkernel2";
+			reg = <0x500000 0x300000>;
+		};
+
+		partition@800000 {
+			label = "ubi";
+			reg = <0x800000 0x3f700000>;
+		};
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pwm {
+	status = "okay";
+	#pwm-cells = <2>;
+	chan0 {
+		channel = <1>;
+		active_low = <1>;
+		};
+	chan1 {
+		channel = <2>;
+		active_low = <1>;
+	};
+	chan2 {
+		channel = <3>;
+		active_low = <1>;
+	};
+};
+
+&ccbtimer1 {
+	status = "disabled";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_sel>, <&gpiobs>, <&pwmc>;
+
+	nand_sel: nand_sel {
+		function = "nand";
+		groups = "nand_grp";
+	};
+
+	gpiobs: gpiobs {
+		function = "gpio_b";
+		groups = "gpio_b_0_grp", "gpio_b_1_grp", "gpio_b_2_grp",
+			 "gpio_b_3_grp";
+	};
+
+	pwmc: pwmc {
+		function = "pwm";
+		groups = "pwm0_grp", "pwm1_grp", "pwm2_grp", "pwm3_grp";
+	};
+
+	i2c_sel: i2c {
+		function = "i2c";
+		groups = "i2c_grp";
+	};
+};
+
+&sata_phy {
+	status = "disabled";
+};
-- 
2.25.4

