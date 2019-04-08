From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 1/3] dt-bindings: phy: rcar-gen3-phy-usb2: Revise
 #phy-cells property
Date: Mon, 8 Apr 2019 06:13:57 +0000
Message-ID: <TYAPR01MB42711FBCAD17ED19A55C5DFDD82C0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1554120083-29990-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190403092054.d26pmbngconkn3hx@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403092054.d26pmbngconkn3hx@verge.net.au>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

Thank you for your review!

> From: Simon Horman, Sent: Wednesday, April 3, 2019 6:21 PM
>=20
> Hi Shimoda-san,
>=20
> On Mon, Apr 01, 2019 at 09:01:21PM +0900, Yoshihiro Shimoda wrote:
> > To have the detailed property on each PHY specifier, this patch revices
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
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > index ad9c290..7f0d4bf 100644
> > --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > @@ -27,7 +27,12 @@ Required properties:
> >
> >  - reg: offset and length of the partial USB 2.0 Host register block.
> >  - clocks: clock phandle and specifier pair(s).
> > -- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
>=20
> The driver currently supports <0> and with this changeset continues to do
> so. I also assume there are existing DTs that use <0>. Would it be
> better to describe this as deprecated?

I got it. I'll fix this in v2.

Best regards,
Yoshihiro Shimoda


> > +- #phy-cells: see phy-bindings.txt in the same directory, must be <1>.
> > +
> > +The phandle's argument in the PHY specifier is the INT_STATUS bit of c=
ontroller:
> > +- 1 =3D USBH_INTA (OHCI)
> > +- 2 =3D USBH_INTB (EHCI)
> > +- 3 =3D UCOM_INT (OTG and BC)
> >
> >  Optional properties:
> >  To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral)=
 are
> > --
> > 2.7.4
> >
