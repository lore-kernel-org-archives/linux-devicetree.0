From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 3/3] usb: gadget: udc: renesas_usb3: add support for R-Car
 M3-W
Date: Fri, 4 Aug 2017 01:11:29 +0000
Message-ID: <TY1PR06MB099220C834EFE0F92E26D5F1D8B60@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1501244219-11840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1501244219-11840-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170803222808.v24lt5bzvpzmjwcj@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170803222808.v24lt5bzvpzmjwcj@rob-hp-laptop>
Content-Language: ja-JP
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring
> Sent: Friday, August 4, 2017 7:28 AM
>=20
> On Fri, Jul 28, 2017 at 09:16:59PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds support for R-Car M3-W. This patch also adds R-Car
> > Gen3 generic version's compatible.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 16 ++++++++++=
+++---
> >  drivers/usb/gadget/udc/renesas_usb3.c                  |  8 ++++++++
> >  2 files changed, 21 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index 8d52766..e280258 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -3,20 +3,30 @@ Renesas Electronics USB3.0 Peripheral driver
> >  Required properties:
> >    - compatible: Must contain one of the following:
> >  	- "renesas,r8a7795-usb3-peri"
> > +	- "renesas,r8a7796-usb3-peri"
> > +	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 compatible
> > +	  device
> > +
> > +    When compatible with the generic version, nodes must list the
> > +    SoC-specific version corresponding to the platform first
> > +    followed by the generic version.
> > +
> >    - reg: Base address and length of the register for the USB3.0 Periph=
eral
> >    - interrupts: Interrupt specifier for the USB3.0 Peripheral
> >    - clocks: clock phandle and specifier pair
> >
> > -Example:
> > +Example of R-Car H3 ES1.x:
> >  	usb3_peri0: usb@ee020000 {
> > -		compatible =3D "renesas,r8a7795-usb3-peri";
> > +		compatible =3D "renesas,r8a7795-usb3-peri",
> > +			     "renesas,rcar-gen3-usb3-peri";
> >  		reg =3D <0 0xee020000 0 0x400>;
> >  		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks =3D <&cpg CPG_MOD 328>;
> >  	};
> >
> >  	usb3_peri1: usb@ee060000 {
> > -		compatible =3D "renesas,r8a7795-usb3-peri";
> > +		compatible =3D "renesas,r8a7795-usb3-peri",
> > +			     "renesas,rcar-gen3-usb3-peri";
> >  		reg =3D <0 0xee060000 0 0x400>;
> >  		interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks =3D <&cpg CPG_MOD 327>;
> > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget=
/udc/renesas_usb3.c
> > index aa2b185..45410f3 100644
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -2506,6 +2506,14 @@ static void renesas_usb3_init_ram(struct renesas=
_usb3 *usb3, struct device *dev,
> >  		.compatible =3D "renesas,r8a7795-usb3-peri",
> >  		.data =3D &renesas_usb3_priv_gen3,
> >  	},
> > +	{
> > +		.compatible =3D "renesas,r8a7796-usb3-peri",
> > +		.data =3D &renesas_usb3_priv_gen3,
> > +	},
> > +	{
> > +		.compatible =3D "renesas,rcar-gen3-usb3-peri",
> > +		.data =3D &renesas_usb3_priv_gen3,
>=20
> What's the point of a common fallback if you list all the compatibles in
> the driver?

Thank you for the comment!
The renesas,r8a779[56]-usb3-peri don't need anymore.
So, I will fix this patch.

Best regards,
Yoshihiro Shimoda

> > +	},
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, usb3_of_match);
> > --
> > 1.9.1
> >
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
