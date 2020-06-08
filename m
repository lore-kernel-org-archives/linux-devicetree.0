Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869D0C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 13:43:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B5222076A
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 13:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TTWNknvh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbgFHNm7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 09:42:59 -0400
Received: from mail-am6eur05on2063.outbound.protection.outlook.com ([40.107.22.63]:6079
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729737AbgFHNm6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Jun 2020 09:42:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgzaZhZ8d7R5PHtor+1yvv69t6sRiZAcV9DkqpAe72myJBJcmKyE0kf+nw7IAJWz/lFwJFvpip3NDYDlTX+KQhTiw8slJhPPQ4OQHm30FL7qQLnT0dht2SbAYnXJ4JHItosW+82rQGmhIwDF5fvUPKatUZGBk+eM2Y+N7/nYo/amUsuq28+eTcLPS6nEycSpS8E8o0jk5cdgW/Dse6EUjLRsNmPiQFKNTt+D+94DoMjiXOzPT5PYpDRKqIHM/FYSqBslmETKEXEym0Wnq/i5Pa0Wpe5f9AfqxYObtQM9T7HMr0z2o9rBSszJphb5Sp0RwVLyua87xXUdP7IgpHdeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLZiFcM0DDZjD9SEZbmrcs4wuy+czro2yCas9GHVPfM=;
 b=cFPKAb9B9Ph5oeVJtHgzzfQfRPPmQEvbG/Ay6y1mDy+R4ZS1ejUCPuOIivutaV3MCPWiwWzNhiiNxNuBH88778CMBAZl282q1Ufg4ungGGBM9npDjTSb/DImr+j+T3kyLDQfoyy3vN1swVn/V0iUobuhQQwAsdq3c4HG37mMxtCFJgC7JN5Z5CdjGRqYGmWSmXLWUOWXXcuD45g05W7IxGwpsr2aJnLjDlFNjYhNhC2MuoY3laVn63ql6j3WYOgQ9rJ3Eld8FFGw5CExn0Ant5tsAWu3m0cWXehI4R3l/D9jeK4bc7h/SXAu2YmFJhZNtPVikATKltJuwtTj19W20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLZiFcM0DDZjD9SEZbmrcs4wuy+czro2yCas9GHVPfM=;
 b=TTWNknvhkicefSx1Ni+AjZEFoY7NoIRk4yLlxTLwvn9oB1RavgTvabnKQTAbYZiCb6Rsgwj9t5CRpa2ezUlwfN5gmKrH+fX0qbKVCUdStv4IxvZ2GWfZlSrddHTPbrSznMsptD36tm26X5AeiSX8iMQ9ScP336qt7HizmHHytns=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6448.eurprd04.prod.outlook.com (2603:10a6:803:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 13:42:54 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 13:42:54 +0000
From:   Li Jun <jun.li@nxp.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, peter.chen@nxp.com
Subject: [PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp usb phy
Date:   Mon,  8 Jun 2020 21:11:33 +0800
Message-Id: <1591621893-22363-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
References: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b47624-OptiPlex-7040.ap.freescale.net (119.31.174.71) by SG2PR02CA0096.apcprd02.prod.outlook.com (2603:1096:4:90::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 13:42:51 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fef210d2-1e4c-41e9-7c56-08d80bb1d8aa
X-MS-TrafficTypeDiagnostic: VE1PR04MB6448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6448A938191A15B9BF30E1CD89850@VE1PR04MB6448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2MHYKmPZsiZSGTXawTQRR4Z+WVzO0yMtYNLfP+jSejHDoBTEyKRWtiDALmBUALSMpmMiOsdugnwe0cig/CSwnBvEm/wVI/OzpJrxsKKx7Tu/BYlkLy1YPPOJ5GeL1UkKE7vmfTW1aJGZe1LkUdLJkIRZzK5wLcHb2Tm7Q3bPqdNylZss5ZfS2jEQZjHRWIVzNnYqOuTdvKLxbIE/2Y+TS9FqbW9zjAq9u3PRIDT6kjk5zeAN/cMBfxp9rDBdWPT1Pg5nAeN+QgBjELHHYtBDoohlWB1wuk/wKm5LdxYPBLRAXXDNaP+pIq3MHStX3fMvKyGkWuc+aXcmxzYE+8+UetLY+jqfGb3pTBJyitB19QrknmqO8Jmq12TLeG0eviuN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(478600001)(316002)(4326008)(2906002)(6512007)(2616005)(956004)(8936002)(83380400001)(6506007)(186003)(16526019)(6666004)(86362001)(8676002)(52116002)(66476007)(66946007)(66556008)(6486002)(26005)(36756003)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: WQt3+v3i1bbR9whgBZ9e1ghNk/q240R6xv28YWDfygdqKv5i+IJQonxqsUggqlETPv7X9QzIDFW2fjdnx3oUNJRklPq0FKt+iGYIkIwshsPvTjqrgaHO/wvD7xdlOYChOGa5k2SydygnBUU3IPHfs41PbkMmgdRAXwdwjeG0WxwZXV9L06j92H/QsxIHxBusyUEkT4nRvKGH5ntJpDuUzzOznewDHC7tlaTr8d9+UpgQ96/ePpJa3P0kF/AegsJGEtjVhB6wVR55YYw10kyy+2IwpDPCcPh8UB++iO9DzkR4gTYDbSFN3X0JrDkC9oy1w/kyeWhTq9420FO0vKF1QUuX8xUxN0+Ppc4E4VENd5PI/EcDjxEZVbtlsY9kNMsefuEKTsOoobDPvvbeMr2Xj+bTq9LXPoG+wnVzSGw3n32YCSbuwZwfSF8Z2BXB6XsIJCMPSvRJ70CMOwj1KVENjqE3kLkkqFryMOLj3Hq+Izs=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef210d2-1e4c-41e9-7c56-08d80bb1d8aa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 13:42:54.7182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLOr4De11QOZ0BZYOJY/C5eQaUOe+DNrZMeNiSPIjJlmqciRKE7u9aOVWpY5ya3n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6448
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add initial support for imx8mp usb phy support, imx8mp usb has
a silimar phy as imx8mq, which has some different customizations
on clock and low power design when SoC integration.

Signed-off-by: Li Jun <jun.li@nxp.com>

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 0c4833d..030bf4e 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -4,12 +4,16 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/of_platform.h>
 #include <linux/regulator/consumer.h>
 
 #define PHY_CTRL0			0x0
 #define PHY_CTRL0_REF_SSP_EN		BIT(2)
+#define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
+#define PHY_CTRL0_FSEL_24M		(0x2a << 5)
 
 #define PHY_CTRL1			0x4
 #define PHY_CTRL1_RESET			BIT(0)
@@ -20,6 +24,11 @@
 
 #define PHY_CTRL2			0x8
 #define PHY_CTRL2_TXENABLEN0		BIT(8)
+#define PHY_CTRL2_OTG_DISABLE		BIT(9)
+
+#define PHY_CTRL6			0x18
+#define PHY_CTRL6_ALT_CLK_EN		BIT(1)
+#define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
 struct imx8mq_usb_phy {
 	struct phy *phy;
@@ -54,6 +63,44 @@ static int imx8mq_usb_phy_init(struct phy *phy)
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
+	value |= PHY_CTRL0_FSEL_24M;
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
@@ -83,12 +130,29 @@ static struct phy_ops imx8mq_usb_phy_ops = {
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
+	const struct of_device_id *of_id;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
 	if (!imx_phy)
@@ -105,7 +169,12 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
-	imx_phy->phy = devm_phy_create(dev, NULL, &imx8mq_usb_phy_ops);
+	of_id = of_match_device(imx8mq_usb_phy_of_match, dev);
+	if (!of_id)
+		return -ENODEV;
+
+	imx_phy->phy = devm_phy_create(dev, NULL, (const struct phy_ops *)
+					of_id->data);
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

