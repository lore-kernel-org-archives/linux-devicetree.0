Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C31C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 13:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A7BB2063A
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 13:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="p48nhyl0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgHXNjs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 09:39:48 -0400
Received: from mail-am6eur05on2087.outbound.protection.outlook.com ([40.107.22.87]:3040
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727905AbgHXNjU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Aug 2020 09:39:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l156yBQiVMke2cseu/VwdIzhbEKw6cwSj2Etw6T27yfMNOKsMYp4DgIPguJnlNSo+Gi/KA6L7Bb/8NRH/iOgFkkAzdyaD6m9dIdEMvt4GmS+OLhsX18J0OUVRBfAR2xH2Q3EB809pC0wFvRm8ouQkCdxM7fsLM39wC4deEAL+KgSGTFfT9JwVE/0RId17un4Ce9iLkVPDEXUKreFO28sNESGxUeffkUDdva2Urv9LUg1YMDP2YL3Ly9OmmGuoCbXJq3afOXr5ZYYPKYJ03M/nMa7eDX6Jo9CHD45Q67i0YEcvxFfuvSvUkJGG+IzA6Jskdvvuag3wbPfudVuLiZWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb60X83BDs9Ng1d9n+h/MUu19LMKzeRXai7+edNhIK4=;
 b=SJUdOv/pPIkUmPSxtWKouNBWYb+APPLaOFl28LbkYxx0g1JXeow2c6b/SZZoOere+hJvOrVjJWHksA8pNfVjussGprq7EDWTJh4oyVmdE3jBKHCvzfkfB87cnVssvcbI6UV8/iYRhGqqPxot+eadyfcqChAeHu9ik15rNl2MqI9tL7uawUelafYZcgyZiaVvPYkeSu90SO8JmWkVcqRzF0tvIKqMpqgOgMNv8b8a7tdfMJ0dBv4b6ZjPGlWKTcIkJMpLczxxLqQnA4lnS3imojumcfMSTB+k6r5bdvXHEWVOTWKxLgZ4OsEcdSmv+aqtpJm6C8vm5wJre4ynNP/7/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb60X83BDs9Ng1d9n+h/MUu19LMKzeRXai7+edNhIK4=;
 b=p48nhyl0ZrGAs+upGPiCcvezrR5dbrzXHn0oSkitJb5aiygDlrEGICV/7PGhIuXwDpCVFzID7wFWroPG4R+F8Cc1tPIZgdmSio6AyIw576+vXu01h3sxGVkY3Vj0svN+7BtZWfrXS+pGcafKOZciYpd14pWFTT5p3zI80rPPfhc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4173.eurprd04.prod.outlook.com (2603:10a6:803:47::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 13:39:15 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 13:39:15 +0000
From:   Li Jun <jun.li@nxp.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: phy-imx8mq-usb: add compatible string for imx8mp usb phy
Date:   Mon, 24 Aug 2020 21:33:33 +0800
Message-Id: <1598276014-2377-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0220.apcprd06.prod.outlook.com
 (2603:1096:4:68::28) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR06CA0220.apcprd06.prod.outlook.com (2603:1096:4:68::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3305.25 via Frontend Transport; Mon, 24 Aug 2020 13:39:12 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4f90150-47b7-4f37-0eb9-08d8483317b4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4173996D58E3675E1710A22C89560@VI1PR04MB4173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7HzPR8mfc49R77iogiNBXpNxL2Cita2Z60R+PXH9zS32OuRM3/kgoRDMKR0mDq231KWaXyIpnRc+TSJcoG7A0JHKhUkWrXHkxa6UcfmXlsxThWeh+EPBLMPvxWnFsGxdFMxg4pGujqEOWi1LpILNeiaAfvNuzm24lZNyPomXtjiFsI/oajFJegTW0oBlTxzTh+ECsoPBTk5NzWzQ7kqlUVtYoonGrjCC2e6mMJ9bVS81DjG+eUvhsDHz8qNvGP8GKsGgGZas3VpiPkDghLhv0KlA1RB6IQTKBcFlbrw0DmME7LPrhUARwv3Ck32ann2qDgu3bObVBqc2F63JBuwyfP1NpK/odFyIAk42B52dRcT87tme7+fQGNCLvqUNNqH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(66556008)(4326008)(86362001)(16576012)(478600001)(66476007)(36756003)(6916009)(6486002)(16526019)(66946007)(8676002)(956004)(2906002)(186003)(8936002)(5660300002)(83380400001)(316002)(26005)(2616005)(52116002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: qnV3Pb54hKBCrMSaDjHPZXWOBOMyx03dkXZgkjkQJMxrkHCkw5h/qU+HFEAFgTdm67dV1vEHSXeXc7YtIHqog31AMGg4t1C5QXTRUzSHBghGK1H/tIp5UVRww6Ho0QWObj8vuNYzs8iqWln6BxSF7fh73kwEFlXQWjK94uFVVTFW5Y1/wYlIT+iw84pot1jJ6gLmhdwqxd3NG6ePAOSNrBWqNpbpTL2tg9KubDte78VfPTU/4qqUa+9M3NCa0Y9fSk6bdnQpIQ1QuxTq+WAQzORUjVxr/z43qqgka1lqyxFqZLzcYKVeCCpm5vl4CuZbHk5Mi7u9Q8eMf0ucWOdFDIIBbfhZ24+MPe5u0K78s7cBCUPYGvgLn77kI6K+WAalJzQqTSEvMUeCWHrbdmurFgmGDxYkPBjRbfpgd/hBBrejzgkBXh5w9iIPgFAvV9jI8gSjEyh5osy5jpo6M/atfCnDaby6NK2RU++CI9f7+hrHFKwFKX4FqD5/Wcrm6Ri6prMw3VUkFXogfF7t5NZrcBjrHWTI/VzdT9SNpN2Wm7yc5a+/9ZP0B7KsVw3ajjcuOG27j3by62qpBSu3JaMqQaBQ+QietOJVdyFbQ90C81lEKnX/2cXNYOIeB21zXHFmcjTAtxqHUJUWLARiUyLRRw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f90150-47b7-4f37-0eb9-08d8483317b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 13:39:15.5580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rui23BPyVv9J0KSIEW1pK9obQ4v5QlWit7+im0WAjIIuVPQU3wSxzNV8bCJ25bVM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4173
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add "fsl,imx8mp-usb-phy" compatible string for imx8mp usb phy, which is
similar with imx8mq usb phy but with some different customizations.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
no changes since v1.

 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

