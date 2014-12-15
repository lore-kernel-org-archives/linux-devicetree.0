From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: dts: Add mediatek MT8173 SoC and evaluation
 board dts and Makefile
Date: Mon, 15 Dec 2014 11:28:48 +0000
Message-ID: <20141215112848.GE462@leverpostej>
References: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
 <1418208602-35584-4-git-send-email-eddie.huang@mediatek.com>
 <20141211180245.GE28150@leverpostej>
 <20141212065235.GK30369@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141212065235.GK30369-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 12, 2014 at 06:52:35AM +0000, Sascha Hauer wrote:
> On Thu, Dec 11, 2014 at 06:02:46PM +0000, Mark Rutland wrote:
> > Hi,
> > 
> > On Wed, Dec 10, 2014 at 10:50:01AM +0000, Eddie Huang wrote:
> > > Add device tree support for MT8173 SoC and evalutaion board based on it.
> > > 
> > > Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  arch/arm64/boot/dts/Makefile       |   1 +
> > >  arch/arm64/boot/dts/mt8173-evb.dts |  31 +++++++
> > >  arch/arm64/boot/dts/mt8173.dtsi    | 164 +++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 196 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/mt8173-evb.dts
> > >  create mode 100644 arch/arm64/boot/dts/mt8173.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> > > index f8001a6..db7661e 100644
> > > --- a/arch/arm64/boot/dts/Makefile
> > > +++ b/arch/arm64/boot/dts/Makefile
> > > @@ -1,3 +1,4 @@
> > > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
> > >  dtb-$(CONFIG_ARCH_THUNDER) += thunder-88xx.dtb
> > >  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
> > >  dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
> > > diff --git a/arch/arm64/boot/dts/mt8173-evb.dts b/arch/arm64/boot/dts/mt8173-evb.dts
> > > new file mode 100644
> > > index 0000000..adf26dd
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/mt8173-evb.dts
> > > @@ -0,0 +1,31 @@
> > > +/*
> > > + * Copyright (c) 2014 MediaTek Inc.
> > > + * Author: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License version 2 as
> > > + * published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "mt8173.dtsi"
> > > +
> > > +/ {
> > > +	model = "mediatek,mt8173-evb";
> > > +
> > > +	aliases {
> > > +		serial0 = &uart0;
> > > +		serial1 = &uart1;
> > > +		serial2 = &uart2;
> > > +		serial3 = &uart3;
> > 
> > Do any of these support earlycon?
> > 
> > > +	};
> > > +
> > > +	memory {
> > 
> > Nit: should be memory@40000000 (and you'll need to add device_type =
> > "memory").
> 
> skeleton.dtsi already has a /memory node with device_type = "memory".
> Shouldn't that be used?

To be honest I don't think that skeleton.dtsi is all that helpful.

Almost all dts files define the root #address-cells and #size-cells for
clarity anyway (which means the memory node isn't necessarily adequately
sized), and the memory node(s) should have unit-addresses (so they won't
match the memory node it provides).

Where a dts is written with the assumption that the bootloader will fill
things there should be a comment in the dts to that effect, with
adequately sized memory nodes.

The only potentially useful items are the empty /chosen and /aliases
nodes. Both of which don't seem to be strictly required.

If anything, I'd be tempted to get rid of skeleton.dtsi entirely.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
