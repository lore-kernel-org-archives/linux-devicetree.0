Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698FFC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 05:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3651520810
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 05:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="CkoAtOWJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgFIF0b (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 01:26:31 -0400
Received: from mail-db8eur05on2057.outbound.protection.outlook.com ([40.107.20.57]:30628
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725770AbgFIF0X (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 9 Jun 2020 01:26:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io96niBfdZYvrNcYFxwwbyyy+L/AvKTiyum4nmyLya1gtX+XjrIen5JocPUQWmILcrrct5vGOcVrfnNpKwL3gorfvQRGBPAWVvd8R28djq3MHsdAMGCmhL03EYeCG7ETg5tNG5wXdvyEE+Fj4YRdad1NCnD9nVkXp0RDHL4hsL1Pu9hOmSgii0vMmTCdZriZsB41XC7DzhMg8oDdRBIpGpCPM9BuhsMKXvhxL+becmk96ZDFIkjiOLFwk//qZmLdWAu6RKS7vDXo7ldWbHRr5uRBvMghesHEDPib1P/O307+uXcrdaGzXitAPlTgtWHjG18Q172gSyegBzGmseYCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCe1FDaTwCQDaUDTvPzYric+sD1aak+UNbwldILeClU=;
 b=ai4ISta8vZJcqHGQ/Gfd29Fr4QXz+fbZHP+AtFVRbHdm3QON197vV6kG3K2DtjlcYHCCAdVrObob2gzbLyBvuwSE4CqnpFBVuM+vIcjO8b+PmrRr2idiouRR3lSSFXsn3YwsnatiXV15wCHZU3dljWYaJm+wFqGwPW68cLz58xyLzX+yAkQDf2reDM9/qbjla570mX86wAOhANO2bDxxX0rMv3wVFSft/axBxSpfssmuLcA8xQBLftVsSlbapyA5X5lHIu4oFKOP66/2FPBOiHW4pjJ3c6MNLwpCjsZKFIe7qrrnApcnhQi5+Ljo7VViv4lVczs4lOqHUrZ6GxZXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCe1FDaTwCQDaUDTvPzYric+sD1aak+UNbwldILeClU=;
 b=CkoAtOWJTsjy81soN1Lp6dK3BxIVwruN5PLY4T9GGKlxqxjgReooLaBewfVRfH+zDFgOFOt8SUuhHlrjv8qm8vPPz+/uHFoEEOm1UxL+h6Rie1p7BoMgD8YEj+c/dRgHvCceMVp7CZPiQQ/riNkVn5wggbeo5TK9JM3AXPQpwIs=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7048.eurprd04.prod.outlook.com (2603:10a6:20b:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 05:26:20 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 05:26:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp
 usb phy
Thread-Topic: [PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp
 usb phy
Thread-Index: AQHWPZq3axBY0FBNE0y/zPxAacz/majPweoA
Date:   Tue, 9 Jun 2020 05:26:20 +0000
Message-ID: <20200609052644.GB14710@b29397-desktop>
References: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
 <1591621893-22363-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1591621893-22363-2-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 903aabf4-f343-4c08-789e-08d80c35a481
x-ms-traffictypediagnostic: AM7PR04MB7048:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7048CD881FC34C37BCE906CB8B820@AM7PR04MB7048.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /9/71deLRsl2lEJhFoDcwWNwOOW/xG+FfE5NgqPkhfNFWIXaagj7dU3UDUuO5s6P3NtkV7jhfh+JNREfmauI1n2kA9NMtYnw8Z7gvmqNNTCVQ09PJ3YBqdd+T1RwzUCXOB3MoCVVpFOy7m8dpv9cFJBwGX5DPkzAxLCzGar1619kAbsA8i+HbL8xfSVzJm6DoHb/EbpY4/lNWVGl1pNkkvNQFxSiuzb9C0O1d+NshLoSg+dBz44PYK5DKEcMiu/r/RLAC+lcR706iyhKr0yJT8P1oNId6TDjZ5OQbi91cRImK7sNd0joV+hwEAIKVn5oWKzud84P/qkFUZXKJ5UVCvtHZXo+EBDpq+2QmT4m8wnt2gRzPFJznAq+o+3Q3P9y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(5660300002)(8676002)(6486002)(316002)(6862004)(8936002)(44832011)(86362001)(54906003)(1076003)(4326008)(33716001)(478600001)(71200400001)(76116006)(91956017)(9686003)(26005)(6636002)(33656002)(66446008)(66946007)(66476007)(66556008)(186003)(2906002)(53546011)(64756008)(6506007)(83380400001)(6512007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: fBXSB8B2imdZTY4bffmy+dL97bRDB5jfADycke3Cy0pUMseo8vIUOkNDqlFPXRuYbGJMnPvEtz7lsvNuhmbirxdnWx3CjXr/IGVk8yTJxVWsXcxxGH/kikzd12N2IWfJSUVLjSr7xL4JYXeNmmg89eNRBrAwOV7YzmqLhDbgdShXtG3hKKI4bu8ZVoDcfLxKrvrRZxCaOcoZcVwgb4f10lPRxNKlZs2DtaO4ieOHHdsQEd+IwJ776oEnQ5dtXd4//S9fnioNRNPGm8QDIuV2Jho/pi6DCKsr0ol84QA6Bk3eVYQAbSC9zgYtE6vfhUit1MZ8ZgL7kx7ThcpjQSpwci5ifcptBqazwzM4tWHjZZqQF9a7/wY+N9ghdfTET9675h+lA/DAzYJ0kRllXTkridi4t9Eel43wEGgLr43ApAmIPvSGPdPxPG+DAnNdAv+7RX/SqoemxFo7W9+VEInu8rpJf3sJGIGE4YCWMui/HwW//Cng+dOn/dDt4i+3E+rL
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CB67CB2FD87F14F901C721B347038EF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903aabf4-f343-4c08-789e-08d80c35a481
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 05:26:20.4797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x127qhUswNIMvlRv9Xj6d+Wc+2SlSZlVltlafVZBMlG4HriyfvUROvLttutXQSB+yomgEerHfI3EJLpRolM1HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7048
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20-06-08 21:11:33, Li Jun wrote:
> Add initial support for imx8mp usb phy support, imx8mp usb has
> a silimar phy as imx8mq, which has some different customizations
> on clock and low power design when SoC integration.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
>=20
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
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
> =20
>  #define PHY_CTRL0			0x0
>  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> +#define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
> +#define PHY_CTRL0_FSEL_24M		(0x2a << 5)
> =20
>  #define PHY_CTRL1			0x4
>  #define PHY_CTRL1_RESET			BIT(0)
> @@ -20,6 +24,11 @@
> =20
>  #define PHY_CTRL2			0x8
>  #define PHY_CTRL2_TXENABLEN0		BIT(8)
> +#define PHY_CTRL2_OTG_DISABLE		BIT(9)
> +
> +#define PHY_CTRL6			0x18
> +#define PHY_CTRL6_ALT_CLK_EN		BIT(1)
> +#define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
> =20
>  struct imx8mq_usb_phy {
>  	struct phy *phy;
> @@ -54,6 +63,44 @@ static int imx8mq_usb_phy_init(struct phy *phy)
>  	return 0;
>  }
> =20
> +static int imx8mp_usb_phy_init(struct phy *phy)
> +{
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
>  static int imx8mq_phy_power_on(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy =3D phy_get_drvdata(phy);
> @@ -83,12 +130,29 @@ static struct phy_ops imx8mq_usb_phy_ops =3D {
>  	.owner		=3D THIS_MODULE,
>  };
> =20
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
>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
>  	struct device *dev =3D &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
>  	struct resource *res;
> +	const struct of_device_id *of_id;
> =20
>  	imx_phy =3D devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
>  	if (!imx_phy)
> @@ -105,7 +169,12 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
> =20
> -	imx_phy->phy =3D devm_phy_create(dev, NULL, &imx8mq_usb_phy_ops);
> +	of_id =3D of_match_device(imx8mq_usb_phy_of_match, dev);
> +	if (!of_id)
> +		return -ENODEV;
> +
> +	imx_phy->phy =3D devm_phy_create(dev, NULL, (const struct phy_ops *)
> +					of_id->data);
>  	if (IS_ERR(imx_phy->phy))
>  		return PTR_ERR(imx_phy->phy);

Reviewed-by: Peter Chen <peter.chen@nxp.com>

> =20
> @@ -120,12 +189,6 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> =20
> -static const struct of_device_id imx8mq_usb_phy_of_match[] =3D {
> -	{.compatible =3D "fsl,imx8mq-usb-phy",},
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> -
>  static struct platform_driver imx8mq_usb_phy_driver =3D {
>  	.probe	=3D imx8mq_usb_phy_probe,
>  	.driver =3D {
> --=20
> 2.7.4
>=20

--=20

Thanks,
Peter Chen=
