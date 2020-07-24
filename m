Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC4DC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 06:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EAD520714
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 06:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="mATuAJBr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgGXGGE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 02:06:04 -0400
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:32987
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726381AbgGXGGE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jul 2020 02:06:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5PKGUQC+xBO4eIuFZeDMk4txcjEO46l5CETqa9pjFx7TYROFy3BQuKm8EQzbdsxT/v0uWzCUzKQFeY+ZBVHxFpt+CWwuxb5Rq6E9iEPL8d+YwbITkBykzIqLuwJhcj8fMt65EJF67r1+ox8pIxYU2HfCGT+n9BSyd6o1MP+uMGRnBGNaKFlR7XIshTXWPrZcRMQ8ZYJWDVdqM1J4ia7Ea15qcEb6QO269JBNcJzJ7NxqDB45F7ZEuzlCarEoYN/PLAtacbQb2QZQvvNR45Ht8x/eJaswekI/CMnMP4iIkkutLkw/50fUJvkASaBtbh0rkFq4AIqEZPl/iWSQHwKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xi6jnBWHV/a3CzufHWQlHz8iPZvYAo31NvK35eWlMKw=;
 b=av+VJYkdGWRtEeeO5CtB9wLVZz+8tX/Ylh3dT1xDCr8SNBS7bp3CZjJwQFgUxhdewyhU/qtdonYQGn1U4CCMsT4sRLsN34kK0k2rkgq1+pM/EdaKFobRmpkCtAtA2tCJpJs91hqKvJ7rx5UlGTTDJP6nIVfNbynU6rkiVDWTTX+qXaESUcnIP01v1ZiQisupzTGECQeAL2qMayf541CTEf8ovKlpGaSrqZkxotdBozKWhyfFW74B1DypfSTT8DJOSvL8PDf5Kci6S2vuzIm0y19aDHCvln2Ssx1pQCxxNI+2tJf0DH94R8eKxemnPN/meZPXo2okaUAeqplzHqk2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xi6jnBWHV/a3CzufHWQlHz8iPZvYAo31NvK35eWlMKw=;
 b=mATuAJBr4JBnV5aNTkqdJWYfuK4zhvjUljGMezl2ACUy+pLklf7ypXluavr9GS/K0w1r0zSYQAhseUGyb0IMxzAqTXTObSTVTUn1WlNr4tP/Bf/qbbpA73tlkNuDGiO26q4QjylrPfcI9GWp+OK6wnHE9iNVCUrK1n8K3I/vvMo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4248.eurprd04.prod.outlook.com (2603:10a6:209:4a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 06:06:01 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 06:06:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 1/4] doc: dt-binding: ci-hdrc-usb2: add property for samsung picophy
Date:   Fri, 24 Jul 2020 14:05:29 +0800
Message-Id: <20200724060532.3878-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Fri, 24 Jul 2020 06:05:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 651be118-cc8f-4355-99c6-08d82f97a2f0
X-MS-TrafficTypeDiagnostic: AM6PR04MB4248:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4248EEE877DE693AA49A212E8B770@AM6PR04MB4248.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9BHXehL+BZ610VmK8pxlTt8eR3LYJEpICL6HNSpPFK3r7C19yFvZjuulCAoR/FoaIK0gsGw/t8cVDGhE8Ck+JoD9ot3FQybd/xiEfIaCcj7rR918xOXk0YCZtFXKrjaBwzahAyl22EFAkyYqMBqFk/lIrt//eUywKTo0IdnFLfKl9NvybxUsuSXt5Hqk5cWD61SNXjLmzrikqh0NXq51DlkggCoQcFSmYOh4cfvKpJWKhiHaDBJVRNwJbI8N/5izE+90s+oFfs+CvqMslJRYaFzbBv0wNFdsHSE/v1Uo4GLTVXrJd+Gal1U+66wpbPs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(8676002)(26005)(6666004)(36756003)(2616005)(316002)(6512007)(6506007)(6486002)(66946007)(956004)(86362001)(4326008)(66476007)(44832011)(186003)(16526019)(8936002)(5660300002)(52116002)(478600001)(2906002)(1076003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5D+fqpPlZoQK0YXYIimYgXUfaDEKrjUfDfOMcJMBVDeL1+h2OPZYFlOtk9Vap1MUvYak/zkdLzymrpJvUNRL2bLzlh1i5Lbdhe/Aegb+byOBAFK7Yn66pIXTSbt3FfqmDjbq0vvi1JedwO4B5+s0Sc7TN5Z38kFrg3nhINmY+Vc2oxEjtyhV7NHPH9Zhq7Flww+N8i/VdHMxJQJOWcaBBAB0nxSXHyaYXekDp0tzPsr9xMYjHvWJ/CFsHq/M5KskTNHoyCpwZ7Hi6bh9JRxgxYlmMFXdcQ5JSTdvjEjQo51hEEoQuJiRNYRJLPi7+f38V0rEX77zwaBs/ScL/aFuwZe7dLPa45Mixw0pRd+e5uUMMK2wBefvQ1TAhsUnIQrZC76OhW2c8hxQ+P5j1zS4hnj+0ViBAb+m1LNsGMJPU0BdE8H6EvJpA8Q3iAYhk+ImxQ19RfmiUwclnvGUL57RdlBiT6WoGO9O7ArX4un7eLA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651be118-cc8f-4355-99c6-08d82f97a2f0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 06:06:01.0383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MB8/OZnOLGvu3fdMqZhLIt0VjubCIevDi0qxVfn+Q6LHhM5iUAwaz5dv3zC7OR6Nf/dVH6POQLXtVeg3NQH0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4248
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add two parameters which are used to tune USB signal for samsung picophy,
which is used at imx7d, imx8mm, and imx8mn.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v3:
- Changing propery name to indicate it is a samsung phy
- Add property range and default value.

 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 51376cbe5f3d..a5c5db6a0b2d 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -100,6 +100,15 @@ i.mx specific properties
   It's recommended to specify the over current polarity.
 - power-active-high: power signal polarity is active high
 - external-vbus-divider: enables off-chip resistor divider for Vbus
+- samsung,picophy-pre-emp-curr-control: HS Transmitter Pre-Emphasis Current
+  Control. This signal controls the amount of current sourced to the
+  USB_OTG*_DP and USB_OTG*_DN pins after a J-to-K or K-to-J transition.
+  The range is from 0x0 to 0x3, the default value is 0x1.
+  Details can refer to TXPREEMPAMPTUNE0 bits of USBNC_n_PHY_CFG1.
+- samsung,picophy-dc-vol-level-adjust: HS DC Voltage Level Adjustment.
+  Adjust the high-speed transmitter DC level voltage.
+  The range is from 0x0 to 0xf, the default value is 0x3.
+  Details can refer to TXVREFTUNE0 bits of USBNC_n_PHY_CFG1.
 
 Example:
 
-- 
2.17.1

