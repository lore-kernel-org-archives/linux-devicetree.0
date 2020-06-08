Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFE7C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 13:42:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2923206C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 13:42:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ib2jXlUz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729674AbgFHNmz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 09:42:55 -0400
Received: from mail-vi1eur05on2067.outbound.protection.outlook.com ([40.107.21.67]:60961
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725797AbgFHNmy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Jun 2020 09:42:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlN0r0CQapirOWvRQls/GMGzSN0eHBG6YJIfYY5jasQLI5WBdoBk9M+V5VINdAQRt7vzoGaYz2JYA1ckdyoGNPo5Hk+6JK4S2Nn5EujrGj33fA/xr4hHYPXGHFbJSV9V01tJRzVgFNrrYQQL5cVcjZK1KqPHpjI2maD2YuJ9OgEzQq7bpyCMnuhnWsJaCCV2g4i1ZlQfM9stTUrHyuSRVVglh7zKVZSp9SCkX71qdNMG5F405mLaFEsXEFZbcpnbAJMJLe8IyJFjOgd0KNoty5agRYfATc+uJe85IJu1vjVelBWD7OjiIXS7acbnnlJXN+3Wb0A5shOdKg7VPKwtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uc3X0k9FEt976DOrEo+lcC1YvHUIXRR1b779GNtexdQ=;
 b=WRENw91DOJ9y7MkeDcm26EvMzjBP0gRRuYshAxEXJzjmgGYiiwFyNX/8JHugYL53rVNPpXUdctpec7US6xRr3AM5sc92IJxblN5eU0B22mUN4pc9L85M03pInB8N37nwNr24AZxgZLy9pTgI0vGjRd9RYbb27d8Yv1B8GkmXFebMHNSDLcz5hgPI4GdjtY2MNOQeJMfNycVPAI0lXPPaiAtBKORCmu4XU4thhRpaPPfCUtJLs3OY5mF0u9RdmSCmOsu6CEId1BUXtDKkBe2ILaRDoO5COShWizkjuhZ+HogAUvZigBIg/lueibWL0DE6xtz/HjsQkiyDKvCh+6hGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uc3X0k9FEt976DOrEo+lcC1YvHUIXRR1b779GNtexdQ=;
 b=ib2jXlUzAN6AFJm8xn+z12QyvNGwoDa4KOcdDsdxgBQ2Qyejz6CvWkEmYixLDUuHCkv1Y566xj0UkNzJQ6wBPcPnzUuLrKlZymk5tA4orj8ODZoXDvTIJ6cfMwmVHnzRXqfVHK18Qxy9nXU7BWDgf6YqBm1At4aiC7kF1NC4FCQ=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6415.eurprd04.prod.outlook.com (2603:10a6:803:11b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Mon, 8 Jun
 2020 13:42:51 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 13:42:51 +0000
From:   Li Jun <jun.li@nxp.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, peter.chen@nxp.com
Subject: [PATCH 1/2] dt-bindings: phy-imx8mq-usb: add compatible string for imx8mp usb phy
Date:   Mon,  8 Jun 2020 21:11:32 +0800
Message-Id: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b47624-OptiPlex-7040.ap.freescale.net (119.31.174.71) by SG2PR02CA0096.apcprd02.prod.outlook.com (2603:1096:4:90::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 13:42:48 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 88dc800a-012f-4886-b9f4-08d80bb1d68b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6415777B3B4AEC016581FD4889850@VE1PR04MB6415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BikAbJjSrVwsZ4LMLNomdpZpz2Ulu7OEc2ityqLsmQ5sR/1z1ymDHxPBltq4scz7oqeD8taAq/uyvly/co0LiBjUjUqZXO9mALN7D5gE+JiQSTvObFqFMzgFLAr3i/1jwVDEgbnTEiDv2RLY+5TaIxr6Hg4lOe8JrJgSqFlj8zm22+g8pkIHpChfH6kYSXYddLUtQ0xkvF4LxFP2ouMgXL0HoHRPH3fHLBJUs4oTuVU9T0tv7coMfB8telqQbyvVYE2rb7jzsoywIiCJCjUitmAoSKTiNeXqm/n/xjUExAnIkUMkZ4RPrLh19Ub40XzntaoxMzJrqbBln+7gzYmAskLCoT+jIwtWuOX/3tj0VQVj8UJmUg/aQijeN/W9zahS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(6512007)(66946007)(26005)(66476007)(52116002)(36756003)(83380400001)(4744005)(6506007)(8676002)(66556008)(316002)(16526019)(2906002)(6486002)(5660300002)(478600001)(8936002)(186003)(4326008)(956004)(86362001)(6666004)(2616005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: gcNBoREG4aDKP3I51SvUIp0e4ATnlAzudmv+LHaTg49jcopB6iDk4ZD5dJr53pLVwbpc8GMeN5DHTBA54uNvy/ve+Kzh44f2j/CmblClK7KJJTOPAYLfUtzjG4LT++/9MnuKp3z+OreFOBb3s4lIA9xqJw3Ww39WctW/UV7NXlgyi0Jjaw2KJ1oGSNzHQq1uqiLMf12Ov5jDJQVsYdnxyWw7oktuW0DH7MFBqX8hscjQlN3RMIEwyMPwDgWQBvouo5AU0cZzZSIeTzh7GOlO6dUOyvxFq4r13snqZSYt69vwqA20/CRR3tAvJza0K8n8WaARBqdlDkmJZRTFabUTqccLJ9QBMAw2aKF9hS6Z6eVu3dm7gKh1jT7eeCiuCod1VgYLpD/nXzmnJpsmtvzculgVD49OHXk6Mc/M1YKi7qI12lP4DNJTHYjv7b3yYCC5F4GgfzzFTyZIxQSHZfqU7QskNQr2YLsydMcxxn69Yks=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dc800a-012f-4886-b9f4-08d80bb1d68b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 13:42:51.3071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65bUZSM4NKxPVQj9MzSNPSCA4eT55H/fVGzP6GpPp28zAX2sHDG2agc/2DTMbYTu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6415
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add "fsl,imx8mp-usb-phy" compatible string for imx8mp usb phy, which is
similar with imx8mq usb phy but with some different customizations.

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

