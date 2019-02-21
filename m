From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: RE: [PATCH] dt-bindings: Add bindings for mdio mux consumers
Date: Thu, 21 Feb 2019 14:10:11 +0000
Message-ID: <VI1PR0401MB24962D52E53B9637922BD4CBF17E0@VI1PR0401MB2496.eurprd04.prod.outlook.com>
References: <20190221182349.4057-1-pankaj.bansal@nxp.com>
 <20190221134504.GE5653@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190221134504.GE5653@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Andrew Lunn [mailto:andrew@lunn.ch]
> Sent: Thursday, 21 February, 2019 07:15 PM
> To: Pankaj Bansal <pankaj.bansal@nxp.com>
> Cc: Leo Li <leoyang.li@nxp.com>; Peter Rosin <peda@axentia.se>; Florian
> Fainelli <f.fainelli@gmail.com>; Heiner Kallweit <hkallweit1@gmail.com>; =
Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> devicetree@vger.kernel.org; netdev@vger.kernel.org
> Subject: Re: [PATCH] dt-bindings: Add bindings for mdio mux consumers
>=20
> On Thu, Feb 21, 2019 at 12:59:19PM +0000, Pankaj Bansal wrote:
> > When we use the bindings defined in
> > Documentation/devicetree/bindings/mux
> > to define mdio mux in producer and consumer terms, it results in two
> > devices. one is mux producer and other is mux consumer.
> >
> > Add the bindings needed for Mdio mux consumer devices.
>=20
> Hi Pankaj
>=20
> Please thread this binding patch with the code which implements the bindi=
ng.
> The two should be reviewed together.

OK. If you have any comments about this patch, then please let me know.
I will incorporate these when I send both patches together.

>=20
> Thanks
> 	Andrew
