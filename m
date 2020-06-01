Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519CBC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 06:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1902A20734
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 06:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZPuJai76"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgFAGV7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 02:21:59 -0400
Received: from mail-db8eur05on2085.outbound.protection.outlook.com ([40.107.20.85]:11788
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbgFAGV7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 1 Jun 2020 02:21:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMpR2E9QDXd//WQFiRxwnKDcRWpjQuWFc7Hp/KqEWOUvGHabp9GcXW8I9v2uQpYyLXSL49dRES02S8mLfM0in5kgOGe/7x2HsMs4ZMhJhCSE/i0yOZFqnBMmICk6hS1qXg2JXNN9XMZEQnZh/zXwj4lsd757QqSoVl/seM6+87fFc5TzOt40somaY8piicG4S6ayxyxWGdHf2w/v1h33CQD5pKbSLUn5398V7KIuYqCtxYTb/RfurPaTZWJkoKTgccKF+WaBjKcPAnDq1qqEJ3ZW3qy/73Twef5lmtzNlFkBnG43DVhh23EuJnXgdrYujFQOZDdwKQcvy1HJXKp94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu6lIrAncbFzVl1ltS70F5JjeNb2UewxtTCnZHmYzQw=;
 b=asItazQcogldZGabqEKW8EWvD2KeuQmh6CxLXT3hOtdI2n5dgWXPgLeNxLlGC+q8KjHSpIE47WUAfxrCYnxfpMNG5dMv/6nrgCpOYoPvDxrigUX9HrY6OtCYebsEL53SVJGdLxVHacbWpsnkHcgwB/GZ7Vlddt9wciXcegI2aIhy+hpmt3C8gZyj+eMktXf844XJBLxVi3EYAlxiXhZ3KGuxhtJG5+RVbsgyFaDuwfZsh7BdGZGegNDo4UdFVzcqq/ZU1GqX89AdkH882PoSwcOSwkdcBomu5X1brU0XhmmpxN0bVZXmJgPvfXqhk4EvDDDCQYdghtJPxi/dBxa9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu6lIrAncbFzVl1ltS70F5JjeNb2UewxtTCnZHmYzQw=;
 b=ZPuJai76KutktAljnQVM6ra6y9efVXt7fX6X9qhsT88zdj38dfIoQgCErrcGTZMbbGP90YBjOi27XT8cJ9/ewZ/cAOePM7eF8b5CI/9YuwkXK0NzdBEh5JvyTDw//GByaOoPphL2FYyATJqVfWrkL7KG/TlY+yAjvxEeOvd5Y8E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4573.eurprd04.prod.outlook.com (2603:10a6:803:73::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Mon, 1 Jun
 2020 06:21:55 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 06:21:55 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, linux-imx@nxp.com
Subject: [PATCH 2/2] drm/panel: simple: Add support for KOE TX26D202VM0BWA panel
Date:   Mon,  1 Jun 2020 14:11:20 +0800
Message-Id: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:3:17::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3045.21 via Frontend Transport; Mon, 1 Jun 2020 06:21:53 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8c08c29-68ca-4f96-d5e0-08d805f414b1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4573606A8974F5475551A694988A0@VI1PR04MB4573.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0421BF7135
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLbBQgOGJkHVg9c4eeDsO0wmsJn3OfPU70H4KI9GUaHmHWPgAj8o+cmCgjUlIUnBa4MHxrgJFuN4GpXoyFfogjuj5XQ9UXpJ6QtuyEi7TRubbPPhFDfzobGkmjFjW1eXj7UOAf+ivlel4zs3eKitszaOG1pw6Usc+fRDsfbBxLKtqFKP90vSY7zaINEEgie0S4w9Jj72PEDzAgyltUgZEhqb43Mh4d1A85BreLuOxiGdhzQvp5Y80G413Qs0JydyoJpl0XZlquP9EaySdt5gJreYt1kdEIHWHN8pHoTkuHG6HO8Bznf6oN9j4FcUlmtQShvSn4+bmWsb5Pn6B/lPXR35NY5u4aMdie2eOlMROt44Kx0SURa9KoPHqEExZkdRjE4ILAOzRTsQblYNX4rmV0lvv0IsgvirhUTYv9ol816JeLFZvOYh6mjJ9mRNnUYVZl2eXfqURbHIdEK7GcdWxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(52116002)(966005)(478600001)(8676002)(4326008)(36756003)(69590400007)(26005)(6506007)(6486002)(86362001)(5660300002)(8936002)(6512007)(186003)(16526019)(2906002)(66946007)(66556008)(66476007)(83380400001)(6666004)(2616005)(6916009)(956004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: DatXFXx5KzcuHIZdzhZl+Il5VnN51qjzGxfOITcAj2Wa5Y4LXfZD2yi5611/46qBKdcnfctDWIZ44lUmVzU8Uda6Ha4ivluj4RVHRrLwNvePI1AotHQ3H9fn3TKm6vb2tJ9ZG02TiGO34kR/O8sY4P141zGEazLX5aAVeAQRHBjOgAm10h7aUaoIwkqUX5+fZJUAVWQO2pz1+QHZ8KAq7rtw2bNXp40eBQ0GGjrVJdzv3oSOJX4gqM/f8OxF8z11IrmBck1zkEZm4Ub3zsU0HlVXayatU4VNtXARVrbtQPNf33VNRpiRrdpdAkuz5RDzwGL2zeIPEIEEq2kAftkk6xbsM3IS8q1vhZ8Wi7KdRB3IBcHKifA/j4684fT6snGwTGTgULUCbAeKXFoRROWIlx80VRIQaSivaCdPtpQZPk2gjVS6gwQOcRITngGfSSX/Bqw0m8OR8NT/LWdF9Bh+71mnY4oNN5XVCwrKwEWmBVY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c08c29-68ca-4f96-d5e0-08d805f414b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2020 06:21:55.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+wrjjAWrd0ZRz/K+7MudeZUEZFPwo+MVhWYOXtT6Fue7EKL3YO76olV3u5BJSQeoJpcnmqEu+sb3N8Irwds9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4573
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds support for Kaohsiung Opto-Electronics Inc.
10.1" TX26D202VM0BWA WUXGA(1920x1200) TFT LCD panel with LVDS interface.
The panel has dual LVDS channels.

My panel is manufactured by US Micro Products(USMP).  There is a tag at
the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
and it's made by KOE in Taiwan.

The panel spec from USMP can be found at:
https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf

The below panel spec from KOE is basically the same to the one from USMP.
However, the panel type 'TX26D202VM0BAA' is a little bit different.
It looks that the two types of panel are compatible with each other.
http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b6ecd15..7c222ec 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2200,6 +2200,37 @@ static const struct panel_desc koe_tx14d24vm1bpa = {
 	},
 };
 
+static const struct display_timing koe_tx26d202vm0bwa_timing = {
+	.pixelclock = { 151820000, 156720000, 159780000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 105, 130, 142 },
+	.hback_porch = { 45, 70, 82 },
+	.hsync_len = { 30, 30, 30 },
+	.vactive = { 1200, 1200, 1200},
+	.vfront_porch = { 3, 5, 10 },
+	.vback_porch = { 2, 5, 10 },
+	.vsync_len = { 5, 5, 5 },
+};
+
+static const struct panel_desc koe_tx26d202vm0bwa = {
+	.timings = &koe_tx26d202vm0bwa_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.delay = {
+		.prepare = 1000,
+		.enable = 1000,
+		.unprepare = 1000,
+		.disable = 1000,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing koe_tx31d200vm0baa_timing = {
 	.pixelclock = { 39600000, 43200000, 48000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -3832,6 +3863,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "koe,tx14d24vm1bpa",
 		.data = &koe_tx14d24vm1bpa,
 	}, {
+		.compatible = "koe,tx26d202vm0bwa",
+		.data = &koe_tx26d202vm0bwa,
+	}, {
 		.compatible = "koe,tx31d200vm0baa",
 		.data = &koe_tx31d200vm0baa,
 	}, {
-- 
2.7.4

