Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C63C43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:41:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2011206D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jHxIxmQy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbfLPMlj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 07:41:39 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:38982 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727512AbfLPMlj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 07:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=640pafii4BaTm6pAUfNoSe2SO1K5SZva34WQkqC+OoY=; b=jHxIxmQyaK3LPBsau1MMPbfa9m
        zRR/IgxT/oFPHpiLwBgh+Jwrt4GKxcexS9KRgnwJEOoqdQ5Y33qu3SYn9/i5xEIsedi9HyUjSq8vy
        AiPzUY5o6+tPSlbhccT8LGuQFvDwFAhn23dK7TArcxNeLC2nrOeiD8wJoFkVrFkl2hrBXQ2XlFwAn
        pTnddiMlKIDae4GrgsyKFU9/seWDUhzvtHTKUafcDEzeAg3bgd0lNKj//p043oWasDjN/kdDP9/gW
        i2OvEf+yo0St0cF67QJybvylXAEg3xjPT1YHOX8z/ki0Qkmg9OWZvURAA4f2HeLxbu6d8FKz85oaC
        omPt/xdw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:47618 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igpgk-0007Qu-Hq; Mon, 16 Dec 2019 12:41:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igpgj-0008Ql-0x; Mon, 16 Dec 2019 12:41:25 +0000
In-Reply-To: <20191216124042.GH25745@shell.armlinux.org.uk>
References: <20191216124042.GH25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: lx2160a: add dts for CEX7 platforms
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igpgj-0008Ql-0x@rmk-PC.armlinux.org.uk>
Date:   Mon, 16 Dec 2019 12:41:25 +0000
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Rabeeh Khoury <rabeeh@solid-run.com>

The device tree enables the following features -
1. dpmac17 RGMII MAC connected to Atheros AR8035 phy
2. 2x MDIO busses
3. 2x USB 3.0 controllers
4. 4x SATA ports
5. MT35X 512Mb SPI flash
6. Temperature sensor on i2c0 channel 3
7. AMC6821 temperature and PWM fan controller (not fitted)

The module supports AMC6821 PWM controller which is not currently
assembled on currently available Com Express 7 hardware.

This commit adds support for the Clearfog CX and Honeycomb variants,
which are indentical in this patch, but once QSFP support is finished,
only the Clearfog CX will have a QSFP description.

Signed-off-by: Rabeeh Khoury <rabeeh@solid-run.com>
[Add Makefile patch, split into clearfog-cx and honeycomb variants,
reworded commit -- rmk]
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../boot/dts/freescale/fsl-lx2160a-cex7.dtsi  | 127 ++++++++++++++++++
 .../dts/freescale/fsl-lx2160a-clearfog-cx.dts |  15 +++
 .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |  57 ++++++++
 .../dts/freescale/fsl-lx2160a-honeycomb.dts   |  15 +++
 5 files changed, 216 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 93fce8f0c66d..b4d696e64625 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -18,6 +18,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-rdb.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-clearfog-cx.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
new file mode 100644
index 000000000000..071e21678f77
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for LX2160A-CEx7
+//
+// Copyright 2019 SolidRun Ltd.
+
+/dts-v1/;
+
+#include "fsl-lx2160a.dtsi"
+
+/ {
+	model = "SolidRun LX2160A COM Express Type 7 module";
+	compatible = "solidrun,lx2160a-cex7", "fsl,lx2160a";
+
+	aliases {
+		crypto = &crypto;
+	};
+
+	sb_3v3: regulator-sb3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "RT7290";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&crypto {
+	status = "okay";
+};
+
+&dpmac17 {
+	phy-handle = <&rgmii_phy1>;
+	phy-connection-type = "rgmii-id";
+};
+
+&emdio1 {
+	status = "okay";
+
+	rgmii_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+&esdhc1 {
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	bus-width = <8>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9547";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			fan-temperature-ctrlr@18 {
+				compatible = "ti,amc6821";
+				reg = <0x18>;
+				cooling-min-state = <0>;
+				cooling-max-state = <9>;
+				#cooling-cells = <2>;
+			};
+		};
+
+		i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			temperature-sensor@48 {
+				compatible = "nxp,sa56004";
+				reg = <0x48>;
+				vcc-supply = <&sb_3v3>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+
+	rtc@51 {
+		compatible = "nxp,pcf2129";
+		reg = <0x51>;
+		// IRQ10_B
+		interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&fspi {
+	status = "okay";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "micron,m25p80";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		reg = <0>;
+		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
+		spi-rx-bus-width = <8>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
new file mode 100644
index 000000000000..86a9b771428d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for LX2160A Clearfog CX board
+//
+// Copyright 2019 SolidRun Ltd.
+
+/dts-v1/;
+
+#include "fsl-lx2160a-clearfog-itx.dtsi"
+
+/ {
+	model = "SolidRun LX2160A Clearfog CX";
+	compatible = "solidrun,clearfog-cx",
+		"solidrun,lx2160a-cex7", "fsl,lx2160a";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
new file mode 100644
index 000000000000..f3741a32e868
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for LX2160A Clearfog ITX board; this contains the
+// common parts shared between the Clearfog CX and Honeycomb builds.
+//
+// Copyright 2019 SolidRun Ltd.
+
+/dts-v1/;
+
+#include "fsl-lx2160a-cex7.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&emdio2 {
+	status = "okay";
+};
+
+&esdhc0 {
+	sd-uhs-sdr104;
+	sd-uhs-sdr50;
+	sd-uhs-sdr25;
+	sd-uhs-sdr12;
+	status = "okay";
+};
+
+&sata0 {
+	status = "okay";
+};
+
+&sata1 {
+	status = "okay";
+};
+
+&sata2 {
+	status = "okay";
+};
+
+&sata3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
new file mode 100644
index 000000000000..fe19f3009ea5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for LX2160A Honeycomb board
+//
+// Copyright 2019 SolidRun Ltd.
+
+/dts-v1/;
+
+#include "fsl-lx2160a-clearfog-itx.dtsi"
+
+/ {
+	model = "SolidRun LX2160A Honeycomb";
+	compatible = "solidrun,honeycomb",
+		"solidrun,lx2160a-cex7", "fsl,lx2160a";
+};
-- 
2.20.1

