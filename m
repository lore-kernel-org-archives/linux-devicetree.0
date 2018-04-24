Return-Path: <SRS0=akpW=HN=verge.net.au=horms@kernel.org>
Date: Tue, 24 Apr 2018 10:36:34 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: Add Renesas R8A77990 SoC
 support
Message-ID: <20180424083633.ypkamflp3v6zlsz7@verge.net.au>
References: <1524227297-24955-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524227297-24955-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUx8CGoC=kMbAVUDO807g9BJ80w-TFdZ2vJZ9d0B6rbdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUx8CGoC=kMbAVUDO807g9BJ80w-TFdZ2vJZ9d0B6rbdA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 24, 2018 at 10:26:37AM +0200, Geert Uytterhoeven wrote:
> Hi Shimoda-san,
> 
> On Fri, Apr 20, 2018 at 2:28 PM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > This patch adds basic support for the Renesas R-Car E3 (R8A77990) SoC:
> >   - PSCI
> >   - CPU (single)
> >   - Cache controller
> >   - Main clocks and controller
> >   - Interrupt controller
> >   - Timer
> >   - PMU
> >   - Reset controller
> >   - Product register
> >   - System controller
> >   - UART for console
> >
> > Inspried by a patch by Takeshi Kihara in the BSP.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Thanks for you patch!

Thanks for your review.

As I've already applied this patch I'd like to ask Shimoda-san
to send incremental patches to address the issues you raise below.

> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -0,0 +1,127 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Device Tree Source for the r8a77990 SoC
> > + *
> > + * Copyright (C) 2018 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +       compatible = "renesas,r8a77990";
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +
> > +       cpus {
> 
> > +               L2_CA53: cache-controller@0 {
> > +                       compatible = "cache";
> > +                       reg = <0>;
> 
> Please no unit-addresses and reg properties for cache controllers.
> 
> > +                       power-domains = <&sysc 21>;
> > +                       cache-unified;
> > +                       cache-level = <2>;
> > +               };
> > +       };
> 
> > +       psci {
> > +               compatible = "arm,psci-0.2";
> 
> "arm,psci-1.0", "arm,psci-0.2"?
> 
> > +               method = "smc";
> > +       };
> > +
> > +       soc: soc {
> 
> > +               rst: reset-controller@e6160000 {
> > +                       compatible = "renesas,r8a77990-rst";
> > +                       reg = <0 0xe6160000 0 0x0200>;
> > +               };
> > +
> > +               sysc: system-controller@e6180000 {
> > +                       compatible = "renesas,r8a77990-sysc";
> > +                       reg = <0 0xe6180000 0 0x0400>;
> > +                       #power-domain-cells = <1>;
> > +               };
> > +
> > +               scif2: serial@e6e88000 {
> > +                       compatible = "renesas,scif-r8a77990",
> > +                                    "renesas,rcar-gen3-scif", "renesas,scif";
> > +                       reg = <0 0xe6e88000 0 64>;
> > +                       interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 310>;
> > +                       clock-names = "fck";
> 
> I assume you plan to add the other clocks later? That's fine for me.
> 
> > +                       power-domains = <&sysc 32>;
> > +                       resets = <&cpg 310>;
> > +                       status = "disabled";
> > +               };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
