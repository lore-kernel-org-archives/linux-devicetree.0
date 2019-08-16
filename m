From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: allwinner: Add devicetree for
 pine H64 modelA evaluation board
Date: Fri, 16 Aug 2019 11:35:13 +0200
Message-ID: <20190816093513.GA25042@Red>
References: <20190808084253.10573-1-clabbe.montjoie@gmail.com>
 <20190812094000.ebdmhyxx7xzbevef@flea>
 <20190814131741.GB24324@Red>
 <20190814133322.dawzv3ityakxtqs4@flea>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7YLCN32UNBBVPR3HVAKGQES2ZXKQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190814133322.dawzv3ityakxtqs4@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 03:33:22PM +0200, Maxime Ripard wrote:
> On Wed, Aug 14, 2019 at 03:17:41PM +0200, Corentin Labbe wrote:
> > On Mon, Aug 12, 2019 at 11:40:00AM +0200, Maxime Ripard wrote:
> > > On Thu, Aug 08, 2019 at 10:42:53AM +0200, Corentin Labbe wrote:
> > > > This patch adds the evaluation variant of the model A of the PineH64.
> > > > The model A has the same size of the pine64 and has a PCIE slot.
> > > >
> > > > The only devicetree difference with current pineH64, is the PHY
> > > > regulator.
> > > >
> > > > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
> > > >  .../sun50i-h6-pine-h64-modelA-eval.dts        | 26 +++++++++++++++++++
> > > >  2 files changed, 27 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > > > index f6db0611cb85..9a02166cbf72 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > @@ -25,3 +25,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-3.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
> > > > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-modelA-eval.dtb
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
> > > > new file mode 100644
> > > > index 000000000000..d8ff02747efe
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-modelA-eval.dts
> > > > @@ -0,0 +1,26 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > > > +/*
> > > > + * Copyright (C) 2019 Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > + */
> > > > +
> > > > +#include "sun50i-h6-pine-h64.dts"
> > > > +
> > > > +/ {
> > > > +	model = "Pine H64 model A evaluation board";
> > > > +	compatible = "pine64,pine-h64-modelA-eval", "allwinner,sun50i-h6";
> > > > +
> > > > +	reg_gmac_3v3: gmac-3v3 {
> > > > +		compatible = "regulator-fixed";
> > > > +		regulator-name = "vcc-gmac-3v3";
> > > > +		regulator-min-microvolt = <3300000>;
> > > > +		regulator-max-microvolt = <3300000>;
> > > > +		startup-delay-us = <100000>;
> > > > +		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>;
> > > > +		enable-active-high;
> > > > +	};
> > > > +
> > > > +};
> > > > +
> > > > +&emac {
> > > > +	phy-supply = <&reg_gmac_3v3>;
> > > > +};
> > >
> > > I might be missing some context here, but I'm pretty sure that the
> > > initial intent of the pine h64 DTS was to support the model A all
> > > along.
> > >
> >
> > The regulator changed between modelA and B.
> > See this old patchset (supporting modelA) https://patchwork.kernel.org/patch/10539149/ for example.
> 
> I'm not sure what your point is, but mine is that everything about the
> model A should be in sun50i-h6-pine-h64.dts.
> 

model A and B are different enough for distinct dtb, (see sub-thread on HDMI difference for an other difference than PHY regulator)
And clearly, the current dtb is for model B.

So do you mean that we need to create a new dtb for model B ? (and hack the current back to model A ?)

Regards
