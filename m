Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D090EC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 06:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABE6D2074F
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 06:06:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Owu4YkuQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgGXGGM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 02:06:12 -0400
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:45703
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726178AbgGXGGL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jul 2020 02:06:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibey7s7uqCw4m4jD2d15qpyMQAfEDiGhvjMWDJbAgdmZC3JlEd9Ir233pNjY49rfTh08a9LTxjwVVLWH79B/Ifh0EeE8E4kt3QX597iTZ9SKBhFk4hNqI1K8ehTtbH3SaD0DYXRRg0FZvoKV/TxUW3qX1pUb5jsk4pq3gBCuaZSEftxkVNmAcAp8aSiE7TZcDhjTVAw/NiNRyeZ2m1L5N5zZbsX+LwypcU/rga8CD9lGL00jsmu/W5MMMyq3drnVFXA44jNI5cBvx5B57MBSXrhmdhkGaeEnLwy9dZ+mtIfk5JzxYq6tVp2rFZOOV1XK5U/mriyY/5n7wu1DjGUyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZpVvrTU+4R7pgfYK/CVTRSNjCPWo+YJuyh5U9n+HOI=;
 b=B39a7GbWCqLupuhSXNbhSafpB69B4CPdJvxRvpbfHqAv/fuOKlmnqetnootPy6RAKjkC+sr6hpP5msgTtHSIZO68n/WvrrqoL0VmmV8KIVF1gDDgrV/Watz7KAJV8QrXCjBDpJf5Y0xgcqu8gswCV4urpfuLgERDbdz06zp43vAIqqxTBEGhl3/jNzhzfDOsAQLMjmrGzbStWII33LRG9LhHwqm2JKLo0vsLYU/7KTZma5rJ93MIa/Xfj1nRngFC2+AQFljmovipKY/kBjM0gsIx5a7cZ89z4JyxjcxTgON4mA6YrRu+d5D1ppxrtOF12RNp3RX0sdzwRdBy06/Fhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZpVvrTU+4R7pgfYK/CVTRSNjCPWo+YJuyh5U9n+HOI=;
 b=Owu4YkuQ/uvClsUzvhaN5sisN258oSHy3w1uQArH/mjujfmnVvEQ8PCadK9zJJGDUXBrCvvJgVg56ekQGei9xXO+EOyxDpZCiNHjhlbmuj2mFFhKw4qp362bUBvQZyICfMjlLOlBoZUq/wK75AJl+sKzoer5hyZ8auNEGHyLDHY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4248.eurprd04.prod.outlook.com (2603:10a6:209:4a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 06:06:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 06:06:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 3/4] arm64: dts: imx8mm-evk: add two parameters for samsung picophy tuning
Date:   Fri, 24 Jul 2020 14:05:31 +0800
Message-Id: <20200724060532.3878-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724060532.3878-1-peter.chen@nxp.com>
References: <20200724060532.3878-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Fri, 24 Jul 2020 06:06:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fa49cc8-6143-4049-1780-08d82f97a820
X-MS-TrafficTypeDiagnostic: AM6PR04MB4248:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB42481BEF7C6C3C6F16DC64D18B770@AM6PR04MB4248.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b7CjCXjHfmThfbYgtWH6cZ/v8+xAPNCTzv9YLoDdsnBJHi2CrgZxEjTcQL7XfgWEqb5GXztm8dhVheuRVQOeQkXsaAfJogHWnxSyKMyYbHBui1fUhMfDMU40oOWcxG8n9Ja5hpr85s5oyp3F38/fEH3PNNrTj7MK13rS4k3izmV5GhLzy2EQ3rRlo+pdY559lqQMAGXMfujpyTkmpps9NLz97T7Bqmbuju/uwocdkI4RtXZENrqbd+aD9p7jmVprNmYEydyxm+z9FedLFBW2HDnKMsM/q30emB4Euujii2ov6PQFH5Yby0nNpLOddzYq/1GnKdg+qPE+Ve0FpAwDYHZdYDHRbu9UdhZWGxQiU+hjoq45B6Xo1qRRw6BRQBej
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(8676002)(26005)(6666004)(36756003)(2616005)(316002)(6512007)(6506007)(6486002)(66946007)(956004)(86362001)(4326008)(66476007)(4744005)(44832011)(186003)(16526019)(8936002)(5660300002)(52116002)(478600001)(2906002)(1076003)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mUySCWRxTCNVyEi1U4H1DdpqbaVAmRKMI7JJPufuJgE5IT8H2Nz5/ScvJLRkloVjm9yOp6XlCWe+mMEUGUaukStnKhzbUh1JlGLfPl+mT27uf6QKH0SYIj8Hu8q0It7scRq9SCqW4Dci8bn3IEOWLMKG9hCFPgsJ8nl7YG905gyEqFUOpf6/VQbeLfq0w4ETLfUQ8wvOq2SwJ/gh6BWm/ixmVs1nYcywd5U3lYEB+5OWseTTNwWAeTxJQDpjUtMB2w8yi9FAFB0ZsoRQZDcgPu+fkdMNbZt6O0rQHb4CvgeXx0MoA/V6KO+UPtmtQr/plKBMKpnvyR1yujXAgC/KG9FhSNt4/eYZfeVGVIsPCWA0+aiCPxh2MdEaMwAHt5kVkTbdweIw3H0CsjiSg8y5OkSyn4/7jBWxrsHQ3dM9zcRefb+RHPGOMRCBtvUMQmiN5HY1Bhtv01EUn8v7XQE6zV2kBXgNlPA1M/jPL2NyMCo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa49cc8-6143-4049-1780-08d82f97a820
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 06:06:08.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkSoYZodOuY3zpszr3LN8gahLCNkUTZ/kR020BBy0Kz3opxuu87dVOpvFWltxufOXQ0Z9v0WG8hK/crErya+7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4248
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With these two parameters tuning, it can pass USB eye diagram at evk board.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v3:
- Using the new property name
Changes for v2
- Address Shawn's comment to change subject.

 arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index 0f1d7f8aeac4..7c652b898114 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -324,6 +324,8 @@
 	srp-disable;
 	adp-disable;
 	usb-role-switch;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	status = "okay";
 
 	port {
-- 
2.17.1

