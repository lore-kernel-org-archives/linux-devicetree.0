Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67B0C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 14:33:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81F3F20729
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 14:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wyun3rmY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbgGVOd4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 10:33:56 -0400
Received: from mail-am6eur05on2052.outbound.protection.outlook.com ([40.107.22.52]:40545
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729126AbgGVOdz (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 10:33:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0uuBIy/yhbY6O6jDjD3OsboB+mLcE6JwPmqsKUa+e6lV3pCvRYYC3isuNgjVBUREJsBfSM8LdBW3Xt30ObnKNVPqjTM4iY7nBUUR2hJwz4jjsoT4r6lfyAOmPjDLZTAV21sRaWi6gkv4rI119uTxZtx10SvHvS8N31s0QxGcGa2AdikA+Aldc7cnklpYyIW/Dg4jaLaF7dV5j+x5wEtp98msO1kBQIA3ZoFjSeNdYGz5lexfa8qnSini6Z8PAo/cVbFSTJfxQBldsqwsot5H9okodIgHwcoNqtg5cguqvPWFILW6jTe8aYnK9y8VHblUvvw9zKrvN5jYQx1r973Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0Njm5pY5rHSkOTmhUJUxUPG/IHXNbNmfCV5pDIpZXE=;
 b=K98HmB2SoH4hAk98D5Fn4jMkA6M2ddI94Esy+KZLFa5Cu5s5QKc6ZJclw+Q/HwGlgpt7LUGVKzx57tJeNTLBiYqoAaMrsUpJ+fu5ChgzgBl/c9BlWjezIF6IPbB0/LlmgKZLCES5psrzrIOweWtTBuw665O/Ysh2fZ9QBYaQVmH8GhrL/WGOLQR7m+ZjFYQln4zALoFJhPC+nje5KunL3TXWRrroTQM/l7EleeKzG/QQCI19ZxTtcd3HENNJoKffflvp8N79a/s/bPN89isHh6ZwUm3+dz7KTaikD+fvHOrt/zrfLSTeXFIogRLbbV6vgdqDvQecZbm/1lLImPSCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0Njm5pY5rHSkOTmhUJUxUPG/IHXNbNmfCV5pDIpZXE=;
 b=Wyun3rmYZytFjD+X7JpkjZKpYXPhQ6+dCqwSLKNdyHha1e0YWaxWNfOEAu5Vrrc8hszQ2HarMMJXc0m+HpcfdMppIEufltcXtwN1FSE/0A05p82PXj4hMpLHaP9I/Fngs47KIlmI8KE25Z3NOHrg06RRktTFRV4kcBScoRnQ9co=
Received: from AM6PR04MB6517.eurprd04.prod.outlook.com (2603:10a6:20b:f5::12)
 by AM6PR04MB6069.eurprd04.prod.outlook.com (2603:10a6:20b:72::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 22 Jul
 2020 14:33:51 +0000
Received: from AM6PR04MB6517.eurprd04.prod.outlook.com
 ([fe80::11a9:bf16:14cb:5821]) by AM6PR04MB6517.eurprd04.prod.outlook.com
 ([fe80::11a9:bf16:14cb:5821%6]) with mapi id 15.20.3216.022; Wed, 22 Jul 2020
 14:33:51 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Anson Huang <anson.huang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core device
 to pass data
Thread-Topic: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core device
 to pass data
Thread-Index: AQHWU3qPod3u7KLfuUW6rq9H7arWKakTwq3g
Date:   Wed, 22 Jul 2020 14:33:50 +0000
Message-ID: <AM6PR04MB651795D149D5D8110E51E58B89790@AM6PR04MB6517.eurprd04.prod.outlook.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
 <1594028699-1055-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1594028699-1055-2-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3630ad06-646b-40d6-cb87-08d82e4c40b5
x-ms-traffictypediagnostic: AM6PR04MB6069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6069D251017335A466CED17D89790@AM6PR04MB6069.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xD6mPZq7+Z9lCFW9GuPOdtN9eYteuXQJU1C57Zy9/uVvDwgcsUMNZ9OhuXwRUAE/Sw5Pz8AW2FGxhTh2yi00KEqVaXW94ynq4/BRXLBE85RGrceHXM1JfsoMoO2aku6SzEy7MEuPJnTC/gkB6QQhWVp8Ojgf44SkykRA+MexVahRy+ZbMY28tqdlZa7dl32KaEAxhbowEd5P5iUuarjBTp6M2ZO6GuEktRM/Gqb3WrkMfaXJW7cZWZyR91iFjQEJKO6xxRVI7mUiDk/e7ZRqDwC/g4XLcctutnVXfQN7BWJuTeCc+K/iqEpYmRv8swBpgij6X21dnC8XZYIB8RXwJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6517.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(7696005)(76116006)(86362001)(186003)(316002)(66446008)(26005)(54906003)(64756008)(71200400001)(44832011)(66946007)(5660300002)(66476007)(66556008)(8676002)(9686003)(55016002)(8936002)(2906002)(52536014)(6506007)(478600001)(83380400001)(53546011)(33656002)(7416002)(6916009)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cDn+pxTh8KBMqbEmEU8Q7thFq7r1WisQBiN9VThaFRKT6PzHr8l12EETJpGqJA01ntvXjUe7jawriKSF8Cuy1brGI+7ir70KmnJFxIxFamnB3Sg7zArX9yhlxu9V5vqIoxbKLPIErUussdbN9q0CciAWQ3MCWnbBKOAAgbnh0nE9dZTHiiFwMnxppjaWO+M+XfogKDNwh/jC+htLeZ1IasO5A09Wx5fWeKtJcA2L20aZOKAAzC4yVEt0tybJUEpRA8/38k8h4GSQFJU+7DneQyv3rEjWAXDFVQH851gE3GvA0FTPgPN8i362h2XB99dIOONPha82UO7Am1YKflhPFhe7Zrgb1tebr2ssTG8ZW8oCODHj9mYhLvWX3arv9bksLKxBamuf7yV+TtU7OmdwkXyJo5fnD9OwhkaU32k+GpCGtzkJb6LYEe224inga7j4woepe9ACjSnOZJVfaG8fZpHEQ8HP0XEw9CwPaas4t4o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6517.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3630ad06-646b-40d6-cb87-08d82e4c40b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 14:33:50.9873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAhgSM8labqYm3pP4d/rsPxEzY/upamRbLGn2EeRIVpI0o2A+d5U0bo4hGuWs2Gn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6069
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Monday, July 6, 2020 5:45 PM
> To: balbi@kernel.org; shawnguo@kernel.org; robh+dt@kernel.org
> Cc: gregkh@linuxfoundation.org; s.hauer@pengutronix.de; kernel@pengutroni=
x.de;
> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; linux-usb@vger.kern=
el.org;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; Peter C=
hen
> <peter.chen@nxp.com>; Anson Huang <anson.huang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; Horia Geanta <horia.geanta@nxp.com>
> Subject: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core device =
to pass
> data
>=20
> In case dwc3 has SoC specific customizations, dwc3 glue driver can base o=
n compatible
> string and pass it via platform data to dwc3 core driver; and pass xhci p=
rivate
> data further to xhci-plat like quirks.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/dwc3/core.h | 5 +++++
>  drivers/usb/dwc3/host.c | 9 +++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h index
> 0b8ea8c..3146697 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -29,6 +29,7 @@
>  #include <linux/ulpi/interface.h>
>=20
>  #include <linux/phy/phy.h>
> +#include "../host/xhci-plat.h"
>=20
>  #define DWC3_MSG_MAX	500
>=20
> @@ -924,6 +925,10 @@ struct dwc3_scratchpad_array {
>  	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
>  };
>=20
> +struct dwc3_platform_data {
> +	struct xhci_plat_priv *xhci_priv;
> +};
> +
>  /**
>   * struct dwc3 - representation of our controller
>   * @drd_work: workqueue used for role swapping diff --git a/drivers/usb/=
dwc3/host.c
> b/drivers/usb/dwc3/host.c index bef1c1a..4f8514a 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -46,6 +46,7 @@ int dwc3_host_init(struct dwc3 *dwc)  {
>  	struct property_entry	props[4];
>  	struct platform_device	*xhci;
> +	struct dwc3_platform_data *dwc3_pdata;
>  	int			ret, irq;
>  	struct resource		*res;
>  	struct platform_device	*dwc3_pdev =3D to_platform_device(dwc->dev);
> @@ -115,6 +116,14 @@ int dwc3_host_init(struct dwc3 *dwc)
>  		}
>  	}
>=20
> +	dwc3_pdata =3D (struct dwc3_platform_data *)dev_get_platdata(dwc->dev);
> +	if (dwc3_pdata && dwc3_pdata->xhci_priv) {
> +		ret =3D platform_device_add_data(xhci, dwc3_pdata->xhci_priv,
> +					       sizeof(struct xhci_plat_priv));
> +		if (ret)
> +			goto err;
> +	}
> +
>  	ret =3D platform_device_add(xhci);
>  	if (ret) {
>  		dev_err(dwc->dev, "failed to register xHCI device\n");
> --
> 2.7.4

A gentle ping...

Thanks
Li Jun
