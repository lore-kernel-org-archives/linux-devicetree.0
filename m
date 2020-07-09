Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD71BC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F07B2074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="M4V4Y2nM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgGIK7J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:59:09 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:43178
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbgGIK7J (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 06:59:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4XNQXQh5sIbWiZclrNgd5ixcVd7UwbKUnCbOYeT4GMPH7zh20h7iPgZKQQ79uFd2ytYTuxeJNQdSEHS0shla5QYAWa6K6lowkJRd7mXB3AhYaJaemo5JK72tN2ArEtI7YItIjp3GXrWre8HcTF3/ogBO3LzgP5PlEkx2OOmgBrhGpdMkbTbi5oB/3yxrvZefa/uFAtKWUpxcafL4wP08/roHzQcBN7woOmgZX/p2DA0VCjFo4fLiy5fOfcS2U1QbuoE9h64wxhly9OJElTu1i/hBg0E0osQHWOJMcciVe6VPSwPr7s/YiR/RB9SefrzNqSbbnfLvsng5RtH4QmOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy5onE1qdPtnNI+asmUIO0+YT5SmDhs/EsVQcMgLcI8=;
 b=IZG//dzSWhuz/VPDubkuxlv+6EVewapzaBLfPP5iv6E1frpoaKZaI8ciG4mTOtxif4oKfEDABqyHWc7c7a3MVbQ02OWkkPyI41dgVXF6Yg8iNRbErwZaq/tPKCBSxswzKYdmhv5ZACPbFvWdiw3AxdDKy2JjWBbKrEeR9ZdHDnd4Ffl2Tb+YFMdxN3zJ7/kuKx6GswNPWQOARpxSTd6yST9xrvIKXZYjG5xR+eZvFtUuzzbpzhLETCg0xKs1D9js3561Vek5uuZmuU9OTktHo6JNcRSZf1ub6Gkcba+ELyCORRy/hUCpCBt7ipZih/IUfQchCAtLjxomb3bgBXsI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy5onE1qdPtnNI+asmUIO0+YT5SmDhs/EsVQcMgLcI8=;
 b=M4V4Y2nMd3quRS5aPlKvNC0+sRSfDdG8qZCvYMdo801rif1aBE/3qSaauzKrGyV1SYpTMuHF8KjXPFCGKtjjrDFlavdSauYCTD0cZIEBOGwI17RxWXvC8i81dDHlGA3MbVgbc13RNjmuKWLAirIRXHgVWJZNc3X6gu1rfR+oXk8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5736.eurprd04.prod.outlook.com (2603:10a6:20b:a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 10:59:05 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 10:59:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, fabio.estevam@nxp.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/4] doc: dt-binding: ci-hdrc-usb2: add property for imx picophy
Date:   Thu,  9 Jul 2020 18:58:59 +0800
Message-Id: <20200709105902.23165-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:3:1::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0401CA0012.apcprd04.prod.outlook.com (2603:1096:3:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 10:59:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29f511c6-5687-4464-5fd2-08d823f7188b
X-MS-TrafficTypeDiagnostic: AM6PR04MB5736:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5736225B7976E554110BDC018B640@AM6PR04MB5736.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7eGEb9ZFeL8wyEDq/Ehvwnd8GLGUSbPTlPcbzo7pt2s709vACDoyh1HxciZ0uGBbOErnSaPK5Hozy7Dr4NccoqzyaTehccykpe9KpZvqrnpBHui3QXVky7xwgPlV/qP+F31hSCQKN/0oftH3OdeYN7rk5lWBYZi9U0Eq+cZ3u+a3W8IWPIHjh2JQaZZVQf7BWYsJBuHTkiEfA7Bact1qAFNDsPyHhx8vb/Mo93inxK2I5ono8Hproj3XLumguRmwSmScpVfbuRQXrjRHsCKP5zaRFWNA+FkxNtfjoEvZeh0Bx7tzmNcw7q1yQriw5rjA1lLHdD5+Scd97au0mTW3GA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(8676002)(6506007)(26005)(956004)(44832011)(1076003)(6666004)(66556008)(66476007)(66946007)(5660300002)(36756003)(6486002)(86362001)(2906002)(6512007)(478600001)(186003)(2616005)(16526019)(316002)(52116002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yEic1x59ewLC7a7ZnOsopORk5U2AB4ovC/xkFYmEt7Q1VMf63h/n4K+hRM0sO66ZgundK7gu/E6NZGDIkg8eB+LO2Agti0hIUevX2Y7888vLeSuYVGs/CKXFj3zq5m+Usj+PMO76lDSCXA9yokihAjS37viyyiETL3fZ9kUQME1tnS60UhecXFryYOkXQN5m+95GbiPaICThjOrJ0nlhzhWIRfMVPzAmtmQNEpbPLOGXZDP0jPRKOBB7DI6NRQ4O82XEyo+5NZfWqoHOy6UJHF7WiUEPvzdzGMOq/Ic7mAOL1HchV8py5qTM9ZYh3f5wKpJzGfZGrsVsrnFAIjKZHUCiKRKQtlheImuW7Hxk7nVf472wGdvstmexeJTZ0wu3ceGIal9Myt1uCSj0bbpPNXEpQfVc8PUoPG7KwtnfwZlEvgbwgQX6KstiL/WgEeMkC7Y8TACEglCKU+W9NmK2vg9ZzE6n6E1yeLF7t8AkBuw=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f511c6-5687-4464-5fd2-08d823f7188b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 10:59:05.2240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcCaTp0N9djgFoYX2XrJQ3uw0co4z+JKkqHEm4MKtJtK9OiwY+2aGZ0zWzpbl3IQbaEVLX5wDeX+3ipFnoGESw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5736
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add two parameters which are used to tune USB signal for imx picophy,
picophy is used at imx7d, imx8mm, and imx8mn.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 51376cbe5f3d..e9858dafb08f 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -100,6 +100,13 @@ i.mx specific properties
   It's recommended to specify the over current polarity.
 - power-active-high: power signal polarity is active high
 - external-vbus-divider: enables off-chip resistor divider for Vbus
+- picophy,pre-emp-curr-control: HS Transmitter Pre-Emphasis Current
+  Control. This signal controls the amount of current sourced to the
+  USB_OTG*_DP and USB_OTG*_DN pins after a J-to-K or K-to-J transition.
+  Details can refer to TXPREEMPAMPTUNE0 bits of USBNC_n_PHY_CFG1.
+- picophy,dc-vol-level-adjust: HS DC Voltage Level Adjustment.
+  Adjust the high-speed transmitter DC level voltage, details can refer
+  to TXVREFTUNE0 bits of USBNC_n_PHY_CFG1.
 
 Example:
 
-- 
2.17.1

