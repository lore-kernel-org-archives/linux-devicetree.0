Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D86C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 09:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B26320737
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 09:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="M6YYYPlT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgGWJ61 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 05:58:27 -0400
Received: from mail-eopbgr10070.outbound.protection.outlook.com ([40.107.1.70]:5438
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725858AbgGWJ61 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 23 Jul 2020 05:58:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPrblr3ANxQVKeDknMz4Z9d7ThHHWDcUcBWyKDbMT8/M9Xw3/HLYW267XTJLJFO0ZjhL83X3p6fKRJsXA8iQLYoHzTpKMX8dKviocCefcsWsOApZu9vyIvR73tknWFs4sen14eMuNrGokqi8gP5ak1gcgRuvGk8PXIjg8FPcaDeBZyQ78T7XrO8tFMg72vLcj5onhBTd93YBK4Sa6riowybdTHCVnfD1zWf6fmx/U4h9xX8jYLXF45uDp7hAg3rL7yIxrOiECrZQtZUjrSzvGgXtQxBCfJE3BcXAiva09Cw3ac3Ukmdpmy24d2EEolFJ2m5X/pViHwSSQKDcEs02mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWUZP3dcO3LD8PvV6gxlaFcK9XWcKMvZNT/lxKFKATw=;
 b=N16eZmwtOI0DPVzqkvJ0OlBlQUzshY5ygchZrcUR9zrSuOWHVbO6gyZkoFoby7j0JbPEGTgna9V/cNvGxh16Q4UHNgP1dIkFNpxoOZQDqbdDhRV/PDK4XJ8WryVQerJr3Lnr4ddLru9HTU03WyvWh2Zvf7yXWwUBAHATB8oASThDWyadcAAAzUMoUTedSaZt+SIqV15rXO2Zuup3VWRHj17VmiGQbfQQ62aZ4v7kop2VhKJ6lrLEJlp/X3ht7/sgElvHOdNxCJzJCVS1VTD/D232R9uWnSrjzTfkBltuxVvFwpAaQPjVpEpkV0xqzB8RuiXrZFmnHd8fZwNZK6ty4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWUZP3dcO3LD8PvV6gxlaFcK9XWcKMvZNT/lxKFKATw=;
 b=M6YYYPlT8qfFyIKVkaxixhdBGUXzhfzJCVVSg7JLdXK9VrhQVyuNKPWxEJi8DVLQasWHaKoJmjkwRSa08Q4wpCTovH/gfpZtaz15Nbq5K3S19whZDLUnFTieRI7yiajZ0zWEuuSbZ2rNIcutOTak4Tc56SWTHa0jI0ozl0qVeXE=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4063.eurprd04.prod.outlook.com (2603:10a6:803:43::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Thu, 23 Jul
 2020 09:58:22 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 09:58:22 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
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
        Horia Geanta <horia.geanta@nxp.com>
Subject: RE: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core device
 to pass data
Thread-Topic: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core device
 to pass data
Thread-Index: AQHWU3qPod3u7KLfuUW6rq9H7arWKakU/oyAgAAAsRA=
Date:   Thu, 23 Jul 2020 09:58:22 +0000
Message-ID: <VE1PR04MB6528BF081AA2B4AE64C8F00F89760@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
 <1594028699-1055-2-git-send-email-jun.li@nxp.com> <87r1t2oabc.fsf@kernel.org>
In-Reply-To: <87r1t2oabc.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f89aa14-8321-4924-4db1-08d82eeeef81
x-ms-traffictypediagnostic: VI1PR04MB4063:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB406379DB53F663A142F55FA489760@VI1PR04MB4063.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZtmvizBj068pWK+B62kLNzlrQDEML4P1C9Zx8989eV1nwTqNZS3jlFVz5TDIY5FViV9Nh92WoLRH0LRt8qhedxtM1U/pJgAba2gaNl196b1LfAdYtuX+CPkM8nIQ14tAl7ALYmR9UahSdIi37FwyFTjV3r2WOP0fLKjhoYEm3xsB40qGvVB6bzwvB95Qb9iJ06snWS3ef1FrGbjfJ9M9tQoPDN1NzNxv2gpvX1/gPcl3Tuni8PVZGw/uCw4OhGj36wv6sjLo9ynDOQnycrKoGiGJ2BdBPJ+olL4p9n13cu+nxQ4mp+eplDiP1mTN/gBSxYpOwNpRv2pDND7sBZoX7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(6506007)(76116006)(64756008)(33656002)(53546011)(44832011)(55016002)(8676002)(478600001)(71200400001)(54906003)(110136005)(52536014)(66556008)(66446008)(66946007)(66476007)(7416002)(5660300002)(316002)(186003)(8936002)(2906002)(4326008)(9686003)(26005)(83380400001)(86362001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: veJ9Da7jRQguJbsZBdvD7TvKma/HryfoK1v230MLBejSUZA514mIs5OQ86O49KVWJVolpLbJaBAwYkXqvAA00nK/qgKuc60VX+yzHD1aMq+Q5ln+QFSx3dXq5Nl1NoVXgVCYarYKR6nhs3qyIp9DJFPRtFx+b1Hvxloa5Pgp2Eb/wjgS1ZGapSqGpy+2k/q3icT7fAutXNDYH39Fkzy+O6ag+OnCdnSByGt8c6mlewnaTV8ZJWfFJ32vT1fDTfC2uyu9WaO3aGO2YuFoPLjZAE70nhJ9jFlJzK2jJbnOFuA9xuw9DffFoHX8NTn0Y+bfKDmEvQ4SHmFH7ev2ndVn76Nw3+D7uYKpEdVzyxpTHcngb18Lp319qShKejEJ3SOgImPNcGvuucC0hj/b4DALHK85bxD9BSoz5qeCkj9IBj/PcuWvObgSdyIl+GP0xWTfwWR3AZyiJPIf/IQ8VXHKvRsu6pYk8UCxEnvkGKiX4NM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f89aa14-8321-4924-4db1-08d82eeeef81
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 09:58:22.7808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I/XA/PNeS53du11WzqXr6aFJCscPZLfAPmkV4nZlz4GY26pZxKJ19qWhRb8I6uFl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4063
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



> -----Original Message-----
> From: Felipe Balbi <balbif@gmail.com> On Behalf Of Felipe Balbi
> Sent: Thursday, July 23, 2020 5:22 PM
> To: Jun Li <jun.li@nxp.com>; shawnguo@kernel.org; robh+dt@kernel.org
> Cc: gregkh@linuxfoundation.org; s.hauer@pengutronix.de; kernel@pengutroni=
x.de;
> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; linux-usb@vger.kern=
el.org;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; Peter C=
hen
> <peter.chen@nxp.com>; Anson Huang <anson.huang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; Horia Geanta <horia.geanta@nxp.com>
> Subject: Re: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core dev=
ice to
> pass data
>=20
>=20
> Hi,
>=20
> Li Jun <jun.li@nxp.com> writes:
> > In case dwc3 has SoC specific customizations, dwc3 glue driver can
> > base on compatible string and pass it via platform data to dwc3 core
> > driver; and pass xhci private data further to xhci-plat like quirks.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  drivers/usb/dwc3/core.h | 5 +++++
> >  drivers/usb/dwc3/host.c | 9 +++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h index
> > 0b8ea8c..3146697 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -29,6 +29,7 @@
> >  #include <linux/ulpi/interface.h>
> >
> >  #include <linux/phy/phy.h>
> > +#include "../host/xhci-plat.h"
> >
> >  #define DWC3_MSG_MAX	500
> >
> > @@ -924,6 +925,10 @@ struct dwc3_scratchpad_array {
> >  	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
> >  };
> >
> > +struct dwc3_platform_data {
> > +	struct xhci_plat_priv *xhci_priv;
> > +};
>=20
> why? We should rely on properties, no?

My v1 patch was adding new property directly, considering Rob has objection
on that way if I understand correctly, also there is suggestion on use
compatible string to set quirks, I changed to add platform data to pass
SoC level quirks, I think this also can be used to extend other special
handling for glue layer driver, so should I go back to use properties?=20
Hope an agreement can be made on adding new properties/quirks.=20

Thanks
Li Jun
=20
>=20
> --
> balbi
