Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329CAC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 22:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F1F52087C
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 22:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpswO3Hh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgHLWmA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 18:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgHLWl5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 18:41:57 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17FEC061384
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 15:41:56 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id qc22so4048678ejb.4
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 15:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BKPDTr0AtTkoqc7ofCXce3fJ9/UUAi7uqf5Gd7Rb1eU=;
        b=BpswO3Hha1PclIsf1ZrAOOAebhYnFB0EkzQhBnuLuDKzU43zkgRY0jjGK6EYXCY/iD
         4EqRiV5Yv9u6gVePVrYGqySZmX3eE7EoZmgOSWTp7Ih8SW2rOkvziuzUBi8aoNMciZji
         zwtHHVncIuhhmqAUWgz1mNUTfs4WiGUNrTmSfpH/Ky3gg1+2abHq7il2aKA6Ew8EGGqD
         xdg1IllHkusw/5Mwe9J/I1Is+81fcGm2YfrknzCgv3+iubbR1CMI5I1Jd10JoAo+97Os
         I30A/zPNaq4IasU5FD9MV77LKh0i7A4JwAsvdiwwQGQB9zhEsRX/pEJmwjP9LEDYjpi/
         DyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BKPDTr0AtTkoqc7ofCXce3fJ9/UUAi7uqf5Gd7Rb1eU=;
        b=CTqLYxsZDYV+XEwUtoaCEvrTM2XvtrATJlBFhy3xGEfB2im0zRUtS0CACSVLB0kuci
         DBPH+ImHZGfssrzfdS51LaKLMZ1OxLduli2Qe0yMCFg0Dafq3LhblLJi/nie3ySlV4l9
         MlEQI1vmr816Luxj6ONxln1J9BS123Il8Up7Yyp468pusY79+viEVe9mmSw8X5uzVXET
         2a4ALXTxQvE45B9SUzAmmmlYOlNjnhfaNt+m4UOwSaocpIwOjknxzKWC699Ps86/JUsu
         Wkbeh8AV4rJ2vi5v7kmgT477bPj3sPpH0+U+FNxpeK4+Jkb8oxEd78Kt/ax7m9ICIp7Y
         u1Dw==
X-Gm-Message-State: AOAM5336d+nBAGh+jTy4ZryFy7KiENw66pE3e068CbUaksUGD2szPejf
        DA+wM8IBqy5u+kCiQyGpB1o=
X-Google-Smtp-Source: ABdhPJxaOAInqb+Ph3Sagvt/ynMIUgC8/OriJwqS/4cePg6AiCjkVzk6ZbIwtZQOzak93sE3BV+5xw==
X-Received: by 2002:a17:906:c7c8:: with SMTP id dc8mr1901680ejb.399.1597272115286;
        Wed, 12 Aug 2020 15:41:55 -0700 (PDT)
Received: from debian64.daheim (pd9e293b6.dip0.t-ipconnect.de. [217.226.147.182])
        by smtp.gmail.com with ESMTPSA id j24sm2405170ejv.32.2020.08.12.15.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:41:54 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
        (envelope-from <chunkeey@gmail.com>)
        id 1k5zRR-005oDX-TS; Thu, 13 Aug 2020 00:41:53 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Cc:     Chris Blake <chrisrblake93@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v1 3/4] powerpc: apm82181: add Meraki MR24 AP
Date:   Thu, 13 Aug 2020 00:41:52 +0200
Message-Id: <0732d462e1f727dc95898bd33cdde920ce81e2ff.1597271958.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <08dd11e8ce996a0df27dca3a9316bfc4ede0d0d0.1597271958.git.chunkeey@gmail.com>
References: <cover.1597271958.git.chunkeey@gmail.com> <15a94dddc15d29bac02439beb77fd066771c747a.1597271958.git.chunkeey@gmail.com> <08dd11e8ce996a0df27dca3a9316bfc4ede0d0d0.1597271958.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds the device-tree definitions for Meraki MR24
Accesspoint devices.

Ready to go images and install instruction can be found @OpenWrt.

Signed-off-By: Chris Blake <chrisrblake93@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 arch/powerpc/boot/dts/meraki-mr24.dts      | 237 +++++++++++++++++++++
 arch/powerpc/platforms/44x/ppc44x_simple.c |   1 +
 2 files changed, 238 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/meraki-mr24.dts

diff --git a/arch/powerpc/boot/dts/meraki-mr24.dts b/arch/powerpc/boot/dts/meraki-mr24.dts
new file mode 100644
index 000000000000..945e3e6b2585
--- /dev/null
+++ b/arch/powerpc/boot/dts/meraki-mr24.dts
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device Tree Source for Meraki MR24 (Ikarem)
+ *
+ * Copyright (C) 2016 Chris Blake <chrisrblake93@gmail.com>
+ *
+ * Based on Cisco Meraki GPL Release r23-20150601 MR24 DTS
+ */
+
+/dts-v1/;
+
+#include "apm82181.dtsi"
+
+/ {
+	model = "Meraki MR24 Access Point";
+	compatible = "meraki,mr24";
+
+	aliases {
+		serial0 = &UART1;
+		led-boot = &status;
+		led-failsafe = &failsafe;
+		led-running = &status;
+		led-upgrade = &status;
+	};
+
+	chosen {
+		stdout-path = "/plb/opb/serial@ef600400";
+	};
+};
+
+
+&CRYPTO {
+	status = "okay";
+};
+
+&PKA {
+	status = "okay";
+};
+
+&TRNG {
+	status = "okay";
+};
+
+&EBC0 {
+	/* Ikarem has 32MB of NAND */
+	ndfc@1,0 {
+		status = "okay";
+		/* 32 MiB NAND Flash */
+		nand {
+			partition@0 {
+				label = "u-boot";
+				reg = <0x00000000 0x00150000>;
+				read-only;
+			};
+
+			partition@150000 {
+				/*
+				 * The u-boot environment size is one NAND
+				 * block (16KiB). u-boot allocates four NAND
+				 * blocks (64KiB) in order to have spares
+				 * around for bad block management
+				 */
+				label = "u-boot-env";
+				reg = <0x00150000 0x00010000>;
+				read-only;
+			};
+
+			partition@160000 {
+				/*
+				 * redundant u-boot environment.
+				 * has to be kept it in sync with the
+				 * data in "u-boot-env".
+				 */
+				label = "u-boot-env-redundant";
+				reg = <0x00160000 0x00010000>;
+				read-only;
+			};
+
+			partition@170000 {
+				label = "oops";
+				reg = <0x00170000 0x00010000>;
+			};
+
+			partition@180000 {
+				label = "ubi";
+				reg = <0x00180000 0x01e80000>;
+			};
+		};
+	};
+};
+
+&UART1 {
+	status = "okay";
+};
+
+&GPIO0 {
+	status = "okay";
+};
+
+&IIC0 {
+	status = "okay";
+	/* Boot ROM is at 0x52-0x53, do not touch */
+	/* Unknown chip at 0x6e, not sure what it is */
+};
+
+&EMAC0 {
+	status = "okay";
+
+	phy-mode = "rgmii-id";
+	phy-map = <0x2>;
+	phy-address = <0x1>;
+	phy-handle = <&phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+		};
+	};
+};
+
+&POB0 {
+	leds {
+		compatible = "gpio-leds";
+
+		status: power-green {
+			label = "mr24:green:power";
+			gpios = <&GPIO0 18 GPIO_ACTIVE_LOW>;
+		};
+
+		failsafe: power-orange {
+			label = "mr24:orange:power";
+			gpios = <&GPIO0 19 GPIO_ACTIVE_LOW>;
+		};
+
+		lan {
+			label = "mr24:green:wan";
+			gpios = <&GPIO0 17 GPIO_ACTIVE_LOW>;
+		};
+
+		ssi-0 {
+			label = "mr24:green:wifi1";
+			gpios = <&GPIO0 23 GPIO_ACTIVE_LOW>;
+		};
+
+		ssi-1 {
+			label = "mr24:green:wifi2";
+			gpios = <&GPIO0 22 GPIO_ACTIVE_LOW>;
+		};
+
+		ssi-2 {
+			label = "mr24:green:wifi3";
+			gpios = <&GPIO0 21 GPIO_ACTIVE_LOW>;
+		};
+
+		ssi-3 {
+			label = "mr24:green:wifi4";
+			gpios = <&GPIO0 20 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		reset {
+			/* Label as per Meraki's "MR24 Installation Guide" */
+			label = "Factory Reset Button";
+			linux,code = <KEY_RESTART>;
+			interrupt-parent = <&UIC1>;
+			interrupts = <0x15 IRQ_TYPE_EDGE_FALLING>;
+			gpios = <&GPIO0 16 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+};
+
+&PCIE0 {
+	status = "okay";
+	/*
+	 * relevant lspci topology:
+	 *
+	 *	-+-[0000:40]---00.0-[41-7f]----00.0-[42-45]--+-02.0-[43]----00.0
+	 *	                                             +-03.0-[44]----00.0
+	 *
+	 */
+
+	bridge@64,0 {
+		reg = <0x00400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		bridge@65,0 {
+			/* IDT PES3T3 PCI Express Switch */
+			compatible = "pci111d,8039";
+			reg = <0x00410000 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+
+			bridge@66,2 {
+				compatible = "pci111d,8039";
+				reg = <0x00421000 0 0 0 0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+		                wifi0: wifi@67,0 {
+					/* Atheros AR9380 2.4GHz */
+					compatible = "pci168c,0030";
+					reg = <0x00430000 0 0 0 0>;
+				};
+			};
+
+			bridge@66,3 {
+				compatible = "pci111d,8039";
+				reg = <0x00421800 0 0 0 0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+				wifi1: wifi@68,0 {
+					/* Atheros AR9380 5GHz */
+					compatible = "pci168c,0030";
+					reg = <0x00440000 0 0 0 0>;
+				};
+			};
+		};
+	};
+};
+
+&MSI {
+	status = "okay";
+};
diff --git a/arch/powerpc/platforms/44x/ppc44x_simple.c b/arch/powerpc/platforms/44x/ppc44x_simple.c
index 1122702c804a..7d479928fd48 100644
--- a/arch/powerpc/platforms/44x/ppc44x_simple.c
+++ b/arch/powerpc/platforms/44x/ppc44x_simple.c
@@ -60,6 +60,7 @@ static char *board[] __initdata = {
 	"amcc,taishan",
 	"amcc,yosemite",
 	"mosaixtech,icon",
+	"meraki,mr24",
 	"wd,mybooklive",
 };
 
-- 
2.28.0

