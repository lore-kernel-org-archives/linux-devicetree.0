From: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH][v3] dt-bindings: ifc: Update endianness usage
Date: Thu, 21 Dec 2017 08:09:41 +0000
Message-ID: <HE1PR04MB1241224F0F7DC884338F2D26970D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1512029196-7158-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <20171204204727.fnt4vsw2lg2q2w5x@rob-hp-laptop>
 <HE1PR04MB12413F48FF7E083FD8E0FD36973D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <HE1PR04MB12413F48FF7E083FD8E0FD36973D0-6LN7OEpIatU9TB6uw0n1oM9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:devicetree-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Prabhakar Kushwaha
> Sent: Tuesday, December 05, 2017 2:45 PM
> To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: RE: [PATCH][v3] dt-bindings: ifc: Update endianness usage
>=20
>=20
> > -----Original Message-----
> > From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> > Sent: Tuesday, December 05, 2017 2:17 AM
> > To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> > shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Subject: Re: [PATCH][v3] dt-bindings: ifc: Update endianness usage
> >
> > On Thu, Nov 30, 2017 at 01:36:36PM +0530, Prabhakar Kushwaha wrote:
> > > IFC controller version < 2.0 support IFC register access as
> > > big endian. These controller version also require IFC NOR signals to
> > > be connected in reverse order with NOR flash.
> > >
> > > IFC >=3D 2.0 is other way around.
> > >
> > > So updating IFC binding to take care of both using endianness field.
> > >
> > > Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> > > ---
> > > Changes for v2: updated subject
> > > Changes for v3: fixed typo for "big-endian"
> > >
> > >  Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6
> ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/memory-
> controllers/fsl/ifc.txt
> > b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> > > index 89427b0..824a2ca 100644
> > > --- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.tx=
t
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.tx=
t
> > > @@ -18,8 +18,10 @@ Properties:
> > >                interrupt (NAND_EVTER_STAT).  If there is only one,
> > >                that interrupt reports both types of event.
> > >
> > > -- little-endian : If this property is absent, the big-endian mode wi=
ll
> > > -                  be in use as default for registers.
> > > +- little-endian or big-endian : It represents how IFC registers to b=
e accessed.
> > > +			It also represents connection between controller and
> > > +			NOR flash. If this property is absent, the big-endian
> > > +			mode will be in use as default.
> >
> > My question on the prior version remains. I think if you need to handle
> > more than just register endianness, that should be done with the
> > compatible string.
> >
>=20
> I may not able to use compatible string as this information will also be =
used it
> drivers/mtd/maps/physmap_of_core.c other than drivers/memory/fsl_ifc.c.
> I am trying to avoid controller specific details in generic file.
>=20
> This is the reason endianness property is being used.
>=20

Please let me know if I am not able to address your review comment

--prabhakar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
