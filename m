Return-Path: <SRS0=QNtu=LT=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180829132841.64787-1-chris.brandt@renesas.com>
 <TY1PR01MB1562F79382CA2AA33AA661EB8A020@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdVZbaGxwuL6aJfv0Nsoxyrj_M7nL0X1Oo6_KoDYJTwi-w@mail.gmail.com> <TYXPR01MB1568DD90490B28E46E949D658A020@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568DD90490B28E46E949D658A020@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Sep 2018 17:07:06 +0200
Message-ID: <CAMuHMdUojvTWiGhULtp=tgTz56S2MAuYnT1p-JQWBn3PUag8jg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Sep 5, 2018 at 5:02 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, September 05, 2018 1, Geert Uytterhoeven wrote:
> > > So, I think I need to rework this driver to add the ability to add
> > > multiple address regions.
> >
> > Your main driver for this block (clock?) can register the watchdog.
> > Either directly with the watchdog subsystem, or by registering an
> > "rza_wdt" platform device.
>
> It would seem strange that the clock driver would register the watchdog
> timer for no other reason other than where the chip designer happen to
> put the register addresses.

That not that uncommon for "syscon" drivers...

> Now that I look at it:
>  CPG is at FCFE_0010 - FCFE_0104
> MSTP is at FCFE_0400 - FCFE_0464
>
> Nothing sits in between CPG and MSTP.

OK.

> In the hardware manual, there is other 'random other stuff' that they
> put in that chapter that is located in multiple address places, but that
> doesn't mean I have to map them all in this driver.

OK.

> I simply changed the DTS to just map CPG and MSTP and now everything is
> fine. My watchdog driver is happy and this CPG/MSTP driver works the
> same.

Good, I will resume review of the patch in $subject ;-)

> So....I guess I didn't really have an issue after all.

You do want to:
  1. Document the two register ranges in the DT bindings,
  2. Update the driver to map both ranges on RZ/A2.
Right now it works by luck, as ioremap()'s granularity is PAGE_SIZE.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
