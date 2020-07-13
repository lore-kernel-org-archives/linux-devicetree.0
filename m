Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5272CC433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 08:38:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EFED20702
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 08:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="I8Sfjgcu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgGMIiP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 04:38:15 -0400
Received: from mail-eopbgr130043.outbound.protection.outlook.com ([40.107.13.43]:37048
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725818AbgGMIiP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 04:38:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iz9KLixbSxTJ/pxfy+QK0cRX9egVFphYm7X+qeLODEhdhsllJvtu4bCgR6e+WWBJ/tj/QWuUZzoWEznVkoQcmkHSh+j0XNs0otHu8CQoGz7vsFj2lYroi39KRZzDcloeF3zFAAjqU4ESi65WJZ1MSQ2nDadP84pDJ59/N3uUtKZ1zvL+NZjK4dxdtDSw3DeGGptjKFPpUBdgXuPRbfG18Y51dk5mScVT3Dx2xyfadpQxK531xwUFzG0WH3nS6IerqAPrLQyt3apKbWOX2Joeo2g7xPCb34ViUCFPIlSnWqfC61DQV3WGkrKqmEbpDMI79xURIIszc49vbQ22eKVjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nClVY1nAD9Eb7jHBUjax86wQ6dqVW8M8y/My7arrTLQ=;
 b=GJAwm7GuVYRDQPeylFTpiihXTAPOjkOfv12SJIaNifhF/uBDVswjy+5K1MG9iekegCBoMwrZeM21fx69e4WBWjF/nFJRCA+wRnJ/JodaKDP/F/7cMkhO7z0Xbe3ReR5Rkhsqqegws6gVYcWzqndidPuMRpQ6icd3sQceFtKlr8l/F7VBBLwKSMqPsb4Aqk8Mk/2mHU4iHTaNn0mwh94zPD9KNvKOY3GNnn+qilE/kXXVkSSHHWK840+taXNwmobS2JJ8yfOT57nHoSwg02JPE/fJesihNOUPH4js73OJXOBdfEKWYqsnBhMeZ0FvO+eN9ryjBUYJiu8YtAMtw38LSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nClVY1nAD9Eb7jHBUjax86wQ6dqVW8M8y/My7arrTLQ=;
 b=I8SfjgcupTyvmolquC/WdAKtACeaAjtmrlC8jadUO2KubLpgo3ckN3wl0GGYnwTVJaEqLojR3PRywr38Z18Eck4A3lNlAejq+QoOI0RFL0/5OKYhnS+9tHcSOiVLy+PnnsqXtCjUxtbULsP273puDFoorB7umE2o7d9+s18JSoI=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 13 Jul
 2020 08:38:11 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 08:38:11 +0000
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
Subject: RE: [PATCH 1/4] doc: dt-binding: ci-hdrc-usb2: add property for imx
 picophy
Thread-Topic: [PATCH 1/4] doc: dt-binding: ci-hdrc-usb2: add property for imx
 picophy
Thread-Index: AQHWVd/263vExqqdu06vQC3dMxDtIakFNEMAgAABX2A=
Date:   Mon, 13 Jul 2020 08:38:11 +0000
Message-ID: <AM7PR04MB7157D089D56069DDE2654D7C8B600@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200709105902.23165-1-peter.chen@nxp.com>
 <20200713083129.GC15718@dragon>
In-Reply-To: <20200713083129.GC15718@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [101.229.5.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dcbdf065-d7ca-4142-32c9-08d82708138a
x-ms-traffictypediagnostic: AM6PR04MB5608:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB560839CEEFB28A6EB90968B58B600@AM6PR04MB5608.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bmAFuRLK4cmQhgUv+LwjlcjnY75jlC44xoGFi7jPI06pFVLmFc7/LVPL+uIfojIwoICINNNyqzwhw/B2+98ENd+bqp7tNoZXDiDkyXYPPThWn1GPg5jhv2wxa0gncqY5yqVhcHsIGYvx0M2ejUWt/woNazqv8jEwdSwnwbxG40ILL8pHFq1c0r82riouOJtM/4IfCHYIK/kIJlPuv6Kdjh1UEtoVozQp1wpbyIEXefjWVzvvBvrDB2f+4hSOho3KxDPTtfN6R9P+OjVgXD71TNjH0g8tmUnXcYYHqz93RRX/IAhSxXblwk5lCRvAnHrw1vdAGxxzJL1uDuyem0V8Xg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(478600001)(86362001)(44832011)(7696005)(76116006)(5660300002)(66476007)(54906003)(66556008)(6506007)(66946007)(2906002)(55016002)(9686003)(71200400001)(4326008)(26005)(66446008)(52536014)(64756008)(316002)(8676002)(33656002)(6916009)(8936002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZbxRH/Z4Cp9kiqR3Qd6z+RqQVe83eYZ7AeaSA7wX3iFxS2ARXpskGfKA83L7kbd6psX/n1UcXbYgQ9TT3EpbPUZf8gV9BLhSVmpUr9vjPVILoERG38r8VCIVOOgeKlIcsw8QLjPGlMHbG3qOoowzTkrRzSBEt8mXRNAT6QXWEpPO8Lt1Z4+MHOo/sRxlM6uX33HzBBr/lyH6hsS6HbplfWJZ8xQ6+iGKbVVZ5w0e3U0tlsFZ+in8ZYEbum0dQCHWI7KaM0RodDVsPmZ3ekdzm8fk1sA1i6uVOI917j9ZfnVYvYvTbZ8pTX55N8/3LeLXl9Xp0tHLzP8JpkukfxfYiw+qgQoEC36BTYnIKsKECVVmbDf1vvrB+1h8YVaSH5YQZ4Maoxj3LL2/dxY8M10oOj65L/bJCC0RVzJxgaH316MAY0EGijg2E7IcFwTKKa56S+LnTFVlxQWCR0hQMtJrXcOhk6HxbSOkIuqciIAeQJ8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbdf065-d7ca-4142-32c9-08d82708138a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 08:38:11.3025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o/g+BhDNU8FElhMFvGBZrBWJH+gc8HZUnnMhofxCIAGG0yfusH6Oxc9R3XPnn9gFO2mYwKcX01yigz2WHXE+Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

=20
> > ---
> >  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > index 51376cbe5f3d..e9858dafb08f 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > @@ -100,6 +100,13 @@ i.mx specific properties
> >    It's recommended to specify the over current polarity.
> >  - power-active-high: power signal polarity is active high
> >  - external-vbus-divider: enables off-chip resistor divider for Vbus
> > +- picophy,pre-emp-curr-control: HS Transmitter Pre-Emphasis Current
>=20
> 'picophy' should be documented in vendor-prefixes.yaml?
>=20

For chipidea binding doc, there is no vendor specific doc, only there are v=
endor
specific parts in general binding doc.

Peter


> Shawn
>=20
> > +  Control. This signal controls the amount of current sourced to the
> > +  USB_OTG*_DP and USB_OTG*_DN pins after a J-to-K or K-to-J transition=
.
> > +  Details can refer to TXPREEMPAMPTUNE0 bits of USBNC_n_PHY_CFG1.
> > +- picophy,dc-vol-level-adjust: HS DC Voltage Level Adjustment.
> > +  Adjust the high-speed transmitter DC level voltage, details can
> > +refer
> > +  to TXVREFTUNE0 bits of USBNC_n_PHY_CFG1.
> >
> >  Example:
> >
> > --
> > 2.17.1
> >
