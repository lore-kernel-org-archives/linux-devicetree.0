Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075FFC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 07:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D64EF2072D
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 07:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gm5CxOgv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgHXH0M (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 03:26:12 -0400
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:28547
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725976AbgHXH0L (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Aug 2020 03:26:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiprd3aSiEr1wO+50PrzkBjr7PEXZM0yReF8XEu5GNtN+pum+QRuyTCWtQzxiBzjOgTX7mN7MAJeE3Lkh6OlztGacnaVX96DARnCq+gYijLepwQXUymBKdOsJeR65O+W6I99PhxQs5q1nsohMbscmX1uUaqOfvxeFTKD4DA0Kxf4pZekyhOkivrd4S4zN1YR7bJ7M4ZkVLP+ZDHZvPrIEjZRuR/NU5iaKGTVxls8kp5jjIb1c9TR75PMdwfO/junddortweprbUY3/kpFye1GG5RDSjD73AhwRDeF2rCBc4HMpqm71YiA0Jbg1Y9gAyTQ+7YxI8/4qMTv+zSHf49Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laiTpTpa6eSseFKmcPUxQO8A4qNx5rEx/3zZUUCwXSM=;
 b=bWoQhM+DOI7v2mJofc5zGe82KYyDe0L9XJys9BRllbRJQ0JWUWcGPIK0odYEH4mmr0ahaGtwpyrgVUxPBUk09IvMJ/zNUD/KHrk7ATaykovhYRzhcUTe3zg2mMEOQKp741GV1FWqSJXDbBBdo77PV/1mhf4a+fChZ4bxdOKVcYo98VdvWvydWc4tXHI2qOgyC/8q5OMTxZiAiI/zkk20QWbwUMEl6N+vyhCpQTBiSOlCHtCwS4GqM83whHUUXhfO48batxqRnFZzDlS7miTeGD2nESG8jFbWFXrozHA5n3L7FUhcxgHysbXL/vwgjYZ0e9C12IQWZ2wnKy4rY/glsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laiTpTpa6eSseFKmcPUxQO8A4qNx5rEx/3zZUUCwXSM=;
 b=gm5CxOgvuFO+6ruyjoCY4EVM0YJwI/oZGpV8oiJsMCTTxPpBrhWvmsFSMdlsJDcQNmRIrrxaFlIx4Ztmg6yLwY2NyGaXXJtX+S80PZyF4yH74wkybK3sw+aUsW9lbe7kncHrGqjm/gSw9aGLxQSA6MKWTMk8cSqcyH6RaAm+75A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 07:26:08 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3%7]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 07:26:08 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add imx8mm ddr4 evk board
Date:   Mon, 24 Aug 2020 15:20:25 +0800
Message-Id: <1598253627-25797-1-git-send-email-ping.bai@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.3 via Frontend Transport; Mon, 24 Aug 2020 07:26:05 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9ca6349d-189d-4b32-9d8b-08d847fef7b8
X-MS-TrafficTypeDiagnostic: AM8PR04MB7409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB74097DD3F9682CDCCDD720E687560@AM8PR04MB7409.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +X0qQ61Cv0Uc12PX3n7SPEW5T7okMdhCTU5FVKalWGvo86mbc9+kS4teMFXJCn16PTJZgymkDWO562dPGMQZD4igD1jAeThHEJyqO5ziAZ2/yBLJ7kYJd05EmYboNiDqbZgNirz5t1LiqifvqdbMsT0tCCpNIO/oN1FTdeMKfC7sFC1gCkOqADmYbL7g/0YmBsFUqr4TvAHMgbojAzLxO/0xi8MvOMdjiok4idevkmMPvKJuV5KBL0ruIRIPm7brRyaX3kpT95uKO9yfA2DOwI9+y9OEAKtngWW7DB7lhHALB8LfL/OA9v4NsFd8JQco1aZ+2eVQ78aec2enOKDP7O6uCxrxWUPRAOJnmA/5FXHx0W+IN4oibRnwgfOM1CnU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(4744005)(8676002)(4326008)(6486002)(6666004)(66476007)(8936002)(2616005)(66556008)(956004)(36756003)(316002)(66946007)(16576012)(5660300002)(186003)(478600001)(26005)(52116002)(86362001)(83380400001)(16526019)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: lnZc6SX+VP8PSNw/wpqHSjqwX9EtPoZN8vjShW2VPEN81EYpjbEWc7J/doAgqbNC3dZakgfD9Fdzgd55Ki+cwerjM2iM6OrO6b6DAoAZNFBUA6alOGU5LmoxQLlJW2t10AZQocJeXjimrXemYYsjmQUVq7437/9v6kC7wpdxyOcUTsWhL4JOxY32PRSqzw7GabgEU0SmD/tDWYabItW2oOL2bvZYCmvY+vdYn4IUeG8QeAI/FTdLSX5d14vZDEM7OqfhFzgpJPuBH0inIEyYUdKitO7Oexmvb2WDN7URKYKBQVTs98dFQcAelKxsm2ByvtPZmcj0MZNdimGpj8TPhlkejySUWISqSPA3n+z7fgLIhyL33s/4mjlgIiNnZV8ISc/+x1z4JOajZou8kRg2XNC/XeSHNLHgbZihM2uQeaSsWTJ69u/Q+yKU81Rvmz7mLixx05qLquMXbzVVZrLacIDhHl/yV9xpHIH1IGN4fYPpcyqn47smbitJqKXi1Yr/aWfgdkvVGaU8qrdM9BeGdxFf4H/C0DXch9LZoChf3oDyEllLHXoi74tLG9w/RqTl8IQm+fsvKnW9heqNXKI7Vy0n0LhdQ6iaIs3WAUNlVtSrtQ7ErZgX3iU0pPiB1SUVO4KiytJblP0Jf81fD9Rbaw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca6349d-189d-4b32-9d8b-08d847fef7b8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 07:26:07.9869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJBWsyfwdu1NAiQQ/2sewLYy10ikejyJlcoKBH6nKcOMixfCOLt/nPzpNNZUyxnOf8FfS98NDyxGw+BLDn/W2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7409
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add entry for i.MX8MM DDR4 EVK board and update
the comments for imx8mm-evk as it is populated
with LPDDR4.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes for V2: no changes.
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6da9d734cdb7..a3340d5c77f7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -344,7 +344,8 @@ properties:
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

