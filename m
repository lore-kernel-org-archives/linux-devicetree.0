Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356A0C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 111312075B
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="izP8aIej"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgGFJs3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 05:48:29 -0400
Received: from mail-am6eur05on2063.outbound.protection.outlook.com ([40.107.22.63]:29305
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727973AbgGFJs3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jul 2020 05:48:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fptryQ8Z8GOoDrOE4Dmdx7QhbFOdcCHJQ/U1nmteIIRHaoDhBXoGC16wxhyw/PBbnLuge8TQYMSpRL9B/egJATvBk86J9ry3/dG8C4KVjNIaqH40qdk6Vgn9ntVtbx4N5VpMbfXDLcaYOd+INn4DJuJCNjNgrqsy9OIUHZPIseZ3U3CqZCkf+IFFI3afGD2ao5FM2ZX7m9f+idwTOHUAr7BaMq00J8a1BmtBrEHUyYXZpRfQVbwPZ7QSVpbu6aQeRyOD/2QQOVRZOdY9kcZlUs0BaycrXMnmWdsWu7pqttngpum0ta2/91ABykS0qXl1iuMbGqzc1QFBxIRXg77cig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0/2eNqVSHwdUlUW/ivftevamb9lQyty+9qIuaaW50Y=;
 b=aVq5zSs/74Ztc1talJimHPZAJJGM7adgYj8bratrAY9MFc378dPxy1h91CYwkkM1ayNG+ddocImyOMjKdZmjn/S14natxC8jrmip2J3xpqe+iUzMObWt9KQOyJ2auKUxMqnAoEe3UWIZzcflP/sojEOjSknx9QNobFhFEMDAM6MUgFnuLkfejwtehZLBy2o1IzRQwH5q65OuEi3pSAutA1eZcplXFOR9YcvSYrkFKkfI03+h+VmMUcY4H/hG7Jnatocu05k3GeN5uV2cX0WHZlp+ve89kjYSaCl33jXNkhOTQAMMTEvZ5Pk0ITRS9GQNJGf6ftFF9ynCZnMlBqyT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0/2eNqVSHwdUlUW/ivftevamb9lQyty+9qIuaaW50Y=;
 b=izP8aIejtX3js2t8/yYLcTYSN0xlVw+imgZUyayzTrVOgPknrqHnBh1nKdwm/ZVD6S0mzmseZgNjV1edqApEn/xJdMaFsi+9U23Y4S4D2Hm/6lFpiUETUCJ/1wT67Ih8KG16NPLFzl+ayAgs/Re+Seo/ueyAZ/UEX7ShkzLK8fk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 09:48:25 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 09:48:25 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, peter.chen@nxp.com,
        Anson.Huang@nxp.com, peng.fan@nxp.com, horia.geanta@nxp.com
Subject: [PATCH v2 4/5] arm64: dts: imx8mp-evk: enable usb1 as host mode
Date:   Mon,  6 Jul 2020 17:44:58 +0800
Message-Id: <1594028699-1055-5-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR01CA0117.apcprd01.prod.exchangelabs.com (2603:1096:4:40::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 09:48:21 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6332cf5-f7b5-48ed-19ca-08d82191ba53
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3520FB4B109F21BE11F9812889690@VI1PR0402MB3520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fmk5pcBqcRqkV7U5+8buzUGJzFfoAyM/tWc7XlkQ5YxmCkPdiJti+5gg8Hi6C3/8mjDismHMG4vHkz52rnfUEJKOjfUje+21xswHSvYjG5VJBn2NRmmLNyx5JCI8ysGI8oqetr9kxSH+3NsIN2wIZ+tug7VViMhMmAK7aUThuGsJuE7eX6ZRzBD9HdJMNFAOYquS5l6dgVMfCsCM0/5G7YDMxVhQXsXX2jaqTz4AielZp/VEyLab7YCgfLWmEaFUvXsQC9gDGwGsH0kzPA2Fk+UAdanV1pCiy40F7tD0obwSBg25LRTcJA2ynQ3KWN3ngQEzuEW9yJWNaa10PdArLn8DZev4bgvy1wBQoRZB/nOX0/EDWfkORr7vxKLSb7feZDmHnk7JVrD1snA43hIg0yOmKzAq8e0xMlzXkDxPXvxzuJgp5T2k2R8exZoCSfCS4SzCIb6otWmP8G7KdrOu8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(8676002)(52116002)(8936002)(956004)(2616005)(186003)(16526019)(2906002)(6512007)(6506007)(66946007)(66476007)(69590400007)(66556008)(26005)(86362001)(83380400001)(478600001)(5660300002)(36756003)(316002)(7416002)(6666004)(6486002)(4326008)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: PiAQOcK+rKHr5DQ41wpM32jhd7pcuiN4Fa1VYR4DM0gG2qCOQLk2AKTa3rLV7UB80zoklDgQnb0cEmpfadJegq6brp1TzqRBrgq0Dbt7v9CbmrFBCFyIJ9aTF/20JcEmmtRiaItR+7FOsK2mOedVHCYSFaao/YSJH8dlHqV5fbqLhlx2f8jaYaaTA2Jai3FPCxjsWKstVE1VFYW8k1bV2CgsK2BVeG6Kt+yDGhZBSOkHwdG4rfT7clBIsj13zZa7ZRYpX0zY7+6CYNpEvJ0Xpc9NGCDRHfvPU9PGSvCwXchUgXDXgEjxpX+PL5yaPeX/Uou/naIYXg+HMzPlLBJDoanDiN0354UYt5EjQ8jutefp8nrXq/AztmYv1qrrcuyBcUARjE+faY2O61uHs7GqWivGqFetUvt2gGhuxZ/iqUaKtACmCS0x2Fs76u4w3NAba/X2dByGoV4rV6g+HAWUTNNcDwWH7zHzPZow1DW3AcQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6332cf5-f7b5-48ed-19ca-08d82191ba53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 09:48:25.5876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBuHCM/1UJfVS0kTzduC3qJUyHBv8qZYOnGvK5cXIuAMeJWI5/lvyyX69TT+a3p/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable usb host port with type-A connector on imx8mp-evk board.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3da1fff..c7cacf2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -91,6 +91,21 @@
 	status = "okay";
 };
 
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1_vbus>;
+	dr_mode = "host";
+	status = "okay";
+};
+
 &usdhc2 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
 	assigned-clock-rates = <400000000>;
@@ -172,6 +187,12 @@
 		>;
 	};
 
+	pinctrl_usb1_vbus: usb1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__HSIOMIX_usb2_OTG_PWR	0x19
+		>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
-- 
2.7.4

