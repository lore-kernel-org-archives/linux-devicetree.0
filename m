Return-Path: <SRS0=RCUR=TX=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Date: Thu, 23 May 2019 08:56:51 +0000
Message-ID: 
 <OSBPR01MB2103449C227E75781E857368B8010@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
	<1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
	<OSAPR01MB30899C8C3E0F316FF37DAE3AD8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <877eaktf8i.wl-kuninori.morimoto.gx@renesas.com>
 <OSBPR01MB2103B7A7CF5F9CDDC40B9A2BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSAPR01MB308947DD6A61047728A1BFEDD8010@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSAPR01MB308947DD6A61047728A1BFEDD8010@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree bindi=
ng
> document
>=20
> Hi Biju-san, Morimoto-san,
>=20
> > From: Biju Das, Sent: Wednesday, May 22, 2019 8:00 PM
> <snip>
> > > > According to the connector/usb-connector.txt, should the connector
> > > > node have ports, port@1 and an endpoint nodes like below?
> > >
> > > "ports" is needed if it has multiple "port", otherwise, single port
> > > is allowed from OF-graph point of view.
> >
> > OK. I will use single port on  the next patch series.
>=20
> According to the connector/usb-connector.txt [1], even if this device use=
s a
> single port, we should describe ports node and port@1 (for SuperSpeed)
> subnode like usb/typec-tcpci.txt.

OK.  I will update the example like below.

hd3ss3220@47 {
	compatible =3D "ti,hd3ss3220";
	reg =3D <0x47>;
	interrupt-parent =3D <&gpio6>;
	interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;

	usb_con: connector {
		compatible =3D "usb-c-connector";
		label =3D "USB-C";
		data-role =3D "dual";

		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			port@1 {
				reg =3D <1>;
				hd3ss3220_ep: endpoint {
					remote-endpoint =3D <&usb3_role_switch>;
				};
			};
		};
	};
};

Regards,
Biju

> [1]
> Required nodes:
> - any data bus to the connector should be modeled using the OF graph
> bindings
>   specified in bindings/graph.txt, unless the bus is between parent node =
and
>   the connector. Since single connector can have multiple data buses ever=
y
> bus
>   has assigned OF graph port number as follows:
>     0: High Speed (HS), present in all connectors,
>     1: Super Speed (SS), present in SS capable connectors,
>     2: Sideband use (SBU), present in USB-C.
