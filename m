Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA66C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9284C2074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="D2k19YUU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgGIK7O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:59:14 -0400
Received: from mail-eopbgr10073.outbound.protection.outlook.com ([40.107.1.73]:24455
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726387AbgGIK7N (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 06:59:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4yFClCDLjDddCm4ll9JZGUQdIPQkOxGVxBPQHXifi8jbSK2bV1F00fYATlDd5XnCiWTzJsSxdXvaYM0QVlwnh3AFvBYLYV0lHyHitNoZ1MF6LaoZcdh8lrroXy3LqPZjL3IqKXecuDxY344coUcUfZa9TLV1FHsdXipDHzhsb+jPhft29hriT6S/XSyuBBP+KSLmt2GAh8GitGK/81eqrXrt2b3RswKyUoPUw3329nhb9bMGY7RIn2Nw5VACTsjIIAaFSdypaN46VYyrCeN6P9IOBuND10u+syTI9jXHmUJq4p097GVu3BqBAmLgW+lE4mrX8vA0XoLp50ZVzeYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6ePAqO/Bblr9Z0zJ3Tp+7SYqquWNtP74rVxcu0Noj8=;
 b=A+SPG69KcESZZDRcrcRuVvw7Bp7uuBDQAbgALH42oc6ELzo+/7nq8/5AD1v/9Ic/M7QPKpaoFGNueKB+pDDq3Scpfw59+ZZnaSTfZGcHXLzsuD01hWV9dHsBaFiGhij6ADGP9LJzh3NuFAE+uKgHMGF4SUc5Zx6rhmljFG8ob9xvU6AyxVbjx1xRZyKng3V2NFLlVwwo/yrYyv7oOjtKnZRd7A4k5O4Z6FAiJU11D7M1KqFvq2wTodsgcKVeMSHVOkY4i3YvmKxF+zSNVVL4x+wEBl0eVNZEzMSj9ELwriO0l73pOOsja+KwWhCG22kgbGn6dAKpW1YrUhOp1Mm7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6ePAqO/Bblr9Z0zJ3Tp+7SYqquWNtP74rVxcu0Noj8=;
 b=D2k19YUUxviCWgvfj8YXVSNaMtQ6+uQkaqSR3FNv+Ejbwx2dsUWAcD8xVN294MfITMFjIPNx0IDte77Q7gemMRc/HEvL8g7RW8va4TVfzeRH+QRMCeMScKHVS27tYVqK9nEpkgf08wIRCTd9RsA9mM9hMnkfs1KD4pE4Tne0Vyc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4982.eurprd04.prod.outlook.com (2603:10a6:20b:5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 9 Jul
 2020 10:59:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 10:59:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, fabio.estevam@nxp.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/4] usb: chipidea: imx: add two picophy parameters tuning implementation
Date:   Thu,  9 Jul 2020 18:59:00 +0800
Message-Id: <20200709105902.23165-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709105902.23165-1-peter.chen@nxp.com>
References: <20200709105902.23165-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:3:1::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0401CA0012.apcprd04.prod.outlook.com (2603:1096:3:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 10:59:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bdbb9b6d-f8f8-41d2-b17d-08d823f71a9a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB49822776ACEEA64CBC80E6BD8B640@AM6PR04MB4982.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfUz+zZon/09pMA39NleO5Q5/YnMpNWj2/2oZ6VPUZ/ovF1Wsx8ucwQlTffLbiAqEKHWriUaPBYA9YfslA6Ds0bzHW6GUfJU+1N0l106msA2/pI2ZwdPfvLM6lD4fn65ga7Dk7sZweUZttSfaXd7vtNNxlQAKXZIjSH7elHYI3U1Myf1WdMIo6OJSP2AgUi6PGdGVJJ3v3YUrm3gR2/wi3eWqcSQ/DLrYuIzdNeEBkQqo2oPeXqc8pr+TWv4eQ/2bqH9RKTjaqxqnaxuVO45ZCPw0QoEOEcBCVPJYtVjc5gsOfKHILjYoPPY6TyziEIn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(2906002)(36756003)(478600001)(83380400001)(8936002)(5660300002)(6486002)(2616005)(86362001)(186003)(66556008)(956004)(16526019)(66476007)(4326008)(26005)(66946007)(1076003)(316002)(6666004)(6512007)(6506007)(52116002)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: X9AT6uNEZlaYDg3L9Vy9oqcR9ZqsC43aGvbqjkufoxmBxFnLpQouAMEZSAAEnc/4X7digLhsSrNs/RhwrHN19THukLdYTrmGvM4oe8SNbdMvBUluxCPo8gLnjxSkS9bmbW9WVyvmxs7JBhQBxr0ufaGiChO4DThFW+LyKFRU5kXUWCoaCzUk+XoKzNNFF9lcrvktPwXuMkBNBflK8XO/RCYa4T3b8wW9BzURS9C/RXjCnjceuvGiYab7ii6R+rF1Az2K1rNs4Au1rzDWpGzOfqtaJOWLEZrpKxnZFDA8i7+rSYwwzIuTXJag2zztEp/gS6JsRXBKS8VjLVnxWtv9i2IXujrhHlAboMQmPUeh0WChkKj8CPUOFOV5KxDkCcxDToB3XaiTb8Iy5NFlOnQZYCqq7c4XdEWTj+QfDlO3Uoh4A3jawxToqYy4nLra9DQxTFjeEK7B+NJBJhp9gohj3ZNzDDJehptXSFh0JSAYI+M=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbb9b6d-f8f8-41d2-b17d-08d823f71a9a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 10:59:08.5305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGrDXe8tZi73Pwio7XiEZUYlUUciPtTKhBuLILy54vNBcdwaRu892YpmJgjAzGXj7udU4t2GrI6iNZu4qPTUsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4982
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These two parameters are used to improve USB signal for board level,
in this commit, we read it from the dtb, and write to related register
during the initialization.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  5 +++++
 drivers/usb/chipidea/ci_hdrc_imx.h |  2 ++
 drivers/usb/chipidea/usbmisc_imx.c | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 5ae16368a0c7..58de0f3ac0e9 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -165,6 +165,11 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI)
 		data->ulpi = 1;
 
+	of_property_read_u32(np, "picophy,pre-emp-curr-control",
+			&data->emp_curr_control);
+	of_property_read_u32(np, "picophy,dc-vol-level-adjust",
+			&data->dc_vol_level_adjust);
+
 	return data;
 }
 
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 727d02b6dbd3..367bb0d0cb6b 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -25,6 +25,8 @@ struct imx_usbmisc_data {
 	unsigned int ext_id:1; /* ID from exteranl event */
 	unsigned int ext_vbus:1; /* Vbus from exteranl event */
 	struct usb_phy *usb_phy;
+	int emp_curr_control;
+	int dc_vol_level_adjust;
 };
 
 int imx_usbmisc_init(struct imx_usbmisc_data *data);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index f136876cb4a3..f9881aed468f 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -128,6 +128,12 @@
 #define MX7D_USB_OTG_PHY_STATUS_VBUS_VLD	BIT(3)
 #define MX7D_USB_OTG_PHY_STATUS_CHRGDET		BIT(29)
 
+#define MX7D_USB_OTG_PHY_CFG1		0x30
+#define TXPREEMPAMPTUNE0_BIT		28
+#define TXPREEMPAMPTUNE0_MASK		(3 << 28)
+#define TXVREFTUNE0_BIT			20
+#define TXVREFTUNE0_MASK		(0xf << 20)
+
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP)
 
@@ -649,6 +655,21 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 		writel(reg | MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID
 			| MX7D_USBNC_AUTO_RESUME,
 			usbmisc->base + MX7D_USBNC_USB_CTRL2);
+		/* PHY tuning for signal quality */
+		reg = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
+		if (data->emp_curr_control && data->emp_curr_control <=
+			(TXPREEMPAMPTUNE0_MASK >> TXPREEMPAMPTUNE0_BIT)) {
+			reg &= ~TXPREEMPAMPTUNE0_MASK;
+			reg |= (data->emp_curr_control << TXPREEMPAMPTUNE0_BIT);
+		}
+
+		if (data->dc_vol_level_adjust && data->dc_vol_level_adjust <=
+			(TXVREFTUNE0_MASK >> TXVREFTUNE0_BIT)) {
+			reg &= ~TXVREFTUNE0_MASK;
+			reg |= (data->dc_vol_level_adjust << TXVREFTUNE0_BIT);
+		}
+
+		writel(reg, usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
 	}
 
 	spin_unlock_irqrestore(&usbmisc->lock, flags);
-- 
2.17.1

