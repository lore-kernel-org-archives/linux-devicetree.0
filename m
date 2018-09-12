Return-Path: <SRS0=J1Gy=L2=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <72db4d8d-7b3d-7368-02a4-f652a7bc810d@cogentembedded.com>
 <CAMuHMdW3nfPNOPQR9mWN+tdtLRz8LwR797gzORG7RRiiiHYeHQ@mail.gmail.com>
 <eed804ea-35ae-5c8f-7575-070cdefe02ba@cogentembedded.com> <20180912093728.bhu7cz2warhcvej7@verge.net.au>
In-Reply-To: <20180912093728.bhu7cz2warhcvej7@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Sep 2018 14:23:47 +0200
Message-ID: <CAMuHMdW89Y7XzCGW4Ke+Fj=vdRaqOO6LUbf_fmT3Sd9DFv7huA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: document R8A779{7|8}0 bindings
Content-Type: text/plain; charset="UTF-8"
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Wed, Sep 12, 2018 at 11:37 AM Simon Horman <horms@verge.net.au> wrote:
> On Tue, Sep 11, 2018 at 09:26:27PM +0300, Sergei Shtylyov wrote:
> > On 09/10/2018 05:24 PM, Geert Uytterhoeven wrote:
> > >> Document the R-Car V3{M|H} (R8A779{7|8}0) SoC in the Renesas TMU bindings;
> > >> the TMU hardware in those is the Renesas standard 3-channel timer unit.
> > >>
> > >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > >
> > > Thanks for your patch!
> > >
> > > Not all channels seem to be identical, but the driver just matches against
> > > the "renesas,tmu" fallback?
> >
> >    The only difference between TMUs is the input capture capability on the 3rd
> > channel in each TMU -- that includes TCPR register and extra interrupt output
> > TICPI<n> (perhaps has to do with 4th TMU IRQ?). The driver is blissfully unaware
> > of this extra capability. :-)
> >
> > > In addition, the V3H TMU seems to differ from the TMU in other R-Car Gen3
> > > variants?
> >
> >    Yes, but they only differ in the number of channels capable of input capture.
> >
> > > How is this handled?
> >
> >    Nohow. And I'm not sure we should care about this difference...
>
> It seems to me that the driver has the option of caring about the
> difference, by matching on the soc-specific compat string, in future,
> should it be so desired.
>
> So this patch seems find to me.
>
> Geert, am I missing something? Do you still have concerns?

Matching on the SoC-specific compat strings is not sufficient, as the actual
TMU instances in the same SoC are not identical.

Please check Section 80.1.1 "Features".

The differences are in the number of clock inputs. As these are not the plain
clocks, but core clocks + a postdivider, perhaps this can be handled by using
clock-names like "div4", "div16", "div64" etc.?
I haven't checked the relation to register bits yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
