Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E406AC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 08:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B98CB2065D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 08:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fPRovHyf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgGMIkd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 04:40:33 -0400
Received: from mail-eopbgr130048.outbound.protection.outlook.com ([40.107.13.48]:10722
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725830AbgGMIkc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 04:40:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2W/mw0AkkIq+DTKeXz7sdxjtbx+kma5YwBXBlsfzLCvndvugoItZH+mD1p/Sgr/FI1P4AuQ0yAWzWlnSjVqXBpd/qNcgGVLVJFTwCrcECJBebjvXEnJ5mHbSTAta8G9SRCdpYEksPJ8MLggqydJLxtFOnR8tXUGUxKN6uCrLbxsnD6T8OkXT4fJEGco8geAncolRFuf2TLRgIf0MtjZcQNlgLrGaQzOZ8XeHzbFERYU7C/z08MnF1fBFnyRxWxh/foM2T1TriSRT0sZ7nQjnxtBvHZiNQmPkMqTeBmqbd8eySPi+ttJWP2gD5Ul/5fdpgtcC56rWxhHUV+nAnJatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Olfc1ERZO23dz4gJNsFCqpFnHu/TtIRJlZ++ylWRFzo=;
 b=Eiqx1XVAFJLA9yOWKZOz4KSrNYOvknd1FD5pNEvpdTC0pw/CVk9KZp1Y4nSdFncJ6SOar/wWqXf+tWh56Z6EMnQvt02HxH4xNWyqC48fl54ofpeon812k1+rebK5Zb7h15k0aMuhAdGLBY2pF/F/B1I3jLKYMrDBV4NDFEfDGMd+NPnwLdhi374Lpjy8iBExDsX8SzI+xyret9TkRXA/AqZaxEMLxJKcp3Lp32YYB2koa61fkW/rM2h3KL7Z0S8Gg+Jm23sgBrIHG8xAeRnANHDxjlD2/2ANYhLU/QZmvT8K1w3W/RZhFZWZUf4vyQ3M8s3o7jhBur44wB0khoSFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Olfc1ERZO23dz4gJNsFCqpFnHu/TtIRJlZ++ylWRFzo=;
 b=fPRovHyfgUZFpcCr6NEIY4iZrPzYeJBqNrercqLGlUT8okcRt3uQRbNdEDru4TaXCBUgWILYKOxWAQxF4dhx64YvX0SyXBnHcq5NcYY5SPy7Lr56QBvbnVbD9HUqCNEaNeKxT/H3S8dwZiI46NpvgyquWAT5P6c2SL2KJ0c54xY=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 13 Jul
 2020 08:40:29 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 08:40:29 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 3/4] ARM64: dts: fsl: imx8mm-evk: add two parameters for
 picophy tuning
Thread-Topic: [PATCH 3/4] ARM64: dts: fsl: imx8mm-evk: add two parameters for
 picophy tuning
Thread-Index: AQHWVd/6PSh/hZ4gPEa7GemIPlKBdKkFNYaAgAABJYA=
Date:   Mon, 13 Jul 2020 08:40:28 +0000
Message-ID: <AM7PR04MB71577343E91264A4B6E05AA88B600@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200709105902.23165-1-peter.chen@nxp.com>
 <20200709105902.23165-3-peter.chen@nxp.com> <20200713083600.GD15718@dragon>
In-Reply-To: <20200713083600.GD15718@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [101.229.5.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9d63041c-9120-4a8c-97ed-08d8270865a2
x-ms-traffictypediagnostic: AM6PR04MB5608:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB56080DE11A19075DB74AE83E8B600@AM6PR04MB5608.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1AxC2z92RA9uablTHC6LmJUynOEq12nafliInmQLUg/wAuwihDOpm0+XMBPjiCt99A7lVaEERbQF324NcooyboMr1HpLXK1tfhfsD/bsk6GDO2vytQpaUYg1oHIxIef6ADDEMcooQttB0vwfs2dGxk0WOObkL1Wh8IeTuI4bwi8/TAhbQOw0iUIFg8O16X4RtFJXNamT9zc2YfNiR8zX7/CQTU7eP5MKrbd/ABsOuAyavT7Dt7ts8BoIv1Ilpa7zLckeA4WPuXqEsAlHnAc3bZCCMx0orNSd92skQUp+NExfMlJlFFLLe5+7M6LfpJY/KbYqxAJvbAVlJXq3hfd9xPf/wDeD2z9CEQOkFSZ7zmKS000bBAt6++lAo9QlDWxm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(478600001)(86362001)(44832011)(7696005)(76116006)(5660300002)(66476007)(54906003)(66556008)(6506007)(4744005)(66946007)(2906002)(55016002)(9686003)(71200400001)(4326008)(26005)(66446008)(52536014)(64756008)(316002)(8676002)(33656002)(6916009)(8936002)(186003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HFLvls16q3EJMc3TELtshbUnXfQc3Ay9q4zl8z7QvbVxQ9evkBMTbwq41MVdK0TmweabP3Z5SnsTNB+6rasdM2KBl6yCPVxgNbHLaNjbgEQ2BYlLOLkKjCy99bJoRyF5O3yD7JLPPEyEShXgUN+gdhouAMUgXG1Cw2jhyHSBVOAfj3uy9DWjrkC3gTnDuWBMin0wbuJvwkvAG8T15kRz4m9z/f4uNXf8nicIzw8ZwHRuBlYCD+D70vVyKUZ2WAF0nP+Id/Hw7c+s1wYmmYX7f3oUk0UG187CJrzf5HpTS3aYKiIB7Fmsu2kzGwuvSze4dVWjGW1b2hyec8Fxr+9LpwI/5VvdBOwiAuNjwkgkHxpuEDtn3OWPEpzoBFpHSncIMexPb3+n92DOd2s3xmGVlrQ9oVZ4J9CCCFJ1YsliYYYcyqf/x8pFBbp3kzEq9IBdzVQi0EGa5hAmV0HH648CuY9cFgtirmdNpJKBRMfZLY8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d63041c-9120-4a8c-97ed-08d8270865a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 08:40:28.9967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Myy7N8ZOM0bnQzM1cePdSktGQWUKZWwXMDMr4KBt+gmqsrT5qoaewvZW4uJRGp4b3VBJ//89SXbYPtuxfautaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

=20
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>=20
> It's not so consistent, but idiomatically we prefix arm i.MX platform/dts=
 patches like
> 'ARM: ...', but 'arm64: ...' for arm64 ones.
> Also with 'imx8mm-evk' in prefix, it's good enough to know this is fsl/im=
x patch, so I
> suggest prefix like:
>=20
>  'arm64: dts: imx8mm-evk: ...'
>=20
=20
Thanks, will change.

Peter
