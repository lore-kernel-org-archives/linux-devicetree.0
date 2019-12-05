Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8A7C2D0BF
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 08:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3189324651
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 08:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="HWaeSx3b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfLEIGV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 03:06:21 -0500
Received: from mail-eopbgr140072.outbound.protection.outlook.com ([40.107.14.72]:24302
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728419AbfLEIGV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 5 Dec 2019 03:06:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzGstZ3/0W1V6Au82cNJvdGaB8mjTx8Q0sfDlMSCRj+3iputeXDQQvChsk1NMaZI/BF6NnC0fnsnmczgoOImWQGwN9jL21sc4lldeUewIHQVyB5m+qh6CfBV/pxY2a65HK1W8OfXnGZtSUpZGUv9loJBdD38MgBHBV+trfFQsTR3/JGjuLCgsWIceRfNeNao+IWY6QgdPyzUdnoLqympf3j2j4GJ1fONKx6DFpAPbo0bTVXcd7k7gWPbVEuSvURbEvCcmGNS3KiiTpUE9+VpiMbhsOrfc475N9MJJdWoOwyDmmSQMVtI99cmLP9JyjjbS8SJNOMpVSDKO6aotYwv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sy2yvF7lTaSCWszw23p8+imZjaR1+UzisULwMtz5iw4=;
 b=kKQA69FzRpN/nlCYtBPhJUA3wz+Aou7xvHZSOvgyL+M7AlWaHLiLH50lDRgKsZYo13XtC3YxkDj46SddX9e3l6qeG/CvKsS3XN/Q7S/egn8KdF1o8g5KqdQWvS0MMMMCLyj90yhMctbeE+bvY6DGjicnJRJbOR8Za5Kvu9gTiAv02A7WHQHYB+IrsV8mwSSHePGAlpCTFY5Io6HJv3msPR9tMQdIAew2quA1XH5n933b8eMrZxPjKEVj82x4HSN1rKkL5tN6T9s/uQK9IlV5z6AWKoOCc4uZC5/J2vDg3o22LlduQHyZIPDWGN82b84I1+3mr7gdTMDTrqwEmVo9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sy2yvF7lTaSCWszw23p8+imZjaR1+UzisULwMtz5iw4=;
 b=HWaeSx3byvzYw7l2OZaFQGj/8zrzmUV2Hco+SnonsPDVmDse+8QQrFSI7HPnh/qvTVH/8/oH3pu3Hoo4bAqu98of8ME9iyKGG1QOZqnHT0pQibbyJH5EWNRQ1vSON7BzMBd4AqpXBnOk4noCUMiWdw//ROv5UCyUHGdZ7kBKx4k=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6670.eurprd04.prod.outlook.com (20.179.233.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Thu, 5 Dec 2019 08:06:17 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::bd10:c4cb:c1ed:97df]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::bd10:c4cb:c1ed:97df%3]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 08:06:17 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Jun Li <jun.li@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: [PATCH 1/3] clk: imx8mn: correct the usb1_ctrl parent to be usb_bus
Thread-Topic: [PATCH 1/3] clk: imx8mn: correct the usb1_ctrl parent to be
 usb_bus
Thread-Index: AQHVq0LeKcaKVFbYuE65++4CmZUlQQ==
Date:   Thu, 5 Dec 2019 08:06:17 +0000
Message-ID: <1575533029-13049-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c55002d9-de23-4e1b-cfe2-08d7795a0132
x-ms-traffictypediagnostic: VE1PR04MB6670:|VE1PR04MB6670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB66701FFC26BF582DC258C33D895C0@VE1PR04MB6670.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(199004)(189003)(6506007)(66446008)(7416002)(50226002)(8936002)(81166006)(81156014)(8676002)(7736002)(186003)(4326008)(102836004)(14444005)(26005)(66476007)(66556008)(66946007)(305945005)(64756008)(6512007)(2501003)(316002)(5660300002)(36756003)(71200400001)(71190400001)(110136005)(54906003)(52116002)(99286004)(2201001)(86362001)(3846002)(14454004)(2906002)(25786009)(6116002)(44832011)(6486002)(478600001)(2616005)(6436002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6670;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gj1BiscJ/+ki/HSlp+uvZKkeFSckEP1sZr8+iTBFT5nAVDuJVI9tkLb1c/25+QJxMg2JJycdvp1e2/Q0gSiZEctPi3unAcJzMKXJorfJWq1Bx5TS0tjWoUCupnCr08pnxQyaEu8Ad3Xxahyy74jhKIrYrH4TLl2az3fW4N0sDF+dk1zuk3QP88jndjiU07xlgPmG8kB0IPwHrznMRhzzkoGyHNdPALH8GLBLGUu4qHe5nggYgNCmPKh9AIlYMahntdgpXRla3zgCC2Wl90wrfbq4j79B4aJ7iZabypV7c/XvxG4ECnkAJ+sBbSF/2+uxrTzUMgx05fcH2UqRVVLi6tXCvkHFj11Ff7R7FkrIYJNLP8iOEyR+m4aezGUl2OTlFxBsVVVjPlw2gXnrYSfeML47Rd5q9/wK5JF+9zoCJlemIaC1t0lyr9loMspMDOqrBGUd+LH1ulCZdiqdtxkjL3m8uALC+c5KI0LQDPi5IN1n2jlvViimQj3Jp7EcFLFu
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55002d9-de23-4e1b-cfe2-08d7795a0132
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 08:06:17.6006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8XOIeGKNYDLDSirNJWKD9kTdgmLQ+F2k288x6uubQfQvlabu7lAK205bfugvbMx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Per latest imx8mn datasheet of CCM, the parent of usb1_ctrl_root_clk
should be usb_bus.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/clk/imx/clk-imx8mn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 9f5a5a5..1c0d5e9 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -512,7 +512,7 @@ static int imx8mn_clocks_probe(struct platform_device *=
pdev)
 	clks[IMX8MN_CLK_UART2_ROOT] =3D imx_clk_gate4("uart2_root_clk", "uart2", =
base + 0x44a0, 0);
 	clks[IMX8MN_CLK_UART3_ROOT] =3D imx_clk_gate4("uart3_root_clk", "uart3", =
base + 0x44b0, 0);
 	clks[IMX8MN_CLK_UART4_ROOT] =3D imx_clk_gate4("uart4_root_clk", "uart4", =
base + 0x44c0, 0);
-	clks[IMX8MN_CLK_USB1_CTRL_ROOT] =3D imx_clk_gate4("usb1_ctrl_root_clk", "=
usb_core_ref", base + 0x44d0, 0);
+	clks[IMX8MN_CLK_USB1_CTRL_ROOT] =3D imx_clk_gate4("usb1_ctrl_root_clk", "=
usb_bus", base + 0x44d0, 0);
 	clks[IMX8MN_CLK_GPU_CORE_ROOT] =3D imx_clk_gate4("gpu_core_root_clk", "gp=
u_core_div", base + 0x44f0, 0);
 	clks[IMX8MN_CLK_USDHC1_ROOT] =3D imx_clk_gate4("usdhc1_root_clk", "usdhc1=
", base + 0x4510, 0);
 	clks[IMX8MN_CLK_USDHC2_ROOT] =3D imx_clk_gate4("usdhc2_root_clk", "usdhc2=
", base + 0x4520, 0);
--=20
2.7.4

