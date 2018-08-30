Return-Path: <SRS0=CDzY=LN=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <20180829132954.64862-2-chris.brandt@renesas.com> <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
 <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org>
In-Reply-To: <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 09:54:46 +0200
Message-ID: <CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Content-Type: text/plain; charset="UTF-8"
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Daniel,

On Wed, Aug 29, 2018 at 6:26 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 29/08/2018 17:44, Chris Brandt wrote:
> > On Wednesday, August 29, 2018 1, Daniel Lezcano wrote:
> >> Can the boot constraints [1] solve this issue instead of the changes you
> >> are proposing ?
> >>
> >> [1] https://lwn.net/Articles/747250/
> >
> > Thanks for the suggestion, but...
> >
> > I grepped for "boot_constraint" and it shows up nowhere in the current
> > kernel.
> >
> > Also, this article was written Feb 16, 2018, and I can see that the
> > patch series was still being submitted (V7) as of Feb 23, 2018.
>
> Ah ok, fair enough, I thought it was merged. In any case, after thinking
> about it, it wouldn't have helped.
>
> My concern is if we can avoid changing the TIMER_OF_DECLARE because of
> the boot order, it would be better.
>
> Can returning EPROBE_DEFER fix this issue? Or use the 'complex
> dependencies' [1]?

*_OF_DECLARE() is not compatible with EPROBE_DEFER, which causes
issues with complex dependencies.
That's exactly why many subsystems are moving away from it.
E.g. IOMMU_OF_DECLARE was removed in v4.19-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
