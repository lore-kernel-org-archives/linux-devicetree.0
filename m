Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED078C433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 06:06:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C30BD2074F
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 06:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RKqqKRV3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgGXGGJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 02:06:09 -0400
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:45703
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726381AbgGXGGJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jul 2020 02:06:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L33F9k721ypeKhzCrJRBmGsr33rMQ6kpO907Dg/GMhiNLA7RD4I4vutD1dcbrNKzHlVe36GUGz2rst0AOGAOrGO0OnWJ75wEGHAMSq9wVmXKs3vlXMmQ+RAPmkD9OlGudDSXZ0Q8EdlAvTTTjrncHewE91x/yJl40o9E9S14+445A3s9M9GJoCzouFuNqAT464km1BtnF3wEOlodWMx6ZTY4MkyxEWBozdyVPZ2jpyWhF7J3uv74JXTnkXacfGTS2gqwPTVkp7TWCy0l7bAxbIxMcm8z+wvAK2JVUlT5ZyX6rxe3L5MECrsJjV1EqNEIWEcsyQeo8hakBiFt0D46sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+HtTeom6fKvvQWHYOIyF57N6NzsfS+F9BYQ5EMJDIM=;
 b=UhdjMwt1ZnBoJdOV7L7w/+jdqrMSSFI6Qo94FmhEIrf2uU2Rg7sCznMqw3hrfVqye1WLLlJXj8ojxwnjOShHSjx2BSEuluNOlG2nbcFrH8rPjpSDsYsoOhK+gBoZNJXB58c0Tr16RYdDmL3feYp6TBzuJPF4JZqY1ATG4C+66CnLQvxCZUYdOlFbr7VBhDL1/swnwO5alVpJhpFvqif/EBmzi8wz94eiaxlwzQerrqrUJ60DHOIviJa5vvWuSgPqH+S7gMopOw1tiaSunzmAIkGK9edKU+uarujiE5KvX6FA7joUbK4UblME7x+OMM35khD7QrU2aTFTopgM7e01fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+HtTeom6fKvvQWHYOIyF57N6NzsfS+F9BYQ5EMJDIM=;
 b=RKqqKRV3bSfe3XYEnz/y6rD4nXMxxk51cr6ZzeiX/8dUZoU7Y4QPFpnBcncANtHWNokq3P+rn0eniWsNWCwGbB4MYICzjNTvNbqp3gbVDq7UykY8HxFck02gu0OF8a2GPUdwHuqvguQWPTFIp/T/O1R7oAF2av8Tm4x+qbWgwTQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4248.eurprd04.prod.outlook.com (2603:10a6:209:4a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 06:06:05 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 06:06:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 2/4] usb: chipidea: imx: add two samsung picophy parameters tuning implementation
Date:   Fri, 24 Jul 2020 14:05:30 +0800
Message-Id: <20200724060532.3878-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724060532.3878-1-peter.chen@nxp.com>
References: <20200724060532.3878-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Fri, 24 Jul 2020 06:06:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 124d275e-8f88-46df-4b6c-08d82f97a62a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4248:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB42483EBC893D6DF8BFE1074F8B770@AM6PR04MB4248.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nqahp8J67w7gijm98lp+3iRRe1JwSk0puXaXzFxS2NK+y7pGvvV14u1LvsPFwmMYLI95fJFDNwEEzLfENI1EcfSnfOy/hLQzKxnXqHcwB+gBYI+cvzeP49KDgcr7vmWMmn8oMyq9JdL3kypCQjDQYIQ6M5qzj3elenneRctqPGvD9VRJRRvGSb23xW5POwdK9jbLFj7B0/xGZlCU0m+PMrDKNI0Vx5CpA7D624AxBQlrejp93a/LM7vZ+MAznKw9a0endsBS9O1uX0CWx2pxzAvreSp+7JA50LaXwQQVlcsJyPqbN+YUXTPqqtYLH35h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(8676002)(26005)(6666004)(36756003)(2616005)(316002)(6512007)(6506007)(6486002)(66946007)(956004)(86362001)(4326008)(66476007)(44832011)(186003)(16526019)(8936002)(5660300002)(52116002)(478600001)(83380400001)(2906002)(1076003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 9TeYLXr0aGeC7+S9/6xlG1/WJsAKaF68pJP/BtZmKW/OxCzfvbueNnbJS2MWsNvT3O+bSjDzKM+CRATgInGyIyiOeh2XfA+gOgT7ln2Oy8bjRTxVWwAzQJIuLypNdL5y70R71QCzk7LbS2xA5owk8uFysgibsSA9JMwWijcDl899GLx9YnaPFuKTNMZNuuJ759Cc7RSQnZ1Br5bHA/jplEYMricUAC+ZakBDpyCcE98lzZ7HVqaerFPmMBJHx+Kz9X9iizxB31z0geJCVNiiw8ju//csrhBpNNPcREiZAaqzEKLHdIUKqv2WqyWkMoyAA+DzdL1GrfTE6QnJQTNnsgRA6OfAXgWNKPgsgBNNeRrCZJ7d+vemgdnTRCfXeVTCTGt6ymZHjWbhjycaJHIFohUYyL0pe9NKXnpwfjxWQbsBuoq1dJUttjYZsDdZjmrIQnES7JoT5lVjT1LemZFy727y/ojkGfje21gsOzBjoWo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124d275e-8f88-46df-4b6c-08d82f97a62a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 06:06:05.0816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/pURFpes8xkDhT0eswYtuiXaSy8dIdNH0+46T/yjl0Tb8HsMzmw11Cw5llX7Fl+WjMm7zVQR6Z+zQ5bI/p6bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4248
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These two parameters are used to improve USB signal for board level,
in this commit, we read it from the dtb, and write to related register
during the initialization.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v3:
- Using new property name

 drivers/usb/chipidea/ci_hdrc_imx.c |  5 +++++
 drivers/usb/chipidea/ci_hdrc_imx.h |  2 ++
 drivers/usb/chipidea/usbmisc_imx.c | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 5ae16368a0c7..3129df2c46fb 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -165,6 +165,11 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI)
 		data->ulpi = 1;
 
+	of_property_read_u32(np, "samsung,picophy-pre-emp-curr-control",
+			&data->emp_curr_control);
+	of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
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

