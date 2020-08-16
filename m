Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B76C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 03:27:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7220A2068E
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 03:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VowYwSuY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbgHPD1E (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 15 Aug 2020 23:27:04 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:31073
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729521AbgHPD1E (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 15 Aug 2020 23:27:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBERISH/YDa5ezsmnvrRmi5a0hcd9BDQWjc5ji49ovOZeqBlzuvpvcYcV9xgL6GE8ZuPxlUBg89R85o6iRaQh0RuZ8CKGWIDMUU295L85AQ2zlYDRIIx3e3ZO1GfbjK0I7EMSbcXY+VLKxduDSEFDpgsKyuHZGpfLtSmyIry31bXw2+UsTMZ7kRQlj+FQ6NKjOtzPwjHFrCr/BidtWcr1e71rgJ9Gt6CioTPv9hgi/kfiljOkVDfzvIfXgrTTyPyvfrflZ7Ky6gwEGjmQo58X1+wGDdDjt4yXnrQD28Tf66sw+O5VdbA73Zs6l0oTMXVh/sqSaBIfrF8389bsYKgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgPpZCo3RnosbrpNizje2Id15dwBpyiUXg/WAn+Ih7U=;
 b=chORHUm9rAJgs+ThAthzfPgABQHqpxrm0gdNhIieF1HJhdwAxEK+tOF6aGXlaaRuHi41gmyynxNi+HZIK4HVmUn3f5yWKqq7sASg5wERNotQVuSyfTTPKCjKh/wamdJkG7hlvKXu3ugSrH8ibhlUtX7StmttkKY3Pv9vwlVMjVr5wGhmYpUeBzSAae4TzP+ZYxszExKE8/oMc88rec5bC040h4w7S7sFGtTUziMHqvgcLnR0CDlcJpRWSbAc/pDXzSxKHzivrxvnpR1oAqdWRSrHJPwTqgDAyR5T2lGk1CwWNNizo7uZ0Zyfuo6pMlyRHejbKZzAcn1Bo95HrHPJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgPpZCo3RnosbrpNizje2Id15dwBpyiUXg/WAn+Ih7U=;
 b=VowYwSuYRudrTP9Q4HtaqDaKnZJyhDtAWUU67eDweK4uLLqItA4YOhToRhXNgDC1QilbDFX7ZXyiaYyOhZFLtgNLuKEueSIsj6p/kaYy8bsvuPys7Y8iQxx+t99vXJzwKN3gikEbmw4HbJ0YkMkIrMEtfB9pazCHV6icQ2mGDaQ=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4591.eurprd04.prod.outlook.com (2603:10a6:803:6e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Sun, 16 Aug
 2020 03:27:00 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3283.026; Sun, 16 Aug 2020
 03:27:00 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Jun Li <jun.li@nxp.com>, "kishon@ti.com" <kishon@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp
 usb phy
Thread-Topic: [PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp
 usb phy
Thread-Index: AQHWPZq2S3C+qLdffUSUIoKgOaVEhqk6flPA
Date:   Sun, 16 Aug 2020 03:26:59 +0000
Message-ID: <VE1PR04MB6528E11B7728E167A7A4A878895E0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
 <1591621893-22363-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1591621893-22363-2-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [114.217.242.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7226639a-c6cf-476a-d4d4-08d841943c9d
x-ms-traffictypediagnostic: VI1PR04MB4591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4591BC911AF0B11C242829BF895E0@VI1PR04MB4591.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cgutlo8y0H6QZbzCXjtXF7xh5Y3BhBP5nNy91JWT4nXX3DZDMHKrB18PefhW0RF4AfSnQbsDfpSyy5VQZZPszaWyosNZWNDaIQ6RUk9DEjTJh+OPns0HKNsum62wyoJeQjyYYmPMQo9c3BZsssRQgzCPuvWuD34C3lcTUAU5pkl7og2UlPsEJPzZU+8ajogOc9EvJ//wY0z3xxitOOn62+2S4/IiU9eKCUyftclm/lvA5zg0EyFVX2Kvpa/izYHGSHs6R+hI59hdx04+fYSQ/fKpZPYQC7hSGSV78IKl+0QQ7hKfdNyDKg6ev8maeryPnHeheZ/mWMzAFECAipe+JFCjWrD8S1NrCVyI95VWQkdqwjzepFC5aRNxzv6p1GAI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39850400004)(366004)(136003)(26005)(478600001)(52536014)(55016002)(86362001)(2906002)(83380400001)(9686003)(33656002)(186003)(5660300002)(66446008)(316002)(8676002)(110136005)(53546011)(71200400001)(7696005)(8936002)(66556008)(76116006)(66476007)(64756008)(66946007)(6506007)(4326008)(54906003)(44832011)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: gB80Y5sgo/FOcvY+3A9oDaH2pm9mE2JGTwJrJ07fLvIqNngArLAaNXXF/rwzbwSY+NScP0NBo1uL6Cy+A924oRScJfN6PZoat3iiJOj7LCoIkEy5PJirZsJ43SUt8ngLS31Fmhbt1apEa7JZN3Nt9lxbFvDVr4I8OFi6wTJPGRC5NLJebcY21/Qrafwz3C/da+PSn9jxlw8FsK8+wB6TBd7hlm9EK/StEsCUyNzvTBeo3z5ON+mUjMvV3fk4FF1WigF1ADsbomaNMAzw84bl+teAEWlLXFRwweMttJAbzMNAwaJ+jfprtP82dSvM90G12hLzp4CnQD8gRfqEZ0+xh8bPOZ/HANLaov9Mk88nSQe5oIRGo6stmJuc0lUKwvP5XqsIvYRkaqjKKP9KlXBae1QUTQ8/3JP26R27teiZx5kEIeDIr1wD6ibHvPSrP3X4OI6QictHixPXCpwdv/gbJbXcWmrn70ByFC3P0tJIotLBeyKtfZ04S3SmJQAzsaYKsSHR48DFZLgt8VcuJakgLrpkA3c8I/BgZP1SOct+clqXghLXStzHbf62zu3hl5YREJs+uTNwSD/Ij7nyHontQjZEFplajy8FmQHva9J0zK54qCz8WjUf9jfXrD4R9vMNlIiWKrIU/ALUxobkzzXhsA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7226639a-c6cf-476a-d4d4-08d841943c9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2020 03:27:00.0417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUIYrfBmuiwHLgDjcrN8Jb3IplHV40GBKOvmQKGKEaRayEU5XjBxsfpsv1gAYS3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4591
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

+Vinod

> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Monday, June 8, 2020 9:43 PM
> To: kishon@ti.com; robh+dt@kernel.org
> Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; Jun Li <jun.li@nxp.=
com>;
> devicetree@vger.kernel.org; Peter Chen <peter.chen@nxp.com>
> Subject: [PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp u=
sb phy
>=20
> Add initial support for imx8mp usb phy support, imx8mp usb has a silimar =
phy as
> imx8mq, which has some different customizations on clock and low power de=
sign when
> SoC integration.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
>=20
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 0c4833d..030bf4e 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -4,12 +4,16 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/delay.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/regulator/consumer.h>
>=20
>  #define PHY_CTRL0			0x0
>  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> +#define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
> +#define PHY_CTRL0_FSEL_24M		(0x2a << 5)
>=20
>  #define PHY_CTRL1			0x4
>  #define PHY_CTRL1_RESET			BIT(0)
> @@ -20,6 +24,11 @@
>=20
>  #define PHY_CTRL2			0x8
>  #define PHY_CTRL2_TXENABLEN0		BIT(8)
> +#define PHY_CTRL2_OTG_DISABLE		BIT(9)
> +
> +#define PHY_CTRL6			0x18
> +#define PHY_CTRL6_ALT_CLK_EN		BIT(1)
> +#define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
>=20
>  struct imx8mq_usb_phy {
>  	struct phy *phy;
> @@ -54,6 +63,44 @@ static int imx8mq_usb_phy_init(struct phy *phy)
>  	return 0;
>  }
>=20
> +static int imx8mp_usb_phy_init(struct phy *phy) {
> +	struct imx8mq_usb_phy *imx_phy =3D phy_get_drvdata(phy);
> +	u32 value;
> +
> +	/* USB3.0 PHY signal fsel for 24M ref */
> +	value =3D readl(imx_phy->base + PHY_CTRL0);
> +	value &=3D ~PHY_CTRL0_FSEL_MASK;
> +	value |=3D PHY_CTRL0_FSEL_24M;
> +	writel(value, imx_phy->base + PHY_CTRL0);
> +
> +	/* Disable alt_clk_en and use internal MPLL clocks */
> +	value =3D readl(imx_phy->base + PHY_CTRL6);
> +	value &=3D ~(PHY_CTRL6_ALT_CLK_SEL | PHY_CTRL6_ALT_CLK_EN);
> +	writel(value, imx_phy->base + PHY_CTRL6);
> +
> +	value =3D readl(imx_phy->base + PHY_CTRL1);
> +	value &=3D ~(PHY_CTRL1_VDATSRCENB0 | PHY_CTRL1_VDATDETENB0);
> +	value |=3D PHY_CTRL1_RESET | PHY_CTRL1_ATERESET;
> +	writel(value, imx_phy->base + PHY_CTRL1);
> +
> +	value =3D readl(imx_phy->base + PHY_CTRL0);
> +	value |=3D PHY_CTRL0_REF_SSP_EN;
> +	writel(value, imx_phy->base + PHY_CTRL0);
> +
> +	value =3D readl(imx_phy->base + PHY_CTRL2);
> +	value |=3D PHY_CTRL2_TXENABLEN0 | PHY_CTRL2_OTG_DISABLE;
> +	writel(value, imx_phy->base + PHY_CTRL2);
> +
> +	udelay(10);
> +
> +	value =3D readl(imx_phy->base + PHY_CTRL1);
> +	value &=3D ~(PHY_CTRL1_RESET | PHY_CTRL1_ATERESET);
> +	writel(value, imx_phy->base + PHY_CTRL1);
> +
> +	return 0;
> +}
> +
>  static int imx8mq_phy_power_on(struct phy *phy)  {
>  	struct imx8mq_usb_phy *imx_phy =3D phy_get_drvdata(phy); @@ -83,12 +130=
,29 @@
> static struct phy_ops imx8mq_usb_phy_ops =3D {
>  	.owner		=3D THIS_MODULE,
>  };
>=20
> +static struct phy_ops imx8mp_usb_phy_ops =3D {
> +	.init		=3D imx8mp_usb_phy_init,
> +	.power_on	=3D imx8mq_phy_power_on,
> +	.power_off	=3D imx8mq_phy_power_off,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static const struct of_device_id imx8mq_usb_phy_of_match[] =3D {
> +	{.compatible =3D "fsl,imx8mq-usb-phy",
> +	 .data =3D &imx8mq_usb_phy_ops,},
> +	{.compatible =3D "fsl,imx8mp-usb-phy",
> +	 .data =3D &imx8mp_usb_phy_ops,},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> +
>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)  {
>  	struct phy_provider *phy_provider;
>  	struct device *dev =3D &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
>  	struct resource *res;
> +	const struct of_device_id *of_id;
>=20
>  	imx_phy =3D devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
>  	if (!imx_phy)
> @@ -105,7 +169,12 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>=20
> -	imx_phy->phy =3D devm_phy_create(dev, NULL, &imx8mq_usb_phy_ops);
> +	of_id =3D of_match_device(imx8mq_usb_phy_of_match, dev);
> +	if (!of_id)
> +		return -ENODEV;
> +
> +	imx_phy->phy =3D devm_phy_create(dev, NULL, (const struct phy_ops *)
> +					of_id->data);
>  	if (IS_ERR(imx_phy->phy))
>  		return PTR_ERR(imx_phy->phy);
>=20
> @@ -120,12 +189,6 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>=20
> -static const struct of_device_id imx8mq_usb_phy_of_match[] =3D {
> -	{.compatible =3D "fsl,imx8mq-usb-phy",},
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> -
>  static struct platform_driver imx8mq_usb_phy_driver =3D {
>  	.probe	=3D imx8mq_usb_phy_probe,
>  	.driver =3D {
> --
> 2.7.4

A gentle ping...

Thanks
Li Jun
