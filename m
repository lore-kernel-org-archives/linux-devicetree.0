From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: dts: imx6sl: remove the use of pingrp macros
Date: Tue, 28 Jan 2014 12:03:47 +0100
Message-ID: <20140128110347.GA16215@pengutronix.de>
References: <1390668191-20289-1-git-send-email-shawn.guo@linaro.org>
 <1390668191-20289-3-git-send-email-shawn.guo@linaro.org>
 <5923680.sl3G3EgCsY@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5923680.sl3G3EgCsY@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-15?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 28, 2014 at 11:17:22AM +0100, Heiko St=FCbner wrote:
> Hi Shawn,
>=20
> On Sunday, 26. January 2014 00:43:04 Shawn Guo wrote:
> > We created the pingrp macros in imx6sl-pingrp.h for purpose of less=
 LOC
> > when same pin group is used by multiple boards.  However, DT mainta=
iners
> > take it as an abuse of DTC macro support.  So let's get rid of it t=
o
> > make the pins used by given device more intuitive.
> >=20
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6sl-evk.dts  |  120 +++++++++++++++++++++++++=
+----
> >  arch/arm/boot/dts/imx6sl-pingrp.h |  148
> > ------------------------------------- arch/arm/boot/dts/imx6sl.dtsi=
     | =20
> >  1 -
> >  3 files changed, 107 insertions(+), 162 deletions(-)
> >  delete mode 100644 arch/arm/boot/dts/imx6sl-pingrp.h
> >=20
> > diff --git a/arch/arm/boot/dts/imx6sl-evk.dts
> > b/arch/arm/boot/dts/imx6sl-evk.dts index f5e4513..8594d13 100644
> > --- a/arch/arm/boot/dts/imx6sl-evk.dts
> > +++ b/arch/arm/boot/dts/imx6sl-evk.dts
> > @@ -86,55 +86,149 @@
> >  		};
> >=20
> >  		pinctrl_ecspi1: ecspi1grp {
> > -			fsl,pins =3D <MX6SL_ECSPI1_PINGRP1>;
> > +			fsl,pins =3D <
> > +				MX6SL_PAD_ECSPI1_MISO__ECSPI1_MISO	0x100b1
> > +				MX6SL_PAD_ECSPI1_MOSI__ECSPI1_MOSI	0x100b1
> > +				MX6SL_PAD_ECSPI1_SCLK__ECSPI1_SCLK	0x100b1
> > +			>;
> >  		};
> >=20
> >  		pinctrl_fec: fecgrp {
> > -			fsl,pins =3D <MX6SL_FEC_PINGRP1>;
> > +			fsl,pins =3D <
> > +				MX6SL_PAD_FEC_MDC__FEC_MDC		0x1b0b0
> > +				MX6SL_PAD_FEC_MDIO__FEC_MDIO		0x1b0b0
> > +				MX6SL_PAD_FEC_CRS_DV__FEC_RX_DV		0x1b0b0
> > +				MX6SL_PAD_FEC_RXD0__FEC_RX_DATA0	0x1b0b0
> > +				MX6SL_PAD_FEC_RXD1__FEC_RX_DATA1	0x1b0b0
> > +				MX6SL_PAD_FEC_TX_EN__FEC_TX_EN		0x1b0b0
> > +				MX6SL_PAD_FEC_TXD0__FEC_TX_DATA0	0x1b0b0
> > +				MX6SL_PAD_FEC_TXD1__FEC_TX_DATA1	0x1b0b0
> > +				MX6SL_PAD_FEC_REF_CLK__FEC_REF_OUT	0x4001b0a8
> > +			>;
> >  		};
>=20
> [... and so on for the other groups ... ]
>=20
> I'm confused now :-) . Current linux-next [0] shows the pin-settings =
as part=20
> of imx6sl.dtsi - a way a lot of other architectures organize their pi=
ngroups=20
> too, with the board file only referencing the relevant pingroups from=
 the=20
> predefined ones of the soc.

Current mainline has all groups under the iomux node which has the
effect that all possible groups are compiled into every dtb resulting i=
n
very bloated dtbs. So Shawn changed it to what's currently in next, but
this hasn't been accepted by the dt maintainers. Now this series tries
to address the concerns of the dt maintainers by not using macros that
expand to other macros.

Sascha

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
