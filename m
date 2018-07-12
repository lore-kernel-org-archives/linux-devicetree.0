Return-Path: <SRS0=F8cI=J4=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180712030149.91385-1-chris.brandt@renesas.com>
 <20180712030149.91385-3-chris.brandt@renesas.com> <CAMuHMdXuXJdvtmEu3WYVSgwd0xfCpQcWQeL+FA9vUMxiA7h=VQ@mail.gmail.com>
 <TY1PR01MB15621B11047F645DE25485E68A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15621B11047F645DE25485E68A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jul 2018 15:35:49 +0200
Message-ID: <CAMuHMdWRprU3jhFUnAzExFZYemqA7Hbvr-ritx0K662Rmy2ieQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Jul 12, 2018 at 3:15 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, July 12, 2018, Geert Uytterhoeven wrote:
> > > +  - RZ/A2 (R7S9210)
> > > +    compatible = "renesas,r7s9210"
> >
> > There seems to be a difference between the r7s92104x and the r7s92105x
> > parts (with "x" just denoting a different packaging)?
> > Do we need one more digit?
>
> From an "architecture" standpoint all the hardware in the RZ/A2
> (R7S9210xx series) will be the same. So from a device driver standpoint,
> CONFIG_ARCH_R7S9210 would cover everything.
>
> The rest of the numbers are just for package and number of HW channels.
>
> Of course, sometimes when they make smaller packages, they also make
> smaller silicon to make it cheaper. But in that case, they just simply
> remove HW or the number of channels for the hardware. (you don't need as
> many peripherals if you don't have as many pins anymore). But, they never
> change the functionality of the hardware.
>
> Take for example RZ/A1
>  RZ/A1H  R7S72100x
>  RZ/A1M  R7S72101x
>  RZ/A1L  R7S72102x
>  RZ/A1LU R7S72103x
>
> These parts all had the same hardware, but different package options And
> the "L" parts were cheaper because they reduced the die size by
> removing HW.
> But the same drivers worked on all of them because the IP was all
> exactly the same.
> So I would have suggested CONFIG_ARCH_R7S7210 for the RZ/A1 series.
> (well, until I found about the R-Car part that took the same part number in
> this series)

That's the issue with using wildcards, or truncating part numbers: you
don't know what unrelated future parts may match...

> As for the r7s92104x vs r7s92105x, that is for a HW feature that will
> have nothing to do with Linux, so we can ignore that number.

OK.

> But even if we did make a tiny cut-down version of the device, say a
> R7S92106x, all HW IP would be the same, just less of it. So in my mind, the
> architecture (from a CONFIG_ARCH perspective) is still the same. Maybe
> just a different .dtsi.
>
> What do you think?

As the IP cores are the same in all variants, using
"renesas,r7s9210-<something>" should be fine for matching drivers to IP
cores. Same for CONFIG_ARCH_R7S9210.

However, as the actual dies differ between H, M, and L versions, there may
be integration issues to be worked around. So I think it would be wise to
use one more digit in the compatible value at the main SoC level, i.e.
"renesas,r7s92104".
Unless there's a hardware register to detect the version at runtime.
But it seems RZ/A2 doesn't have a Product Register
(PRR), which most other SH/R-Mobile and R-Car SoCs do have?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
