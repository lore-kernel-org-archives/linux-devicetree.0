From: M P <buserror@gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: clock: renesas,r9a06g032-sysctrl: documentation
Date: Thu, 31 May 2018 11:16:53 +0100
Message-ID: <CAMMfpExt6Kogw6T5FVrD94QuuN6BBNCXdW0qfnnWr2bEMfqjpA@mail.gmail.com>
References: <1527154169-32380-1-git-send-email-michel.pollet@bp.renesas.com>
 <1527154169-32380-3-git-send-email-michel.pollet@bp.renesas.com> <CAMuHMdUb4fWFB9oP41ejO0_FDxmgBPL0GxQnkFv18Zfb5=1-fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUb4fWFB9oP41ejO0_FDxmgBPL0GxQnkFv18Zfb5=1-fw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: michel.pollet@bp.renesas.com, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, buserror+upstream@gmail.com, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, geert+renesas@glider.be, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Fri, 25 May 2018 at 10:23, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Michel,
>
> On Thu, May 24, 2018 at 11:28 AM, Michel Pollet
> <michel.pollet@bp.renesas.com> wrote:
> > The Renesas R9A06G032 SYSCTRL node description.
> >
> > Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
> > @@ -0,0 +1,32 @@
> > +* Renesas R9A06G032 SYSCTRL
> > +
> > +Required Properties:
> > +
> > +  - compatible: Must be:
> > +    - "renesas,r9a06g032-sysctrl"
> > +  - reg: Base address and length of the SYSCTRL IO block.
> > +  - #clock-cells: Must be 1
>
> No clocks/clock-names for the external clock inputs?
>
> "RZ/N1 has 3 clock sources, 1 reference clock inputs for RGMII, and 2
>  reference clock outputs for RMII/MII."
>
> Given the documentation explicitly mentions the module clocks are to be
> used for power-management, you may want to add #power-domain-cells as well,
> and let the driver register clock domain. But that can be added later
> (although it will break backwards compatibility with old DTBs).
>
> As PWRCTRL_* registers allow to reset individual modules, #reset-cells is
> another thing to add later.  It's good to start thinking early about how to
> reference resets, though.
> E.g. on other Renesas-SoCs, module resets uses the same numerical
> references as module clocks.

As you said, could we add all that later, as appropriate? Here I tried
to trim it
down to the the bare minimum -- my previous version of the driver had
separate reset  descriptors, but this one has been all compacted to do just
what it's supposed to do: clocks.

Or, so you want to add another DT index to refer to other reset indexes etc?
ie not use the of_clk_src_onecell_get provider? That COULD work and yes, the
indexes would stay the same, I'd just have to get the reset descriptor from the
clock object. We haven't had a use for individual resets so far.

> Gr{oetje,eeting}s,
>
>                         Geert

Cheers,
Michel
