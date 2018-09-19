Return-Path: <SRS0=EqeA=MB=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <72db4d8d-7b3d-7368-02a4-f652a7bc810d@cogentembedded.com>
 <CAMuHMdW3nfPNOPQR9mWN+tdtLRz8LwR797gzORG7RRiiiHYeHQ@mail.gmail.com>
 <eed804ea-35ae-5c8f-7575-070cdefe02ba@cogentembedded.com> <a14f6f87-0b55-4c2c-1cd0-27de68562213@cogentembedded.com>
In-Reply-To: <a14f6f87-0b55-4c2c-1cd0-27de68562213@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Sep 2018 09:48:53 +0200
Message-ID: <CAMuHMdUQkPK3=C5XJRVdBewbosTvZHSFBijUFd5JUVmKa_wNtQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: document R8A779{7|8}0 bindings
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 14, 2018 at 10:17 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 09/11/2018 09:26 PM, Sergei Shtylyov wrote:
>
> >>> Document the R-Car V3{M|H} (R8A779{7|8}0) SoC in the Renesas TMU bindings;
> >>> the TMU hardware in those is the Renesas standard 3-channel timer unit.
> >>>
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> Thanks for your patch!
> >>
> >> Not all channels seem to be identical, but the driver just matches against
> >> the "renesas,tmu" fallback?
> >
> >    The only difference between TMUs is the input capture capability on the 3rd
> > channel in each TMU -- that includes TCPR register and extra interrupt output
>
>    Not only that, the TMUs having the input capture also can use external clock
> as they have the TCLK<n> signal.
>
> > TICPI<n> (perhaps has to do with 4th TMU IRQ?).
>
>    They don't, most probably.
>
> > The driver is blissfully unaware
> > of this extra capability. :-)
>
>    Perhaps we should describe a "renesas,tmu-ext-clk" for the TMUs having an external
> clock? Will this make you happy?
>
> >> In addition, the V3H TMU seems to differ from the TMU in other R-Car Gen3
> >> variants?
> >
> >    Yes, but they only differ in the number of channels capable of input capture.
>
>    ... and having external clock.
>
> >> How is this handled?
> >
> >    Nohow. And I'm not sure we should care about this difference...
>
>    At this point, the driver only uses internal clock... we can document the external
> clock for the compatible value I've just suggested... Will that make you happy? :-)

OK, we can add the external clocks to differentiate later, when the driver can
handle them.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
