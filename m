Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF57C433E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:48:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76177207E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:48:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="sFWAgTz8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgG1Gsu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 02:48:50 -0400
Received: from mail-eopbgr40076.outbound.protection.outlook.com ([40.107.4.76]:60898
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726874AbgG1Gst (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jul 2020 02:48:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2JMBteDnok5wHpsY8T5k6pSO2bjhyUPDSqY9gTV82fcSHjgqK2UWNUql6YehA0DYPsXxnCmrCVA724DXKCRcK3H1ZI0f1YsXdEHFWkD4O0sl0tEynfonrdGmozWvCcp7xcO3VXuVBuxWXw33O/N2WLgK91FLXp7s0Tbck5VbTpXtKiJkUcofZROGvrc6Wovh3dNQ9yMFRwOVO4VId4CY5rcYNalKDWBuAZKaTaRD8l7u2Fi+963SVdaTwRVh4yLw1voN1qZfoSof1jrJ4//ZGjD7JPdpi1v7kWmWpx4vkHxJsVMD5Bko8SjN0yok9zvpVxyAewBEs3ln3MQa8cXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu+ZKyKHK2NSatZIFTR0YCJx5u4PqBjdd4iTQbb1oGw=;
 b=d9TfPCj/kA6BQU5ZMi60ErNARo8P0TA01+D+j7FB8JXNXGJ68YNFv7uN7F5Qqx1FLAaetpybevWtsJoiEaIALQoQex75qb6+P/6Sh98lSCq+k1ghz45+jjuwAeEf8KtOyzYJiLbTwPSDiVvSCcY9H9hYXSHbYjkUe0+XvZCECDOjTpbcA+ZLYwRZBH7yq/bGqtXYzfSIBjS0yzz/js9k9fyOiDH1qI3rfGjtyDQ/Ar1oOVpDrb2nvjQVARsaoKxIMBTAs9NwApzhfQhVa5pterdu5i/qEL6KbQKI5J5rpagg+24Vl+IlLqX8Nin2aWe4nX9En6X/kD+ne66oWrob7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu+ZKyKHK2NSatZIFTR0YCJx5u4PqBjdd4iTQbb1oGw=;
 b=sFWAgTz8UxbWbR6s43NtjjOFJZ51IEE/XUEQp9+fc1tIziSNB+R6pElJNKW53BU4bHdWr/N+5PDaq2n8mUZ0CM64xJY4y4ma4Dhf8clLAqqppXNaK07p8vcwdXHaeGJBQBQAtPTWs3eQv4jY5uaeIEzX3gDnGXER3VNVCCN4blc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM0PR0402MB3505.eurprd04.prod.outlook.com (2603:10a6:208:25::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 06:48:41 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::ed9d:4503:443a:3f4f]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::ed9d:4503:443a:3f4f%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 06:48:41 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: imx8mm: Split the imx8mm evk board dts to a common dtsi
Date:   Tue, 28 Jul 2020 14:44:00 +0800
Message-Id: <1595918641-2325-2-git-send-email-ping.bai@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595918641-2325-1-git-send-email-ping.bai@nxp.com>
References: <1595918641-2325-1-git-send-email-ping.bai@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0198.apcprd04.prod.outlook.com
 (2603:1096:4:14::36) To AM0PR04MB4915.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR04CA0198.apcprd04.prod.outlook.com (2603:1096:4:14::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3216.23 via Frontend Transport; Tue, 28 Jul 2020 06:48:34 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 991f4140-00ef-4636-773c-08d832c24184
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3505:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3505809DA4E8FB05B07B9B7687730@AM0PR0402MB3505.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hrzaps1nN+5nPAwRLmc3JMphzfZwQD6AM/koUV/exBaTP8YxJBldNWg0OrrDQJhUmQcbP/CarPePczXn1FAgtNd/6W66C6CBbkGkUw7pS+edGkQc8QQBxYBmbhxq7hUvj+VnSbHE/8h2gT6BD8RctMfFQqlF2hnLIc/1mocKFAZve1caJhbOmhNZkkIxD2esNclp+pwiFH0dfynTCX8xTKR6uBBz2Oc0PR98zRWjDplLMslxhKZMeaWAm1ycF6e8hqTlbpgyluleWEmNrBoZz3fCcY8RCTvyeUrTzQtDRngbSSOC+l8uzeSQpl9uTy1BJyWC+y4LTuTKYqVrubsKdrHArmtu49tIedT7O1qQU8y2ALmXvkexnK8egjK+3AXMGnph8nOEZFBoocVUJpjJ1SmU2+fhlMx6NKGyzva5SJhfdFdN4iSPahTeaa7uCHPgb8VVA1JZOEwtDKcc+aWAJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(8936002)(186003)(16526019)(26005)(86362001)(2616005)(66946007)(956004)(52116002)(478600001)(6506007)(83380400001)(6512007)(30864003)(36756003)(5660300002)(316002)(69590400007)(6486002)(6666004)(2906002)(8676002)(66476007)(4326008)(66556008)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: rn6eM5vMBHdQiixccq3Zfwn5Y6z2PwZm4fsWrB9cG0NyVEhfYDCLUIRDwifE6fj3Cf16g54zCraXOqx/nXRwQNUzDaBPsrKBRQOANwRAuKHEl7JrklwT6vS8G2T8Y3ysXcJdz2d871ym/mwMycjS7BOw07X3QZun7dr85rkKm/YFC5pOD2sYpn97To17c+PqAaQSzULneA1w22+9q/yipbr16UkWxIgo0WZ9GAelUWBu0RdbjODTSwCAPkdrUCrfNtwJmTNpKCalPtE8hab4+A+WtQwXnrKN/qMOPBluToWs5YeAbDYXUhyxNeRxFzhlXMHN4QfUfH78/YCXmefkWXG3EF6icuFjieFhOo2x9L0fDWlHMmqIIWX94VMoR1lS3jIxWH+RXQrhhydAs7bFIgTbu6q/B3M0r+ymj/GiUj0m5LBHHpgsuD2m3cxt8EwsVvpIq36n6ONPP9jzNIuRFF9dg+neylLNlbUZWPjaZkM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991f4140-00ef-4636-773c-08d832c24184
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 06:48:41.0310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqJGY9/AA5BPWzpBEVlSkjse+vPYmjlkd/LKij8+m+lySYVznrjL5jkYS67kxefC+NFs24/Sv0G2hrPwqwil/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3505
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There are two type of i.MX8MM EVK board, one is populated with
LPDDR4(default dts), and one is populated with DDR4. these two
boards share most of the board design, but still have some difference.
imx8mm-evk has emmc support, imx8mm-ddr4-evk has gpmi nand support.
And also, the BT/WIFI module is different. So move the common dts
part into imx8mm-evk.dtsi for reuse.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts  | 528 ++----------------
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 470 ++++++++++++++++
 2 files changed, 506 insertions(+), 492 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index 0f1d7f8aeac4..09abdef8c166 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -1,97 +1,16 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2019 NXP
+ * Copyright 2019-2020 NXP
  */
 
 /dts-v1/;
 
 #include <dt-bindings/usb/pd.h>
-#include "imx8mm.dtsi"
+#include "imx8mm-evk.dtsi"
 
 / {
 	model = "FSL i.MX8MM EVK board";
 	compatible = "fsl,imx8mm-evk", "fsl,imx8mm";
-
-	chosen {
-		stdout-path = &uart2;
-	};
-
-	memory@40000000 {
-		device_type = "memory";
-		reg = <0x0 0x40000000 0 0x80000000>;
-	};
-
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_led>;
-
-		status {
-			label = "status";
-			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
-		};
-	};
-
-	reg_usdhc2_vmmc: regulator-usdhc2 {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
-		regulator-name = "VSD_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	wm8524: audio-codec {
-		#sound-dai-cells = <0>;
-		compatible = "wlf,wm8524";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_wlf>;
-		wlf,mute-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
-	};
-
-	sound-wm8524 {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "wm8524-audio";
-		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&cpudai>;
-		simple-audio-card,bitclock-master = <&cpudai>;
-		simple-audio-card,widgets =
-			"Line", "Left Line Out Jack",
-			"Line", "Right Line Out Jack";
-		simple-audio-card,routing =
-			"Left Line Out Jack", "LINEVOUTL",
-			"Right Line Out Jack", "LINEVOUTR";
-
-		cpudai: simple-audio-card,cpu {
-			sound-dai = <&sai3>;
-			dai-tdm-slot-num = <2>;
-			dai-tdm-slot-width = <32>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&wm8524>;
-			clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
-		};
-	};
-};
-
-&A53_0 {
-	cpu-supply = <&buck2_reg>;
-};
-
-&A53_1 {
-	cpu-supply = <&buck2_reg>;
-};
-
-&A53_2 {
-	cpu-supply = <&buck2_reg>;
-};
-
-&A53_3 {
-	cpu-supply = <&buck2_reg>;
 };
 
 &ddrc {
@@ -114,238 +33,6 @@ opp-750M {
 	};
 };
 
-&fec1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_fec1>;
-	phy-mode = "rgmii-id";
-	phy-handle = <&ethphy0>;
-	phy-reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
-	phy-reset-duration = <10>;
-	fsl,magic-packet;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ethphy0: ethernet-phy@0 {
-			compatible = "ethernet-phy-ieee802.3-c22";
-			reg = <0>;
-		};
-	};
-};
-
-&i2c1 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c1>;
-	status = "okay";
-
-	pmic@4b {
-		compatible = "rohm,bd71847";
-		reg = <0x4b>;
-		pinctrl-0 = <&pinctrl_pmic>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <3 GPIO_ACTIVE_LOW>;
-		rohm,reset-snvs-powered;
-
-		regulators {
-			buck1_reg: BUCK1 {
-				regulator-name = "BUCK1";
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-boot-on;
-				regulator-always-on;
-				regulator-ramp-delay = <1250>;
-			};
-
-			buck2_reg: BUCK2 {
-				regulator-name = "BUCK2";
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-boot-on;
-				regulator-always-on;
-				regulator-ramp-delay = <1250>;
-				rohm,dvs-run-voltage = <1000000>;
-				rohm,dvs-idle-voltage = <900000>;
-			};
-
-			buck3_reg: BUCK3 {
-				// BUCK5 in datasheet
-				regulator-name = "BUCK3";
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			buck4_reg: BUCK4 {
-				// BUCK6 in datasheet
-				regulator-name = "BUCK4";
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			buck5_reg: BUCK5 {
-				// BUCK7 in datasheet
-				regulator-name = "BUCK5";
-				regulator-min-microvolt = <1605000>;
-				regulator-max-microvolt = <1995000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			buck6_reg: BUCK6 {
-				// BUCK8 in datasheet
-				regulator-name = "BUCK6";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo1_reg: LDO1 {
-				regulator-name = "LDO1";
-				regulator-min-microvolt = <1600000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo2_reg: LDO2 {
-				regulator-name = "LDO2";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <900000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo3_reg: LDO3 {
-				regulator-name = "LDO3";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo4_reg: LDO4 {
-				regulator-name = "LDO4";
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo6_reg: LDO6 {
-				regulator-name = "LDO6";
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-		};
-	};
-};
-
-&i2c2 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c2>;
-	status = "okay";
-
-	ptn5110: tcpc@50 {
-		compatible = "nxp,ptn5110";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_typec1>;
-		reg = <0x50>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <11 8>;
-		status = "okay";
-
-		port {
-			typec1_dr_sw: endpoint {
-				remote-endpoint = <&usb1_drd_sw>;
-			};
-		};
-
-		typec1_con: connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			power-role = "dual";
-			data-role = "dual";
-			try-power-role = "sink";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-				     PDO_VAR(5000, 20000, 3000)>;
-			op-sink-microwatt = <15000000>;
-			self-powered;
-		};
-	};
-};
-
-&i2c3 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c3>;
-	status = "okay";
-
-	pca6416: gpio@20 {
-		compatible = "ti,tca6416";
-		reg = <0x20>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-};
-
-&sai3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sai3>;
-	assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
-	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
-	assigned-clock-rates = <24576000>;
-	status = "okay";
-};
-
-&snvs_pwrkey {
-	status = "okay";
-};
-
-&uart2 { /* console */
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-	status = "okay";
-};
-
-&usbotg1 {
-	dr_mode = "otg";
-	hnp-disable;
-	srp-disable;
-	adp-disable;
-	usb-role-switch;
-	status = "okay";
-
-	port {
-		usb1_drd_sw: endpoint {
-			remote-endpoint = <&typec1_dr_sw>;
-		};
-	};
-};
-
-&usdhc2 {
-	assigned-clocks = <&clk IMX8MM_CLK_USDHC2>;
-	assigned-clock-rates = <200000000>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-	cd-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
-	bus-width = <4>;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-	status = "okay";
-};
-
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
 	assigned-clock-rates = <400000000>;
@@ -358,196 +45,53 @@ &usdhc3 {
 	status = "okay";
 };
 
-&wdog1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdog>;
-	fsl,ext-reset-output;
-	status = "okay";
-};
-
 &iomuxc {
-	pinctrl-names = "default";
-
-	pinctrl_fec1: fec1grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
-			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
-			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
-			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
-			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
-			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
-			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
-			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
-			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
-			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
-			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
-			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
-			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
-			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
-			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
-		>;
-	};
-
-	pinctrl_gpio_led: gpioledgrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
-		>;
-	};
-
-	pinctrl_gpio_wlf: gpiowlfgrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21	0xd6
-		>;
-	};
-
-	pinctrl_i2c1: i2c1grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
-		>;
-	};
-
-	pinctrl_i2c2: i2c2grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL			0x400001c3
-			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA			0x400001c3
-		>;
-	};
-
-	pinctrl_i2c3: i2c3grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
-			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
-		>;
-	};
-
-	pinctrl_pmic: pmicirq {
-		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x41
-		>;
-	};
-
-	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
-		fsl,pins = <
-			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
-		>;
-	};
-
-	pinctrl_sai3: sai3grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC     0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK      0xd6
-			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK        0xd6
-			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0     0xd6
-		>;
-	};
-
-	pinctrl_typec1: typec1grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x159
-		>;
-	};
-
-	pinctrl_uart2: uart2grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
-			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
-		>;
-	};
-
-	pinctrl_usdhc2_gpio: usdhc2grpgpio {
-		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4
-		>;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
-		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
-		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE 		0x190
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE 		0x194
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE 		0x196
-		>;
-	};
-
-	pinctrl_wdog: wdoggrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0xc6
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
 		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
new file mode 100644
index 000000000000..ddb3e8715733
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -0,0 +1,470 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx8mm.dtsi"
+
+/ {
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_led>;
+
+		status {
+			label = "status";
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wm8524: audio-codec {
+		#sound-dai-cells = <0>;
+		compatible = "wlf,wm8524";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_wlf>;
+		wlf,mute-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
+	};
+
+	sound-wm8524 {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "wm8524-audio";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&cpudai>;
+		simple-audio-card,bitclock-master = <&cpudai>;
+		simple-audio-card,widgets =
+			"Line", "Left Line Out Jack",
+			"Line", "Right Line Out Jack";
+		simple-audio-card,routing =
+			"Left Line Out Jack", "LINEVOUTL",
+			"Right Line Out Jack", "LINEVOUTR";
+
+		cpudai: simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&wm8524>;
+			clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
+		};
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	phy-reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <10>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 GPIO_ACTIVE_LOW>;
+		rohm,reset-snvs-powered;
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "BUCK3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "LDO2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "LDO3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "LDO6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec1>;
+		reg = <0x50>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 8>;
+		status = "okay";
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+
+		typec1_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+		};
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	pca6416: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&uart2 { /* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
+		>;
+	};
+
+	pinctrl_gpio_led: gpioledgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
+		>;
+	};
+
+	pinctrl_gpio_wlf: gpiowlfgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21	0xd6
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_pmic: pmicirq {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x41
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC     0xd6
+			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK      0xd6
+			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK        0xd6
+			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0     0xd6
+		>;
+	};
+
+	pinctrl_typec1: typec1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x159
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2grpgpio {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0xc6
+		>;
+	};
+};
-- 
2.26.2

