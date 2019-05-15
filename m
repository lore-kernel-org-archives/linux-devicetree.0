Return-Path: <SRS0=7B8F=TP=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Date: Wed, 15 May 2019 14:18:18 +0000
Message-ID: 
 <TYXPR01MB15687A77DA9CEC27D214B17E8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
	<20190514145605.19112-12-chris.brandt@renesas.com>
 <871s106ssi.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871s106ssi.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Morimoto-san,

> > +	if (priv->phy) {
> > +		phy_put(priv->phy);
> > +		priv->phy =3D NULL;
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> phy_put() will do nothing if priv->phy was NULL.
> We can remove if() here ?

OK. I will remove 'if'.

#I copied Shimoda-san's code from rcar.2  :)


Chris
