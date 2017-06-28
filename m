From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3 v6] ARC: hsdk: initial port for HSDK board
Date: Wed, 28 Jun 2017 17:50:05 -0500
Message-ID: <20170628225005.5ume54d67vtvp5fi@rob-hp-laptop>
References: <20170626151118.19507-1-Eugeniy.Paltsev@synopsys.com>
 <20170626151118.19507-4-Eugeniy.Paltsev@synopsys.com>
 <CAL_JsqJBPL+AuYNP=JgXWOGNFxdenKY4Rt3_f6tG6MYDLncRNg@mail.gmail.com>
 <1498494334.28955.58.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498494334.28955.58.camel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 26, 2017 at 04:25:35PM +0000, Alexey Brodkin wrote:
> Hi Rob,
> 
> On Mon, 2017-06-26 at 10:51 -0500, Rob Herring wrote:
> > On Mon, Jun 26, 2017 at 10:11 AM, Eugeniy Paltsev
> > <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
> > > 
> > > From: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> > > 
> 
> [snip]
> 
> > > +
> > > +       chosen {
> > > +               bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
> > 
> > Use stdout-path for the console. Really, the bootargs should be blank
> > and populated by the bootloader especially debug options.
> 
> Agree but in case of devboards we quite often disable bootloader and
> load Linux image in memory via JTAG. So in that case bootargs make perfect sense IMHO. 

Okay if you want to leave debug options, but regardless you should use 
stdout-path instead.

[...]

> > > +                       #clock-cells = <0>;
> > > +                       compatible = "fixed-clock";
> > > +                       clock-frequency = <1000000000>;
> > > +               };
> > > +
> > > +               core_intc: archs-intc@cpu {
> > 
> > cpu is not a valid unit-address. How are these interrupt controllers addressed?
> 
> We have per-core INTC so each core communicates to its own INTC and there's no way
> for any core to talk with INTC of another core.
> 
> But then we have the next level INTC which is IDU (Interrupt Distribution Unit)
> which dispatches "common" IRQs to different upstream per-core INTC, see below its node. 

Okay, I'd just do "cpu-interrupt-controller" for the node name then. 
There doesn't seem to be an easy way to use just "interrupt-controller" 
since you have 2 nodes at the same level and no unit-address (i.e. a 
reg property).

[...]

> > > +               ohci@60000 {
> > > +                       compatible = "generic-ohci";
> > 
> > This should have an SoC specific compatible.
> 
> But why? We don't have any SoC-specific extensions.
> This essentially applies to EHCI as well.

Because they are all broken in unique ways across different 
implementations and SoC integrations. Even IP licensed from the same 
vendor has differences.

> > > +++ b/arch/arc/kernel/devtree.c
> > > @@ -29,8 +29,9 @@ static void __init arc_set_early_base_baud(unsigned long dt_root)
> > >  {
> > >         if (of_flat_dt_is_compatible(dt_root, "abilis,arc-tb10x"))
> > >                 arc_base_baud = 166666666;      /* Fixed 166.6MHz clk (TB10x) */
> > > -       else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp"))
> > > -               arc_base_baud = 33333333;       /* Fixed 33MHz clk (AXS10x) */
> > > +       else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp") ||
> > > +                of_flat_dt_is_compatible(dt_root, "snps,hsdk"))
> > > +               arc_base_baud = 33333333;       /* Fixed 33MHz clk (AXS10x & HSDK) */
> > 
> > You should get this info from DT. You don't need to address that now though.
> 
> For normal UART we indeed don't need that. But this is really required for early
> console otherwise how may we start outputting stuff even before we have .dtb
> unflattened.

earlycon gets the register address from the flattened tree. You could 
get the clock frequency too using the "clock-frequency" property.

> 
> The only thing I may think of early platform code that extracts this value from .dtb
> image but:
>  1) I'm not sure it is more elegant
>  2) Still it will be a bit too late - now we start printing very-very early.

You are running C code here and reading the FDT, it's not that early.

For 5 boards, what you have works fine. When you have 10? 100? 1000? Not 
so much.

> 
> > > 
> > >         else if (of_flat_dt_is_compatible(dt_root, "ezchip,arc-nps"))
> > >                 arc_base_baud = 800000000;      /* Fixed 800MHz clk (NPS) */
> > >         else
> > > diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
> > > new file mode 100644
> > > index 0000000..29dffed
> > > --- /dev/null
> > > +++ b/arch/arc/plat-hsdk/Kconfig
> > > @@ -0,0 +1,12 @@
> > > +#
> > > +# Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
> > > +#
> > > +# This program is free software; you can redistribute it and/or modify
> > > +# it under the terms of the GNU General Public License version 2 as
> > > +# published by the Free Software Foundation.
> > > +#
> > > +
> > > +menuconfig ARC_PLAT_HSDK
> > > +       bool "ARC HS Development Kit board"
> > 
> > Per board config options don't scale and shouldn't be necessary with DT...
> 
> Not sure if I understand that completely.
> Could you please explain in a bit more details?

The point of DT is to remove board specifics (and SoC specifics to some 
extent) from the kernel. Having board kconfig options is adding board 
specifics. This doesn't scale when you have hundreds of or a thousand 
boards (as the ARM world does).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
