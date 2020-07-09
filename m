Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C13C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:59:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D1D42074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="CJgHXXKv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgGIK7U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:59:20 -0400
Received: from mail-eopbgr20063.outbound.protection.outlook.com ([40.107.2.63]:59559
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726446AbgGIK7T (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 06:59:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGq2v5B9PvhWnDw0xEp6ZbC284WJutpfR7J3HnpOCqW4aXjxqq1JF2AIpqZftYGNhrt6+M6yrP7zaG8DpDaVfx3DCBlum7Tn6QYV6HDKJEUFify4WP5+wjdLt2TyFlFbg3Qsg3ZE9yQe66GTpwhCwY/2Xd76VA0fw4KA6/WLgoZUSg1kUtlCf466QRqKPnwtAYhViTnr0F+SWeVBOCNvCGh17BwD0+YUNs69vu7HBk+E3uj6ZwnEAfYzr1qepDhsYEVw/BQyL+cgUOHDnw6jeDSaH8PYWqXYblS40lI4gItWNuatwRxkTmyiMBCNDxI+YgC8+iuZkLBr43OAOpqZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52KfQ0DLibI9KVqXWL1dfOYoLRaNg2GIFjtorGLgxBY=;
 b=Aovqd5qMrR5wZUYtRoojy3dhorGkKb2t85KU7Byfws86ifvRZJvWg+nefrY6C5/fg0+0VOkhDCLLA1HkfwjdyqI7XMhE31HhGZFR200PqMAtbWW55LLbZzgDSG7KbJHSZMyBg2IQSiZTrvc4O1bxTlooG7pYPTcFOPm9wciqHDIra7QUnn4iYCbVYb2/J/5CZjj4TKLo6tE++dYdVQME6RSY3BuWu198nQwoiCl7LTpMKq/6gbLOJaDRyO9cRQTpD1UAL50sb0PemFE8S6Ehy+xxap9avMDYGQUJQ7PQsDlDqbn4gPqXbnQxJ+64aY5KitO6ehzHuaCfg5ZgcBTzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52KfQ0DLibI9KVqXWL1dfOYoLRaNg2GIFjtorGLgxBY=;
 b=CJgHXXKvbnCzbAcpCgN6lkgJw4szr3VEZM5nG4UpK+Z5JneDFHLgnCOVsnLgUZqcHuHp/a7fcFuEWyLRSbA4HuYk+EqZhX1RZk2JPvMxgyHpI5haqEfHTaQleoixAP2i9ZqWMbCwZKonCFPB9vJe4uDoeVpyNmmQrnM2LN2+8bI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5736.eurprd04.prod.outlook.com (2603:10a6:20b:a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 10:59:15 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 10:59:15 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, fabio.estevam@nxp.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/4] ARM64: dts: fsl: imx8mn-evk: add two parameters for picophy tuning
Date:   Thu,  9 Jul 2020 18:59:02 +0800
Message-Id: <20200709105902.23165-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709105902.23165-1-peter.chen@nxp.com>
References: <20200709105902.23165-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:3:1::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0401CA0012.apcprd04.prod.outlook.com (2603:1096:3:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 10:59:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: afe982bc-8984-47d1-d5db-08d823f71ea9
X-MS-TrafficTypeDiagnostic: AM6PR04MB5736:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5736E7099C13C25D67E2BC028B640@AM6PR04MB5736.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gysUgyoQQ66lo8Hbyahv1e98cKqF32HR1eL1BOtsxBhnzJdFqq10sIYZt+tnb7/m8GCs2f0QMrnVuBTV8Hu4aj77qjXvuRwoFJO6ZT/AmJthZB4SYRbXvfPEZ2aegD4+6E988OHdst9JVnmP9WNMky7LmaHGAGGt6kTznaOx2PY7/vIf3us4hzMzr+LbgrO2X+eaoJhdZFkWNg1LRbcfuc8EIQcXyVLAv/RTXp9yBGLffvtjNrMjoNmBbNC0YPIzFcQcxfK3u4FfDkdt0Lb/ERtgMXlOn0atIpryg0F6KahXbvIIjsOCBDPTp5R0tZ/t1s1o71TV/xdS1o+Kxsh8j1GiBMgSbqoLHAq9ISZmHZnB+U+jCDHr0UixM4nSL/aL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(8676002)(6506007)(26005)(956004)(4744005)(44832011)(1076003)(6666004)(66556008)(66476007)(66946007)(5660300002)(36756003)(6486002)(86362001)(2906002)(6512007)(478600001)(186003)(2616005)(16526019)(316002)(52116002)(4326008)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: PngpSA0xRUXi0z6+qIVNSM2FVNQJhNCOYT9WBOloif/LrEE9v5+W3EOkM/l8bXG6fILC9rU9aYsHiXRl0I4M/1T+yo7fAmJzyR4GNHsxWxjjQR3rCzjxEP11w6lQcl7o55FHtftRPcIfSJuf5YnpbXhZ6GUu8m96Rrv3YZvIgzASrEtsOAd8QH3xnNc2UNYlrUslXHvvbpHXz7azq1hGBj6aZk7+BQyXXeHJmItmznZlZ4G/f1iqNtIE4QQbK9N/yIMHeFzZqrl9qEP8rVdm0PPB9S4XyeQA+PNGDLEtmK2+7DthOfFAtZpo2X7JqVGcD9h9gin4LmoEuxzRom8HEkJuCPCJWpVB4HteF/KqqOPor2JUItxAt224WaxvOwZofiuaXnYWHHkygX2Iuin8Ne3UACKi4/29k/N43+AGDqTSa2kiLyyzlKz0dHHCe77Myad5OsCGTeDSI+/SlsDA7tQa19eexNthk7voQOoJI9xjhBYc8r7qbRPSH3zJisUB
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe982bc-8984-47d1-d5db-08d823f71ea9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 10:59:15.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+X+pyjfgIsSpHnamt/z3W1bJOadxCM4LnI2gujjzfQyV5j6oQ9RaKjsE6PNJdhhF8oqqQj6PhkJHNuBBj7mNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5736
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With these two parameters tuning, it can pass USB eye diagram at evk board.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
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

