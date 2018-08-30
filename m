MIME-Version: 1.0
Date: Thu, 30 Aug 2018 08:48:54 -0500
References: <20180827162139.76196-1-chris.brandt@renesas.com>
	<20180829005228.GA5407@bogus>
	<CAMuHMdWcvWDeSpewRDG=vAV+zsTO48a6kXTCL+34H_+Rnt0ung@mail.gmail.com>
In-Reply-To: <CAMuHMdWcvWDeSpewRDG=vAV+zsTO48a6kXTCL+34H_+Rnt0ung@mail.gmail.com>
Message-ID: <CAL_JsqLF76sX=uhvBDOGTHRgZoqXWyUrnPGNmL6heUJmQBF8dA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add R7S9210 support
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 30, 2018 at 3:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Wed, Aug 29, 2018 at 2:52 AM Rob Herring <robh@kernel.org> wrote:
> > On Mon, Aug 27, 2018 at 11:21:39AM -0500, Chris Brandt wrote:
> > > Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> > > Standby.
> > >
> > > The Module Standby HW in the RZ/A series is very close to R-Car HW, except
> > > for how the registers are laid out.
> > > The MSTP registers are only 8-bits wide, there is no status registers
> > > (MSTPST), and the register offsets are a little different. Since the RZ/A
> > > hardware manuals refer to these registers as the Standby Control Registers,
> > > we'll use that name to distinguish the RZ/A type for the R-Car type.
> > >
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > > ---
> >
> > > +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> > > @@ -0,0 +1,192 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> >
> >
> > > +++ b/include/dt-bindings/clock/r7s9210-cpg-mssr.h
> > > @@ -0,0 +1,21 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+
> >
> > The proper identifier is GPL-2.0-or-later
>
> Documentation/process/license-rules.rst disagrees.

Indeed, but: https://spdx.org/licenses/GPL-2.0+.html

I think this changed about the time the kernel adopted SPDX. I guess
it is fine as-is until we change the documentation.

Rob
