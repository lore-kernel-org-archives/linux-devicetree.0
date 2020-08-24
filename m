Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65715C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 07:26:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F01C2072D
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 07:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fMAIN9Xy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgHXH0W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 03:26:22 -0400
Received: from mail-eopbgr60074.outbound.protection.outlook.com ([40.107.6.74]:32333
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726119AbgHXH0U (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Aug 2020 03:26:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkbyUo5X84avJM2t6s/ZblqJHRqoPaxGJ2Ryueu7FTLkwprYrQzZ9Eds/Ii7syzz6E4U7hC5pKnzr/XfghQurOJ4UVYTP/LuNsNF+6Mnj4GXk/IiZASZNFk99RWHPKbqmH3G+6WsATHYfHeEe167Wlkt3qiFTcXoLxSU4BtgxeeKeLDkQ1w7zDkfJRnGBfQY1w2XVFqbJieFq9cx3ykm01nWtt1xWAoK1mA91HRIrKepzfNZFSjQPhaYQRFWihQ0MdsA95BhTK0iKQBHRXhPBXpCbr3WGaPuLQ9Jsbsb+jxuJV4mSeUWaBtBR2P3rId9BJRX3oDUr1jO2EuvLtJb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1I15P3KUM55/zH2tDj8f4XU6c+Gixf0yoMwcgxiOLk=;
 b=it157ffTVv0ux1akNO44m++MOs+VJa0E6OwOLfJz95bppByRF6IKFpH+gj+8KLg7RhQcnW+CsM8imstNaZMae0XEB3FaSYvNuTachvE/kPzwID2KbdIZ7tjTb7kK/XkD7d8U+LdUlga2apH53uWuUr+SAy/KgOz7t3vVEdsx0Jn91iJDEujNKQVSKrNeY8Lt8dV6UNe7FCXE/1T6Re0uvJCPng0dR2i0/AHzjb+FIuAN8rShByRsUj2jCUqKiGy6IfBBbrRt0Oq396EOBZEgt+6vU4e2h5x1FPYI09gcNosFeovA9FZADZyRe4VMIEKl9AURb8icPyExwstpSjTKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1I15P3KUM55/zH2tDj8f4XU6c+Gixf0yoMwcgxiOLk=;
 b=fMAIN9XyGAsGAimq39URcxie/iEjPndfDCG0hst2qtK0u+0OeIfk1b9bE9O793QvkP6AvEgre01xbJMWT7AYkqG9VqTv9aOL5bSWqxoodjXXDCNR7Ni8qLZnp8Mb6I+N9sEO17/fOfCybpdcyTNCp4SwNUyanNZOs0P1jL+J2p8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 07:26:16 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3%7]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 07:26:16 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: imx8mm: Add imx8mm ddr4 evk board support
Date:   Mon, 24 Aug 2020 15:20:27 +0800
Message-Id: <1598253627-25797-3-git-send-email-ping.bai@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598253627-25797-1-git-send-email-ping.bai@nxp.com>
References: <1598253627-25797-1-git-send-email-ping.bai@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.3 via Frontend Transport; Mon, 24 Aug 2020 07:26:14 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3f091102-e863-4d9d-47a6-08d847fefcc6
X-MS-TrafficTypeDiagnostic: AM8PR04MB7409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB74091CBE808294C66E7037A487560@AM8PR04MB7409.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9aQbBStnU4035+XcbkyAxYf90IPXw4eMk93nqP+6Qe/GF7Qp6BsIKeKrbj3BklpCnlVm6EeZARUz0rYeRewWI3SPoIe+NUOyWTgsAMkqAoXOPmRMp3ws8lzfUyHuZsGWfhVHpRhBZZYj2hY2wtpuXiJxWkQmZpvHI+jD3yxDFgqv6dutWdVHVnKOsydqKTv93LWtkOnBMmf68PXAy59Pm+/16UetvHoRpdJ4bUwAP5YYYUNwUv8yS+hfNLvSTPrJKOpSJJ5XHcEIp2yFM5HIAvnWGJ5GL7PnxiaPUeJCNb6eJVRpSYz3m3JQbgAlOqjh7eLndU8QUV2IukbR7/vL1vC+3MOTgnyXs1CKAizrKtB08fP8xzKDbYIozHGwxiWj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(8676002)(4326008)(6486002)(6666004)(66476007)(8936002)(2616005)(66556008)(956004)(36756003)(316002)(66946007)(16576012)(5660300002)(186003)(478600001)(26005)(52116002)(86362001)(16526019)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yv/6xvcMl/i2ZOKq4Yyf70WBb+NuNd/QNZgEc8UHDvAvipnAoVTJsFMzwYb3r3lWeHQ1wPqKI5Ws/hOekhSjNQIwqoJblX0Uh/QQcN/UqNYqChaLZFIgHx5L3j3zb6eh17dxvsjXz+Un/h+R3Dh9QCHOqms6KPMpi8qTCfcYUYidUZfVHExsBGyHj9F3X9etlRmGIXzAOsodGNZw7w3CnSF2l3Q9pFsDYYEO/YqXgTFH9aY89s4QMFyIl3xowWEXW6wenke4bnBj2uAkMu+VCSSWn4guerMiZvrHfqZ3ikoG/T045mNyMR1yMZkT2Ty8MjAyZVWZVxQcsV4L7J4a+TFcteGsaqqYRM2vzhhOZbjvsYVlKotlpiXC7+pur25ee3V45S7aJz9wAGYJk89qlYSxojBOJz0vrXyi6Fa4Q/Ri/lv0Zi5mY23Tmw3UM8yE3BXZptwhXQCGi0q4Klu6qajvHtjqSx9Q57XQpN9NnSHQERATn9pYlChUYE0beZSFlzyX46JlvwwKPkCjOmnXIYHux1g07Oyvv05RvJIUnnQetNypn+fQv/LLHqTgRA1kt0uQRbe8cvPUtjS7jXpBvyWznYfdOVe+aCa23nTVfVbl69TEf+ls8D/iU+rh8wtmLGrdg91csZ1ZKf1EagVKKA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f091102-e863-4d9d-47a6-08d847fefcc6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 07:26:16.2822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpmcnBinlKupYxcxgmesl0dYztq2iW1tot54LkR1trmlip8QQ9byKSdUQCCU8boyOCXAI05X48HOQ2WpNkz2hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7409
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the board dts support for i.MX8MM DDR4 EVK board.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
Changes for v2: remove the ddrc opp table for now; remove the unnecessary
suffix for gpmi pinctrl node.
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8mm-ddr4-evk.dts    | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
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
index 000000000000..6c079c0a3a48
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts
@@ -0,0 +1,57 @@
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
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_gpmi_nand: gpmi-nand {
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

