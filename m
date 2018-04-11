Return-Path: <SRS0=jhCx=HA=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] usb: role: rcar-usb3-role-switch: add support for R-Car
 SoCs
Date: Wed, 11 Apr 2018 08:43:16 +0000
Message-ID: <TY1PR06MB0992B234D74FF7DC6EB14C73D8BD0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1523361826-8772-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180411072606.GA7517@kuha.fi.intel.com>
In-Reply-To: <20180411072606.GA7517@kuha.fi.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Heikki,

> From: Heikki Krogerus, Sent: Wednesday, April 11, 2018 4:26 PM
>=20
> On Tue, Apr 10, 2018 at 09:03:46PM +0900, Yoshihiro Shimoda wrote:
<snip>
> > +Example of R-Car H3 ES2.0:
> > +	usb3_peri0: usb@ee020000 {
> > +		compatible =3D "renesas,r8a7795-usb3-peri",
> > +			     "renesas,rcar-gen3-usb3-peri";
> > +		reg =3D <0 0xee020000 0 0x400>;
> > +		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks =3D <&cpg CPG_MOD 328>;
> > +		power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> > +		resets =3D <&cpg 328>;
> > +
> > +		usb3-role-sw {
> > +			compatible =3D "renesas,rcar-usb3-role-switch";
> > +			renesas,host =3D <&xhci0>;
>=20
> I pretty sure you should model that connection using OF graph
> bindings. That way I believe this will also fit nicely to the
> usb-connector bindings. Check bindings/connector/usb-connector.txt

Oh, I didn't know the usb-connector bindings has been merged into the linux=
-next.
Thank you for the suggestion. I will try to use it.

Best regards,
Yoshihiro Shimoda

> > +		};
> > +	};
>=20
>=20
> Br,
>=20
> --
> heikki
