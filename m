Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0B2C433EA
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 06:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D71CF20714
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 06:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="DWjlVHLo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgGXGGO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 02:06:14 -0400
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:45703
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726381AbgGXGGO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jul 2020 02:06:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xn2yaZ2UFIFZxcQ3kcqSlEy4ynxOcWRHx48YLXgQO5RBQWltmeiKBv5Zx0uVd8U43/aAzavDkrwGs80qwgjbuV7qCrP4ne3HArLvQJITV6SNsQoZ5tTZWtBhTd+oMAUB9pO6BSEjWjBQV/rrDnp3KVWjy0/o1S/50cuneMp3g858LyEwjDo01eQYNYDcLKZxpr64oit612pFzoKrSVior7pCm5UmzJ1UMuXyKhqO7a9EeUAHEfsFTefTgHUzgyKADy7aHWg9MtrPkR/oT0RITut02H9AhGSbopOLCQwb6KXB2oQrgevnvGGr0Fw5d6kg8+/YNxHqek6H2w7q8cqB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1ouiq0XWfgZLcGMCUAHRvLODUMDRdZMJqtVmJmf+4Y=;
 b=VeL1KYgVcLw4RFLukCFArcXtlgYp5j+ecuRplbDvEvEtNEI9gFT3jXK0RuPBcaTImKyOG03LvAlwoYF6MrG4DUZLfrRv2T6gecZOReEXTsZh9YWbDxwQHKE84y0WhlYvlhVrOZw8Ui1BcIMVmBIeRSWCotRk8Pm1dt936l3Njl5llsO0HpCJ43UwUSEpdrXBWr50fZbu8yUjBT3or/yXKTKOWdPPiZTwFXpWaUR9Gx1hfZhhvkdHUuiMVtykU05TNobpMuON4ZlH2KRmEUx+TIS6EVwl/86TWMughmpeO5Ygs8kTt4FJiFnGGdwB7wgwGKBgCMJpIVQvmdx6IIKJgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1ouiq0XWfgZLcGMCUAHRvLODUMDRdZMJqtVmJmf+4Y=;
 b=DWjlVHLott/aU7lzS1gi7/ZGNlGaHitB1XFo7IAaE/5lcVkXzPc+Nz57TvaDC1247rsHoIv2cPbto5j/o9a8mmi/wGDm5M3BzGgnxvnpKR9K/qh6DuoUUJmRAipdUd3KTQ8cqJXrf7pwVpnR+XzOu2vi1HkLkhq1utbrU5KSD9o=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4248.eurprd04.prod.outlook.com (2603:10a6:209:4a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 06:06:11 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 06:06:11 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 4/4] arm64: dts: imx8mn-evk: add two parameters for samsung picophy tuning
Date:   Fri, 24 Jul 2020 14:05:32 +0800
Message-Id: <20200724060532.3878-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724060532.3878-1-peter.chen@nxp.com>
References: <20200724060532.3878-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Fri, 24 Jul 2020 06:06:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 723d263a-1381-4810-7073-08d82f97a9ea
X-MS-TrafficTypeDiagnostic: AM6PR04MB4248:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4248A088D9CAFAB60231FAF18B770@AM6PR04MB4248.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5g8KgUGaU5P+BJIX5ZnHgRZom7UsZgA5AO/V2xT1McvCram7ylj3p8tWIvd0laDKCToL02wradF1x8YMpcH3GuuXPhQhuj0KSs+pJyX9+1xPnGFj9+e5rYkLf/WN8FrdLDxFdd2rYX9Wypk1P0krbVJqYbWoiAuyaHjtcAgJHyxA08kIGdy4Rg2To+bOdzRNXrMQZa6pDITjpb78PrGEKPs2+scbKZ76YjQSmFZv/qOvoIVug3xXIVkaUBCxrC6oGDcOvPo5JzeaNnrv0iU8SzYYcvOwoaDBnZ/GhQ3vwa9EpT87yuG+3hJew33IXfvT72Vyn/UJhQHfCaAY5hjEfXEdvq21O1FJlyPUuHmriH1zuGU8X/Hj94STcary81rM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(8676002)(26005)(6666004)(36756003)(2616005)(316002)(6512007)(6506007)(6486002)(66946007)(956004)(86362001)(4326008)(66476007)(4744005)(44832011)(186003)(16526019)(8936002)(5660300002)(52116002)(478600001)(2906002)(1076003)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: psWU5J9/QcAnSRckBsdkFEpVp/77+MhzMlc2HA8abmJ4qByJRnYIux5td8U2lO28ec3AXoG6vehGSdXSfbnCZhu8vvF/Qw4dQbjhFbOX+0zWcUoEKDy2QN6oumN2bHgaOefcHvw7nNysMZdeOvZgPooczyQttC8NXwwWB7kdgbwmOHAMiVunypdHkyGukC3ipx9DMROT2EhBcB6/OIOyrQrzjol+IhoBt+N6nhecms21gekHzrYm87ww4HZqwBLyAVQdOlDV9RJuSQUHyHofQW/a0ra2y1ex2oJHXzeIahS1zdrnnPj60Mi009sYY33jLDUy0HmsBDYygpcLOVEz4D3JQhTwm656ZCcVPE3s2jJloARgM+RjiUn94M7N4kSazCBfgyLonmPL/NVoMmX8edIFtcsAQ51BCH5N/BnbtUB+C13hOVvxAFCWJZjCwj1EMpDNZIOG48+PRaGRoD0Gi9swcpc5NJ+pGJYuzI9FbJ4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723d263a-1381-4810-7073-08d82f97a9ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 06:06:11.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoYl8Ve9PIFYF5zhvgq87dhtbuM8eMYvZoTMEvo88B278FcI+mFEpie7yhgUrriMwKAfTUEVyqCmtfqNuI3gdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4248
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With these two parameters tuning, it can pass USB eye diagram at evk board.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v3:
- Using the new property name
Changes for v2
- Address Shawn's comment to change subject.

 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 85fc0aa38c4f..7453aec0a5fc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -132,6 +132,8 @@
 	srp-disable;
 	adp-disable;
 	usb-role-switch;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	status = "okay";
 
 	port {
-- 
2.17.1

