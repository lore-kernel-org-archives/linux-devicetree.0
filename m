Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F3EC433E5
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 04:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FF9B20704
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 04:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z8pxTkg7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgGQEWv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 00:22:51 -0400
Received: from mail-vi1eur05on2049.outbound.protection.outlook.com ([40.107.21.49]:43488
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726442AbgGQEWu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Jul 2020 00:22:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezNdhDkkqcbhqKzo4y+/SCaQesoZ8ieLTT5NQKuZyTlO3PxTUcq/Hrb0acrF+cfJYFxHi0AqWOC0Czsfso73AlMzuQHzfzZ2ylsHqTt96S7OuQzhhL0klJPh3/BEvJO8QGYgfWDlYdNdZ3ODscm/duMEQm2YMFDxBzGtmdje+5JtQd0eIDRI0I4wKkdoHnGaTYHABGw67QNuAj5aX4zXL5TErxxWzzz2Ujt9WWIzKuU0Hb2FTSWLn5yOAg4QWZ7Nt1AsrHgM9bjlp26MNnOy5CC8DvmNtvBolSQy/Ah/XyB5J1/TH+YfVRlFuOgSQcLaNeVWYvYJDuEL8em1FEK86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNhG5wY6GLcspFuxFpO/fFZ1T1VxbRM9/fgkrtEZEYY=;
 b=b1Dahsb2HRqySSmsic1WmqABOqvOMzfxM3bkN6AOLzZ/LgBJZ6bwLmEfn/B1RDj6ur0t3LrEDD0JH3XIYqPzRcYuZ0tKIG3P7e69xO8WeMOp7j39AfZKCva3336vS4EDa0RJao5iRzioXkRI2jDFGSFMKHYLyqlAY07CQpJXRnx/7T14gmkDUVJEN6hHCXCZeS+PgK9u7IHubFEe8WbgiKGl8SN1V7vAQkM1KVt8by99wGi2+I3hYrA3qWPbIAfKECjhf/WEH0pe3aJklY1FDKyMl3VwEOMB0MOrE2uFeJ7QIN90Iutta/XKZYlRPfAHLJwF2aWEbtOMqlpqtRj5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNhG5wY6GLcspFuxFpO/fFZ1T1VxbRM9/fgkrtEZEYY=;
 b=Z8pxTkg7H8Ykx5W9hbiCZeXrgtObZ39kR6we5wgHDxe6LNbq6R/HSjcSo0Pz+qSxEGM4obhBuYl9Iqb2Zt62urkj+DiFkJGdxGAZgkI1dZMaU+2zVhYnxY4BnTai7Y/WhqUTXutq5TZ8j9kv2ttYtZ372fHawLNvpDSRhnJ/B1Y=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6279.eurprd04.prod.outlook.com (2603:10a6:20b:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 04:22:47 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 04:22:47 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/4] usb: chipidea: imx: add two picophy parameters tuning implementation
Date:   Fri, 17 Jul 2020 12:22:24 +0800
Message-Id: <20200717042226.18495-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717042226.18495-1-peter.chen@nxp.com>
References: <20200717042226.18495-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:3:2::20) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0302CA0010.apcprd03.prod.outlook.com (2603:1096:3:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend Transport; Fri, 17 Jul 2020 04:22:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9300b56-3bd6-453c-d4a5-08d82a090f2b
X-MS-TrafficTypeDiagnostic: AM6PR04MB6279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB6279F4614A68AC06556070618B7C0@AM6PR04MB6279.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VPrNXn21LjcZnqFFivQCaGefv5rh3ny19tNILYiiEeDYDOK6E+MTCguwTsTuNMm3omFWYt+bCgSmaqG9/JDdtZ9SFfXC0Und5XALE42YdkB9CQccnL2tNfSczJOCRVTJR2slLGdLkkyYgSmqQDVnP6s2pK0a/P9PFAQ3KocQqk5t2hCu1zCbFmKGEiJIHytjP5V9HTdNrm6y25GMo0cmjtNybV40+Ejo9OIrqsvYZHJkkChTZvdMnGCBUKu2Ic3Y13kELfuu7Y9YsGy8SWObjT78M+23L/WQyGQpCYisgURUwgdyNRPjwNe1FLfKUQ4k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(6512007)(86362001)(956004)(6506007)(316002)(478600001)(2616005)(6486002)(186003)(66476007)(8676002)(16526019)(52116002)(36756003)(8936002)(26005)(1076003)(66946007)(4326008)(83380400001)(5660300002)(66556008)(44832011)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: W8671dCugMmu9qkRkqqWS9BTTaO+CxLJiq5ZfsN75tv9jJL6S6NfhNCek6S+Wxhy7nVrPM3Z1MdaSot73ButoKxL4LlcQX804Tv32vybULix72XWQTh/Y2QkwJA1gtXyaj0AkAGVrzBilgHQ8XltNhAVw70RvTSWY1yvlcstfPim5TRZ/ulalBInO5ourTSae9iyWZQ6pXxNhBwJYQ1mKx7DcMgFKInV0NaPwnkcfyE9toGXKD6w9aEpMKoU2DTHAozygRLHo4bEnxNbF7lZHQkBsRZXbP+lV0urW054plrfnipMct5KxNpsoVl7MSG7vrnil2escxhwq/Ngmf6Whvy6QlKhGxwuMLAdEZJMolX4AX1dJXBTzopd1VLnFxrjTjN94cLLKLLYWQMWjhUyCPUmq1ASZjUtJx2ohop9MMecGWp5AwlzRlBHaRm49VWBH/4XSCCpz4lJ+e/2HXbn7AM6VylYH6ndcZQKhWsW220=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9300b56-3bd6-453c-d4a5-08d82a090f2b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 04:22:47.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15R9gVx0MFJyMJ7+UVdGByD5QmibVy7/ojsVEjxd8cR/LDmXlvfivjxmagQ/mR88Pshl3Qi72DlL75bSwOIETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6279
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These two parameters are used to improve USB signal for board level,
in this commit, we read it from the dtb, and write to related register
during the initialization.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
No changes for v2.

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

