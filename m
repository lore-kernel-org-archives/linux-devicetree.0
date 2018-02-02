From: Frank Li <frank.li-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] ARM: dts: imx6q-bx50v3: Enable secure-reg-access
Date: Fri, 2 Feb 2018 15:33:40 +0000
Message-ID: <HE1PR04MB2091FB16A11EE4A02940EB6088F90@HE1PR04MB2091.eurprd04.prod.outlook.com>
References: <20180115160722.17206-1-sebastian.reichel@collabora.co.uk>
 <20180202071819.GE25699@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180202071819.GE25699@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Friday, February 02, 2018 1:18 AM
> To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>; Frank Li <frank.li-3arQi8VN3Tc@public.gmane.org>;
> Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>; Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>; Rob
> Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH] ARM: dts: imx6q-bx50v3: Enable secure-reg-access
>=20
> + Frank
>=20
> On Mon, Jan 15, 2018 at 05:07:22PM +0100, Sebastian Reichel wrote:
> > From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >
> > Add secure-reg-access on device tree include file for Bx50 devices to
> > enable PMU and hardware counters for perf.
> >
> > Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6q-bx50v3.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > index 86cfd4481e72..ccaaee83e2fa 100644
> > --- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > +++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > @@ -43,6 +43,13 @@
> >  #include "imx6q-ba16.dtsi"
> >
> >  / {
> > +	soc {
> > +		pmu {
> > +			compatible =3D "arm,cortex-a9-pmu";
> > +			secure-reg-access;
>=20
> I'm not sure this could be a board level configuration.  Shouldn't this p=
roperty
> just be added into pmu node in imx6qdl.dtsi?

I agree. It should be in imx6qdl.dtsi

Frank Li

>=20
> Shawn
>=20
> > +		};
> > +	};
> > +
> >  	clocks {
> >  		mclk: clock@0 {
> >  			compatible =3D "fixed-clock";
> > --
> > 2.15.1
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
