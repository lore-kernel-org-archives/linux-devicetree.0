Return-Path: <SRS0=zDJw=QF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr690109.outbound.protection.outlook.com ([40.107.69.109]:21632
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727473AbfA2UWx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 29 Jan 2019 15:22:53 -0500
From: Ken Sloat <KSloat@aampglobal.com>
Subject: RE: [PATCH v2 2/2] media: atmel-isc: Update device tree binding
 documentation
Date: Tue, 29 Jan 2019 20:22:48 +0000
Message-ID: <BL0PR07MB4115CF2CA5F69C3963AC58BBAD970@BL0PR07MB4115.namprd07.prod.outlook.com>
References: <DM5PR07MB411967243FA1C96C1179071FAD9C0@DM5PR07MB4119.namprd07.prod.outlook.com>
 <20190123124538.5vfxhsyl2npy4jnp@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190123124538.5vfxhsyl2npy4jnp@valkosipuli.retiisi.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ken Sloat <KSloat@aampglobal.com>
List-ID: <devicetree@vger.kernel.org>

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@iki.fi>
> Sent: Wednesday, January 23, 2019 7:46 AM
> Cc: Eugen.Hristev@microchip.com; mchehab@kernel.org;
> Nicolas.Ferre@microchip.com; alexandre.belloni@bootlin.com;
> Ludovic.Desroches@microchip.com; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org
> Subject: Re: [PATCH v2 2/2] media: atmel-isc: Update device tree binding
> documentation
>=20
> On Fri, Jan 18, 2019 at 06:05:23PM +0000, Ken Sloat wrote:
> > > -----Original Message-----
> > > From: Eugen.Hristev@xxxxxxxxxxxxx <Eugen.Hristev@xxxxxxxxxxxxx>
> > > Sent: Friday, January 18, 2019 9:40 AM
> > > To: Ken Sloat <KSloat@xxxxxxxxxxxxxx>
> > > Cc: mchehab@xxxxxxxxxx; Nicolas.Ferre@xxxxxxxxxxxxx;
> > > alexandre.belloni@xxxxxxxxxxx; Ludovic.Desroches@xxxxxxxxxxxxx;
> > > linux- media@xxxxxxxxxxxxxxx; devicetree@xxxxxxxxxxxxxxx
> > > Subject: Re: [PATCH v2 2/2] media: atmel-isc: Update device tree
> > > binding documentation
> > >
> > >
> > >
> > > On 18.01.2019 16:28, Ken Sloat wrote:
> > > > From: Ken Sloat <ksloat@xxxxxxxxxxxxxx>
> > > >
> > > > Update device tree binding documentation specifying how to enable
> > > > BT656 with CRC decoding.
> > > >
> > > > Signed-off-by: Ken Sloat <ksloat@xxxxxxxxxxxxxx>
> > > > ---
> > > >   Changes in v2:
> > > >   -Use correct media "bus-type" dt property.
> > > >
> > > >   Documentation/devicetree/bindings/media/atmel-isc.txt | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > > b/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > > index bbe0e87c6188..2d4378dfd6c8 100644
> > > > --- a/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > > +++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > > @@ -21,6 +21,11 @@ Required properties for ISC:
> > > >   - pinctrl-names, pinctrl-0
> > > >   	Please refer to pinctrl-bindings.txt.
> > > >
> > > > +Optional properties for ISC:
> > > > +- bus-type
> > > > +	When set to 6, Bt.656 decoding (embedded sync) with CRC decoding
> > > > +	is enabled.
> > > > +
> > >
> > > I don't think this patch is required at all actually, the binding
> > > complies to the video-interfaces bus specification which includes the
> parallel and bt.656.
> > >
> > > Would be worth mentioning below explicitly that parallel and bt.656
> > > are supported, or added above that also plain parallel bus is support=
ed ?
> > >
> > > >   ISC supports a single port node with parallel bus. It should
> > > > contain one
> > >
> > > here inside the previous line
> > Hi Eugen,
> >
> > Yes it's true adding new documentation here may be overkill, but yes
> > it should say something (as a user I always find it helpful if the docs=
 are
> more verbose than not).
> >
> > So per your suggestion, how about the simplified:
> > "ISC supports a single port node with parallel bus and optionally Bt.65=
6
> support."
> >
> > and I'll remit the other statements.
>=20
> Please still include the name of the property, as well as the valid value=
s for it
> (numeric as well as human-readable). The rest of the documentation should
> stay in video-interfaces.txt IMO --- this is documentation for the hardwa=
re
> only.
>=20
> --
> Regards,
>=20
> Sakari Ailus

Thanks Sakari for the feedback. So my original patch here would be valid as=
 is correct?

Thanks,
Ken Sloat
