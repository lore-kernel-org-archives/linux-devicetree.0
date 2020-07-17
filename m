Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F68CC433EA
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 04:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 292B620704
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 04:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="orb/KqxC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgGQEXA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 00:23:00 -0400
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:9328
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726442AbgGQEXA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Jul 2020 00:23:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ff1GJI1k+rv9sDIhmm/np2fvrJ4vcfI9XjqCFSGokoVLRLsAMn5uNRaGiz/zlwoDpE1rdN1j4VOgLT6HxmVD8Jw39O0pJHsc3us9ERCIrx6mvPiNBLKuHl8Oh3Ex1xnYiioq1AzS8QweaMubPpwZlmy1UDiam19lZiJXJ8OhCv6aEBKmZz1b6qs2+b9tRVAMhNXEPHWGO0P04k9Mh/5PS2Q+WfmcKigfBatNhgGO6pPYDKZkYgn4pZyOqwOWDU1b6gUL0XjWSoIGM0APXvYvs+fR7nWTtpkXs9wwy2mlMxGthehAShrQfFQ3kXYooWXHfB7BeDfwHuaMXbuHnqquIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKRthqgJifBiZLodpXmYne6E4/qJhlT5udtkLoeesX4=;
 b=avLM6jxfHbqgc1pvwGpZeWf5s4Id+u84BCMeS4UvBXAH5Sy+jm6fzyEXlVi6k8wWiec3r3nF35UGhC22HFBJQeoCDNmvK9avCJdPKfDE+wUS6Rf9T4boAOcnumQFbZyi75oFscmZKOIUDMLtVjSYU53Nz5IRApOtNsRB5hE2zKp5Co3zo7D4QpnuLta+SnzJj12ASgjq3j2rVr+kBSA8aWSWRksbIu5wpV/FPyQbOZHsSsWIssdsSN0A9A514s3J/Qdoj8YJow882BELukZRrLZ9FT9XKyZ1PKevrReGuM1SIHzseG5iyTJeuVNlUJEOv5H+Xf20Hw1x+zLJyc7nWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKRthqgJifBiZLodpXmYne6E4/qJhlT5udtkLoeesX4=;
 b=orb/KqxCC45B+yNzrQ3+U9GlxmkrfdDtKVBDKV8NznruwbgxcLOqFrp6j5MSK9MFN+ktgkzjBr3HBskkXisyAR6G//HDwbhQWIJoEssWhykU5QvtzPqxJLIE/wjfhFpLEYBeL5I8bjO4xXVXeKga/cVpd0ER/8G19F2N/H+WA/A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6279.eurprd04.prod.outlook.com (2603:10a6:20b:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 04:22:56 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 04:22:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 4/4] arm64: dts: imx8mn-evk: add two parameters for picophy tuning
Date:   Fri, 17 Jul 2020 12:22:26 +0800
Message-Id: <20200717042226.18495-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717042226.18495-1-peter.chen@nxp.com>
References: <20200717042226.18495-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:3:2::20) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0302CA0010.apcprd03.prod.outlook.com (2603:1096:3:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend Transport; Fri, 17 Jul 2020 04:22:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d17b922b-1349-4778-f44e-08d82a0914b4
X-MS-TrafficTypeDiagnostic: AM6PR04MB6279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB62790F1F5F9E2680955512218B7C0@AM6PR04MB6279.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EMlbjfFGnOjiDiSaiAnODlETm6UjRWsrGNL0g4afyF1O2RyID89ZUNZyfiGEmL6vyds4TTob7V4Hj49wxjGqXxlEWO1xx9HhtOgr9xUNyEb5Dpq1cJMoGIK7XveAr5qm0MR0kW1bWAYOokJnUok/MLcxTRhvZOvLvNdgHr3mkmniVTpA/5E09QD5qxozjd7KnrHkvTwv4RQl6uTYp4DGEZDaYZ8dGOTT0FZ8M9iTK0PYyfXRI9EFr9vcqp7GWSnIbJdS/VScqwWsC3N58+D4S7rStRyWvLkI1zxaRgnUCzuh/V5MYl+ytGzqos9FXFTCG3YFrtNizXpyLpT1igJSDQsoFOZeRpWpi+/IuAWQOupbTtmsoJEhoXw97do/UprF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(6512007)(86362001)(956004)(6506007)(316002)(4744005)(478600001)(2616005)(6486002)(186003)(66476007)(8676002)(16526019)(52116002)(36756003)(8936002)(26005)(1076003)(66946007)(4326008)(5660300002)(66556008)(44832011)(2906002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jvef6qaCGbfZ8NxU1xF5ngVMfPk4XIig9inhtB3gqZtdkP+giirhMiTlBp2ugTY2GXw+3TyG4k87hM9eR4jLjneRlcUQdY2fwq6dlB7Mm09pjHM4YNh3ewvtz0PDHVPz6uFANREKVbBpLzfAWYGcp98lTlrwuKuQaeC2O5f7d6sgsbioMYYmepCyBT7SF5jwUnQ1Byq82zilzBAozRT1Em91xoxGbBJRzdoTatPkRn8PfZQLg9wxOSFzOBW97VJtfDwmkmVshKhU2XNErDNjWXdo8nbKdY6pOUnX9XZoVyHuDQkySw+KjGfJxrIgOXyuo4j6KX4AIliOES59/JYY9/s1trE96JnxqLR7mhJY8DWXiu1QHlMVGVal5PfQQWH9SuWddHy7GCCUj0wuS4YZ6pIXwl5iT4v49eF8dcoe2SULRRRnWCwUNySAofF8EPCBKC9Qx7nHWba3NdiGFQMJjk4brdZj6dO46/FgTfDGlF4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17b922b-1349-4778-f44e-08d82a0914b4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 04:22:56.6995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GU7lWvddE2pv4GKqqG83zIC6akFHADaxj5M2takJB3DWjs/MJPNOheY+PCQHm+VgdnqFBcWT50eVlzNB4n9QZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6279
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With these two parameters tuning, it can pass USB eye diagram at evk board.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2
- Address Shawn's comment to change subject.

 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 85fc0aa38c4f..a6e9035e6cd5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -132,6 +132,8 @@
 	srp-disable;
 	adp-disable;
 	usb-role-switch;
+	picophy,pre-emp-curr-control = <3>;
+	picophy,dc-vol-level-adjust = <7>;
 	status = "okay";
 
 	port {
-- 
2.17.1

