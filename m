Return-Path: <SRS0=eaZt=TW=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Date: Wed, 22 May 2019 10:59:46 +0000
Message-ID: 
 <OSBPR01MB2103B7A7CF5F9CDDC40B9A2BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
	<1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
	<OSAPR01MB30899C8C3E0F316FF37DAE3AD8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <877eaktf8i.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877eaktf8i.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


Hi Morimoto-San and Shimoda-San,

Thanks for the feedback.

> Subject: Re: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree bindi=
ng
> document
>=20
>=20
> Hi
>=20
> > > +Required properties:
> > > + - compatible: Must be "ti,hd3ss3220".
> > > + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> > > + - interrupts: <a b> where a is the interrupt number and b represent=
s an
> > > +   encoding of the sense and level information for the interrupt.
> > > +
> > > +Required sub-node:
> > > + - connector : The "usb-c-connector" attached to the hd3ss3220
> > > +chip. The
> >
> > s/connector :/connector:/
>=20
> Maybe it is for alignment ?

Yes, I need to fix the extra space.

> > According to the connector/usb-connector.txt, should the connector
> > node have ports, port@1 and an endpoint nodes like below?
>=20
> "ports" is needed if it has multiple "port", otherwise, single port is al=
lowed
> from OF-graph point of view.

OK. I will use single port on  the next patch series.

Regards,
Biju
