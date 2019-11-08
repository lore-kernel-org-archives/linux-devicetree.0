Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41DFFA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 10:42:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE74F2178F
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 10:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com header.i=@dialogsemiconductor.onmicrosoft.com header.b="cOAcsppr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbfKHKmW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 05:42:22 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.4]:36045 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbfKHKmW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 05:42:22 -0500
Received: from [46.226.52.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.eu-west-1.aws.symcld.net id F7/CA-20596-88645CD5; Fri, 08 Nov 2019 10:42:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTe0xTZxjG+c6tB0L10IJ8IhjWOI1Cb2yLh13
  IsmzaJaAuMftjE/AwzmhNKU1Pi4CZEyYMwUETcNlg0JZxMYhsKcRtgGMh3DfnBMZFJuDonIBO
  7gxFXE8PuO2/3/s+T973+b58H4lKHhJBJJtmZk0GRi8jfDCtEntJnnugI1b1eGULfeG2i6DX7
  t8g6DsjNwna1v4zTt/+9TA9vtQB6OWBXIR2Tg7idNXQDYTOvtouoieaHAh9tzHwVV9NXXkd0H
  xXckuk+cNaJNI4a88Rmt8GWwhNQ+WHmvXRGM2Cc+cR8h1cZ0hISTuOa5s6LwJjvyxtpKsLPQP
  sIXnAmwRUFQrPz/rnAR83d2JwtrsYCEUDgI8+WSX4AqO6Ubh0746nkFBFCLSXdgGhmACwf2gJ
  4YcRFA2Luic8Ln9qDMCKjjWML1BqDIEPZ/Nw3iWlYuBoQQ3Bsz91CFpHq0QCR8DqklaPB6N2w
  cdzlz1TxRQDl3JtuLDuLICdXdMYL3hTGnipdh4RzhECFzMvoTyjVCC86bJ5+pCiYGXLdVTgAD
  g1uY4Lfhb2ZA0DoR8Orw25NlgGy8vaNzgE9tny3Uy6OQZmLSs37d2l2bjANKzMz8YEyy643pY
  utI3QcbZgY+tu+OVAMyZwMMy2D6L8USA1hcPr5Z8CK1CW/Ce1wOHQ3jxPCBwGqx0zaInnKvxg
  z+cuzA6wWkAnmHRJWnMyo9PL1SqVXK2OkKsjI+QREbSCyZAzCtYiP8lyZrlawZzkFFx68nv6R
  IWBNTuB+xkmGn9wfQuW5+4r2sB2EpEFiItgR6xkS0JKYrqW4bTxJoue5dpAMEnKoHj+dbfmZ2
  KT2LT3dXr3Y96UIekr8xf3vuGWxZyRSeZ0SYLUC+SkdaqsApVghhQDGxQoPvWa20TxJq3F8HT
  E5pfoAyFBUjHw8vKS+BpZU7LO/H99GgSSQCYVF/NJfHUG89NN0+4QiDuEariND2Fm/pWCziB1
  Pg/6ziGpo40qaz3xdf3p+MlvyuzShcicLjq4eK7af6C65asTr1hW9d1yUbjSVvDTc+/mbFfkU
  E3BUeok67W/C/aGjRR+YHvz6L6sgNQ/G7lhe0bfcbMqLPXQjicrUdv0bxeHOu75cH/VX/Cqb8
  THdh+zPcq//EW9q+9Ei/JjywPv0qqZt0J7oizO2YMvvvysn3Ttauk2RNQa1zoY/Xz89zuVd2+
  tVmyN1h07f+VoYTOhYZs+KlrLxLxUtXF7dhx4xnkkdH/6j/qMMuMCSn0W5C19kplUuHcs9oUa
  dHGPY/FU4ErN1sjT4/lVilb1yMwvPnj+/uiLweMj1TVX+nvjJL83HJZhnJZR70NNHPMPFxp4D
  40EAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-18.tower-268.messagelabs.com!1573209735!379805!1
X-Originating-IP: [104.47.4.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32755 invoked from network); 8 Nov 2019 10:42:16 -0000
Received: from mail-am5eur02lp2059.outbound.protection.outlook.com (HELO EUR02-AM5-obe.outbound.protection.outlook.com) (104.47.4.59)
  by server-18.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2019 10:42:16 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIUuXP0JZb1GaMvjFm/sLirwYs+EvHrtoMMBs76+hIMLkm91ykX/Ui5gL8ku5dbvxXD7/nWHBqrgI5/eXijJ6dH3GxoAmKv46BvQhVkPiDGh3lR8aTgsaSrAf4gjA8Lh6yuKrIlQp9/WYdg3oQwyBGdDWaH4sr4vo9VDmE3SMZ2C6zdtHKXh1Uf4B+g5LndjHTMReyBejuW8x/FrukSGPNyDpHUMRV5dobkEQU64LkRe+KMptcskiu4m8sQWGgrc7D0sl46Y1I73PmTXuQeXqN8CIqkm4mwaCWmpdvzzDs0cQ6QZzZs8/ROCwMbrFetxhqvMiDs+CV77UC6ELQmHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WejkTp/2lMqujtGTtQBEhua8NPUQdc6YwDmqRgZa7FA=;
 b=R/KQTybUayCg5uozlSO7HkOLX54GQNEBqtkrIoT2KvXKmSE1TKBV/mvGcICZ1n3eZ4z2IY+WXh45OwRvfEdwACCwnOqnMomdgAZHJrZ/hb2Opsg0k4PhwA9GmXWktTTIefREjxuULG5mRdZ+cHuZNJBUrQOCwnF13EXvwDTHC9A42iz4/LwBEKUD7RuJtV3sXbBUPovrSTseFe9IA7VBAWP97n7mhrZ3ahhCMC1xshKy/v3HuaDyjH7XokFbm5RVV74wreOODvtOs40QwiyNCbuPXTNNcvRdiNWwvYpWhQAh+8BBhvV0lGIQumru35Ni5P0ryu7008cMT01szDs5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WejkTp/2lMqujtGTtQBEhua8NPUQdc6YwDmqRgZa7FA=;
 b=cOAcspprf/IolJg2/at+agyMgcUaK04+Lohzefda9lItZ4MHLDQLfygec/mw06sNit5gQiGUX3kU51yX00z+fNG4HTkTOSGYqTXmTGBmZPteGFuNDHSMOHaxsTp+xXXwb2hlKXv8izugfbREXC5TwfuWd8OgYDrk+S0Q4wD0sWQ=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB0962.EURPRD10.PROD.OUTLOOK.COM (10.169.154.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 10:42:13 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b7:8cda:1411:fb7f]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b7:8cda:1411:fb7f%8]) with mapi id 15.20.2408.028; Fri, 8 Nov 2019
 10:42:13 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Christoph Fritz <chf.fritz@googlemail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>
CC:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: RE: [PATCH 2/4] regulator: da9062: add of_map_mode support for bucks
Thread-Topic: [PATCH 2/4] regulator: da9062: add of_map_mode support for bucks
Thread-Index: AQHVlVLYd2sBa+dkcE+OD6//SfsNDKeBFomw
Date:   Fri, 8 Nov 2019 10:42:13 +0000
Message-ID: <AM5PR1001MB0994CA693A40789436CF63DB807B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
 <1573121050-4728-3-git-send-email-chf.fritz@googlemail.com>
In-Reply-To: <1573121050-4728-3-git-send-email-chf.fritz@googlemail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b3a7904-09b2-4b87-e73c-08d7643850db
x-ms-traffictypediagnostic: AM5PR1001MB0962:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB09620BE9C6ED72AEA18D8286A77B0@AM5PR1001MB0962.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(39860400002)(396003)(346002)(136003)(199004)(189003)(229853002)(186003)(76116006)(14454004)(66446008)(316002)(6506007)(53546011)(55236004)(7696005)(54906003)(110136005)(102836004)(71200400001)(71190400001)(66066001)(99286004)(66476007)(64756008)(66946007)(5660300002)(486006)(66556008)(7736002)(11346002)(4326008)(476003)(7416002)(305945005)(256004)(8676002)(9686003)(86362001)(3846002)(6436002)(6116002)(25786009)(55016002)(52536014)(26005)(2906002)(81156014)(81166006)(478600001)(6246003)(76176011)(33656002)(74316002)(8936002)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB0962;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 39Pr9SDPjJD+z3i9nH7XPxXwnsiHS4TECFLYMllzD/2JEP7cUtwPkQ9RyEkIKacuoxZTk1mjcBYALhrpy5bPGwe9gBo/WvjaE2HDcNv/PRvR5+nbDGv6Q80eGfks82R/kZBNVW5HCLPDYNWMYdCJ203z572BFKlTwOlzpCTAFLDzDCbiA2hUv2WXD/UlPTDGCiINyqrqiiEDqyQ+WKrgSvoOcMbs7u9PiWIqOnnFz9TiofGAg1Vi3gOONKQ7DkH6KZN8NkbXlBykbIESuMqO1foJkqkRulO41No2SEVglTeSXRC5V/x0rnn2BweXjKX/kLLpcksCxvhKAc/p6EaD55UKwdvNN+aAzpE30x+bgTrC/SQ6ilXneI9W+ioEVKX0pFMII5tNsaveyZY2Z8fS0/xiyd42szVJh2sfHO1uqMUobt21h6fpppwMPaj7hRNo
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3a7904-09b2-4b87-e73c-08d7643850db
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 10:42:13.2140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBRNJmmy5A+nh35NRRxV/5E1S0RStRkziNUvVehOQu79bbjjZKbfXG2cbXMdaUrDGqoCxn09XwI2FedynY9dqDB4qPe7njn5rTnTQXwGg7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0962
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 07 November 2019 10:04, Christoph Fritz wrote:

> This patch adds of_map_mode support for bucks to set regulator modes
> from within regulator framework.

This looks fine to me, other than a couple of little points below.

>=20
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/regulator/da9062-regulator.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/drivers/regulator/da9062-regulator.c b/drivers/regulator/da9=
062-
> regulator.c
> index 1a95982..f5f2ead 100644
> --- a/drivers/regulator/da9062-regulator.c
> +++ b/drivers/regulator/da9062-regulator.c
> @@ -98,6 +98,20 @@ static const unsigned int da9062_buck_b_limits[] =3D {
>  	2300000, 2400000, 2500000, 2600000, 2700000, 2800000, 2900000, 3000000
>  };
>=20
> +static unsigned int da906x_map_buck_mode(unsigned int mode)

This can just be called da9062 as this function is only used in this file.

> +{
> +	switch (mode) {
> +	case DA906X_BUCK_MODE_SLEEP:

Obvioulsy these names will want updating as per my comments on patch 01 in =
the
series.

> +		return REGULATOR_MODE_STANDBY;
> +	case DA906X_BUCK_MODE_SYNC:
> +		return REGULATOR_MODE_FAST;
> +	case DA906X_BUCK_MODE_AUTO:
> +		return REGULATOR_MODE_NORMAL;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static int da9062_buck_set_mode(struct regulator_dev *rdev, unsigned mod=
e)
>  {
>  	struct da9062_regulator *regl =3D rdev_get_drvdata(rdev);
> @@ -363,6 +377,7 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  		.desc.vsel_reg =3D DA9062AA_VBUCK1_A,
>  		.desc.vsel_mask =3D DA9062AA_VBUCK1_A_MASK,
>  		.desc.linear_min_sel =3D 0,
> +		.desc.of_map_mode =3D da906x_map_buck_mode,
>  		.sleep =3D REG_FIELD(DA9062AA_VBUCK1_A,
>  			__builtin_ffs((int)DA9062AA_BUCK1_SL_A_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -399,6 +414,7 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  		.desc.vsel_reg =3D DA9062AA_VBUCK3_A,
>  		.desc.vsel_mask =3D DA9062AA_VBUCK3_A_MASK,
>  		.desc.linear_min_sel =3D 0,
> +		.desc.of_map_mode =3D da906x_map_buck_mode,
>  		.sleep =3D REG_FIELD(DA9062AA_VBUCK3_A,
>  			__builtin_ffs((int)DA9062AA_BUCK3_SL_A_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -435,6 +451,7 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  		.desc.vsel_reg =3D DA9062AA_VBUCK4_A,
>  		.desc.vsel_mask =3D DA9062AA_VBUCK4_A_MASK,
>  		.desc.linear_min_sel =3D 0,
> +		.desc.of_map_mode =3D da906x_map_buck_mode,
>  		.sleep =3D REG_FIELD(DA9062AA_VBUCK4_A,
>  			__builtin_ffs((int)DA9062AA_BUCK4_SL_A_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -607,6 +624,7 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  		.desc.vsel_reg =3D DA9062AA_VBUCK1_A,
>  		.desc.vsel_mask =3D DA9062AA_VBUCK1_A_MASK,
>  		.desc.linear_min_sel =3D 0,
> +		.desc.of_map_mode =3D da906x_map_buck_mode,
>  		.sleep =3D REG_FIELD(DA9062AA_VBUCK1_A,
>  			__builtin_ffs((int)DA9062AA_BUCK1_SL_A_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -643,6 +661,7 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  		.desc.vsel_reg =3D DA9062AA_VBUCK2_A,
>  		.desc.vsel_mask =3D DA9062AA_VBUCK2_A_MASK,
>  		.desc.linear_min_sel =3D 0,
> +		.desc.of_map_mode =3D da906x_map_buck_mode,
>  		.sleep =3D REG_FIELD(DA9062AA_VBUCK2_A,
>  			__builtin_ffs((int)DA9062AA_BUCK2_SL_A_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -679,6 +698,7 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  		.desc.vsel_reg =3D DA9062AA_VBUCK3_A,
>  		.desc.vsel_mask =3D DA9062AA_VBUCK3_A_MASK,
>  		.desc.linear_min_sel =3D 0,
> +		.desc.of_map_mode =3D da906x_map_buck_mode,
>  		.sleep =3D REG_FIELD(DA9062AA_VBUCK3_A,
>  			__builtin_ffs((int)DA9062AA_BUCK3_SL_A_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -715,6 +735,7 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  		.desc.vsel_reg =3D DA9062AA_VBUCK4_A,
>  		.desc.vsel_mask =3D DA9062AA_VBUCK4_A_MASK,
>  		.desc.linear_min_sel =3D 0,
> +		.desc.of_map_mode =3D da906x_map_buck_mode,
>  		.sleep =3D REG_FIELD(DA9062AA_VBUCK4_A,
>  			__builtin_ffs((int)DA9062AA_BUCK4_SL_A_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> --
> 2.1.4

