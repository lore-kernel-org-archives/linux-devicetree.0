From: Ioana Ciornei <ioana.ciornei-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] arm64: dts: ls1088a: add fsl-mc hardware resource manager
 node
Date: Thu, 16 Nov 2017 14:24:49 +0000
Message-ID: <DB6PR0401MB2264A182C4048471B53BFF89E02E0@DB6PR0401MB2264.eurprd04.prod.outlook.com>
References: <1510147805-24873-1-git-send-email-ioana.ciornei@nxp.com>
 <20171116083920.GK25384@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116083920.GK25384@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

See comments inline.

>=20
> On Wed, Nov 08, 2017 at 03:30:05PM +0200, Ioana Ciornei wrote:
> > Add the fsl-mc node in the LS1088A device tree.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 62
> ++++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > index bd80e9a..aa37ffe 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > @@ -166,6 +166,68 @@
> >  			     <1 10 IRQ_TYPE_LEVEL_LOW>;/* Hypervisor PPI */
> >  	};
> >
> > +	fsl_mc: fsl-mc@80c000000 {
>=20
> The unit-address of the node should be somehow related to 'reg'
> property.  Can you please help me understand how they are related?

The unit-address of the fsl-mc node is the base address of the MC portal de=
scribed in the first region of the 'reg' property and formed using the 2 ad=
dress cells.
Hope this helps.
=20
>=20
> > +		compatible =3D "fsl,qoriq-mc";
> > +		reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
> > +		      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
> > +		msi-parent =3D <&its>;
> > +		#address-cells =3D <3>;
> > +		#size-cells =3D <1>;
> > +
> > +		/*
> > +		 * Region type 0x0 - MC portals
> > +		 * Region type 0x1 - QBMAN portals
> > +		 */
> > +		ranges =3D <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
> > +			  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
> > +
> > +		dpmacs {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			dpmac1: dpmac@1 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <1>;
> > +			};
>=20
> Please have a newline in between nodes.

Will do.=20

Should I send a rework of this patch right away or better to wait for the m=
erge window to close?

Ioana=20

>=20
> Shawn
>=20
> > +			dpmac2: dpmac@2 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <2>;
> > +			};
> > +			dpmac3: dpmac@3 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <3>;
> > +			};
> > +			dpmac4: dpmac@4 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <4>;
> > +			};
> > +			dpmac5: dpmac@5 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <5>;
> > +			};
> > +			dpmac6: dpmac@6 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <6>;
> > +			};
> > +			dpmac7: dpmac@7 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <7>;
> > +			};
> > +			dpmac8: dpmac@8 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <8>;
> > +			};
> > +			dpmac9: dpmac@9 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <9>;
> > +			};
> > +			dpmac10: dpmac@10 {
> > +				compatible =3D "fsl,qoriq-mc-dpmac";
> > +				reg =3D <0xa>;
> > +			};
> > +		};
> > +	};
> > +
> >  	psci {
> >  		compatible =3D "arm,psci-0.2";
> >  		method =3D "smc";
> > --
> > 1.9.1
> >
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
