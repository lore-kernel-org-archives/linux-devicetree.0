Return-Path: <SRS0=P6Mw=TX=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Date: Thu, 23 May 2019 05:18:05 +0000
Message-ID: 
 <OSAPR01MB308947DD6A61047728A1BFEDD8010@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
	<1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
	<OSAPR01MB30899C8C3E0F316FF37DAE3AD8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <877eaktf8i.wl-kuninori.morimoto.gx@renesas.com>
 <OSBPR01MB2103B7A7CF5F9CDDC40B9A2BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB2103B7A7CF5F9CDDC40B9A2BB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju-san, Morimoto-san,

> From: Biju Das, Sent: Wednesday, May 22, 2019 8:00 PM
<snip>
> > > According to the connector/usb-connector.txt, should the connector
> > > node have ports, port@1 and an endpoint nodes like below?
> >
> > "ports" is needed if it has multiple "port", otherwise, single port is =
allowed
> > from OF-graph point of view.
>=20
> OK. I will use single port on  the next patch series.

According to the connector/usb-connector.txt [1], even if this device uses =
a single port,
we should describe ports node and port@1 (for SuperSpeed) subnode like usb/=
typec-tcpci.txt.

[1]
Required nodes:
- any data bus to the connector should be modeled using the OF graph bindin=
gs
  specified in bindings/graph.txt, unless the bus is between parent node an=
d
  the connector. Since single connector can have multiple data buses every =
bus
  has assigned OF graph port number as follows:
    0: High Speed (HS), present in all connectors,
    1: Super Speed (SS), present in SS capable connectors,
    2: Sideband use (SBU), present in USB-C.

Best regards,
Yoshihiro Shimoda
