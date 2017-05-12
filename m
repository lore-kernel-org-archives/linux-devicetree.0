From: Madalin-Cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/3] dts: arm64: add DPAA QBMan portals
Date: Fri, 12 May 2017 14:14:12 +0000
Message-ID: <AM5PR0402MB269109AD8E249CAD01C94BA1ECE20@AM5PR0402MB2691.eurprd04.prod.outlook.com>
References: <1490884672-18294-1-git-send-email-madalin.bucur@nxp.com>
 <1490884672-18294-2-git-send-email-madalin.bucur@nxp.com>
 <20170331014945.GH683@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170331014945.GH683@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gang Liu <gang.liu-3arQi8VN3Tc@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Friday, March 31, 2017 4:50 AM
> On Thu, Mar 30, 2017 at 05:37:50PM +0300, Madalin Bucur wrote:
> > Add the DPAA 1.x DPAA QMan and BMan portal nodes.
> >
> > Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
> > Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
>=20
> The patches should be prefixed like 'arm64: dts: ...'.
>=20
> > ---
> >  .../boot/dts/freescale/qoriq-bman1-portals.dtsi    | 67
> +++++++++++++++++++
> >  .../boot/dts/freescale/qoriq-qman1-portals.dtsi    | 76
> ++++++++++++++++++++++
> >  2 files changed, 143 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/qoriq-bman1-
> portals.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/qoriq-qman1-
> portals.dtsi
>=20
> What does the suffix number '1' mean here?

Will be removed, was used to differentiate between different revisions
on PPC, inherited from there.

> >
> > diff --git a/arch/arm64/boot/dts/freescale/qoriq-bman1-portals.dtsi
> b/arch/arm64/boot/dts/freescale/qoriq-bman1-portals.dtsi
> > new file mode 100644
> > index 0000000..b007344
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/qoriq-bman1-portals.dtsi
> > @@ -0,0 +1,67 @@
> > +/*
> > + * QorIQ BMan Portals device tree
> > + *
> > + * Copyright 2011-2016 Freescale Semiconductor Inc.
> > + *
> > + * SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> > + */
> > +
> > +&bportals {
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <1>;
> > +	compatible =3D "simple-bus";
> > +
> > +	bman-portal@0 {
> > +		compatible =3D "fsl,bman-portal";
>=20
> The bindings/soc/fsl/bman-portals.txt says: Must include
> "fsl,bman-portal-<hardware revision>".

This is satisfied by device tree fix-ups performed by the bootloader
adding the correct version. I'll introduce a comment about this here.

> > +		reg =3D <0x0 0x4000 0x4000000 0x4000>;
>=20
> Can we write it in the same way how the example in the bindings doc
> does?
>=20
> 	reg =3D <0x0 0x4000>, <0x4000000 0x4000>;
>=20
> It's more obvious to tell that it has two memory regions.

Will change that.
=20
> > +		interrupts =3D <0 173 0x4>;
>=20
> Can we use GIC_SPI and IRQ_TYPE_LEVEL_HIGH which are defined by
> headers in include/dt-bindings/interrupt-controller/ to make it more
> readable?

Yes, done.

> Shawn
<snip>

Thanks,
Madalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
