Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56721FC6195
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 16:33:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 201CA222C5
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573230815;
	bh=XwDtuCgF+2cYiTgiiWqo6J6xMbsD84WYkbMg0BP2tnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=DpxrnEcgOqyhkJGF2Q8NOwjOexup7unMOPQ0fdq+/1DRsElohnzjx3JueCnvHBzTR
	 C5q/lvQVOo3jranSqTcF6xfA6qZMDE8VeKR3jJfm9rHGbmzOs29p6ICAGJj83u2UX+
	 7a8hAfkdJjQonzFaKA03n6rmTPAK0hx0r2dcNkRI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbfKHQde (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 11:33:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:35776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727296AbfKHQdd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 11:33:33 -0500
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57F42222C4;
        Fri,  8 Nov 2019 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573230813;
        bh=XwDtuCgF+2cYiTgiiWqo6J6xMbsD84WYkbMg0BP2tnI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wScmqRonRCVkpGK2E9opPCR5tYzdE+SBfevm0x+zqESLuZr2SSTz8fuHYVmBmAhQm
         GaEtkvhzsBTipuXEkuk2pTS17iGlzuyBr5JAFMO45iloPjlB2oCemtQUWkWcDEix0l
         az2nR2x/aR8QqQ0j/bGFhBt/wSlP42VRNmmRYpl4=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Dinh Nguyen <dinh.nguyen@intel.com>
Subject: [PATCH 2/2] arm64: dts: add NAND board files for Stratix10 and Agilex
Date:   Fri,  8 Nov 2019 10:33:27 -0600
Message-Id: <20191108163327.2917-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191108163327.2917-1-dinguyen@kernel.org>
References: <20191108163327.2917-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Dinh Nguyen <dinh.nguyen@intel.com>

The Stratix10 and Agilex devkits support a separate NAND daughter card.
The NAND daughter card replaces the SDMMC slot that is on the default
daughter card thus requires a separate board dts file.

add socfpga_agilex_socdk_nand.dts

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/altera/Makefile           |   3 +-
 .../altera/socfpga_stratix10_socdk_nand.dts   | 225 ++++++++++++++++++
 arch/arm64/boot/dts/intel/Makefile            |   3 +-
 .../dts/intel/socfpga_agilex_socdk_nand.dts   | 136 +++++++++++
 4 files changed, 365 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 27bb925adc8d..10119c7ab437 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_STRATIX10) += socfpga_stratix10_socdk.dtb
+dtb-$(CONFIG_ARCH_STRATIX10) += socfpga_stratix10_socdk.dtb \
+				socfpga_stratix10_socdk_nand.dtb
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
new file mode 100644
index 000000000000..d18f894373b4
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright Altera Corporation (C) 2015. All rights reserved.
+ */
+
+#include "socfpga_stratix10.dtsi"
+
+/ {
+	model = "SoCFPGA Stratix 10 SoCDK";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		hps0 {
+			label = "hps_led0";
+			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		hps1 {
+			label = "hps_led1";
+			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		hps2 {
+			label = "hps_led2";
+			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	ref_033v: 033-v-ref {
+		compatible = "regulator-fixed";
+		regulator-name = "0.33V";
+		regulator-min-microvolt = <330000>;
+		regulator-max-microvolt = <330000>;
+	};
+
+	soc {
+		clocks {
+			osc1 {
+				clock-frequency = <25000000>;
+			};
+		};
+
+		eccmgr {
+			sdmmca-ecc@ff8c8c00 {
+				compatible = "altr,socfpga-s10-sdmmc-ecc",
+					     "altr,socfpga-sdmmc-ecc";
+				reg = <0xff8c8c00 0x100>;
+				altr,ecc-parent = <&mmc>;
+				interrupts = <14 4>,
+					     <15 4>;
+			};
+		};
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&phy0>;
+
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <4>;
+
+			txd0-skew-ps = <0>; /* -420ps */
+			txd1-skew-ps = <0>; /* -420ps */
+			txd2-skew-ps = <0>; /* -420ps */
+			txd3-skew-ps = <0>; /* -420ps */
+			rxd0-skew-ps = <420>; /* 0ps */
+			rxd1-skew-ps = <420>; /* 0ps */
+			rxd2-skew-ps = <420>; /* 0ps */
+			rxd3-skew-ps = <420>; /* 0ps */
+			txen-skew-ps = <0>; /* -420ps */
+			txc-skew-ps = <900>; /* 0ps */
+			rxdv-skew-ps = <420>; /* 0ps */
+			rxc-skew-ps = <1680>; /* 780ps */
+		};
+	};
+};
+
+&nand {
+	status = "okay";
+	nand-bus-width = <16>;
+
+	flash@0 {
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0 0x200000>;
+			};
+
+			partition@200000 {
+				label = "env";
+				reg = <0x200000 0x40000>;
+			};
+
+			partition@240000 {
+				label = "dtb";
+				reg = <0x240000 0x40000>;
+			};
+
+			partition@280000 {
+				label = "kernel";
+				reg = <0x280000 0x2000000>;
+			};
+
+			partition@2280000 {
+				label = "misc";
+				reg = <0x2280000 0x2000000>;
+			};
+
+			partition@4280000 {
+				label = "rootfs";
+				reg = <0x4280000 0x3bd0000>;
+			};
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <100000>;
+	i2c-sda-falling-time-ns = <890>;  /* hcnt */
+	i2c-sdl-falling-time-ns = <890>;  /* lcnt */
+
+	adc@14 {
+		compatible = "lltc,ltc2497";
+		reg = <0x14>;
+		vref-supply = <&ref_033v>;
+	};
+
+	temp@4c {
+		compatible = "maxim,max1619";
+		reg = <0x4c>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+	};
+};
+
+&qspi {
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "n25q00a";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+
+		m25p,fast-read;
+		cdns,page-size = <256>;
+		cdns,block-size = <16>;
+		cdns,read-delay = <1>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x034B0000>;
+			};
+
+			qspi_rootfs: partition@4000000 {
+				label = "Root Filesystem - JFFS2";
+				reg = <0x034B0000 0x0EB50000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 1253af30da8e..40cb16e8c814 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_AGILEX) += socfpga_agilex_socdk.dtb
+dtb-$(CONFIG_ARCH_AGILEX) += socfpga_agilex_socdk.dtb \
+			     socfpga_agilex_socdk_nand.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
new file mode 100644
index 000000000000..90618881854a
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier:     GPL-2.0
+/*
+ * Copyright (C) 2019, Intel Corporation
+ */
+#include "socfpga_agilex.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex SoCDK";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		hps0 {
+			label = "hps_led0";
+			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		hps1 {
+			label = "hps_led1";
+			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		hps2 {
+			label = "hps_led2";
+			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	soc {
+		clocks {
+			osc1 {
+				clock-frequency = <25000000>;
+			};
+		};
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&phy0>;
+
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <4>;
+
+			txd0-skew-ps = <0>; /* -420ps */
+			txd1-skew-ps = <0>; /* -420ps */
+			txd2-skew-ps = <0>; /* -420ps */
+			txd3-skew-ps = <0>; /* -420ps */
+			rxd0-skew-ps = <420>; /* 0ps */
+			rxd1-skew-ps = <420>; /* 0ps */
+			rxd2-skew-ps = <420>; /* 0ps */
+			rxd3-skew-ps = <420>; /* 0ps */
+			txen-skew-ps = <0>; /* -420ps */
+			txc-skew-ps = <900>; /* 0ps */
+			rxdv-skew-ps = <420>; /* 0ps */
+			rxc-skew-ps = <1680>; /* 780ps */
+		};
+	};
+};
+
+&nand {
+	status = "okay";
+	nand-bus-width = <16>;
+
+	flash@0 {
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			partition@0 {
+				label = "u-boot";
+				reg = <0 0x200000>;
+			};
+			partition@200000 {
+				label = "env";
+				reg = <0x200000 0x40000>;
+			};
+			partition@240000 {
+				label = "dtb";
+				reg = <0x240000 0x40000>;
+			};
+			partition@280000 {
+				label = "kernel";
+				reg = <0x280000 0x2000000>;
+			};
+			partition@2280000 {
+				label = "misc";
+				reg = <0x2280000 0x2000000>;
+			};
+			partition@4280000 {
+				label = "rootfs";
+				reg = <0x4280000 0x3bd0000>;
+			};
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
-- 
2.20.0

