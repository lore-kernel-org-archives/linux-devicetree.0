From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 1/3] dt-bindings: phy: rcar-gen3-phy-usb2: Revise
 #phy-cells property
Date: Mon, 8 Apr 2019 06:22:14 +0000
Message-ID: <TYAPR01MB4271FBDF12890817243F3FABD82C0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1554120083-29990-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY1PR01MB17708AF072E039D362FDE659C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB17708AF072E039D362FDE659C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio-san,

Thank you for your review!

> From: Fabrizio Castro, Sent: Wednesday, April 3, 2019 7:35 PM
>=20
> Hello Yoshihiro-san,
>=20
> Thank you for your patch!
>=20
> > From: linux-kernel-owner@vger.kernel.org <linux-kernel-owner@vger.kerne=
l.org> On Behalf Of Yoshihiro Shimoda
> > Sent: 01 April 2019 13:01
> > Subject: [PATCH 1/3] dt-bindings: phy: rcar-gen3-phy-usb2: Revise #phy-=
cells property
> >
> > To have the detailed property on each PHY specifier, this patch revices
>=20
> s/revices/revises/g

Oops! I'll fix it in v2.

> > the #phy-cells property.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 7 +++++=
+-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.t=
xt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-
> > phy-usb2.txt
> > index ad9c290..7f0d4bf 100644
> > --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > @@ -27,7 +27,12 @@ Required properties:
> >
> >  - reg: offset and length of the partial USB 2.0 Host register block.
> >  - clocks: clock phandle and specifier pair(s).
> > -- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
> > +- #phy-cells: see phy-bindings.txt in the same directory, must be <1>.
> > +
> > +The phandle's argument in the PHY specifier is the INT_STATUS bit of c=
ontroller:
>=20
> From the driver we are also looking for value 0, as in rcar_gen3_get_dr_m=
ode we
> have a for loop that starts from 0, and we call of_usb_get_dr_mode_by_phy=
 with
> arg0 =3D=3D 0

This is backward compatibility for old DTS file (phy-cells =3D 0).

> why are we leaving this out from this list?

This is because I don't assume any device nodes doesn't have such a propert=
y
(the bit 0 of INT_STATUS).

Best regards,
Yoshihiro Shimoda

> Thanks,
> Fab
>=20
> > +- 1 =3D USBH_INTA (OHCI)
> > +- 2 =3D USBH_INTB (EHCI)
> > +- 3 =3D UCOM_INT (OTG and BC)
> >
> >  Optional properties:
> >  To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral)=
 are
> > --
> > 2.7.4
