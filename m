Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DF8C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 13:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43398217F4
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 13:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aLwmekXi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgATN5Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 08:57:16 -0500
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:19361
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726738AbgATN5Q (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Jan 2020 08:57:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLUw16EPBetABfRNZidWfeQGoAEg3urPV4pV2EMNWrucIZ+UEgVbkszQLWOLxKb2OYZ7ZjtyAJlIiiEdrmNKWmXgOJzZSvSlcwsoYDGRtUI3zW5WWv3NvmMF0gDGSu1ROf85VO66ygIglUe17i+OhhpOl/uj6NfFxZpH68B7Si5NtUbbqFSk/hbcl9SWQVkm7rU7EB4Vp6VoeE5srG360GdPzu/g3PNQ2DbnwNcphWvz63sqxLywR8N8pBryg5P8fr4EUbtcJH1mn/7uStgsSKsADJX8A3S6o1cetBiwviHibNLU8qkyqll0V4r1V2yDh+IZY7UJ5ZI2C/NzZIbL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebGsAm3oAc01pJEeB5OpOUXXC1vCIvCS1iYG4NzyHr0=;
 b=oF9V7e2r/lsd2hf3YR0XYfLpNYyOfBJ9BxDBRZ/90oCi3q7GDhGhLROWYcpPZkWwct2yEjlDoxbpA63OWhx/ZwYgQKF7VYzGDKyGQGtyH2xyXPL+vzFlUwqQyxwnU8Iovf1nsunosKmtxL0TNaC8U0knT2RoIwB6qc80jeGvtE2YzeVYlKB7rl9iDl6ASGHwb/doF9s2/AO2uVayy1gQidG+kSH3sZzCfkTKH56w34juwwHo9dHeaWDEMTbJ8zFTj2bRJemoaamWqmiGsjPO5+ePTXXoNmrPx57EzbVyJXXbPYn5Q9OQ0vGTxsBvmS/z/ENnEXXpjcZl4WvOXajjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebGsAm3oAc01pJEeB5OpOUXXC1vCIvCS1iYG4NzyHr0=;
 b=aLwmekXiGaTHhG3d4oNt+2vFiW45i4VsjVbHjNzF1lJ5jt6IXesk8jcy6wTAPnWhcc3JpfbMrU1rhYplt63nsvGRVGRSqm2Jt82CRdBmugqo97JXRkQa8qb/KSbnIK0uU/Bz/k/8aM+BOkhaKlzEPFpU6S4dyklc4Jjcw62ZJRY=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB5950.eurprd04.prod.outlook.com (20.178.121.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 13:57:10 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 13:57:09 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Peng Fan <peng.fan@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Anson Huang <anson.huang@nxp.com>
Subject: Re: [PATCH] ARM: dts: imx7d: fix opp-supported-hw
Thread-Topic: [PATCH] ARM: dts: imx7d: fix opp-supported-hw
Thread-Index: AQHVzrCLycfX70mEmUSmYDkdjG+jQg==
Date:   Mon, 20 Jan 2020 13:57:09 +0000
Message-ID: <VI1PR04MB7023BA111917A69D1EA8254FEE320@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <1579428300-9894-1-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1bbdc14b-70b2-44a4-819f-08d79db0a4bc
x-ms-traffictypediagnostic: VI1PR04MB5950:|VI1PR04MB5950:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5950EEC0FC3043B1990B4DA5EE320@VI1PR04MB5950.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(189003)(199004)(81166006)(8936002)(55016002)(26005)(91956017)(186003)(8676002)(76116006)(53546011)(478600001)(33656002)(2906002)(81156014)(6506007)(9686003)(86362001)(54906003)(44832011)(4326008)(71200400001)(7696005)(316002)(5660300002)(52536014)(110136005)(66556008)(66946007)(66476007)(64756008)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5950;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jmUgNc9J3dM7gFu4BUHcpHCuKMwNS0iB99xbdJccR93587zuiPOhh8CyQz5S/BglMjwUGEt8bC5neJ5icrIewh75IlJffd74B4BHsiIiVJTHSpCpBJawrPkH3rRY+uCAw7x5+7Dh8E/bTGbq0IUoWNvtALdnqOqGJUwKA26AlOH2v7QSpkRgNtYsHj6PPS2MRfa2TUyYwJDZfXizYo1N2DkkTz6nkIE2/OF19UANZBnnD/cBcoGHivthDNww477kUr8wsKFk76PRdf2sqWLzplRaMeG899FlKf0sD9hWRv/LqRN5NcdyB+UP8eZor/pfNa7a3tYvmRS43Mk6v1baqgekETX9i2T7+hCpyLwbJ8Hilk1LfGZieeog+OulugNN0EzalhbzB3PLJY9VO0hxV4q/CE727053+bVj2DlvJ7xJC3MKjRiOvfRsHxmpaHyu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbdc14b-70b2-44a4-819f-08d79db0a4bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 13:57:09.8174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6dl29UFxS2Mp8hfZUgQw2DWCtuK8Fn7QfDvxJFs3kx9QvNXjZGvSJhL1b85nXeWpTx40MRiWAay/HKeyw+QmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5950
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19.01.2020 12:09, Peng Fan wrote:=0A=
> From: Peng Fan <peng.fan@nxp.com>=0A=
> =0A=
> Per i.MX7D Document Number: IMX7DCEC Rev. 6, 03/2019,=0A=
> there are only consumer/industrial parts, and 1.2GHz=0A=
> is only support in consumer parts.=0A=
> =0A=
> So exclude automotive from 792/996MHz/1.2GHz and exclude=0A=
> industrial from 1.2GHz.=0A=
> =0A=
> Fixes: d7bfba7296ca ("ARM: dts: imx7d: Update cpufreq OPP table")=0A=
> Cc: Leonard Crestez <leonard.crestez@nxp.com> > Signed-off-by: Peng Fan <=
peng.fan@nxp.com>=0A=
=0A=
My initial logic was that there is no particular reason to guard against =
=0A=
parts which are not documented to exist so checking the speed grading =0A=
should be sufficient.=0A=
=0A=
With this patch if an imx7d chip with automotive qualification is =0A=
released in the future (unlikely) then dtsi changes will be required =0A=
before enabling cpufreq. This is not unreasonable.=0A=
=0A=
Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
=0A=
> ---=0A=
>   arch/arm/boot/dts/imx7d.dtsi | 6 +++---=0A=
>   1 file changed, 3 insertions(+), 3 deletions(-)=0A=
> =0A=
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi=
=0A=
> index 92f6d0c2a74f..4c22828df55f 100644=0A=
> --- a/arch/arm/boot/dts/imx7d.dtsi=0A=
> +++ b/arch/arm/boot/dts/imx7d.dtsi=0A=
> @@ -44,7 +44,7 @@=0A=
>   			opp-hz =3D /bits/ 64 <792000000>;=0A=
>   			opp-microvolt =3D <1000000>;=0A=
>   			clock-latency-ns =3D <150000>;=0A=
> -			opp-supported-hw =3D <0xd>, <0xf>;=0A=
> +			opp-supported-hw =3D <0xd>, <0x7>;=0A=
>   			opp-suspend;=0A=
>   		};=0A=
>   =0A=
> @@ -52,7 +52,7 @@=0A=
>   			opp-hz =3D /bits/ 64 <996000000>;=0A=
>   			opp-microvolt =3D <1100000>;=0A=
>   			clock-latency-ns =3D <150000>;=0A=
> -			opp-supported-hw =3D <0xc>, <0xf>;=0A=
> +			opp-supported-hw =3D <0xc>, <0x7>;=0A=
>   			opp-suspend;=0A=
>   		};=0A=
>   =0A=
> @@ -60,7 +60,7 @@=0A=
>   			opp-hz =3D /bits/ 64 <1200000000>;=0A=
>   			opp-microvolt =3D <1225000>;=0A=
>   			clock-latency-ns =3D <150000>;=0A=
> -			opp-supported-hw =3D <0x8>, <0xf>;=0A=
> +			opp-supported-hw =3D <0x8>, <0x3>;=0A=
>   			opp-suspend;=0A=
>   		};=0A=
>   	};=0A=
> =0A=
=0A=
