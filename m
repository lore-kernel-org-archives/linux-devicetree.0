Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC293C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 12:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 801CD2078D
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 12:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="g66REU/2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgHUMNC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 08:13:02 -0400
Received: from mail-eopbgr140052.outbound.protection.outlook.com ([40.107.14.52]:16775
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727103AbgHUMNB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Aug 2020 08:13:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atjUMd5oDXi4WWrqm5UXvQsBafFd5ldn+mzu2CNg2SY7OipSb5OBUR+TAXBzH9HN7JG67h+S3WjXk1Hxk/JRGeoFPKuWZFCU3r9BmrlCMTeCV6qGkiDHHsfViiXao7B5svfufiNiTEDuhnFSm8BT1JIj9QdOqr2l8juvMAmByImpTq2+qB+S/TD+ceIQIUsXfXhpGznho6NUsBXUnc14MLO3KAPK3hcEmFq+BZlX1jZXwm7b7A78B3igeBMQ8+NFzAeBS5PMd6RYQoWiDl3j1e51Vio+81H+aG7ZtUEZlJ1yBwZlbwjmeMjcQ4UKMgsmk8oMoYXaCv7B2T3SYbr+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eONYX1RaRo4P9Np6+cW6BY1dr/uYVc2z+kZy0nd0e6k=;
 b=ncTmgutNFeC73yPjIL98aavldke1c4zl7mrmLXPRCL4JhjBmG9jpjweaVon1tYp1UfahfIjQbVfB1UQVq/6/YnkCgV6Gex+8fB4vHgPZRG+IRn0AXGbbH0BHvFydEBrubjyb1UqhEdobwjXlL0tcl5t3eJUyz8H2H9HCjP9QqEvaRemX7oNlOI3AoEydXXB9CsO42LoP01oAtlkikEDx7Yr9bYA2Q+8T+zBKtM54YacU768zL/pARrb9Tw4yhNBeywGItLjZTBYbkry/r/r3HJAtHYd1SUbpUYAVCkOM4ifEqLDMHVYF7bP+rbyo18jdeqyElfuWqjL2K/4Oixm74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eONYX1RaRo4P9Np6+cW6BY1dr/uYVc2z+kZy0nd0e6k=;
 b=g66REU/2GmArzpKHc+53jxGIiYuG3td68HW1I4LNqZTh/df0piw75AZV6r+NR0xe884b4sfNK0qVGGP/Ws+Y48hz/XtA5SuLgUTEjJrNOw02UTcWMsE0mEDJ8SyR0AeUVP9FbQAlWwQsAz3Hf8rYXCHboRV4JvlJcKL+pKs0xsE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5389.eurprd04.prod.outlook.com (2603:10a6:803:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 12:12:56 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 12:12:56 +0000
From:   Li Jun <jun.li@nxp.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org
Subject: [RESEND PATCH 1/2] dt-bindings: phy-imx8mq-usb: add compatible string for imx8mp usb phy
Date:   Fri, 21 Aug 2020 20:07:23 +0800
Message-Id: <1598011644-6219-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 12:12:52 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ba51b35-b171-4945-3590-08d845cb8938
X-MS-TrafficTypeDiagnostic: VI1PR04MB5389:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5389CD1E2C8C64DB07294E9C895B0@VI1PR04MB5389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /XJtFmgMWwgz0+2RIKXzL3TrtGkDOgduN+l7Tu3UWhe8eIGGitWfSxCh07ToZoxz8l5V5BtUPZfU/w/W24b2ZAaeo6S9QZi/9GOgXzsINR2X3UGLyXDMHYIyCT1WfSxQdBzzge0NTYRkxQLeS5e+NfzT1DIkkZEkRi6/JUBsscGSUin9bbIDn3eqyhI3Ga4roWEmmq+DxJ0dZBbqRgvMeGwj1aFy2V9JrggQ80npkWvdvUhkIiqd58e7Hl0BgnJ6aTi1nJp82za7mzWqvuhkqP8cz6c4V30cSsIAaBT8GqdOhxQDxJIwqB+ziAy7GoMl8T8k0eK57IFCCm8oYfU6YqPRX7K5ArvEdU0dB313Cd9fVCMeWKPfuhyAR7wg72Dg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(4744005)(26005)(36756003)(4326008)(83380400001)(2616005)(52116002)(6916009)(956004)(6486002)(8936002)(16526019)(16576012)(316002)(186003)(2906002)(66556008)(5660300002)(6666004)(478600001)(86362001)(66476007)(66946007)(8676002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: qa9RF9h/Lw/m2g+Jum26JA5IwhCeeQD3RfxVWgoMUGI8tka4HEYfb6hyEnvr7znGJSyJUZIu60/knK8R7cCDoZNYz0dAmvHO6Pq6GBVUjCSNp7VyQMJ4g5xoyiOfNrT9yx8TDK4zzJ5bvTpMVLG4ycIHHYkWmv1jyycaIcXsnRpBqctLdGx0znOhK6AlJB0ZKj79aqMu4q7AUPbFu6Jw0+CxgAY8hDPs7Vvtz4crhMjLydnxTzJwQ4eJMRsBgpSHRqeEj87MMZmTdN2B57uH9d+SD2cOEMoiY8XG9lsqpusOKQUIKU7nZTuZ0yMVLUjR0px1zQaeGdp36JJGN0TOsOPcO+KyGiaGqfl2FWLTUna/dzpfKxsKirlQTUah8VOTfrfmMKkHyJ9coCSvHM9ZpvEtewRA46xIpoQOHgYnH9H0OOMomMZspS7VlUtYxkNr3qSRlc9XpZPg8S10uSDCA0T3V2A9Cdkb3tjTFM7a14uH4wBVeEfbon6hTJxnh0uxaQ6G8F/D7ASGcl5ytWH63HepZlynP11ZLFPYDm3zSUp8zyUgCB0o7ntjNX4z6IjWQ8vt+070SPnoD4ZnchVAhJ0iAjLd91DcWNoqdAb7BH2mcVcrYrIh6aJI2gBlLYCSleWLhhFd8qbfUY4tgdgrkQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba51b35-b171-4945-3590-08d845cb8938
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 12:12:55.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx0TWplnSyDs9gzCkhIEjId8FLINVCB+tUTxt82akGn3hvXnHCCkSMPo59A335C/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5389
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add "fsl,imx8mp-usb-phy" compatible string for imx8mp usb phy, which is
similar with imx8mq usb phy but with some different customizations.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
index ed47e5c..7c70f2a 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
@@ -1,7 +1,7 @@
 * Freescale i.MX8MQ USB3 PHY binding
 
 Required properties:
-- compatible:	Should be "fsl,imx8mq-usb-phy"
+- compatible:	Should be "fsl,imx8mq-usb-phy" or "fsl,imx8mp-usb-phy"
 - #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
 - reg:		The base address and length of the registers
 - clocks:	phandles to the clocks for each clock listed in clock-names
-- 
2.7.4

