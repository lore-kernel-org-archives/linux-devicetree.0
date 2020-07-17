Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D6EC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 04:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B837206F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 04:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="HFkACEDX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgGQEWr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 00:22:47 -0400
Received: from mail-vi1eur05on2071.outbound.protection.outlook.com ([40.107.21.71]:64918
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725300AbgGQEWq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Jul 2020 00:22:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrpPUFuyVtRqPq4yrhUJo5RB1Ztz9miJ3PRAOyTQZ2dyrjiWNmXyphE9/33te/T4mJ9e9KFyBa/hWoDgS9vBVyLLaJbsrLHy66xz1df0fgajBJucPOo5D3iiGkHbkqHL4uGSfGUfscgwZvAapdvqyfNezS761QuegnoxiV/nm6/rpX2+7SXrxI1ErWqukpRb46kqCOdWw3b4dK5IcPn4W030MVLoYheMTtWQHgrx+bhWz4lpDqPF+0M4Ry6jqABEefIgxmuQukazER4OsmYy+7ooPA5GCa/Bb0S8Q1le1vjfUGQQC2XuQEDGJ9zfR8TZprERe6DicRlMubWC3TcL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK47F9wUT2+uykjkV4AJbG7canpQgtW65gImQZrSpxI=;
 b=A6yUmPGdRWfOREEmYU2naKrizrVWAOMOqJSK1aMYzS3EXPSCLTAXtLEHLP+S6JyGYO62tS1C3cMVMwSbQJvlvvr3gRYQOBhVrvBxFECorbNsQqnYVt0OuBZWosKaSg4Zszm5oP9o8DukNQ/Sn1Xk9OMYtww7P1fO6EovQ44nJckfCy571RYPdD6leQa0tCksdo84eLlz2wAga+MfV58nDdKPV47dm5kE5Q2Bcz4yxr04T/EXhVyAV/Xai4C6zNQetjlGYr16rQZiB6x6kBpGJuFDen3AiXGvM8qQjkz4Pxc+foaDGVp4bbbfwv1AbNoOj24N9n1Hl1suc1tqVxwxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK47F9wUT2+uykjkV4AJbG7canpQgtW65gImQZrSpxI=;
 b=HFkACEDX+2HihKdnaQW3g0obyHxYx+SCwXXtXnaH+rFmsbyNITchVo/t8q1N8DHDI1tsdiKLwKcm9lfyJqV3aY5TGtM73lqOmyUjZ98opjGj6kq28LUA7qVUJBplFhTfMKe0KpVljqG7AjyiFTBVXL/skAZvE8vB76nsGjJ11g4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6279.eurprd04.prod.outlook.com (2603:10a6:20b:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 04:22:42 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 04:22:42 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/4] doc: dt-binding: ci-hdrc-usb2: add property for imx picophy
Date:   Fri, 17 Jul 2020 12:22:23 +0800
Message-Id: <20200717042226.18495-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:3:2::20) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0302CA0010.apcprd03.prod.outlook.com (2603:1096:3:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend Transport; Fri, 17 Jul 2020 04:22:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c48e745a-036d-4341-169c-08d82a090c51
X-MS-TrafficTypeDiagnostic: AM6PR04MB6279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB627952200A38B67163E992268B7C0@AM6PR04MB6279.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DATHHaVsXASBgZ8xb5RLT/sTlnkKwTiZcOCZ/yYo1itnwh72Gf555Sat8AltbB3e7/FGJxAoTxAefbRKWdc1DW+qasJs6lt/TvcheynwYsG1nwdC+/QyeAoeqaPp9GoyDuil80NEPeBwoub9J80Up455Lv0/QeFFp2cZ+MtzRFtdZZN1W4TftAWWrsVt3fAQfeLfhKFbIbc1MzqsDvRBqpJQ758MHKePtSa/iheu5a8uWLj1+L+H9mB8jH9BkYOPpzkV3h1IY2jXYsW3BWxlBpwuG7wCH/PEDBnN3jO96bJiPYNPzB5a5kWXBPdidb5l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(6512007)(86362001)(956004)(6506007)(316002)(478600001)(2616005)(6486002)(186003)(66476007)(8676002)(16526019)(52116002)(36756003)(8936002)(26005)(1076003)(66946007)(4326008)(5660300002)(66556008)(44832011)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NJSfBshSf+hSE1qoTpp2Me2tdvJwQrqjzPamThBduhKpgOJHgn9cu/E9SI2WhiSMjjjIpH2o3KgrALmrqxtT33xkhnWetcjOdH1S4l4seDysXlitU7U3oEDdYxQlf+cJMXJc/sWg91RTnK8Pj8KxF+beWJ3kwsYnb5IGt+9Sr7s/iryFeYu85UK2NMcBn0HfgyA0cM/wUnkjhWrh8FoLj2eFaIDC4KVistiC3ByWo4ru/jn1rH9O01zlyO5Js4NDb5hUhwri+zzHE3h330COFevkWpoIuYoU6wvgVN/8UKDHTQ09xPe+BUkZTpKb8M68VumKTErUrVx+EC2vBG+QcKj/MTw0LfLlj5VBhpqQIMD9Oof5j+NL3VCJ6hPlxA9zkpEY0mBa95+icMXEE4RquOyu44LxzegJUDU4yKQOpBxLR8nMv4WMiBww1zS7rDgwlrBaiGHLtwR1sFztC2rG8/fAbQF0uxXTKgXzI0qlEJA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48e745a-036d-4341-169c-08d82a090c51
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 04:22:42.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3pzALI/IW3L18aIBmBpeSOCNsBlDOHhdK8I9VxVSRh/kAl5W4yAOpfZy4u5Q7cqohJJPksMBn5cRVEkfjOuBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6279
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add two parameters which are used to tune USB signal for imx picophy,
picophy is used at imx7d, imx8mm, and imx8mn.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
No changes for v2.

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

