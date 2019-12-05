Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684D6C2D0BF
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 08:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 316C72464F
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 08:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hPgW9BJf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfLEIG0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 03:06:26 -0500
Received: from mail-eopbgr150080.outbound.protection.outlook.com ([40.107.15.80]:27054
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728548AbfLEIG0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 5 Dec 2019 03:06:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9VIeLIJ+OBH0fnCIiEIk1GzstyjePoS0CwnhCtskuYPfiVtAD5MSAPB6XFhnLT6DcIzGcfFyAP9F1CCu6RT+n3L8cuUVwww6F58gDN64zAWPTf5ARxnIWIaY0aXzb2zM9Nb6+Be/XxaBK2BaY/M1PttFzd9E8EUIhx37bqYNa+7vYIGfI/qzjtdU565xFusReyfI9QuENNxUInS4dzzuwcoSxj4m/cQ7A3zpDHtpGtGhKLkf8C5SIvWl3sIZa/2NL5HUwpUhRDQ1Rz5xT3epLotpXRJ4d6PHufzB+6BUwN1ZCjztR65hPBImbGpLdx3NVa3hjLeDfD6CAh35IAvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vi5dMheK0frcX4pKUP0FbFy/Hd7yezx9VHzq/JPZD0=;
 b=TI39zcfhemny6ZDub8vJiOeRXNttbh40OdhqH+ZB18AACs/xtJRRpTkvr7pIxEWyisEZyCE8k6S9nQS9DHy892qfz/Gd9W3i5hZB6ANMIF941bflArIqD8SWziyfMBMCS4zJanJB2OKbrDiWmz4X60QMPxJmiqjvG/yF204EQkCrlGgiHB6dEl3kwXChHCuhbXia82Co5bWQhWHU2/cjs3aCfYQ3zxR3ZuaqYFr0/xO25C2z1f82pthvfG4m3T1+BcYT9YCX+7YwWO7kXFWCDTMhoV1U+5eNicv2JXDp2pz+qoImgxSCZLlywFiLUyRdE5SDoCiOVFnoavqJlGGYJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vi5dMheK0frcX4pKUP0FbFy/Hd7yezx9VHzq/JPZD0=;
 b=hPgW9BJf6WJG7Y06DdiDuh16AzbBuhy1KozSmNfpWkaW70W60EAvdTpTagnI3J0aCJltqiYVMAnN4zsdMpeC6mKR9nK+CrPhzaBpaoxc47iyCGihxYsWD9+m2CGnmMVc0OFTkkF2mUJmPGfdTnByvfBV5vvTRtETbSfVR2zMLXw=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6526.eurprd04.prod.outlook.com (20.179.233.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 5 Dec 2019 08:06:23 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::bd10:c4cb:c1ed:97df]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::bd10:c4cb:c1ed:97df%3]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 08:06:23 +0000
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
Subject: [PATCH 2/3] arm64: dts: imx8mn: Remove setting for
 IMX8MN_CLK_USB_CORE_REF
Thread-Topic: [PATCH 2/3] arm64: dts: imx8mn: Remove setting for
 IMX8MN_CLK_USB_CORE_REF
Thread-Index: AQHVq0LiB8rWXLXmP0iywflRiPHiHg==
Date:   Thu, 5 Dec 2019 08:06:23 +0000
Message-ID: <1575533029-13049-2-git-send-email-jun.li@nxp.com>
References: <1575533029-13049-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1575533029-13049-1-git-send-email-jun.li@nxp.com>
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
x-ms-office365-filtering-correlation-id: 596214d5-733b-44e8-856c-08d7795a0498
x-ms-traffictypediagnostic: VE1PR04MB6526:|VE1PR04MB6526:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB65264E1083C49C52F7F793CC895C0@VE1PR04MB6526.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(189003)(199004)(6506007)(186003)(25786009)(14444005)(26005)(71200400001)(71190400001)(4326008)(86362001)(6486002)(6116002)(7416002)(102836004)(36756003)(76176011)(305945005)(52116002)(66476007)(99286004)(2201001)(66946007)(66556008)(64756008)(66446008)(7736002)(44832011)(11346002)(81166006)(8676002)(81156014)(14454004)(316002)(2616005)(478600001)(3846002)(5660300002)(4744005)(8936002)(50226002)(54906003)(2906002)(6436002)(6512007)(2501003)(110136005)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6526;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G6ihUIP6rRk68DV8spMy2BoiOysN4v1+lH+px64HkM8ZqZw3pYhvh4f4iVFzt61MS85zMtdqJil+qf6jRGE34rK059cz+4xBafS9JNSvCzLVwlkO+7M4Uedam5UDh7wzBbP1wJkYDJ4HdwOZu1JT054gFOHLvJ7SpaCpIxBucZkNP/dfLvnnqeWnXbW1FeUnnfQPGnk5+EVmpaKGFNPnlB+MFv/uRaeBbhZiCCoewoEFO1egVIRY1M/tWM0flmuYRSGoYYUnK73rlfQZBwA8zDvlxX2Dg1MukLyiOKxWfDZAR36Lh3n4yaq9fOZAZpE7MwF0ZBciTHzMR10pYeG+Ay+8MldT6A68LjrlB2RPNjSVc/I0bbJkGqZJTfyBnUIB1NiMIZ3aLC59ojAw33UecNqFtbtQtwtcIc9SwNL4hUusIQWG6GQ0UoKJ06abWPyri1cb8M9Te6CHPJjhorSwhr7hlzi6wcl9LFwrfSGh8mC4fs9cWp4+LobbOOB8AB1Q
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596214d5-733b-44e8-856c-08d7795a0498
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 08:06:23.1444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: irjVwtcjFcYAn0A4cx5ryVYX+mEH0MsGIiB6BVlGnczDkBV/6cc27NNkf5HtNt/7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6526
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Since IMX8MN_CLK_USB_CORE_REF is not used at all, so remove the setting
for it.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mn.dtsi
index e916250..271d197 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -683,10 +683,8 @@
 				interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 				clocks =3D <&clk IMX8MN_CLK_USB1_CTRL_ROOT>;
 				clock-names =3D "usb1_ctrl_root_clk";
-				assigned-clocks =3D <&clk IMX8MN_CLK_USB_BUS>,
-						  <&clk IMX8MN_CLK_USB_CORE_REF>;
-				assigned-clock-parents =3D <&clk IMX8MN_SYS_PLL2_500M>,
-							 <&clk IMX8MN_SYS_PLL1_100M>;
+				assigned-clocks =3D <&clk IMX8MN_CLK_USB_BUS>;
+				assigned-clock-parents =3D <&clk IMX8MN_SYS_PLL2_500M>;
 				fsl,usbphy =3D <&usbphynop1>;
 				fsl,usbmisc =3D <&usbmisc1 0>;
 				status =3D "disabled";
--=20
2.7.4

