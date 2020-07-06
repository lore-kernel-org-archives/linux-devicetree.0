Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE62C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 065702074F
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="q0i9ZZT5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgGFJsW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 05:48:22 -0400
Received: from mail-am6eur05on2088.outbound.protection.outlook.com ([40.107.22.88]:31276
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727973AbgGFJsW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jul 2020 05:48:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1gyLBO/OFGclzVuGyPiAmOjivTOpHqS1me13EZQBDKdZZiSednK/Wr6BakW9/6NP0N8e9c8GBlyTak5tBDDv3iBcMTxJ8NbuE1jnjuA+g7mKgFQYeoi2zO29YFhofa2wsOACaAiFJZFnARg2B+JWm8IipyG1R079LJWjQH2Mhb4nse/iYk0XrG9jj1JaGXO6vuFN1Q0k5lxTNNnJhj0L/Z2K6zFH16Tz0siGhexAqqTYwgH+BIv3YJ+RiCaTiEbeU1VzxTjzik1ytpHTIfgTslbr1IGM2J1/txh7DV78PqRWtpAvHToL89+9ysvwv+0sxVNh8hDI2fA4rVGsRwgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7eQwdtbePdJhUINhBRWnjZmGPPL+wlLtxFGwqIT1cY=;
 b=a6oHhguQ8DtHbaO4HOvoaLMfn3yCkuRGGXTJkUmxEry9xEchbYD4Gy5SZf0lpEPAFJkROox6HX42TGiBZxtZAitxUC/aRd5kvZouVMlo0ZS1FuVONuCOsX+1teoNZKP0WgCx6jfmM3upKnxGzd5O7RstzQOqfDJ4/6pK8wiSgKDh0wkL9rUY1PMri0VQgamgEhWKB+rgPfqCxBe062EX5sykT/BeM5m8GnNPuO2a+UmU64oCRrIxez5S11J1ttvjJbz1y/CThlj8jfBh2gZRJgaMKbJ1wl9kS818nIJFEe+gzg9kP4jyZK7UasR8+GmA7rMz8NRHR23UHanggE+FvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7eQwdtbePdJhUINhBRWnjZmGPPL+wlLtxFGwqIT1cY=;
 b=q0i9ZZT5gJeoaKsSlXikMYq8vsqIQ6o10lJosYVsm8hgV6pt6iVhafSY+rO6OxuGc9Pswdwra7OrfkE4xty7vLjXq7famx259xMVRllDY8RlPmdn6UbLEgpM8I5m9CApHpEExDX9e8unikhK/LroFxZdR/VWySYfKvGs94TMCl4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 09:48:16 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 09:48:16 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, peter.chen@nxp.com,
        Anson.Huang@nxp.com, peng.fan@nxp.com, horia.geanta@nxp.com
Subject: [PATCH v2 2/5] usb: dwc3: add imx8mp dwc3 glue layer driver
Date:   Mon,  6 Jul 2020 17:44:56 +0800
Message-Id: <1594028699-1055-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR01CA0117.apcprd01.prod.exchangelabs.com (2603:1096:4:40::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 09:48:12 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0472050c-a404-487b-7b14-08d82191b4db
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB35201295F61D5C8F9778024289690@VI1PR0402MB3520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vtlrWnfsCJdPuQPP1w7sQ+UXHJ+/pRRQ7mdFcBUcfiGqqnTZaBTdTrqxFrqQDp2DNGu+LGkcNCv3iSid0SAsfAH8smsfuwy+SZ7vmNBF4ypDvh+jjgrSbhSnlOntsaxFQIWQnlgVaNmIVTJ3B4sS53Vy1+lP//u9EJKYasTZjIILhkOk/FSlAmtaiYmNcu86S9r1NuqMNXeFJI9V7JVV/mFK+CuFF5rXEMPQYLPa5bnXikRmjVqSvUnR+taAuIjZOHo3xGdKPulnGH/ARG0Gr0tdMAHWUfpTOqwcwzvVzcKOwVNpQLKbuD92ra9kbN4Bm+px//MdpcHKKZm6bU/WjrprIawDUkUq73qHpXmmWWlbCV2E0CZysvQ3ZyjfjGJ1/J+Tc5JjqBwLEj3hyKTqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(8676002)(52116002)(8936002)(956004)(2616005)(186003)(16526019)(2906002)(6512007)(6506007)(66946007)(66476007)(69590400007)(66556008)(26005)(86362001)(83380400001)(478600001)(30864003)(5660300002)(36756003)(316002)(7416002)(6666004)(6486002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iBb2Yr/cGKBVw/AEZOE8i9lrSyADmptVGkcQeFQuiBlSfA4WpSA5MbZSzXqXocfixG1O+MC/FDTA99spLi+Q6HX3WjxLLgUQDmoobkwFnVmtox2jwY05QNo9MpHf+6JyErfkGDKoJ5wPWqHLaaVFmQHW6FLMno2E1AP1ZUmwUXX/RxUxJQaBzCyYhnlDdX4ZjZzv7e9cdmXn2J/hJ2wnve65gn3FRBlce0E/7yEvZpfTzarOWEQ8Mk9cRWv5E/YXQNlhfSXoTuXS7TLPmcMMesUwcOaFisYnC02yznPrVtJLvTSFOzVu/0zMNDNqifjFYwo4KCzJj91NXX3nS/l2JOjy6EYDnz0xAv4vNpCQXvaBYjvD5li3jpuGSASJEAw2BvlMCanUCJfHUed2lVuioTQC765fTmUjt7Hdn9MK6g2RFh20x2NaT5NWdVi2Jduda09m5p53Tujx/X7oz+eeMKGSQfnfU08T0KIr+Zg4ZAU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0472050c-a404-487b-7b14-08d82191b4db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 09:48:16.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adQUG8QzbVL+ywvN/vv4936Okj7caJTscXIveI/UmFok5fajJfQ0Y0i6r18mnEez
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

imx8mp SoC integrate dwc3 3.30b IP and has some customizations to
support low power, which has a seprated wakeup irq and additional
logic to wakeup usb from low power mode both for host mode and
device mode.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/Kconfig       |  10 ++
 drivers/usb/dwc3/Makefile      |   1 +
 drivers/usb/dwc3/dwc3-imx8mp.c | 374 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 385 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 206caa0..7ef2339 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -138,4 +138,14 @@ config USB_DWC3_QCOM
 	  for peripheral mode support.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_IMX8MP
+	tristate "NXP iMX8MP Platform"
+	depends on OF && COMMON_CLK
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
+	default USB_DWC3
+	help
+	  NXP iMX8M Plus SoC use DesignWare Core IP for USB2/3
+	  functionality.
+	  Say 'Y' or 'M' if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index ae86da0..2259f88 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -51,3 +51,4 @@ obj-$(CONFIG_USB_DWC3_MESON_G12A)	+= dwc3-meson-g12a.o
 obj-$(CONFIG_USB_DWC3_OF_SIMPLE)	+= dwc3-of-simple.o
 obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
+obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
new file mode 100644
index 0000000..e67d404
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * dwc3-imx8mp.c - NXP imx8mp Specific Glue layer
+ *
+ * Copyright (c) 2020 NXP.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+
+#include "core.h"
+
+/* USB wakeup registers */
+#define USB_WAKEUP_CTRL			0x00
+
+/* Global wakeup interrupt enable, also used to clear interrupt */
+#define USB_WAKEUP_EN			BIT(31)
+/* Wakeup from connect or disconnect, only for superspeed */
+#define USB_WAKEUP_SS_CONN		BIT(5)
+/* 0 select vbus_valid, 1 select sessvld */
+#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
+/* Enable signal for wake up from u3 state */
+#define USB_WAKEUP_U3_EN		BIT(3)
+/* Enable signal for wake up from id change */
+#define USB_WAKEUP_ID_EN		BIT(2)
+/* Enable signal for wake up from vbus change */
+#define	USB_WAKEUP_VBUS_EN		BIT(1)
+/* Enable signal for wake up from dp/dm change */
+#define USB_WAKEUP_DPDM_EN		BIT(0)
+
+#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
+
+struct dwc3_imx8mp {
+	struct device			*dev;
+	struct platform_device		*dwc3;
+	void __iomem			*glue_base;
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+	int				irq;
+	bool				pm_suspended;
+	bool				wakeup_pending;
+};
+
+static const struct clk_bulk_data dwc3_imx8mp_clks[] = {
+	{ .id = "hsio" },
+	{ .id = "bus" },
+	{ .id = "suspend" },
+};
+
+static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
+{
+	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
+	u32		val;
+
+	if (!dwc3)
+		return;
+
+	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+
+	if ((dwc3->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
+		val |= USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
+		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
+	else if (dwc3->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
+		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
+
+	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+}
+
+static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
+{
+	u32 val;
+
+	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
+	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+}
+
+static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
+{
+	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
+	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+
+	if (!dwc3_imx->pm_suspended)
+		return IRQ_HANDLED;
+
+	disable_irq_nosync(dwc3_imx->irq);
+	dwc3_imx->wakeup_pending = true;
+
+	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
+		pm_runtime_resume(&dwc->xhci->dev);
+	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		pm_runtime_get(dwc->dev);
+
+	return IRQ_HANDLED;
+}
+
+static struct xhci_plat_priv dwc3_imx8mp_xhci_priv = {
+	.quirks = XHCI_NO_64BIT_SUPPORT |
+		  XHCI_MISSING_CAS,
+};
+
+static struct dwc3_platform_data dwc3_imx8mp_pdata = {
+	.xhci_priv = &dwc3_imx8mp_xhci_priv,
+};
+
+static struct of_dev_auxdata dwc3_imx8mp_auxdata[] = {
+	{
+	.compatible = "snps,dwc3",
+	.platform_data = &dwc3_imx8mp_pdata,
+	},
+	{},
+};
+
+static int dwc3_imx8mp_probe(struct platform_device *pdev)
+{
+	struct device		*dev = &pdev->dev;
+	struct device_node	*dwc3_np, *node = dev->of_node;
+	struct dwc3_imx8mp	*dwc3_imx;
+	int			err, irq;
+
+	if (!node) {
+		dev_err(dev, "device node not found\n");
+		return -EINVAL;
+	}
+
+	dwc3_imx = devm_kzalloc(dev, sizeof(*dwc3_imx), GFP_KERNEL);
+	if (!dwc3_imx)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dwc3_imx);
+
+	dwc3_imx->dev = dev;
+
+	dwc3_imx->glue_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dwc3_imx->glue_base))
+		return PTR_ERR(dwc3_imx->glue_base);
+
+	dwc3_imx->clks = devm_kmemdup(dev, dwc3_imx8mp_clks,
+			sizeof(dwc3_imx8mp_clks), GFP_KERNEL);
+	if (!dwc3_imx->clks)
+		return -ENOMEM;
+
+	dwc3_imx->num_clks = ARRAY_SIZE(dwc3_imx8mp_clks);
+	err = devm_clk_bulk_get(dev, dwc3_imx->num_clks, dwc3_imx->clks);
+	if (err) {
+		dev_err(dev, "Failed to request all necessary clocks\n");
+		return err;
+	}
+
+	err = clk_bulk_prepare_enable(dwc3_imx->num_clks, dwc3_imx->clks);
+	if (err)
+		return err;
+
+	/* Double enable suspend clk to keep it always on  */
+	err = clk_prepare_enable(dwc3_imx->clks[dwc3_imx->num_clks-1].clk);
+	if (err)
+		goto disable_bulk_clk;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		err = irq;
+		goto disable_clks;
+	}
+	dwc3_imx->irq = irq;
+
+	err = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt,
+					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
+	if (err) {
+		dev_err(dev, "failed to request IRQ #%d --> %d\n", irq, err);
+		goto disable_clks;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	err = pm_runtime_get_sync(dev);
+	if (err < 0)
+		goto disable_rpm;
+
+	dwc3_np = of_get_child_by_name(node, "dwc3");
+	if (!dwc3_np) {
+		dev_err(dev, "failed to find dwc3 core child\n");
+		goto disable_rpm;
+	}
+
+	err = of_platform_populate(node, NULL, dwc3_imx8mp_auxdata, dev);
+	if (err) {
+		dev_err(&pdev->dev, "failed to create dwc3 core\n");
+		goto err_node_put;
+	}
+
+	dwc3_imx->dwc3 = of_find_device_by_node(dwc3_np);
+	if (!dwc3_imx->dwc3) {
+		dev_err(dev, "failed to get dwc3 platform device\n");
+		err = -ENODEV;
+		goto depopulate;
+	}
+	of_node_put(dwc3_np);
+
+	device_set_wakeup_capable(dev, true);
+	pm_runtime_put(dev);
+
+	return 0;
+
+depopulate:
+	of_platform_depopulate(dev);
+err_node_put:
+	of_node_put(dwc3_np);
+disable_rpm:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+disable_clks:
+	clk_disable_unprepare(dwc3_imx->clks[dwc3_imx->num_clks-1].clk);
+disable_bulk_clk:
+	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
+
+	return err;
+}
+
+static int dwc3_imx8mp_remove(struct platform_device *pdev)
+{
+	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_get_sync(dev);
+	of_platform_depopulate(dev);
+
+	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
+	clk_disable_unprepare(dwc3_imx->clks[dwc3_imx->num_clks-1].clk);
+
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx,
+					      pm_message_t msg)
+{
+	if (dwc3_imx->pm_suspended)
+		return 0;
+
+	/* Wakeup enable */
+	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc3_imx->dev))
+		dwc3_imx8mp_wakeup_enable(dwc3_imx);
+
+	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
+	dwc3_imx->pm_suspended = true;
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx,
+					     pm_message_t msg)
+{
+	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+	int ret = 0;
+
+	if (!dwc3_imx->pm_suspended)
+		return 0;
+
+	ret = clk_bulk_prepare_enable(dwc3_imx->num_clks, dwc3_imx->clks);
+	if (ret)
+		return ret;
+
+	/* Wakeup disable */
+	dwc3_imx8mp_wakeup_disable(dwc3_imx);
+	dwc3_imx->pm_suspended = false;
+
+	if (dwc3_imx->wakeup_pending) {
+		dwc3_imx->wakeup_pending = false;
+		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) {
+			pm_runtime_mark_last_busy(dwc->dev);
+			pm_runtime_put_autosuspend(dwc->dev);
+		} else {
+			/*
+			 * Add wait for xhci switch from suspend
+			 * clock to normal clock to detect connection.
+			 */
+			usleep_range(9000, 10000);
+		}
+		enable_irq(dwc3_imx->irq);
+	}
+
+	return ret;
+}
+
+static int __maybe_unused dwc3_imx8mp_pm_suspend(struct device *dev)
+{
+	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dwc3_imx8mp_suspend(dwc3_imx, PMSG_SUSPEND);
+
+	if (device_may_wakeup(dwc3_imx->dev))
+		enable_irq_wake(dwc3_imx->irq);
+
+	dev_dbg(dev, "dwc3 imx8mp pm suspend.\n");
+
+	return ret;
+}
+
+static int __maybe_unused dwc3_imx8mp_pm_resume(struct device *dev)
+{
+	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
+	int ret;
+
+	if (device_may_wakeup(dwc3_imx->dev))
+		disable_irq_wake(dwc3_imx->irq);
+
+	ret = dwc3_imx8mp_resume(dwc3_imx, PMSG_RESUME);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	dev_dbg(dev, "dwc3 imx8mp pm resume.\n");
+
+	return ret;
+}
+
+static int __maybe_unused dwc3_imx8mp_runtime_suspend(struct device *dev)
+{
+	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "dwc3 imx8mp runtime suspend.\n");
+
+	return dwc3_imx8mp_suspend(dwc3_imx, PMSG_AUTO_SUSPEND);
+}
+
+static int __maybe_unused dwc3_imx8mp_runtime_resume(struct device *dev)
+{
+	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "dwc3 imx8mp runtime resume.\n");
+
+	return dwc3_imx8mp_resume(dwc3_imx, PMSG_AUTO_RESUME);
+}
+
+static const struct dev_pm_ops dwc3_imx8mp_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_imx8mp_pm_suspend, dwc3_imx8mp_pm_resume)
+	SET_RUNTIME_PM_OPS(dwc3_imx8mp_runtime_suspend,
+			   dwc3_imx8mp_runtime_resume, NULL)
+};
+
+static const struct of_device_id dwc3_imx8mp_of_match[] = {
+	{ .compatible = "fsl,imx8mp-dwc3", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dwc3_imx8mp_of_match);
+
+static struct platform_driver dwc3_imx8mp_driver = {
+	.probe		= dwc3_imx8mp_probe,
+	.remove		= dwc3_imx8mp_remove,
+	.driver		= {
+		.name	= "imx8mp-dwc3",
+		.pm	= &dwc3_imx8mp_dev_pm_ops,
+		.of_match_table	= dwc3_imx8mp_of_match,
+	},
+};
+
+module_platform_driver(dwc3_imx8mp_driver);
+
+MODULE_ALIAS("platform:imx8mp-dwc3");
+MODULE_AUTHOR("jun.li@nxp.com");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DesignWare USB3 imx8mp Glue Layer");
-- 
2.7.4

