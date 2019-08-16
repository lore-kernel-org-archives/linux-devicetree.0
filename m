From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] ARM64: dts: allwinner: Add devicetree for pine H64
 modelA evaluation board
Date: Fri, 16 Aug 2019 13:36:50 +0200
Message-ID: <20190816113650.hstbi5ntstx3wh4a@flea>
References: <20190808084253.10573-1-clabbe.montjoie@gmail.com>
 <20190812094000.ebdmhyxx7xzbevef@flea>
 <20190814131741.GB24324@Red>
 <20190814133322.dawzv3ityakxtqs4@flea>
 <20190816093513.GA25042@Red>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qzjcq6rd7xgmbg4h"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816093513.GA25042@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--qzjcq6rd7xgmbg4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2019 at 11:35:13AM +0200, Corentin Labbe wrote:
> On Wed, Aug 14, 2019 at 03:33:22PM +0200, Maxime Ripard wrote:
> > On Wed, Aug 14, 2019 at 03:17:41PM +0200, Corentin Labbe wrote:
> > > On Mon, Aug 12, 2019 at 11:40:00AM +0200, Maxime Ripard wrote:
> > > > On Thu, Aug 08, 2019 at 10:42:53AM +0200, Corentin Labbe wrote:
> > > > > This patch adds the evaluation variant of the model A of the PineH64.
> > > > > The model A has the same size of the pine64 and has a PCIE slot.
> > > > >
> > > > > The only devicetree difference with current pineH64, is the PHY
> > > > > regulator.
> > > > >
> > > > > Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
> > > > >  .../sun50i-h6-pine-h64-modelA-eval.dts        | 26 +++++++++++++++++++
> > > > >  2 files changed, 27 insertions(+)
> > > > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > > > > index f6db0611cb85..9a02166cbf72 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > > @@ -25,3 +25,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-3.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
> > > > > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-modelA-eval.dtb
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
> > > > > new file mode 100644
> > > > > index 000000000000..d8ff02747efe
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
> > > > > @@ -0,0 +1,26 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > > > > +/*
> > > > > + * Copyright (C) 2019 Corentin Labbe <clabbe.montjoie@gmail.com>
> > > > > + */
> > > > > +
> > > > > +#include "sun50i-h6-pine-h64.dts"
> > > > > +
> > > > > +/ {
> > > > > +	model = "Pine H64 model A evaluation board";
> > > > > +	compatible = "pine64,pine-h64-modelA-eval", "allwinner,sun50i-h6";
> > > > > +
> > > > > +	reg_gmac_3v3: gmac-3v3 {
> > > > > +		compatible = "regulator-fixed";
> > > > > +		regulator-name = "vcc-gmac-3v3";
> > > > > +		regulator-min-microvolt = <3300000>;
> > > > > +		regulator-max-microvolt = <3300000>;
> > > > > +		startup-delay-us = <100000>;
> > > > > +		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>;
> > > > > +		enable-active-high;
> > > > > +	};
> > > > > +
> > > > > +};
> > > > > +
> > > > > +&emac {
> > > > > +	phy-supply = <&reg_gmac_3v3>;
> > > > > +};
> > > >
> > > > I might be missing some context here, but I'm pretty sure that the
> > > > initial intent of the pine h64 DTS was to support the model A all
> > > > along.
> > > >
> > >
> > > The regulator changed between modelA and B.
> > > See this old patchset (supporting modelA) https://patchwork.kernel.org/patch/10539149/ for example.
> >
> > I'm not sure what your point is, but mine is that everything about the
> > model A should be in sun50i-h6-pine-h64.dts.
> >
>
> model A and B are different enough for distinct dtb, (see sub-thread
> on HDMI difference for an other difference than PHY regulator)

I don't mind having separate DTBs for model A and model B.

> And clearly, the current dtb is for model B.

That DTS was added almost a year before the model B was announced, and
no commit to that file mention the model B, so it's definitely not
clear.

> So do you mean that we need to create a new dtb for model B ? (and
> hack the current back to model A ?)

I'd prefer not to hack anything, but yes

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qzjcq6rd7xgmbg4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVaVUgAKCRDj7w1vZxhR
xQYxAP9kR+PnYnOwBKFxW4HwUV9pEEcT1+VA/ujbIaOvnwPfOwEAphQg1tuO5yP2
DI52+L4m40IPmBjnFMXOdMsrCVezBgk=
=R7nF
-----END PGP SIGNATURE-----

--qzjcq6rd7xgmbg4h--
