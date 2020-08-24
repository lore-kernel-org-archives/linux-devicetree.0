Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78155C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 13:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59125206B5
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 13:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="IIoBMPDn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgHXNkZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 09:40:25 -0400
Received: from mail-am6eur05on2087.outbound.protection.outlook.com ([40.107.22.87]:3040
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726024AbgHXNjn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Aug 2020 09:39:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXlDVFQDQfV9Sn/dxf/nOen+0h3EAk/gJOAIM4gmMAadRMhiPbF55dOPCSLKOAOhkKxjlKqTaeMG/iQcdpBedsVk+uluSFSI8gFxm50tWWHicBZ0dEPObFDB+G8a7Fa28atHPhazKdYaUI0Cf9MIKvUif7ifsLLzOqqZr+hraqR3u9AKBstQE+9iAoXtpFOxqyCqBUAzl1nRbJQpmibxWj4ecpX//dHskTiV/yyLgIaT6vEzDLVR7s4SJVLx7LvaQlpBRdI2Xp9JUO51zZ77mgO5P+v5yikJRcFA6SJhtChj1W2mJSdjnL2/enNwAwmgyL9dmubxcY6Q4QGsuyeeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J6lLWn9kfLOvHcxVtUA8dKkTa6lY5j3TdbIblNUtuc=;
 b=fXyaldqlOXOM+31CPzrqpSbbn09l/CGKX2XB/o76BfHxUIPlNiHJhxNbslKbylNT1MzS7lw6DWgh9zb3JH6qpAItfrVO3tKGDjjmvYllyt4+si8wQWooum/o0OoDjMMLcpyWP37B4vscYvd70EyFmlcEfhpUA3HNzl0bBi9X/zT/5w7ERGJH2eu7sFW+hEw3RhkkEBwLLFWWCETiwNC/jyAmNA8lxAtbXoAo4HX06UHEg2Q6RMMs6HiGexvHaNmZVyVdNxuDAdz5JuGaN1SQIpT9oY3yzlrzIvO6Rsm5itnqtWYbsMtEFTFB7H2HU8eR9BobOYR3w3mp9UC2wYHAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J6lLWn9kfLOvHcxVtUA8dKkTa6lY5j3TdbIblNUtuc=;
 b=IIoBMPDnS5XsxVriH249F08qNtms1gx6IUKHXNyNGruURXM985fxxEMY84o7/6Fz/4JYUH1M6FT4aRZ9LrKGSjIEA/9evgkHkYYNQ+H59nSs7q8r8XcqDDO5EEfLpcXlWEz6/e3yxujRri99aSr/NMgViIjcdG2fT8oN+JXzl+I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4173.eurprd04.prod.outlook.com (2603:10a6:803:47::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 13:39:19 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 13:39:19 +0000
From:   Li Jun <jun.li@nxp.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] phy: freescale: imx8mq-usb: add support for imx8mp usb phy
Date:   Mon, 24 Aug 2020 21:33:34 +0800
Message-Id: <1598276014-2377-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598276014-2377-1-git-send-email-jun.li@nxp.com>
References: <1598276014-2377-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0220.apcprd06.prod.outlook.com
 (2603:1096:4:68::28) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR06CA0220.apcprd06.prod.outlook.com (2603:1096:4:68::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3305.25 via Frontend Transport; Mon, 24 Aug 2020 13:39:15 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7747f4db-1e5e-4297-bb9c-08d8483319da
X-MS-TrafficTypeDiagnostic: VI1PR04MB4173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4173D3965AB80B76F98BE40789560@VI1PR04MB4173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: da9EcqE1JGY5SM0py6I6dvM/0YXKaBWglexjPok5QycuLGDwrwMQtm4cPIn/gu3Ml5dcbpeMPlRW4Xf0Iho3GNVfdu2StN9nt1Hzpfkygaq/tUvcdqqe+3i5pWFpfGspNPdU3GvmbHHtcREe3kz+Hh5zIgfGwbHf9Fvka9G4dOnWrOYK3rxOZh1RixxI0+dSNTrqXQykBb4fXN/BH5v0omW3CazP+C36XY/KYaEykcKLFoOwtvfTla/ivqLs1lir+zOg5A5hZyKst9Osc4AcPupDl7mfG+/1jpNKhTyiSR9r/uTIvcfZhJJ18gZ15nfYNP1W/hn9qYFuZc6f36XGBopcbp6aKRUwF4S+Kfrz4QtkOfIcDJDwI9SRWdBYAdtH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(66556008)(4326008)(86362001)(16576012)(478600001)(66476007)(36756003)(6916009)(6486002)(16526019)(66946007)(8676002)(956004)(2906002)(186003)(8936002)(5660300002)(83380400001)(316002)(26005)(2616005)(52116002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: opIgk1p/SOfWWccsfnnqKA8Oy49CXfRLc5sY86Z85lQgFksJIRbO5ojShgUAg9IONVqlYSTr17jIw5bn6Kry4jvqBwjcNzJzIXzyNo6/7liJ05vOpVQ1ObdSasSwiuy+PH1oD5P2CN0SNtmY7WBk3UP3qBlomGdMMDDW/8RNcytp1Jquog3C0JvfEdkhKH/a3lm1CX8vTtqqaR+KBIljEx+LyvPXJn40vEueaQ/h88XSPrRIZUjblKTyVUIiepxu5tqeE01Bb22GfHj09RaT+XyGThHIQjc23s6c6/OuIJkrwbwp7vKkflc/gLpcxkEcF0RZhwSxQQebfnrpBcJ3h9Njw2TlTRSPag0EyBoLzaCEgwJaM50zRkyER79EFUEF68fh4u+AduiNXZTIJ8AEMhhRVwHqFYQbsuF3xptMOkduccrClPpve3WGEfy2A03tFdtcCGUBTCoHGljlIt7ZJ5BALV51mpuikpbaRL/YU7PdNOgc57Dx/gJG15qBAq9AwjuU/Ibh5vrNsU2iH3NBJbdbUhlgJS/zYxDBj2fY8HtAvUbIVpPloDPO1nPa0oQk4OU+erDaRhI6gEjmGumjPNykt8Xjpua2kbJFooxkM5lCWxKLH0KpyPovNDyBQnWoHCDJgibb+GT0Wrieu6HxPA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7747f4db-1e5e-4297-bb9c-08d8483319da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 13:39:19.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wsWOwiDO9MyCaCacii0LUmUzZN/MbKS7iH9KbNAEVgmop8UwXZ/W4univlKPXvs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4173
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add initial support for imx8mp usb phy support, imx8mp usb has
a silimar phy as imx8mq, which has some different customizations
on clock and low power design when SoC integration.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v3:
- Add missing bit field head file: linux/bitfield.h

Changes for v2:
- Add header files in alphabetical order.
- Use FIELD_PREP to get the target value to set.
- Use of_device_get_match_data() to get match data for phy ops.

 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 77 +++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 0c4833d..d40be7a 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,15 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0+
 /* Copyright (c) 2017 NXP. */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
 #define PHY_CTRL0			0x0
 #define PHY_CTRL0_REF_SSP_EN		BIT(2)
+#define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
+#define PHY_CTRL0_FSEL_24M		0x2a
 
 #define PHY_CTRL1			0x4
 #define PHY_CTRL1_RESET			BIT(0)
@@ -20,6 +25,11 @@
 
 #define PHY_CTRL2			0x8
 #define PHY_CTRL2_TXENABLEN0		BIT(8)
+#define PHY_CTRL2_OTG_DISABLE		BIT(9)
+
+#define PHY_CTRL6			0x18
+#define PHY_CTRL6_ALT_CLK_EN		BIT(1)
+#define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
 struct imx8mq_usb_phy {
 	struct phy *phy;
@@ -54,6 +64,44 @@ static int imx8mq_usb_phy_init(struct phy *phy)
 	return 0;
 }
 
+static int imx8mp_usb_phy_init(struct phy *phy)
+{
+	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
+	u32 value;
+
+	/* USB3.0 PHY signal fsel for 24M ref */
+	value = readl(imx_phy->base + PHY_CTRL0);
+	value &= ~PHY_CTRL0_FSEL_MASK;
+	value |= FIELD_PREP(PHY_CTRL0_FSEL_MASK, PHY_CTRL0_FSEL_24M);
+	writel(value, imx_phy->base + PHY_CTRL0);
+
+	/* Disable alt_clk_en and use internal MPLL clocks */
+	value = readl(imx_phy->base + PHY_CTRL6);
+	value &= ~(PHY_CTRL6_ALT_CLK_SEL | PHY_CTRL6_ALT_CLK_EN);
+	writel(value, imx_phy->base + PHY_CTRL6);
+
+	value = readl(imx_phy->base + PHY_CTRL1);
+	value &= ~(PHY_CTRL1_VDATSRCENB0 | PHY_CTRL1_VDATDETENB0);
+	value |= PHY_CTRL1_RESET | PHY_CTRL1_ATERESET;
+	writel(value, imx_phy->base + PHY_CTRL1);
+
+	value = readl(imx_phy->base + PHY_CTRL0);
+	value |= PHY_CTRL0_REF_SSP_EN;
+	writel(value, imx_phy->base + PHY_CTRL0);
+
+	value = readl(imx_phy->base + PHY_CTRL2);
+	value |= PHY_CTRL2_TXENABLEN0 | PHY_CTRL2_OTG_DISABLE;
+	writel(value, imx_phy->base + PHY_CTRL2);
+
+	udelay(10);
+
+	value = readl(imx_phy->base + PHY_CTRL1);
+	value &= ~(PHY_CTRL1_RESET | PHY_CTRL1_ATERESET);
+	writel(value, imx_phy->base + PHY_CTRL1);
+
+	return 0;
+}
+
 static int imx8mq_phy_power_on(struct phy *phy)
 {
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
@@ -83,12 +131,29 @@ static struct phy_ops imx8mq_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static struct phy_ops imx8mp_usb_phy_ops = {
+	.init		= imx8mp_usb_phy_init,
+	.power_on	= imx8mq_phy_power_on,
+	.power_off	= imx8mq_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const struct of_device_id imx8mq_usb_phy_of_match[] = {
+	{.compatible = "fsl,imx8mq-usb-phy",
+	 .data = &imx8mq_usb_phy_ops,},
+	{.compatible = "fsl,imx8mp-usb-phy",
+	 .data = &imx8mp_usb_phy_ops,},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct imx8mq_usb_phy *imx_phy;
 	struct resource *res;
+	const struct phy_ops *phy_ops;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
 	if (!imx_phy)
@@ -105,7 +170,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
-	imx_phy->phy = devm_phy_create(dev, NULL, &imx8mq_usb_phy_ops);
+	phy_ops = of_device_get_match_data(dev);
+	if (!phy_ops)
+		return -EINVAL;
+
+	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
 	if (IS_ERR(imx_phy->phy))
 		return PTR_ERR(imx_phy->phy);
 
@@ -120,12 +189,6 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
-static const struct of_device_id imx8mq_usb_phy_of_match[] = {
-	{.compatible = "fsl,imx8mq-usb-phy",},
-	{ },
-};
-MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
-
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
 	.driver = {
-- 
2.7.4

