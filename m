Return-Path: <SRS0=0oJi=RR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add
 usb-role-switch property
Date: Thu, 14 Mar 2019 10:14:12 +0000
Message-ID: 
 <OSBPR01MB21039B4241097B8EE8C73A85B84B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-3-git-send-email-biju.das@bp.renesas.com>
 <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add usb-role-
> switch property
>=20
> Hi Biju-san,
>=20
> > From: Biju Das, Sent: Thursday, March 14, 2019 5:40 PM
> >
> > Add support for renesas_usb3 to support dual role switch using usb
> > role switch class framework.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  V1-->V2
> >   * Added usb-role-switch-property
> >   * Updated the example with usb-role-switch property.
> > ---
> >  .../devicetree/bindings/usb/renesas_usb3.txt       | 22
> ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index 35039e7..eecaf4c 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -22,6 +22,7 @@ Required properties:
> >  Optional properties:
> >    - phys: phandle + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - usb-role-switch: use USB role switch to support dual-role switch
>=20
> I don't think we can add such a property. At least, we have to add "renes=
as,"
> prefix.

usb_role_switch_get   api uses  "usb-role-switch"  property to get role swi=
tch linked with the device.

HD3SS3220 port controller driver gets role switch handle linked with the de=
vice using usb_role_switch_get  api. =20
That is the reason, I have added " usb-role-switch" property here.

Do you have any other suggestion to get usb role switch handle?

Please correct me if I am wrong.=20
=20
> >  Example of R-Car H3 ES1.x:
> >  	usb3_peri0: usb@ee020000 {
> > @@ -39,3 +40,24 @@ Example of R-Car H3 ES1.x:
> >  		interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks =3D <&cpg CPG_MOD 327>;
> >  	};
> > +
> > +Example of RZ/G2E:
> > +	usb3_peri0: usb@ee020000 {
> > +		compatible =3D "renesas,r8a774c0-usb3-peri",
> > +			     "renesas,rcar-gen3-usb3-peri";
> > +		reg =3D <0 0xee020000 0 0x400>;
> > +		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks =3D <&cpg CPG_MOD 328>;
> > +		companion =3D <&xhci0>;
> > +		usb-role-switch;
> > +
> > +		port {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			usb3peri_role_switch: endpoint@0 {
> > +				reg =3D <0>;
> > +				remote-endpoint =3D <&hd3ss3220_ep>;
> > +			};
> > +		};
> > +	};
> > --
> > 2.7.4

Regards,
Biju
