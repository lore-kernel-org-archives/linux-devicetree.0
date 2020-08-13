Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C91C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 09:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CEF92074D
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 09:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="auibEEpP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHMJyi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 05:54:38 -0400
Received: from mail-am6eur05on2045.outbound.protection.outlook.com ([40.107.22.45]:24256
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726106AbgHMJyi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Aug 2020 05:54:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy8KfdhiY2mHZFxIDIKF5EtaEkTojK+bn/JWAk/1tTOOxeYfKhOsA2jUUFv/F9FGk/szhZ1oY+xKNBs4/ITg6G56EvSsa1ln2D0U5Li268EXLxdsyryuRo82kBVU9oEkYyMJojesZk5AIKJagsKR/mginXJTKkNgSciwVUCr4vL1rVEmSpUUo5WJ/GYng3Vl1liChM5R12VuGDTblt79aY/cE+KTA9LTMQAJGI4bNtBDTtWiqNr5azPeR+SDjNj3nUs9alMv3+dYjeElYsCUzhemp6QyhCpzE6y9rZwOQSXOdx27IcixLlJ8mq4SsOAh/1O+BfD+T70ojkyged1MHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCwkf6vGRZLoX+PMO/ZRRK7fzGlQKkiWqE/uAuiAeZY=;
 b=PTcVH3uLz7sFYAQ/w6Yev1qkNmyaDATT6qtYs3Nk06xseP5m3hWu4QxXF3BHA+K7RdV/iPt65bGEqMJk1peiUUyPQYOAAgUxlfteyO5mCKl1j+INu/hwAA+wZb5vHLHPlv/gSkSFnTMxJAfjxvoX52mD/udO06S6nRfu9djj9tmG/u0I/X/pap2OZJvAF9tTRQe3QFKY33ckMKf+0LtsyCrg+5Sp4QGLwUvmGmY5MKPO4Sz91deL7net2guGpS6D+tcj2elEFX/bIzAuBumKjUfbgwzTkswOr/iG4YnKRA4G8rAk+znrBrTnwXXK3v/Q8lnM4N6nkGheVBpO+UbH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCwkf6vGRZLoX+PMO/ZRRK7fzGlQKkiWqE/uAuiAeZY=;
 b=auibEEpP8hqKjP9FKzU4hZ8kwud/CObjbtGfmuoekBU4JVujzyy9prSXprS3jWkYC6f36muxPUliKW/SELHsp5riQYUd+/+JpMDRwb8bmBs/pHUmFwIqnfwCnVjU1l7lht7EffnnPXDHfgNGP2qGTCVG5sGjqNG/HhBc1v0LxVw=
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2472.eurprd04.prod.outlook.com (2603:10a6:4:36::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 09:54:33 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::2d61:d6fe:3c2:3e14%3]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 09:54:33 +0000
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
Thread-Index: AQHWU3qPod3u7KLfuUW6rq9H7arWKakU/oyAgAAAsRCAIQe6kA==
Date:   Thu, 13 Aug 2020 09:54:32 +0000
Message-ID: <DB8PR04MB6523EE64FD4AC189E5D42A4989430@DB8PR04MB6523.eurprd04.prod.outlook.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
 <1594028699-1055-2-git-send-email-jun.li@nxp.com> <87r1t2oabc.fsf@kernel.org>
 <VE1PR04MB6528BF081AA2B4AE64C8F00F89760@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528BF081AA2B4AE64C8F00F89760@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f8ee29f5-452e-4fa6-8a16-08d83f6ee150
x-ms-traffictypediagnostic: DB6PR0401MB2472:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2472127F75D0906C1FD1EBCB89430@DB6PR0401MB2472.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5i3rhAw5K4oRGUbGi4zB/avsNoe3LKDYxLl9vFFx9bO5e+AoAAUeo18aZAEfxWif0aTuIhJKyR3E9QSrE05ZpL8bYDjGlsvOd3NgDnqrkW5MBPC9yCz6mDrRMZ6RBW6O0xJe+5pqP15w3DxbJJcUhrKQscHF7lW2A7a8Ohe9dShISuzHCP75eWYwIwwswWRZAGCJAhUVrTw7koIq1J6MxKk9x2ZEPJMrt8Br9jHXEqZE0vKW4vI0YEgu/eXKkt/2W6rt2qRhMC1nEzAmYAPYh/gP9Asvc1OQX8Y2wh/pF4OWHO4B7mE+wQfxcofhLxlCTl2QFGBo7UUXcD9W12MLXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(55016002)(71200400001)(33656002)(54906003)(8936002)(6506007)(4326008)(86362001)(316002)(52536014)(9686003)(110136005)(53546011)(478600001)(83380400001)(186003)(5660300002)(26005)(66556008)(64756008)(66476007)(7696005)(76116006)(44832011)(2906002)(7416002)(66446008)(8676002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OqJPBRP2+4QK9J1YAeULgkgUyvcjPMBf9g4lsEiqIyLXgVQ/nRKMaWdkUDwcPQ9iHpaPl0VZ36qDVBowWxfPa0H//b1mZeUiW1sJWL+cnQNLRCxHWJh0p29SiRdVn1KW40tCli5E7c+TQwzX2j+tDbD5bA0CX3kiY+bMCE45hRvckOX5zY5IiP1OletseOg3Ivtj/kxK5lZFDUY0vxJwaI3dakhTJqmflxT+WzKKTdryL5ekbdL2lOqoQWUmteiBecLJxwyb7G1BA25RhFy8UFQ9ue0U4Y47y+LjfQlvenQYSauBzME7tu5TjaKJ3pEC9Dxi0srPzF+mH/BCmmg1JW/xPS+DtVJ3bI7KCrMbao/ZvGX/juYm2RJ03wG5vplNvcwWk7AOEt+rH0TpgS3GRIrA/D6rodd3J8r/ubgY1TN42yarrx7VwnVVPbsIyL5sznHhkmf4x7guqacdduCmHnj77D2gmdu5ZCII7q8jxlNli1S/wlAhFiJKPwtFVXna6zRmAwaV129stf7QWWmgbs+ODyVTVEcnuBmfQ5dtO3KrC9IPXeTUYCSJiozYAWkpb5Xhb4mSms832QLgs1p40JPTDwBYnGxLf0/zyu3FgfCm9B4LfvkM7YWRs+JfwLMHsEmN/F71SB4GfD88dL05uQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ee29f5-452e-4fa6-8a16-08d83f6ee150
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 09:54:33.0200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZdaB7CtFSLF9D9jUi7jBEfTebUunWna7vh4K7V27z1ZTDOFHy+qxN7bCsSnUjBr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2472
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


> -----Original Message-----
> From: Jun Li
> Sent: Thursday, July 23, 2020 5:58 PM
> To: Felipe Balbi <balbi@kernel.org>; shawnguo@kernel.org; robh+dt@kernel.=
org
> Cc: gregkh@linuxfoundation.org; s.hauer@pengutronix.de; kernel@pengutroni=
x.de;
> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; linux-usb@vger.kern=
el.org;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; Peter C=
hen
> <peter.chen@nxp.com>; Anson Huang <anson.huang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; Horia Geanta <horia.geanta@nxp.com>
> Subject: RE: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core dev=
ice to
> pass data
>=20
>=20
>=20
> > -----Original Message-----
> > From: Felipe Balbi <balbif@gmail.com> On Behalf Of Felipe Balbi
> > Sent: Thursday, July 23, 2020 5:22 PM
> > To: Jun Li <jun.li@nxp.com>; shawnguo@kernel.org; robh+dt@kernel.org
> > Cc: gregkh@linuxfoundation.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx
> > <linux-imx@nxp.com>; linux-usb@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > Peter Chen <peter.chen@nxp.com>; Anson Huang <anson.huang@nxp.com>;
> > Peng Fan <peng.fan@nxp.com>; Horia Geanta <horia.geanta@nxp.com>
> > Subject: Re: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core
> > device to pass data
> >
> >
> > Hi,
> >
> > Li Jun <jun.li@nxp.com> writes:
> > > In case dwc3 has SoC specific customizations, dwc3 glue driver can
> > > base on compatible string and pass it via platform data to dwc3 core
> > > driver; and pass xhci private data further to xhci-plat like quirks.
> > >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > >  drivers/usb/dwc3/core.h | 5 +++++
> > >  drivers/usb/dwc3/host.c | 9 +++++++++
> > >  2 files changed, 14 insertions(+)
> > >
> > > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h index
> > > 0b8ea8c..3146697 100644
> > > --- a/drivers/usb/dwc3/core.h
> > > +++ b/drivers/usb/dwc3/core.h
> > > @@ -29,6 +29,7 @@
> > >  #include <linux/ulpi/interface.h>
> > >
> > >  #include <linux/phy/phy.h>
> > > +#include "../host/xhci-plat.h"
> > >
> > >  #define DWC3_MSG_MAX	500
> > >
> > > @@ -924,6 +925,10 @@ struct dwc3_scratchpad_array {
> > >  	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
> > >  };
> > >
> > > +struct dwc3_platform_data {
> > > +	struct xhci_plat_priv *xhci_priv;
> > > +};
> >
> > why? We should rely on properties, no?
>=20
> My v1 patch was adding new property directly, considering Rob has objecti=
on on that
> way if I understand correctly, also there is suggestion on use compatible=
 string
> to set quirks, I changed to add platform data to pass SoC level quirks, I=
 think
> this also can be used to extend other special handling for glue layer dri=
ver, so
> should I go back to use properties?
> Hope an agreement can be made on adding new properties/quirks.
'
Hi Felipe,

Could you please point me how I can move forward on this, thanks a lot.

Li Jun
>=20
> Thanks
> Li Jun
>=20
> >
> > --
> > balbi
