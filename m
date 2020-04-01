Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6ACC43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 06:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BF79206F6
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 06:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="nQo50/TR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731741AbgDAGvh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 02:51:37 -0400
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:6204
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730426AbgDAGvh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Apr 2020 02:51:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpFS8FgeDASoB/2v5y8yal0pL/UCAV4y5I9+kwZndHGXpRkQ+t+1cG6wdNQaTr/5tjiMxHpDd5aIBMekVog8pKYHWSE8o25kwLbAIOSoKZKYAYpQY4XT4DHfsxSh9e/olj+0t+ZBByS160fKLyE9odvb/lmwFGFDPvsuqNH+T32YlMuCjmYV5aJTDHKFyMCUpMciFa5UOJVz3E1AqLujYetBBMhCF8Uu3nxGAAmrAVzYli8Xn593+zL/J5FVMf/JXIGnP2ALhaLU/E6uuBT04Rxs+cnMR/41kyXHeKsKlpzctQD182SGS99dHauGT8yqnm9Jj1ZCKL8KGz7HObe1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNh6/KjEoyHfmtg3YcVfGORUignRmvkcuPpIpo8SfJM=;
 b=Bzl1Am+oE/WtyN+nCvFboPP1JXrMnocxcKwF2aXu/G4x/cWH6LsojhEEg8pG8XMYZqR/IY32uPpKYtweDePAlrsjC5FgBE6A4+XXlQNeNVOe+DoLwh6gCZy3jPwXE5g+tsJ2IXAQjIqDCGwylaW2MAOIfm19pZlBq/gJjxPEn6WXFltu2XbfGZWnyIfso6hZR2Tbzg745d0DZfszBDUu7GqRZDyMDoX9bzypMZnsRQ+n+NC/+wjJGLjcS2HLw18/1FZaUISnCsY9gsu3oJG6aQMcAFisQtVeKCl5M18IaioU/ZtW5NMtEwEmI1XNVBMG76gL6he+1tocDRJCQCN8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNh6/KjEoyHfmtg3YcVfGORUignRmvkcuPpIpo8SfJM=;
 b=nQo50/TRc2g6zITnM2xFE8hMqjU59Gk7vyX3AjcEoCyLxNE2gtRJ4QzM19suZRy4kivvFrovvwLICCkRhPyQ9N762r2TYsEsRMbdpEQzAGfL0df62tjNDHPgkQNPgJAR2NVzE/j4Dp544xUrVNhVhr9e2K02V88tTo4W2LZGia8=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6163.eurprd04.prod.outlook.com (20.179.34.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Wed, 1 Apr 2020 06:51:30 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 06:51:30 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] arm64: dts: imx8m: Fix AIPS reg properties
Thread-Topic: [PATCH] arm64: dts: imx8m: Fix AIPS reg properties
Thread-Index: AQHWB4t4/ugLiU2Tk0m1UIFW36Tgqqhj0+XA
Date:   Wed, 1 Apr 2020 06:51:30 +0000
Message-ID: <AM0PR04MB448118DFFFBA1C1119D257F588C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200331183725.25255-1-festevam@gmail.com>
In-Reply-To: <20200331183725.25255-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 833b2e67-340c-4b40-5146-08d7d6091bfc
x-ms-traffictypediagnostic: AM0PR04MB6163:|AM0PR04MB6163:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB61637D06DA30427EE896380F88C90@AM0PR04MB6163.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(9686003)(2906002)(55016002)(6506007)(26005)(110136005)(54906003)(478600001)(81166006)(316002)(86362001)(81156014)(8936002)(7696005)(76116006)(186003)(8676002)(5660300002)(4326008)(66556008)(66446008)(66946007)(71200400001)(64756008)(52536014)(66476007)(33656002)(44832011)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dn6Ckrt7xKPrGYitp+iDkoFcDXh/iCFVCj6cP7sY4VT9bZcLpzfsE67Y9N2lIltIX5Q5tZiOnN8ro0iK34mwZA178ql/aBfDtV/KO+ijiuyUZwl6I6yApkVUkUaz7Fcz5PxKbNWm+jFZ1vQZ1/pdYmpyTPBciFldQKrxnil2X4rPcHkxgGzXacq9KPVNprA4fXy2Ddud0mzSv8cov1aD2K1xmFgxIEmjUtBzysJruj2XLCcGz1I/bcC/V1HZCAsnSzOg/t2VjvKOgnI1AUggxlGgXhiaRQlCisEWj0x6P53iodLI19r8I9GvjuJv9apfF3ZYbSIlsLZbhBLFT5hVFbGfs7tCjtnDwvDyZIuDfd+2CuD5Q71X8epOW4IG/y+QC/5sYIEDzEznMFmCOqS+ff8jwhaYBRXViNySgKIoLT5hDTEYjLncIf/2zaG3ZTAmB+XFvrUSlrKr4uPDpLDTlIn0NcWgnTJ06XK9tTT2XyY=
x-ms-exchange-antispam-messagedata: cUMOiLxAUf0frRYiEOBX2w1XSanvCMWmacl0/HiQlgyKO9ow1MpbLZXDbdzMeVnQtESpVm17ci0IA35Ac9JS/WoSUaCbm9bFk/kTCi3ZR0EX7hvobYn1uAyO4+B7mlAV1WvSgKBnDAGoFTU7P6wy7A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833b2e67-340c-4b40-5146-08d7d6091bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 06:51:30.7135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/j0qKrJxL2VaslJeas8IO4CaoubuoE1fAfQIhzXzDtnd99xtLKOr5WMUuYkMC4tEKrjW8UJ278Og7aabVVjkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6163
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabio,

> Subject: [PATCH] arm64: dts: imx8m: Fix AIPS reg properties
>=20
> Commit dc3efc6ff0d5 ("arm64: dts: imx8m: fix aips dts node") caused sever=
al
> dtc warnings like these when building with W=3D1:
>=20
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:265.23-542.5: Warning
> (simple_bus_reg): /soc@0/bus@30000000: simple-bus unit address format
> error, expected "301f0000"
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:544.23-602.5: Warning
> (simple_bus_reg): /soc@0/bus@30400000: simple-bus unit address format
> error, expected "305f0000"
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:604.23-862.5: Warning
> (simple_bus_reg): /soc@0/bus@30800000: simple-bus unit address format
> error, expected "309f0000"
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:864.23-909.5: Warning
> (simple_bus_reg): /soc@0/bus@32c00000: simple-bus unit address format
> error, expected "32df0000"
>=20
> Fix them by using the correct address base and size in the AIPS reg prope=
rties.
>=20
> Fixes: dc3efc6ff0d5 ("arm64: dts: imx8m: fix aips dts node")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 8 ++++----
> arch/arm64/boot/dts/freescale/imx8mn.dtsi | 8 ++++----
> arch/arm64/boot/dts/freescale/imx8mp.dtsi | 6 +++---
> arch/arm64/boot/dts/freescale/imx8mq.dtsi | 8 ++++----
>  4 files changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index cc7152ecedd9..8829628f757a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -264,7 +264,7 @@
>=20
>  		aips1: bus@30000000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x301f0000 0x10000>;
> +			reg =3D <0x30000000 0x400000>;

Should the node name changed to bus@0x301f0000, but not
change reg?

The 0x301f0000 is the correct aips configuration space.

Thanks,
Peng.

>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges =3D <0x30000000 0x30000000 0x400000>; @@ -543,7
> +543,7 @@
>=20
>  		aips2: bus@30400000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x305f0000 0x10000>;
> +			reg =3D <0x30400000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges =3D <0x30400000 0x30400000 0x400000>; @@ -603,7
> +603,7 @@
>=20
>  		aips3: bus@30800000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x309f0000 0x10000>;
> +			reg =3D <0x30800000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges =3D <0x30800000 0x30800000 0x400000>, @@ -863,7
> +863,7 @@
>=20
>  		aips4: bus@32c00000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x32df0000 0x10000>;
> +			reg =3D <0x32c00000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges =3D <0x32c00000 0x32c00000 0x400000>; diff --git
> a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> index fa78f0163270..e62d4146cebc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> @@ -241,7 +241,7 @@
>=20
>  		aips1: bus@30000000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x301f0000 0x10000>;
> +			reg =3D <0x30000000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges;
> @@ -448,7 +448,7 @@
>=20
>  		aips2: bus@30400000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x305f0000 0x10000>;
> +			reg =3D <0x30400000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges;
> @@ -508,7 +508,7 @@
>=20
>  		aips3: bus@30800000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x309f0000 0x10000>;
> +			reg =3D <0x30800000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges;
> @@ -754,7 +754,7 @@
>=20
>  		aips4: bus@32c00000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x32df0000 0x10000>;
> +			reg =3D <0x32c00000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 9b1616e59d58..9f6ba763238d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -145,7 +145,7 @@
>=20
>  		aips1: bus@30000000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x301f0000 0x10000>;
> +			reg =3D <0x30000000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges;
> @@ -318,7 +318,7 @@
>=20
>  		aips2: bus@30400000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x305f0000 0x400000>;
> +			reg =3D <0x30400000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges;
> @@ -378,7 +378,7 @@
>=20
>  		aips3: bus@30800000 {
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x309f0000 0x400000>;
> +			reg =3D <0x30800000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 75b384217a23..bab88369be1b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -291,7 +291,7 @@
>=20
>  		bus@30000000 { /* AIPS1 */
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x301f0000 0x10000>;
> +			reg =3D <0x30000000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges =3D <0x30000000 0x30000000 0x400000>; @@ -696,7
> +696,7 @@
>=20
>  		bus@30400000 { /* AIPS2 */
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x305f0000 0x10000>;
> +			reg =3D <0x30400000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges =3D <0x30400000 0x30400000 0x400000>; @@ -756,7
> +756,7 @@
>=20
>  		bus@30800000 { /* AIPS3 */
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x309f0000 0x10000>;
> +			reg =3D <0x30800000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges =3D <0x30800000 0x30800000 0x400000>, @@ -1029,7
> +1029,7 @@
>=20
>  		bus@32c00000 { /* AIPS4 */
>  			compatible =3D "fsl,aips-bus", "simple-bus";
> -			reg =3D <0x32df0000 0x10000>;
> +			reg =3D <0x32c00000 0x400000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			ranges =3D <0x32c00000 0x32c00000 0x400000>;
> --
> 2.17.1

