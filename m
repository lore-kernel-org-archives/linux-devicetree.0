From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: [v2, 3/5] dt-binding: ptp_qoriq: document "fsl,extts-fifo"
 property
Date: Fri, 18 Jan 2019 08:10:55 +0000
Message-ID: <VI1PR0401MB2237D239322218954C0C1CC1F89C0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
References: <20190117014936.48117-1-yangbo.lu@nxp.com>
 <20190117014936.48117-4-yangbo.lu@nxp.com>
 <20190118013434.qwuiqi5iwo5gw2nk@localhost>
 <20190118013912.skj4x5wmkbouekfx@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190118013912.skj4x5wmkbouekfx@localhost>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

> -----Original Message-----
> From: Richard Cochran <richardcochran@gmail.com>
> Sent: Friday, January 18, 2019 9:39 AM
> To: Y.b. Lu <yangbo.lu@nxp.com>
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; David S . Miller <davem@davemloft.n=
et>;
> Rob Herring <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>
> Subject: Re: [v2, 3/5] dt-binding: ptp_qoriq: document "fsl,extts-fifo" p=
roperty
>=20
> On Thu, Jan 17, 2019 at 05:34:34PM -0800, Richard Cochran wrote:
> > > @@ -17,6 +17,7 @@ Clock Properties:
> > >    - fsl,tmr-fiper1   Fixed interval period pulse generator.
> > >    - fsl,tmr-fiper2   Fixed interval period pulse generator.
> > >    - fsl,max-adj      Maximum frequency adjustment in parts per billi=
on.
> > > +  - fsl,extts-fifo   Required if hardware uses external trigger stam=
p FIFO.
> >
> > Does this take a Boolean value?  Please explain the semantics.
>=20
> How about this instead?
>=20
> 	The presence of this property indicates hardware support for
> 	the external trigger stamp FIFO.

[Y.b. Lu] Yes. This is a Boolean value.
Thanks for good suggestion and I will use this instead.

>=20
>=20
> Thanks,
> Richard
