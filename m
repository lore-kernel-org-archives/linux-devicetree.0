Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4E6C433E7
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 04:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A702C20704
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 04:22:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="dul0ll3U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgGQEWz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 00:22:55 -0400
Received: from mail-vi1eur05on2070.outbound.protection.outlook.com ([40.107.21.70]:54240
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726442AbgGQEWy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Jul 2020 00:22:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMwLQHh0rEx0hxDBLccMZJv6du1/nDoTlPUds4biSs2dTk+rZc+bLvbYuTJkUCUrjkZKwsYARqyAKTQPjcFifcW0oM5f/L7grKVPWpWb3XMWkOEjIANOic98xGVnucPD6GQfTg2LRzv0k1m7sKISRbMJ4i8NUvE7qlnfoFU7deZHD4DwK1r9rXkqqM5CZ0NiKZM+0KJxZrTvJ5cxK8kKp2JQYFDDnf8YIlA1bUfVpwzSgNrOrhjKN9FEdHDQ5wcs7PdCWVgonKaWmb+WkdomBSVIihmwjHwKme+ce17Fv+OTHPFfJG9OPKCVeTdTY2E7dFqOK+D252bs+zJFMYztvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjyHK8wNMT7oBpsXocRNIYgDv2Iwo8qeASNV3bCBEzo=;
 b=NlpJoVXUteImz1CWW0+6ENGCJBF7cmdeX/Pqj1Um+x9wQYtqNwBFPSUru5D7Y7RO3TMzLDoFUCk4JNL0d7RtbWUuFPJwThdpSxlfF+/X8c2wAXMjRqfSobO2eHtjz0aIh9Uzi5nzFn6vdyMcHBYlKmFik9MoZKF7RMfl2j3dtYdIXwWsUevxcn+ObZiFo5zx6hOHHK6YtTks5nzzb1lSaEGTHSUAVNBMLi0tEWkVtyidK+MczQkS/MwOb3MvKBTUt5BeIf41OoMOk9BjEVPPResQdLHrvERXGdKjikzxlbSJGiHkFoQgEPusalPJyscV98yH6KOjdLVnFfdoPlEWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjyHK8wNMT7oBpsXocRNIYgDv2Iwo8qeASNV3bCBEzo=;
 b=dul0ll3Uah/YhVmYZr2lQ21cjh6dquLgbA6n8RHMr8zIITtRgn5pqfhmdCdMu6soV2vrzKMCk7yrKlRPk6EstOpoJiuZ8WP19UEAqnOn7fFWetR0tOrkZla4Yj4BLt2PQGXgT2B8rP4e2muosP6WxpEXbguVE1sCmUAGPABfqTE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6279.eurprd04.prod.outlook.com (2603:10a6:20b:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 04:22:52 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 04:22:52 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 3/4] arm64: dts: imx8mm-evk: add two parameters for picophy tuning
Date:   Fri, 17 Jul 2020 12:22:25 +0800
Message-Id: <20200717042226.18495-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717042226.18495-1-peter.chen@nxp.com>
References: <20200717042226.18495-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:3:2::20) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0302CA0010.apcprd03.prod.outlook.com (2603:1096:3:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend Transport; Fri, 17 Jul 2020 04:22:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45b5b50d-942b-4020-371c-08d82a0911f2
X-MS-TrafficTypeDiagnostic: AM6PR04MB6279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB6279FCC30227D8F25477229B8B7C0@AM6PR04MB6279.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzqwGr25qfIfWxA9TLdKyE/TmjwVTWqBSybHnuTcMglRA2K0iyqvugotsw4QIkFrHI80o4F3UrokxFtY6whzoQeYuUmo4fpjI4aM2ZHGL8wOUcqHwZ43AM3ytqSMQYSv4qNFULktELPEFYnFI1BFgTh3xVt3tysKRyafL8IKqTP0GSqQI/NWIDurUTmfaUPx9XpWDkn4pnKtdkitStPsLoah9Fd7K2nAzVP0/jHhmlE6TSaNh+Rr2iLUZR8DQQPVPVtNjlfr8j2ldc99dmaaHxpvh+PrWpAb0EK4MniXLLGclVxrUGvlBeT1wIXeSIikDbcvfoBKXvOZ/5sbfWMGO5BtItkQOkKYKyspdrPlUFX1MWdxPfb5qxXvrJH23G5K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(6512007)(86362001)(956004)(6506007)(316002)(4744005)(478600001)(2616005)(6486002)(186003)(66476007)(8676002)(16526019)(52116002)(36756003)(8936002)(26005)(1076003)(66946007)(4326008)(5660300002)(66556008)(44832011)(2906002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yGaiur28ABVkU+KhlJBaG/GAmW79Y0DnnYeAjKf9iAOEDyLKdPfoSf8F+8Z9MXJgkyaiBY4bCF5Uyn5CFLAFUu1YA/DKOf+rkqsN4M9SW6IEh8Y5Yv7E0Gnfmckmi43fTNtaVy4jBOAG8scFoLJO+v4He9Bl/RayDd8dyseI5rHEWiqDD95s9SUm8jei9L8HKDxAnnBTCPixDjooJdQmfYxLBPjnneFBixOUQnm3Onc9jY0Cuyr8rouEXkcjQhcuRhYqj5iIZUjR8JnX2KfEUY+OqmW3Ug8/KC5FsXHR5676MCH5bjoMsKvjuQgE/cyEXrdqQIiVXCvBNQplleUM3de/Kz8n32JnhBuEwnOsfocW8/mmWSeL1D7i7LxCLpw8MPAsqjvFfPysr4AOF+ij6jCVfl4Ajs5BKFH27AvvHlRElhC+A7UnCvkc/Zobmol3FYhRYtAaXO7n3DyYJZ2+TSuMqLpAlPEBwVqUk0OfZww=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b5b50d-942b-4020-371c-08d82a0911f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 04:22:52.0419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70bwfuP5EuLwPG5xNC6mdzBbq9T21JqM3SZoEYexjo186r8Ec/4hMty94KvylQIJtmciT15gnPdrSHzB29E+lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6279
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With these two parameters tuning, it can pass USB eye diagram at evk board.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2
- Address Shawn's comment to change subject.

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

