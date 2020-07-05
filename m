Return-Path: <SRS0=PeIc=AQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51732C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jul 2020 13:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 205072070B
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jul 2020 13:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="ImYBBAQu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgGENBr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Jul 2020 09:01:47 -0400
Received: from gproxy6-pub.mail.unifiedlayer.com ([67.222.39.168]:37008 "EHLO
        gproxy6-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726792AbgGENBr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Jul 2020 09:01:47 -0400
Received: from CMGW (unknown [10.9.0.13])
        by gproxy6.mail.unifiedlayer.com (Postfix) with ESMTP id 761F51E07E1
        for <devicetree@vger.kernel.org>; Sun,  5 Jul 2020 07:01:42 -0600 (MDT)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id s4H6jqvNPUY3Ds4H7jXxMo; Sun, 05 Jul 2020 07:01:42 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.2 cv=QpUu5R6d c=1 sm=1 tr=0
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=LfuyaZh/8e9VOkaVZk0aRw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=_RQrkK6FrEwA:10 a=oz0wMknONp8A:10
 a=vU9dKmh3AAAA:8 a=tc3lRw1TNdAtvppHo30A:9 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=MKutPIaDJX1PyoHZVK7DcRh8mCOgDHihHLjZJlEZHwg=; b=ImYBBAQuM2byPm6atMvaqW2AEC
        ZWUrT7DP8aspkZjJTEhjBS/qZRAZi+mtZQ1nUqvkYojF1qU+GOQxo6UOO/IiDGnwnP+G2xgEbku1u
        bUDtfGTbWmmz+oBOkPzSi48QNP+fT8Y8NJCg+f5Dn69XzA8odjx7OiUbBxKhbUTwgEdhmubzId2CE
        29OUZZ+IAgxvtDWDzKIeCtqBeo1fq26oRpxDPQaLc/QVyzFeASAyvDpM7DocCqzi8Vr86sTguJxWS
        o4ofkCPBDagzGmo6H1HrMB6pmDJ1Bq77P/quvcFFqeENXj/sSdenDnke6Q/h/UIUNKplCfe/FZ7YE
        a2nlAizg==;
Received: from dslb-002-205-076-031.002.205.pools.vodafone-ip.de ([2.205.76.31]:38936 helo=arch.fritz.box)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <parthiban@linumiz.com>)
        id 1js4H5-002K3K-4P; Sun, 05 Jul 2020 13:01:39 +0000
From:   Parthiban Nallathambi <parthiban@linumiz.com>
To:     robh@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Parthiban Nallathambi <parthiban@linumiz.com>
Subject: [PATCH v3 2/2] ARM: dts: imx6ull: add MYiR MYS-6ULX SBC
Date:   Sun,  5 Jul 2020 15:01:26 +0200
Message-Id: <20200705130126.64285-2-parthiban@linumiz.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705130126.64285-1-parthiban@linumiz.com>
References: <20200705130126.64285-1-parthiban@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 2.205.76.31
X-Source-L: No
X-Exim-ID: 1js4H5-002K3K-4P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: dslb-002-205-076-031.002.205.pools.vodafone-ip.de (arch.fritz.box) [2.205.76.31]:38936
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 10
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the MYiR imx6ULL based single board computer
equipped with on board 256MB NAND & RAM. The board also
provides expansion header for expansion board, but this
commit adds only support for SBC.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---

Notes:
    Changelog v3:
    - use only 'eval' as compatability and rename devicetree
    name to -eval suffix
    
    Changelog v2:
    - moved regulator under root node
    - status property removed

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/imx6ull-myir-mys-6ulx-eval.dts   |  19 ++
 arch/arm/boot/dts/imx6ull-myir-mys-6ulx.dtsi  | 238 ++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-myir-mys-6ulx.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e6a1cac0bfc7..5e07ed88970f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -617,6 +617,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-wifi-eval-v3.dtb \
+	imx6ull-myir-mys-6ulx-eval.dtb \
 	imx6ull-opos6uldev.dtb \
 	imx6ull-phytec-segin-ff-rdk-nand.dtb \
 	imx6ull-phytec-segin-ff-rdk-emmc.dtb \
diff --git a/arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dts b/arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dts
new file mode 100644
index 000000000000..e086d916c951
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Linumiz
+ * Author: Parthiban Nallathambi <parthiban@linumiz.com>
+ */
+
+/dts-v1/;
+#include "imx6ull.dtsi"
+#include "imx6ull-myir-mys-6ulx.dtsi"
+
+/ {
+	model = "MYiR i.MX6ULL MYS-6ULX Single Board Computer with NAND";
+	compatible = "myir,imx6ull-mys-6ulx-eval", "myir,imx6ull-mys-6ulx",
+		     "fsl,imx6ull";
+};
+
+&gpmi {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/imx6ull-myir-mys-6ulx.dtsi
new file mode 100644
index 000000000000..03365a1ca8e6
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-myir-mys-6ulx.dtsi
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Linumiz
+ * Author: Parthiban Nallathambi <parthiban@linumiz.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	model = "MYiR MYS-6ULX Single Board Computer";
+	compatible = "myir,imx6ull-mys-6ulx", "fsl,imx6ull";
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	reg_vdd_5v: regulator-vdd-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_vdd_5v>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	phy-supply = <&reg_vdd_3v3>;
+	status = "okay";
+
+	mdio: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+			interrupt-parent = <&gpio5>;
+			interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clks IMX6UL_CLK_ENET_REF>;
+			clock-names = "rmii-ref";
+		};
+	};
+};
+
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
+	status = "disabled";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb_otg1_id>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	cd-gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	keep-power-in-suspend;
+	wakeup-source;
+	vmmc-supply = <&reg_vdd_3v3>;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	keep-power-in-suspend;
+	vmmc-supply = <&reg_vdd_3v3>;
+};
+
+&iomuxc {
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
+			MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0
+		>;
+	};
+
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0x0b0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0x0b0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0x0b0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0x0b000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0x0b0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0x0b0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0x0b0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0x0b0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0x0b0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0x0b0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0x0b0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0x0b0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0x0b0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0x0b0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0x0b0b1
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
+		>;
+	};
+
+	pinctrl_usb_otg1_id: usbotg1idgrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+			MX6UL_PAD_UART1_RTS_B__GPIO1_IO19	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100b9
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170b9
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170b9
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170b9
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170b9
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170b9
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170b9
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170b9
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170b9
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100f9
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170f9
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170f9
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170f9
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170f9
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170f9
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170f9
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170f9
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170f9
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170f9
+		>;
+	};
+};
-- 
2.27.0

