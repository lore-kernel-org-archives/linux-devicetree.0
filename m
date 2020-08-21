Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF46EC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 12:13:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7CD6207DA
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 12:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vyl8z/9e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgHUMNH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 08:13:07 -0400
Received: from mail-eopbgr140052.outbound.protection.outlook.com ([40.107.14.52]:16775
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727793AbgHUMNE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Aug 2020 08:13:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQs8pTVeQ1ExwgAZkng8wDDAT/aounFyAHUJxN0HVP7QIlpOYXEq2znH1O2B4eXPQw6Fda5D+0bwVD3Ykg2dVFkSccoTSXiotjUZPe1pox2SuKKa1dVNE4wvU7IZ5+fvUcTYQw6ux38NQtBkbB/sp+IJ7C2JlZklKko2TuTndtI+Nq9+IA1K6npnFSCOAucs1lY0vmMi60J+zAucCzCiVG9PT0RY2GwkorX+yLr96GypeNkbT4xvCbvl0JErgphd5cK9bHE76nYhTDUAR5JNpA6GsLQZ7OoZRCrKCKN2GHIfzmNMla1LjpdWAJtzq0PZjV19CCompV60qNwzHQUVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLZiFcM0DDZjD9SEZbmrcs4wuy+czro2yCas9GHVPfM=;
 b=EMscuTir/WyLza2bjfmuwqCimcsK+ovx3QMDa6IpFyqwUoGXuLbuI8VLCVi2iXdN7xz4ZUru11CFABMZORjQSZh8fkFGYIzKi+fuKC4qGV99ffxi++JkQTh/gfD4XFoYbA5dc0vIELgx8Ny/LZa8FyymYkXWLbz5H7j49SLVAREc3pQwUrB3h4FF+DBv34y7iijvU4xYtRxtrXsNmHVeDvqb+4YximPH4+KRAO/JHJ5sduhNL0eNSLWgVDXuYYUqps5NK34fZlTBugbckSn3k/5R5mM0ENIqkGaP6fgf5XMvEmrNj7+RUw96vRHfKH+cZQUva7Q8PRdMjAzn7AsZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLZiFcM0DDZjD9SEZbmrcs4wuy+czro2yCas9GHVPfM=;
 b=Vyl8z/9e3F74P1ydLILHgJNVQRIaJcS24+qYyAZa2ZgOsJpRQ2EHuIK2/DUHhvYFktPUjthF+2uOfu8AwWsUhxZcXW3y4elxkXVTBMKlcAfR1s0gDSemo2gDJBQBec/hy6z6RBquXl/2OULGBHvXv2FtR1cbrIdxtTqO4ceDHKg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5389.eurprd04.prod.outlook.com (2603:10a6:803:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 12:12:59 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 12:12:59 +0000
From:   Li Jun <jun.li@nxp.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org
Subject: [RESEND PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp usb phy
Date:   Fri, 21 Aug 2020 20:07:24 +0800
Message-Id: <1598011644-6219-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598011644-6219-1-git-send-email-jun.li@nxp.com>
References: <1598011644-6219-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 12:12:56 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c7fffb6-ba92-4f2c-0aaf-08d845cb8b4d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5389:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB53891E649DBCB6CA270489FC895B0@VI1PR04MB5389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QPRPOXElwf+ssRzSGpNdCwUrKcYXR678lQp2UEfrp/cafjpMU0PQbMhlfhlmeJcEUYipGCl42Wgf87TJJB8+wWFmtiYZ/B2DbG2mkmcZ7ZLsERfADxubm/q/j4zBXqK1WH1WokOWQROhLoZWvbAO0UefhmtQ24cSIWVie1/d64xCJ1rlsYS50K8rHi0Fvto/kQtzXhdEUvpi9aDUk6WIrGIdWrSQJ2ytZ5MTt7VTu6eR3aXx2slJOqGV6YhpapyWVMcKBkt0PhmQhxB6yTpqxkorBMbkT9n2Y5pjHLEHPrFvIJ8B++1lscK2LHseKNuMHnPaygpFktrE3K1Fae9c2rFaY0qmP5dmAHSZVbrQO0zC8w43QtG54L7beJWQMEnq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(26005)(36756003)(4326008)(83380400001)(2616005)(52116002)(6916009)(956004)(6486002)(8936002)(16526019)(16576012)(316002)(186003)(2906002)(66556008)(5660300002)(6666004)(478600001)(86362001)(66476007)(66946007)(8676002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +YMs2AXdHXULZFJ9764ykllTuf6sMy93rcRg8BhJhymQx+in2TUBF0AQuJHo7U+yph34gPH/GsR90hqsyUUYjLrXMqMzQhGs/xvwQFeWgmZEn+7Rd+waaccn2f8QpY+ziUm+Oh760ZC7FPQFEZ0Pk21yJ+SHw4ZXX92llHF42Z/hTjbVTiZBcjqEI0SLI+mgi62d2ht8B26Od8ECPQs6V15zPlheOaOoO+TY+xq3+sPBFDqGSZqowiMWu92tTl3dK4VUnR43Ly0KjGTnqI4vrABHDKpkGvvs+UbjYdeWNxYRkbZ26wDW4jt3Dq7cxvSWqMtsDA4ZhV1exb92E3VSzwuCRnz5Bpg02ZLbszzNdRoGhpSaHYZrwnDr4WOPhpjppp4xTJ+WvWKeYTzIDvPN8F5/OfNiHxE2G6aWsBLO5KWEKwShsz1BdCbW86NZx0x9SzHtLLYDsXF52qs2+x10IPEUuyYbFKcTORUQZNNMmK9UhHAnbzi+F9jBwONaY/dMSHmQyTGlnYBugAOyKEtyw5DOlYIiQcmZ62yJrSfwSqURimKdl8OsjNzJlTTqwap7DKyz0zYXJD2BxIonnMXDu8n2VUk4DzoTTQ+ETEoSmjZ0QdfO5FexcC2yk+S5QEV3jEown4meYVoBEa6/EcS7Bw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7fffb6-ba92-4f2c-0aaf-08d845cb8b4d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 12:12:59.2463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CBNYkoa+TYsZNs6CJsZ/bBZn8jiGXSqU1b9LMcxLutz6fScNkvCeCv5MFbXr7pt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5389
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

