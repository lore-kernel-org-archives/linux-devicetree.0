From: Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] arm64: dts: ls1088a: update the sata node
Date: Thu, 11 May 2017 07:57:20 +0000
Message-ID: <HE1PR0402MB28280A817B291C3F141097FEF3ED0@HE1PR0402MB2828.eurprd04.prod.outlook.com>
References: <1494213209-39673-1-git-send-email-andy.tang@nxp.com>
 <20170511073514.GE5833@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170511073514.GE5833@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Please see my reply inline.

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Thursday, May 11, 2017 3:35 PM
> To: Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
> Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> catalin.marinas-5wv7dgnIgG8@public.gmane.org; will.deacon-5wv7dgnIgG8@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH] arm64: dts: ls1088a: update the sata node
>=20
> On Mon, May 08, 2017 at 11:13:29AM +0800, Yuantian Tang wrote:
> > 1. Sata ecc should be disabled due to a erratum.
> > Provide the ecc register address for driver to use.
>=20
> This is a bit confusing.  Are you saying that the ECC register address is
> provided in DT for SATA driver to disable ECC function?
>=20
Yes, we have a ECC register to control all the IP's ecc status.
This ECC register doesn't belong to any IP block.

> > 2. Enable dma coherence operation
> >
> > Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > index 2946fd7..90edd76 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > @@ -265,10 +265,13 @@
> >
> >  		sata: sata@3200000 {
> >  			compatible =3D "fsl,ls1088a-ahci", "fsl,ls1043a-ahci";
> > -			reg =3D <0x0 0x3200000 0x0 0x10000>;
> > +			reg =3D <0x0 0x3200000 0x0 0x10000>,
> > +				<0x0 0x20140520 0x0 0x4>;
> > +			reg-names =3D "ahci", "sata-ecc";
> >  			interrupts =3D <0 133 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks =3D <&clockgen 4 3>;
> >  			status =3D "disabled";
> > +			dma-coherent;
>=20
> Please add it above 'status' line, which we generally keep at the bottom =
of
> property list.
>=20
OK, Will resend this patch.

Thanks,
Andy

> Shawn
>=20
> >  		};
> >  	};
> >
> > --
> > 2.1.0.27.g96db324
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
