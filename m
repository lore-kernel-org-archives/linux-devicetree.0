Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C27AC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 06:40:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5362320578
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 06:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SWJHmly0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgHXGk2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 02:40:28 -0400
Received: from mail-vi1eur05on2049.outbound.protection.outlook.com ([40.107.21.49]:27104
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725850AbgHXGkZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Aug 2020 02:40:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1hfOWTssucu777FqzYpCoDc4DSqAHOknNRmVbHHHGKSHL4kQZXCmQvBKQakHIenZrMw+l75qJX62iUE/JoX5Q1y8FMeIuD71VLD+SBn6U5oYgiRLAH1LwWxRs44QFMdNRa6J+Otaj8KdwnAs1q2f4QVzocbnNXzdAwQ5TVJ1ozU+ijHX4i8JtJU5QCIQ5pDQkcWkBaZUE3ueOnSJZ8ph/5f3CZAarOG9ZYnhrgjSQhTiV4J5wsGJBA5L4d1P1T0BsYMoVTFV6feUeE0eErgm72OOseSnL/bpMV2Km5pypG7FKG9mAEYv3JbXLu5K+LVQXuJXsX0T5U89jZ357zoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+/YoS/qZ5U9bqlD8DtQT/8d8d9FEJAyLQz93171nEI=;
 b=gMrZSE+1phazSVs+5uJttsNegO1BDeS7x+CtuOuR9maMktKz1zKzB0XngrjlA0CsjI3YsI5xhfbo7ImOvwHaqcXy2n521rVdRd8ZA4u67U02Jhc3Z+dmFUpWFEBAe+bO9DsAg+7a1WWby6MxFlV4uYnPv2Tl8RnNIkWRP8ODi2c478yLoFpdHslIQyHmWDcEOx9pcbvnolwZ9RtS6odzHJLCL3d42VrK3hDIlbwWxvg57FHCKYTGVANRJhb19rT7kx8ID8RYTBx+4FOFYKnCoSZqbbjjLlz2m55+cK5c7HoQRgmSkTiF3YHtWsFtMbTxWZS0I3YEODmDi+MlCNBj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+/YoS/qZ5U9bqlD8DtQT/8d8d9FEJAyLQz93171nEI=;
 b=SWJHmly0aQiu1Iqg0qeePMovWTLGw+4+DfxjX6T2pW0O+K78qKYq7hD5WjuF41Qnqv/iGvS5hRF/uJPqIJKVg/aD3JmMDthJ13a0yIR1X5luY0u2pNwjvxqKvfT1J+Ku15Jilk7qP/iRKUd5EJMODfhWHn/6kwj2Egu8rWbxbn0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6221.eurprd04.prod.outlook.com (2603:10a6:803:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 06:40:21 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 06:40:21 +0000
From:   Li Jun <jun.li@nxp.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] phy: freescale: imx8mq-usb: add support for imx8mp usb phy
Date:   Mon, 24 Aug 2020 14:34:38 +0800
Message-Id: <1598250878-28055-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598250878-28055-1-git-send-email-jun.li@nxp.com>
References: <1598250878-28055-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0202.apcprd06.prod.outlook.com (2603:1096:4:1::34)
 To VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR06CA0202.apcprd06.prod.outlook.com (2603:1096:4:1::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3305.25 via Frontend Transport; Mon, 24 Aug 2020 06:40:18 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8173524-de05-495c-3a78-08d847f892c5
X-MS-TrafficTypeDiagnostic: VI1PR04MB6221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB62216636B7D20A98FD0F4BD589560@VI1PR04MB6221.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zSQ9Hn2H/wxSj5cHIJvkoWL1qy0tCRNU9n6qqIsty3gc3RD9KdIo68HonJnNkxkTYLzsrBD+zxwik9+dAczfHOtovSBABJOEqitosv9z4bIoDtA4QH//ryYLi9tFbn9lz8qj1t77xBaiihh0rVjrmoyBCBRZW+vzJZcBH9Fa/kwzWI1DbkLgI6q7/8EZHGpCwTXWCPtYX9QWAyxHbErFf/4UlpbotZ221Pw0EFQr92sbxoHILd1ov7bF7XM5cAnMtGkeSpgCTSXDhP6Vak6CmIysPk4+RMDbpadQTLXo+6Te702kcwsHka9kV03FQ+5wX7ACS/1Q08uBVE8EUNhM4qhfHTHQ3rvinjA4BMZxOYc9uAiM1zdFE9kvEM9MUYV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(16526019)(8936002)(16576012)(8676002)(6486002)(5660300002)(36756003)(52116002)(316002)(2906002)(186003)(26005)(478600001)(6916009)(2616005)(4326008)(956004)(66476007)(66556008)(66946007)(86362001)(83380400001)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jeC1y4D4W/WKVUpQCZ06F2ABJ31yDNQEuY7hVmHQd7IQ6MCqloaUaa4F4PRg7TEApCyMMgI/0AGdcNpONnY92aserysiUYdIxJVcy28wju0qPG3zUg/mKokrzcANVY4TmYVq2jnZJsJ3v+i7BgcACr0PoeeiCzMn9/TotZt14Z6T9LtQ/GWT4h+7krWfMFXDmFivXPiyqUkCSHxOYzYNrM1jy+Ahq0qZP31Y3jCSYv2qfeHNX6KyC0mHIYAtcotsE5uuTkHT7OK+k2IW5DK7QfRa/CwH2pVVFnQG1F3n7LRcyAQJJJivH/ChIwbgGlSVolLrH16OIpqHxlzbGVMlk4xoCSAj2KB+uY09HHlJGqmqSOdOzIn8e9sTb1XfbJiv6/9I/LCzBrxzale973LB9WDxVPUUuUUoR8+xHM+C8gjF5WSyDIy6W7NhXSPgkfvtSnM06njbTqFP5Y4RvvkYYfojyE763h4qSkHAQjYLyg/8CXE3nXF3GB3kd2fnupyRA4Xx1BjmO/HwdIBMkpE+WeWCXQyEjygBYHE+nZ0s/pBDsqsw6Vv1rZJQ8ai3ywq3nXspNP1nJRF93cDGjxQpbWpgu9fCXPCrXz1JhMW8jknbJghTcKUtSFp7dljoJXmSneuUUWeeSJSKCBHjzQxMkg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8173524-de05-495c-3a78-08d847f892c5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 06:40:21.4714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /19NSfrzp7Wv8lUxvNqpVIXnE4ZVWvWl+uvHyyXG1A9u6pgk+HnkIEVy8fKkwjjN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6221
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add initial support for imx8mp usb phy support, imx8mp usb has
a silimar phy as imx8mq, which has some different customizations
on clock and low power design when SoC integration.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Changes for v2:
- Add header files in alphabetical order.
- Use FIELD_PREP to get the target value to set.
- Use of_device_get_match_data() to get match data for phy ops.
  
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 76 +++++++++++++++++++++++++++---
 1 file changed, 69 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 0c4833d..abd3151 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -2,14 +2,18 @@
 /* Copyright (c) 2017 NXP. */
 
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
+	const struct phy_ops *phy_ops;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
 	if (!imx_phy)
@@ -105,7 +169,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
 
@@ -120,12 +188,6 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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

