Return-Path: <SRS0=xVPa=NE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181012122924.5543-1-chris.brandt@renesas.com> <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
In-Reply-To: <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Oct 2018 11:30:48 +0200
Message-ID: <CAMuHMdW5ep14ocQQLSRCk89yV-ut29YEr_59+pYvCMb7h-D=Tw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mmc: tmio_mmc: Add support for RZ/A2
Content-Type: text/plain; charset="UTF-8"
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk <linux-clk@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Ulf,

On Tue, Oct 23, 2018 at 5:02 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On 12 October 2018 at 14:29, Chris Brandt <chris.brandt@renesas.com> wrote:
> > Basically the same HW block that was used in R-Car Gen 3 is used in
> > RZ/A2 (with only a couple small differences).
> >
> > Not sure if you're going to like the Kconfig change or not.
> >
> > Chris Brandt (3):
> >   clk: renesas: r7s9210: Add SDHI clocks
> >   mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
> >   dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
> >
> >  Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  3 ++-
> >  drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
> >  drivers/mmc/host/Kconfig                           |  5 ++--
> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28 ++++++++++++++++++++--
> >  4 files changed, 36 insertions(+), 5 deletions(-)
> >
> > --
> > 2.16.1
>
> This looks good to me. So unless someone objects I intend to queue
> this up for 4.21, once 4.20 rc1 is out. Or perhaps the clock patch
> should go via the clock tree?

Correct. Please do not take the clock patch.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
