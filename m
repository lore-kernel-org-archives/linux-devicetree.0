Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56007C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A9932065C
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UpF7qKPL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgG1GtD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 02:49:03 -0400
Received: from mail-eopbgr40076.outbound.protection.outlook.com ([40.107.4.76]:60898
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726967AbgG1GtD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jul 2020 02:49:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBlB4+UxmezQknL/HJYLkYawQfil4N5pgm9UREkEDj4j0KvGSL99eyQhL4o2ohg31Kdhfzm4IYE9kBzBJ5EQ00LgCB9ZjH6YSXGLYImCzqMXu0MsPLtoK15UNEDebbpFPhUW3sIuCjBdtNHjCE4deqshrPCNYawf2wg5HmDgBqTffMfiDVqWgWYDSXh1d5gJUlNHb/IEUA9AOdmlzFOcnatF2h62VprHCk6Hi7kmEA4j8izwnlOleECdxqZ9VCTimNXd81CYqzaQqow5+9v6glLueqUY4QI7WC2xPGtyftzLX4D6g2gEpzXye6hGQbktZcaVHsSaML+N1cLUx6dVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuzVpPfU7g1SBahePPAMpaz3Bf4N4k+g/L+aL1ClAO0=;
 b=m5TG17BkjxnWMZlSA/PTLWVsepicKDrpe7+N7ZaSZEde4yhbcDNie9+Mrtz5LTqmrgaf1Vyp9pqBX130zbpddzxWXKeH/8mV4DumpyTRc7FoJcTdymn90ZlJmJBnXABxHjioZMYQnZIO747diYbbm6Mo8zi/Iyq1TE0r8/Zl2F5A6GBJKOpe+dKCWiNv4U/EX0cyy0G5YYxVDbqVRZosNhITsLrkHyeiWQ4YRdh7pOu+TH9PWdmxyQ3W9phTTqNTJXrp0k5L64wD7fwIakNPDBRlbEcOR6XC+uVNM00pmKBOqRW8rUxyjwAkD6qm1mXbxEnGZZT4VhGTy+js9OJjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuzVpPfU7g1SBahePPAMpaz3Bf4N4k+g/L+aL1ClAO0=;
 b=UpF7qKPL+y7EZCuhw4MDLlO2KtvNMZfgUOw4U08IyGpjpp0b4bkYdso3Clf6sljzHcS2Gd658PDS3/CkdI5Dhyls6Mqe8mEMf7i3uh0HsUj8Eg+HbCyKHRHHCWmZSEYjiniBUsvdgknlKZnOdkKl8QjX/hX6ocWLAvM1HXOy9qY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM0PR0402MB3505.eurprd04.prod.outlook.com (2603:10a6:208:25::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 06:48:46 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::ed9d:4503:443a:3f4f]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::ed9d:4503:443a:3f4f%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 06:48:46 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: imx8mm: Add imx8mm ddr4 evk board support
Date:   Tue, 28 Jul 2020 14:44:01 +0800
Message-Id: <1595918641-2325-3-git-send-email-ping.bai@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595918641-2325-1-git-send-email-ping.bai@nxp.com>
References: <1595918641-2325-1-git-send-email-ping.bai@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0198.apcprd04.prod.outlook.com
 (2603:1096:4:14::36) To AM0PR04MB4915.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR04CA0198.apcprd04.prod.outlook.com (2603:1096:4:14::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3216.23 via Frontend Transport; Tue, 28 Jul 2020 06:48:42 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f2692a5f-7755-4ab5-2a39-08d832c246b7
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3505:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3505CCDF3039DC475889913687730@AM0PR0402MB3505.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXTgHde7xOVJ5eAZIZLL0vCExzYg28Je9qqMtJjdiO+4SaH4jU6ayeP2id3saIgUmTXOm/gxdPqlEvMvo4Yjin2LBwnXXaEI27eYPIowZ9rPW6wmjcO2/aKmeJOFBle2ef24facfuYTUqIBwmh9Xm02CJt6rH4kIjjyrIvXXsT7te9w+htOUXm/9cmelNwzcgvU1jWoK1HXHs9IhNC7vWfMbKsuxujzo+6xU3VmUj6H/HGaAxWAyK9s0YI+HQy7GLTEhd9aVBaeEWs9ilh4OqVfA5bVCTyP+XjDQg+/EsIwSG4i839Xpien7XyA89qO5DPcm/dOX+QrygAIKDe5oFj7gdhmJXEztKvPErsrWHcpIWEq5cjDy/quhX56x840sGqRNLmVnXtaqZlJTI2Jabg/zkAfWVI9SsDKKQL77n4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(8936002)(186003)(16526019)(26005)(86362001)(2616005)(66946007)(956004)(52116002)(478600001)(6506007)(6512007)(36756003)(5660300002)(316002)(69590400007)(6486002)(6666004)(2906002)(8676002)(66476007)(4326008)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: pE4Ei1I6MZt/A7/OwmNprfUnuhFaG00vsZuax7xIrHYfIHU4EA7+q8IdLTiX4XAfTCith9Tn/f/uN3ezS0CP3K3Vs6ABDkyVK66wJJci660Qjs2tL4tOKVJ3RxJ1n1Ssopbx6phMqOhotE7vin+UYW8pBXfuPmsM37YUW+ww0gjp5Z3MjFboA29mtbJRAICLwlOf/0KV+eEpC+8ykxpN76LdNmuCQ17wSSpag7Rp63UoN25QRFTp+FhT9aQFUtYHegymMe8wRjcAmvSXVkmYaYTSLGo3bTee06pOoSGVAscurTg6gvviBifaqrplwS31KYZpms7mQjylxJ3grrKKEFLU9zlBMVtF3mwjdlj4wZrzr79rsV7D7QoWy5hh4lHvAbDNKag+nzhZNROi/TI5IMvye/lqsa7490h6b8DaViOPpFxOVSLeJXh9DwZ2EDjAWDi97HIpooo7s+X2bXda06xV7x7a9uISH0uQc6PmVAQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2692a5f-7755-4ab5-2a39-08d832c246b7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 06:48:46.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDW4vntS3HT+ZrYqyuqgaUJ4YYTYuh9vMR0Gytw1AGIQFGtEL8XnCAKFBB4qY4vzONkGmol2wRNn6biudOZ/RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3505
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the board dts support for i.MX8MM DDR4 EVK board.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8mm-ddr4-evk.dts    | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a39f0a1723e0..417c552480f2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts
new file mode 100644
index 000000000000..9cd89182218e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8mm-evk.dtsi"
+
+/ {
+	model = "FSL i.MX8MM DDR4 EVK with CYW43455 WIFI/BT board";
+	compatible = "fsl,imx8mm-ddr4-evk", "fsl,imx8mm";
+
+	leds {
+		pinctrl-0 = <&pinctrl_gpio_led_2>;
+
+		status {
+			gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&ddrc {
+	operating-points-v2 = <&ddrc_opp_table>;
+
+	ddrc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-25M {
+			opp-hz = /bits/ 64 <25000000>;
+		};
+
+		opp-100M {
+			opp-hz = /bits/ 64 <100000000>;
+		};
+
+		opp-600M {
+			opp-hz = /bits/ 64 <600000000>;
+		};
+	};
+};
+
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand_1>;
+	status = "okay";
+	nand-on-flash-bbt;
+};
+
+&iomuxc {
+	pinctrl_gpmi_nand_1: gpmi-nand-1 {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_ALE_RAWNAND_ALE		0x00000096
+			MX8MM_IOMUXC_NAND_CE0_B_RAWNAND_CE0_B		0x00000096
+			MX8MM_IOMUXC_NAND_CE1_B_RAWNAND_CE1_B		0x00000096
+			MX8MM_IOMUXC_NAND_CLE_RAWNAND_CLE		0x00000096
+			MX8MM_IOMUXC_NAND_DATA00_RAWNAND_DATA00		0x00000096
+			MX8MM_IOMUXC_NAND_DATA01_RAWNAND_DATA01		0x00000096
+			MX8MM_IOMUXC_NAND_DATA02_RAWNAND_DATA02		0x00000096
+			MX8MM_IOMUXC_NAND_DATA03_RAWNAND_DATA03		0x00000096
+			MX8MM_IOMUXC_NAND_DATA04_RAWNAND_DATA04		0x00000096
+			MX8MM_IOMUXC_NAND_DATA05_RAWNAND_DATA05		0x00000096
+			MX8MM_IOMUXC_NAND_DATA06_RAWNAND_DATA06		0x00000096
+			MX8MM_IOMUXC_NAND_DATA07_RAWNAND_DATA07		0x00000096
+			MX8MM_IOMUXC_NAND_RE_B_RAWNAND_RE_B		0x00000096
+			MX8MM_IOMUXC_NAND_READY_B_RAWNAND_READY_B	0x00000056
+			MX8MM_IOMUXC_NAND_WE_B_RAWNAND_WE_B		0x00000096
+			MX8MM_IOMUXC_NAND_WP_B_RAWNAND_WP_B		0x00000096
+		>;
+	};
+
+	pinctrl_gpio_led_2: gpioled2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_CE3_B_GPIO3_IO4	0x19
+		>;
+	};
+};
-- 
2.26.2

