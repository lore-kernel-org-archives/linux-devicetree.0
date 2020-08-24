Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DE5C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 06:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A63A720578
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 06:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aDB6RzoR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgHXGkW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 02:40:22 -0400
Received: from mail-vi1eur05on2042.outbound.protection.outlook.com ([40.107.21.42]:7329
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725850AbgHXGkV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Aug 2020 02:40:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm57wXA2IUz656rpJ4qR/RlbJFx6De5aA0YjJljBUcmrk37UVvkoXxfPwsVsawFfnRwVs687aJO81aJbo50QlUVKi5SN07y5o2IHFTleyJnbqvSuMW3JKICDHX3/UdBRGqRlxKvu9VD1SosrCYkQuYQRYe/8yCAayXsZ+0bVe7KDbZ2l7v+5jQjrCgyP4oUcdYt2dQVf/d61f0CB0H4dwY94JlB274QaOTR9iH1VWcGX0ZAcfbGmQhyWVjWcwprPXoech1Npzg1j8yMsCQke0AmMlyaE4J0vhd+aUh80vRtybpONXyGk+eshFVfZ8RhJXyY9AlpXwGAogqY/sK5N3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnvtcYErtpfavCYO8ey7LEchycGHdk3LJau+E/xLtjg=;
 b=nvIquL2SemlxhPAXoe8gYfBAaZ/3Ww/IkyZ4kJgD38iu2BTHiQwdWNxZtuJcpmKrctTY86cJ9oO6+2A/9lOyFd1CNWUWA89JvX0kw1/E8bHx2+Tf8AdzrfHwpY3cYyYDdM0R/CJHOyQBpNmMpql5nxIppMLfWwAepx7+n6h6fBW2d5HhdtbrMDTmGrooeciVwV0HszKU9Tr8xgWHKaKnzHBH39ZePmkL5vI1EvPtXCIneahHlVWUPBwOz/lOzLbytxwuTrFcxNRPuopDgogAntVkgD5X6QE4Rb3CQXos8iqYF+DZt6TH/QN8j2cxB5LVM603Yb9Mtjq5G+n60yTdsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnvtcYErtpfavCYO8ey7LEchycGHdk3LJau+E/xLtjg=;
 b=aDB6RzoRySDDwvMNy5xfTXRd2knBLhUyiA/H/+NcU2/kjmyUREvYQapplUjDS7duGbT6N/p5RjTYHMbxfR9RzmXfWS2PP+wn4PeFMSj8MN/hmPKQtCtKQi6H7xX28vKPj/JDrJbEc5ksVAQsSAkAzhOduba+qUefVC/hozT6C/o=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6221.eurprd04.prod.outlook.com (2603:10a6:803:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 06:40:18 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 06:40:18 +0000
From:   Li Jun <jun.li@nxp.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy-imx8mq-usb: add compatible string for imx8mp usb phy
Date:   Mon, 24 Aug 2020 14:34:37 +0800
Message-Id: <1598250878-28055-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0202.apcprd06.prod.outlook.com (2603:1096:4:1::34)
 To VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR06CA0202.apcprd06.prod.outlook.com (2603:1096:4:1::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3305.25 via Frontend Transport; Mon, 24 Aug 2020 06:40:14 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e3f60c6f-4d05-4c7f-2797-08d847f890aa
X-MS-TrafficTypeDiagnostic: VI1PR04MB6221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB62219AA1591EBDF2742012C889560@VI1PR04MB6221.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aT6l0wl5yU8sJ06JDJY/PMTzt/0sA3vLLuigX4MXs5e+y8a6jtVJ8lnnpL6mUyDnfVecqtWxSd8eAlThPUKrFUzCXMplrqss0lk/iNkbsasjMvIjItJ49jU1omrBkJFT6qgGVnfCK9PTFkmHBAOAPS0zSa7RpYNI2glQChEwEfb538SFztrgjfIfdLY29/eFbTwk6IfWgZBzJoTe6fiblVWj9eg9NWGLpyObBtzS0cMA81H+1SmgjniedWwylxBKUcXhAWTuuPOdp+GDiuQdLbe/f4Z2RRHvSEBQS0cHMGPUwynciemNWRce63imzdNibtibEKgvZ0q4Kq9T6q8atlctVLny9Rur2HbNoa3MTQPFIMh7YRyGMPYNBjWjzLzB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(16526019)(8936002)(16576012)(8676002)(6486002)(5660300002)(36756003)(52116002)(316002)(2906002)(186003)(26005)(478600001)(6916009)(2616005)(4326008)(956004)(66476007)(66556008)(66946007)(86362001)(83380400001)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: W82x8n/s+PTORELkiU7KjwKyy/m2vQX5kgeC9cjRk6UvN6EHxT8II8Bw5BxhmScgI2ZL01scwE5PLTsl3H1Oyzt8iIIXPsjTlGuI+jg4ZxuRu90RrnC+Z5reiLWmYfl17MshQZCFa39qUgxcaV+1zo8OP8C53Pf9oY562eryCngmKeNFZM3oL5moWY2dDCAMixj9Oe45Q50mUDI9id85UwHAyw12xwfL6oV/cPAaIUIJwqXmcm6qOGRP+MFDnh8RXypNakLIpMEr4LOziQKymVieurezGeRG/otvlJaRxwFInunvbhhj0CYtIEUH/0z5ArGORsHUbKZ8F0TUe1lDb6rCNhS6gi7Ju71qFL2BDIpDrN8OeijXEU3TZfgvoX0vfNurlZNOwpcL2lkbEqW3VFpgq9vX3gGjYtCMwlJyPGBw3jdMmf49vjLByiCBAMx/W+Svgh+BiYr8Ml5uUe4HkgP2ldcgiwXuT8E/4oeL79o3auqysabPgoJM7cfgOjmuOb/TTudtR5Yq02bFA/i+SBQwo2zqyQp+rEFjJoKce7KHGTI9pcfDfzETL1pmxqkztLxDrSGV9pXraxVbzpU7m/DMdHQuQQy+W4+xVlJvqm0B6Qg2zFt6f/buBUchLEir/kBHj/IIupetxkWekCSpOA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f60c6f-4d05-4c7f-2797-08d847f890aa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 06:40:18.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCh/1d/q0X1jy0eG9fOr6oB2rtijw7ctAIw4YcGUNWf7xq0WfR4hqb19SxOyxC+9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6221
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add "fsl,imx8mp-usb-phy" compatible string for imx8mp usb phy, which is
similar with imx8mq usb phy but with some different customizations.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
no changes.

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

