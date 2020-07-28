Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D4FC433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00F582065C
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="irzEQSyj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgG1Gsg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 02:48:36 -0400
Received: from mail-eopbgr70071.outbound.protection.outlook.com ([40.107.7.71]:1485
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726874AbgG1Gsf (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jul 2020 02:48:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ7flYndGwli4zu9zr460zLNcCLnrAXxBwX+T59juvK3MJGXLLr06wyfpCZ8CjADnjOdkSn+aGUD89pYNH8Aq5QWfiOuzzKUQ0/3Y7GTJP7deBQiWle6Dz4NB9ebZW84oU/elEhM7TpuQXdsC1HSi6quAxNKRgE9IzpRq7kWaUxxZjn8KblOyS79fAQD0Voa5OwvZCCDuFm7mWIFUvxX1wQ4d3dXDnGYBynrgtsDiZCEy3Ouy7hmk551cWMULhYOt24EXZSaBqC+014rh8am3X/EMjxEFLrwgGq3VSXiN+2KVYyPRxyY1FlJH0IJCwgAcimxlsmmg/rVjoZSFJlTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf3OUqGlLNAn4oqDFFZ6cyyI7yF9qtOtgf/rCbX1BEA=;
 b=CyJApGj9mdiOBR/SA6xD7+Trg/iWMS4uZIDDr1D+RWedmvLEPlMHyaTY0yxYvA4J1+ts88j+BuphsKBoNS9tw74xULjH2VA+3qddOyf8uAmbXZgYsaEj0O8UdlYtkvrpvt6fwDb9VONOmPyZ+NBIDUxlIM/Z+j/Rz8p6uXakSK9a+GJcyP1n4GED9qyd5VKQP3s13izNgizVqu82ccUbBBdiD9sqMs8VbK5kEB8yGmYSx0U4AmBSuJ2DCjlCmVB797g/JPScMIS3GjCZ1IIal41dA3ZUIyHkuMvOxK59oCgMg7iR3eYJil7ZpQ6Ev7lEqa4c8W7r21XIT6NsMlvvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf3OUqGlLNAn4oqDFFZ6cyyI7yF9qtOtgf/rCbX1BEA=;
 b=irzEQSyjPnDAEBbHd2kRV3KQvD6zmR4Vcjw05kS17y9buFXS1arXQB+AkYD8/e1Ur2khp76V9Bx/tGw7s+R80Yq60BVIKwmacGp8rY0XJbVray3jdkM2a1XsiHH8p/xYFZyP8eUsPAWd/G3Avx9L9lZDKSt8ZNd2ipFN2315DiA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM0PR0402MB3505.eurprd04.prod.outlook.com (2603:10a6:208:25::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 06:48:33 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::ed9d:4503:443a:3f4f]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::ed9d:4503:443a:3f4f%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 06:48:32 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: fsl: Add imx8mm ddr4 evk board
Date:   Tue, 28 Jul 2020 14:43:59 +0800
Message-Id: <1595918641-2325-1-git-send-email-ping.bai@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0198.apcprd04.prod.outlook.com
 (2603:1096:4:14::36) To AM0PR04MB4915.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR04CA0198.apcprd04.prod.outlook.com (2603:1096:4:14::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3216.23 via Frontend Transport; Tue, 28 Jul 2020 06:48:29 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52f80632-2004-412f-0919-08d832c23e69
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3505:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3505FD6F562508B2B149A58987730@AM0PR0402MB3505.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q7BJgyTXKmeq2D+24knGEit+3JNzhcEm+iUaIZLwPpy5LheSnznW4DXtF2uN6LPuVpLzq08eavXeDudr0h7/hNFXPaKmbXQojOkrZnn7vi0uHLo4Mgv2t7H3jbqjEqYU8SiChK4YQaa7CF7zach1YZPt3DbkL9lojjhpADsblMbCHoYSyh1OZ2VCgW0WWJEoN3EkgFz6t0vxqwAS78Mn+EFdX9ugzUp7lK5MOVx2yOU2KuY5fWerLZIC312eDvAG2eVa8gZh5MdghGggyh/plZ0hgEgbTiW3nSGjdooUGeWq/WKXNYL2zcTFvdPmyaoDc4Hk6SSKivMQ5L+A7g0WEYPiq4Xcqrold2MDgGkKc6H2BeIdZZHsdt4o3uei8WGI8qMHG/Lo7m21kR3y83ebGLGs4LXD6b5nJZAjiiTL6eQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(8936002)(186003)(16526019)(26005)(86362001)(2616005)(66946007)(956004)(52116002)(478600001)(6506007)(83380400001)(4744005)(6512007)(36756003)(5660300002)(316002)(69590400007)(6486002)(6666004)(2906002)(8676002)(66476007)(4326008)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 7Py84JQDYcepsDeJylFkooSEQZc7UwDdRliu1+mX/GmxxfnXf5yYr/Pm0NnLpo4I1Kqf1xHmppXMwnixb1T1NMLOaKXltL6QdSIHAOFtKXwAC5+L8AxUIaaGiJ/CjbS3GGJsM036yz3W9rPkTjk5KFWNah3TVTbneO7o7ZaIH6Prmtu9gaEw68B8D0ih1pCfUi4jrQZ+2N5TbGc8zXiR3SfIOb6qIhxJH36mchamDdN8c66Vp8BihI9OtkBLM8PVh2eJFEz+1lC705isMUDq7GGHq1uOFD92n5YYU2ivmmI5+DuOGJNRO3YtBDfo8r0gZMzKZfl7wu/j/4+riu+4D3JH86MSIdhpOSKH9yJE0T6n5ur3bk+sLLAZOuaC9DDbh2MMtILZOc/CoL5lom+rhGltBTCotxjWcEeeuOuGw3Ie//q8Kx2S/WkHFcHbALFTyEtbjYdE19r4mnA84GrHkaxBVJYE9dQQ5URImrfCa+Q=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f80632-2004-412f-0919-08d832c23e69
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 06:48:32.8638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MROHHp6CuqbSb86Ftu/IsPu+D4Yo9CO96NOFkqERfXsBcnQXVmiGAfs2NE9Rdnvs12cbvzHHfL/VX9eFdae/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3505
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add entry for i.MX8MM DDR4 EVK board and update
the comments for imx8mm-evk as it is populated
with LPDDR4.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f63895c8ce2d..7c1cb8953342 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -341,7 +341,8 @@ properties:
       - description: i.MX8MM based Boards
         items:
           - enum:
-              - fsl,imx8mm-evk            # i.MX8MM EVK Board
+              - fsl,imx8mm-ddr4-evk       # i.MX8MM DDR4 EVK Board
+              - fsl,imx8mm-evk            # i.MX8MM LPDDR4 EVK Board
           - const: fsl,imx8mm
 
       - description: i.MX8MN based Boards
-- 
2.26.2

