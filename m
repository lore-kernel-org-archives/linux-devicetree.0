Return-Path: <SRS0=f8OU=J5=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180712030149.91385-1-chris.brandt@renesas.com>
 <20180712030149.91385-3-chris.brandt@renesas.com> <CAMuHMdXuXJdvtmEu3WYVSgwd0xfCpQcWQeL+FA9vUMxiA7h=VQ@mail.gmail.com>
 <TY1PR01MB15621B11047F645DE25485E68A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWRprU3jhFUnAzExFZYemqA7Hbvr-ritx0K662Rmy2ieQ@mail.gmail.com> <TY1PR01MB1562A3B909AFC6CEB7E5BD088A580@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562A3B909AFC6CEB7E5BD088A580@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jul 2018 14:13:43 +0200
Message-ID: <CAMuHMdWFNCjmMPPFRtQqpdb=AaXQtiuRxkgLgfPbSDvR_H5Qnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Fri, Jul 13, 2018 at 1:50 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, July 12, 2018, Geert Uytterhoeven wrote:
> > As the IP cores are the same in all variants, using
> > "renesas,r7s9210-<something>" should be fine for matching drivers to IP
> > cores. Same for CONFIG_ARCH_R7S9210.
> >
> > However, as the actual dies differ between H, M, and L versions, there may
> > be integration issues to be worked around. So I think it would be wise to
> > use one more digit in the compatible value at the main SoC level, i.e.
> > "renesas,r7s92104".
> > Unless there's a hardware register to detect the version at runtime.
> > But it seems RZ/A2 doesn't have a Product Register
> > (PRR), which most other SH/R-Mobile and R-Car SoCs do have?
>
> There is an ID register in RZ/A2 that will have a different number for
> each silicon.
> See the first entry in Table 5.6 (BSID register).
>
> Technically, it's not  "PRR" like it's SH/R-Car devices. It's actually
> the boundary scan ID number. All RZ/A1 devices have this too. But with
> RZ/A1, you could only get to this register through JTAG (not by the CPU).
> So for RZ/A2+, they will mirror that register to CPU space.

Cool. So if you add a "renesas,bsid" device node to the dtsi, and add
support for using that to drivers/soc/renesas/renesas-soc.c, then we can
use soc_device_match() to filter on SoC revision, if ever needed.

> So with that said, are we good with CONFIG_ARCH_R7S9210?

Yes, the Kconfig symbol is fine for sure.

Thansk!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
