Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F670C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E6792074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="lDQPh0SO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgGIK7R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:59:17 -0400
Received: from mail-eopbgr20042.outbound.protection.outlook.com ([40.107.2.42]:17794
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727062AbgGIK7P (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 06:59:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaxRL/kMfUH8kGEwIR3264XHrvdvOffPQ0mKKMtSKYOzRBix5q/xYoqbdnAcjOm98aX6F2DybnFdXItst9hyTS5WFN6B/BAJxsQ1ULtzSuRghlgK9rt8JL+K6+w30ElvPVfta0hqrVH6ZPewGbcPi9/EHKXUsYdeh+IZ6IFJcrz6yCDnUSZJWdP5qRbuMULK+DNiT+ruCVMzwjyovkq1ZCLm8Y0iDz64RCNxqfysB6cI0NbszzTLO0ZkSEnoo3QOHpz/YW7ltEbcQv+AczXTE7oC+6t5ysR5y1E5YD/3mEwN7j+MDcP/N5cmOhsHV0XSNuVc197cB0hlVD/ApdotMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7U5+fxFy/8iOwHPqNMFGUCQy11xfdREtbCw7pAj+YiY=;
 b=MDfNSkAj29YsgHC4m6ewFeYOf9MjwR+q0l8H5HwVsD9SWEAhaReQ3LEn9M+I1KS8f7/g8Eq5iurfXXD1ZUO1ygX5WzTSvdDXG4wzn3O1vfaVvD8KGN5PcKzLm5xidy6+KisARXkeHgu3CFwd6TRkgkx251dvRoAOVnaFlNOHVbZ2OkhtWRIM60e8Xn8TjFIctcWhVrc76j7r9KtAZzyyb1o195AGZz/ibtjey34rqHQBVbZnP2jn0Mo29EJd/V4xwqB0gXqKoHFJlOdBNyk7DQxePgu9kCmUMlbgxSVZQMMOXB2d4q3ZjrNocWCiQs+W4588tDuh6Yvl+1fiYaimqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7U5+fxFy/8iOwHPqNMFGUCQy11xfdREtbCw7pAj+YiY=;
 b=lDQPh0SOVryx9Dki9fa1NhZzezxeiJ9wMnYni4jH1XYLBg/o8kCDBKUfLfXZGUM19c7dNharyukxNpJiqkxKoo6beTLuR2X3lBXnGSebIBgjYtnz73/oq4tVF86yCTFJ+TOh77k3bddaF3WpBlE5totY63Uf/4qyA7S0j/5P3SE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5736.eurprd04.prod.outlook.com (2603:10a6:20b:a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 10:59:12 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 10:59:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, fabio.estevam@nxp.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/4] ARM64: dts: fsl: imx8mm-evk: add two parameters for picophy tuning
Date:   Thu,  9 Jul 2020 18:59:01 +0800
Message-Id: <20200709105902.23165-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709105902.23165-1-peter.chen@nxp.com>
References: <20200709105902.23165-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:3:1::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0401CA0012.apcprd04.prod.outlook.com (2603:1096:3:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 10:59:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cef32165-dd63-4638-56e5-08d823f71c9c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5736:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB573610FB262DD033DA2851DE8B640@AM6PR04MB5736.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6lHB2aQcCZKNTpglRrTFenTmMw9QllJQqOWIgbqNqbLU219T6jaRYvgsx/IA/FZ2fF+1OF+z9t1cU84cO/SwWbUieE3NLhHu9xCtrbJ+MTO26ZpuJ+fC8iIl5bH0JrHNHgYYPmmXWed0oG0hd1Ie8kg+3S0/wwPCBAfArd5jFGjHKfXmj360AH8hgFLxWKLHZd1mImInRndNkyLX4fRIeRYu5GGSDqQ32XS+EngsMFampCQmqOKJ8lG9CIfoVFkLec1BuibggXcSvMdtxmPcvduBO+hX9Gzp8BYO7U/vnAdErbGYFK+al3SYiYMewiEApATjwxMQ7gE1mjerzQFrXCQ36NKzuGyZSaYjZA1/6MiHSIr/ntOfUGnjMBpU3IZx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(8676002)(6506007)(26005)(956004)(4744005)(44832011)(1076003)(6666004)(66556008)(66476007)(66946007)(5660300002)(36756003)(6486002)(86362001)(2906002)(6512007)(478600001)(186003)(2616005)(16526019)(316002)(52116002)(4326008)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fFUXXnthk/ZLlLjLevbAsagrkmJLPwfZAow1vT48m/VfGcQYfAyzKtofS3v/X6Ve0uwIGV4HVZHZYtMJy0HuHuvgi8MJPYXb4EC48C7q8m5bjOiu1onh8ujzfPrIsbbsA11nvEWMAe+/FRD4wXjlCfOwr2l/C6NzQgSnBYQYgqxSjMIuB3oLFDtYU3pSufSS+Qr6nECJfYhgV6+gMCkeyOnI6rJ7zGFRyvvSzugqLDVdflC+FIfIHuVjM8PofchA9431OyjYq9qoMs3ccMogSgsc5Op4XTg2FPlL/+FylVU7ifJjejJ3NtSMesQDcni1ULp7r3DSBri47zTJX2acx35UweBTa2sPhzTPOlGwtkYtaOC/5VWBvyADuujZhV9drc3cgH4rhERyfIQa+9FYKm90P9eLSVEsfc6Gk6fIAJ8MMY2V8tuD/XY2KKJ/nABIXyB8Qp3EYfo0+3aL255zHB+idh19vw9saRzv+HtLx/c=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef32165-dd63-4638-56e5-08d823f71c9c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 10:59:12.0361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6wmxtHshE0PuhYA963KA+r4dHNgkuKNNsVHETthzPyi7QOuOBydOQOa84L3jM+mQXO2dfbKheuYqEweYt13cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5736
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With these two parameters tuning, it can pass USB eye diagram at evk board.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index 0f1d7f8aeac4..c432b628e1ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -324,6 +324,8 @@
 	srp-disable;
 	adp-disable;
 	usb-role-switch;
+	picophy,pre-emp-curr-control = <3>;
+	picophy,dc-vol-level-adjust = <7>;
 	status = "okay";
 
 	port {
-- 
2.17.1

