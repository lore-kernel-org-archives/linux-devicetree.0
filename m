Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C102C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 464442073E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 09:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AB3CAvfO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgGFJsP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 05:48:15 -0400
Received: from mail-am6eur05on2046.outbound.protection.outlook.com ([40.107.22.46]:52513
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727973AbgGFJsP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jul 2020 05:48:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbbOPHCGj9zIZnlEgakCLGDufV4Tpr3itG42X9/x3RHO9pZ/gvzSWwx+G/zfJuOYIj1AZ/VQOskvc1MASXNsBZ5qxwlPFxAczqEivMSJfkklke1JKeZOhK16NWAMyCSAJnuJHRPNQrNNrmuSEr7FPT8cgTR81YxokKSsb1IPJoqWstFCTRX0lucMm+T9ktr1BhewnDQmZB3Z/GIPfwhFlIglCSnElOC+HckwrX+wZann0ru0BqFm7oWHVUNXiYFx8NtSpW0SCoF947ZFYFZpOBAes/4Reh819Z1yfkt8vkIlxR7EoZVel3C1CHWuv+Upz8JgeaoXJFiB+GxEJVXRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5z041zoxAKG7Y8lm3GtfSokHblVRMFY/kzIHvWzMys=;
 b=l0skVZc8Ni5sZ1a7JJW3ETxB1aNmZht4GqtKRQLm8l4x/UbbnhX94p9/iugSUYSZnx/xvifOPjxAs+gSmwulrNNyfbrdqUboltMvo+jqSYORB94ReY7ISXw4r/clJ4wOKbZBOx4C8QAhuea49s+FY0ZNbnHSxt43lMF+K7Vvgq3AJA80sgtoQSIXkZ/UY1UtyPZixyK+dQz5EJxkkjhguhCaj1iGKq1mblLUFALYfN29quLVm75tw8foPl0rcvH2C6kP9Ah3++HlHMPKzul6A1jBpsgirCVjRjRmmRuKeNZR2EsfUDcEWO55qSPFu/DQmTTLpapmowfuykD6o/fWzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5z041zoxAKG7Y8lm3GtfSokHblVRMFY/kzIHvWzMys=;
 b=AB3CAvfOrf/nvVGwv/IKkJ/zUVgAL4t4s/RfJJbOelPL+dla1rtjd+pt5OZyyxRuHAsaMQ+dwyFZJ/iJ2y/wRl1o/j6GbR4IvOpjwiEvrUwqoE7wA9bkJNb/SOZ9IRHx4f4SQa3Ck4vVnZl3e5RINKnEtuIbQgPJlNd/qX3PgAE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3520.eurprd04.prod.outlook.com (2603:10a6:803:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 09:48:11 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 09:48:11 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, peter.chen@nxp.com,
        Anson.Huang@nxp.com, peng.fan@nxp.com, horia.geanta@nxp.com
Subject: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core device to pass data
Date:   Mon,  6 Jul 2020 17:44:55 +0800
Message-Id: <1594028699-1055-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR01CA0117.apcprd01.prod.exchangelabs.com (2603:1096:4:40::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 09:48:07 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 51f92c73-3204-4dac-173c-08d82191b22d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3520EED0732DABB58ABB1E2F89690@VI1PR0402MB3520.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMhbqY+lh0/qYlRRaPA4TyRfjCxHwwvvzkLPowDzzDGF/tUVYb68yUPha2Npg+4LzNF1OhGYnK7Nf9wz/eDrQ0CNjWbsO4FkBFKclqHXiSqGkQXwmWedDxwkHZVHw63zFt9/gk1/rTmTyh7fDmuhLOfy3N5OA/0jiFB66RU+GZhCoQxSI/X1Ml5crg4PsOBQ2Wc3GuykEIwF67Uos+GuNBd0tW+E6GW5j83sWgOhvnW11WB48J/IDeD2tkSkBV2L56J7gvZWhY2yPKg+IL91x5V0e+h+QeUQ4PyV4nQodf+tGZZ8pwWgc6GocQz/6ebE86SHq7l1thS6bD6bk+iIqJZQR5JTyITTm/1/XKh7c+uccoABFrv2hl8FYIFa2u4p
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(8676002)(52116002)(8936002)(956004)(2616005)(186003)(16526019)(2906002)(6512007)(6506007)(66946007)(66476007)(69590400007)(66556008)(26005)(86362001)(478600001)(5660300002)(36756003)(316002)(7416002)(6666004)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: z/zO//SlnNXPkHcfef43Z1Nemo6EanvlQQs1MWVAnSc/BDWGqkeOgi+h1tg/hd8nYTK3AaZPv6JLLBtijemSdV6D5+wdW+0VtuScHfDahTpTD6Bw12CSKEF+NgdzuLdA73t2R/CkASTc5F03IJLL4RZ9rAlYrwha2sv8rqbcMjkkWUYMdoc2HmwAMcPLYh00DTZRSlzbFdqxnAgo+OSjikS+aou7TCWBzz4DSiIDq6Gx/kjf26vjsCoELJoF78q1Ql/Jcv5O3910NqxkxEGBLaicO/CY5q7utaNlDyeIVEYtPLKqkNipRyrPx59GaonQ4NaGT8XJntlogxpUF5dLgUM4qqlPtqQrqx77pS8o/1FVgQAc/jukYx/WLka998MpPh9+VWgqcztVyRk1bHLYZ1g3ziDBnhm67b7U37xLg3OIbzkK+E7ZUCtVsiScHgkoa+u3/x+2k/2B5IjCHsbjsIx9l4zH9wqK0laRmZt15lk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f92c73-3204-4dac-173c-08d82191b22d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 09:48:11.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF6o7YHxcVlKPJY3j1owD1ja4fRr/YX6vHrTfKtsL4S4PrY4KMTvmBBePuiM8jap
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3520
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In case dwc3 has SoC specific customizations, dwc3 glue driver can base on
compatible string and pass it via platform data to dwc3 core driver; and
pass xhci private data further to xhci-plat like quirks.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/core.h | 5 +++++
 drivers/usb/dwc3/host.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 0b8ea8c..3146697 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -29,6 +29,7 @@
 #include <linux/ulpi/interface.h>
 
 #include <linux/phy/phy.h>
+#include "../host/xhci-plat.h"
 
 #define DWC3_MSG_MAX	500
 
@@ -924,6 +925,10 @@ struct dwc3_scratchpad_array {
 	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
 };
 
+struct dwc3_platform_data {
+	struct xhci_plat_priv *xhci_priv;
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index bef1c1a..4f8514a 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -46,6 +46,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 {
 	struct property_entry	props[4];
 	struct platform_device	*xhci;
+	struct dwc3_platform_data *dwc3_pdata;
 	int			ret, irq;
 	struct resource		*res;
 	struct platform_device	*dwc3_pdev = to_platform_device(dwc->dev);
@@ -115,6 +116,14 @@ int dwc3_host_init(struct dwc3 *dwc)
 		}
 	}
 
+	dwc3_pdata = (struct dwc3_platform_data *)dev_get_platdata(dwc->dev);
+	if (dwc3_pdata && dwc3_pdata->xhci_priv) {
+		ret = platform_device_add_data(xhci, dwc3_pdata->xhci_priv,
+					       sizeof(struct xhci_plat_priv));
+		if (ret)
+			goto err;
+	}
+
 	ret = platform_device_add(xhci);
 	if (ret) {
 		dev_err(dwc->dev, "failed to register xHCI device\n");
-- 
2.7.4

