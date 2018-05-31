From: M P <buserror@gmail.com>
Subject: Re: [PATCH v7 1/5] dt-bindings: Add the r9a06g032-sysctrl.h file
Date: Thu, 31 May 2018 11:01:09 +0100
Message-ID: <CAMMfpEwnB26q+JzEfwby409XkUPWpNZAD8FhRWJfjW=0naY+pg@mail.gmail.com>
References: <1527154169-32380-1-git-send-email-michel.pollet@bp.renesas.com>
 <1527154169-32380-2-git-send-email-michel.pollet@bp.renesas.com>
 <CAMuHMdVzN0Cbc9+MJqC4EzVgD3bkDixkf10NA13ko87cMwvpLA@mail.gmail.com>
 <CAMMfpEwpiZnZEykzxQJMTwE+cDnOD_qA3nUzyB96DGTWPzSJrw@mail.gmail.com> <CAMuHMdXQWSVh37HqrvFWeLNHZ5zNh0=9+hV0_nsQ9mi1HQSCaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXQWSVh37HqrvFWeLNHZ5zNh0=9+hV0_nsQ9mi1HQSCaQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: michel.pollet@bp.renesas.com, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, buserror+upstream@gmail.com, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, geert+renesas@glider.be, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Thu, 31 May 2018 at 10:32, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Michel,
>
> On Thu, May 31, 2018 at 11:11 AM, M P <buserror@gmail.com> wrote:
> > On Fri, 25 May 2018 at 11:31, Geert Uytterhoeven <geert@linux-m68k.org>
> > wrote:
> >> On Thu, May 24, 2018 at 11:28 AM, Michel Pollet
> >> <michel.pollet@bp.renesas.com> wrote:
> >> > This adds the constants necessary to use the renesas,r9a06g032-sysct=
rl
> > node.
>
> >> > @@ -0,0 +1,187 @@
> >> > +/* SPDX-License-Identifier: GPL-2.0 */
> >> > +/*
> >> > + * R9A06G032 sysctrl IDs
> >> > + *
> >> > + * Copyright (C) 2018 Renesas Electronics Europe Limited
> >> > + *
> >> > + * Michel Pollet <michel.pollet@bp.renesas.com>, <buserror@gmail.co=
m>
> >> > + * Derived from zx-reboot.c
> >> > + */
> >> > +
> >> > +#ifndef __DT_BINDINGS_R9A06G032_SYSCTRL_H__
> >> > +#define __DT_BINDINGS_R9A06G032_SYSCTRL_H__
> >> > +
> >> > +#define R9A06G032_CLKOUT                       0
> >> > +#define R9A06G032_CLK_PLL_USB                  1
> >> > +#define R9A06G032_CLK_48                       1 /* AKA CLK_PLL_USB=
 */
> >> > +#define R9A06G032_CLKOUT_D10                   2
> >> > +#define R9A06G032_CLKOUT_D16                   3
> >> > +#define R9A06G032_MSEBIS_CLK                   3 /* AKA CLKOUT_D16 =
*/
> >> > +#define R9A06G032_MSEBIM_CLK                   3 /* AKA CLKOUT_D16 =
*/
> >> > +#define R9A06G032_CLKOUT_D160                  4
> >> > +#define R9A06G032_CLKOUT_D1OR2                 5
> >> > +#define R9A06G032_CLK_DDRPHY_PLLCLK            5 /* AKA CLKOUT_D1OR=
2 */
> >
> >> [...]
> >
> >> I have 3 comments:
> >
> >>    1. I had expected this list to match (both name- and order-wise)
> > Appendix
> >>       C ("Clock Tree Structure") in the RZ/N1[DSL] User=E2=80=99s Manu=
al: System
> >>       Introduction, Multiplexing, Electrical and Mechanical Informatio=
n.
> >>       That would make it easier to review.
> >
> > Well, that document was made a *long* time after the internal documenta=
tion
> > we used to generate the clock lists. There are a few things we had to d=
o:
> >
> > * Renumber peripherals. We decided a long time ago that u-boot and linu=
x
> > would stick to zero based peripherals, and not one based numbers. It's =
next
> > to impossible to keep mixing number based across software base, so we u=
se
> > UART0 while the hardware manual mentions UART1 -- It *is* documented
> > extensively with out SDK, and makes life using linux a lot easier. It's
> > across all our SDK, u-boot, webapps readmes, howtos etc.
> >
> > * Rename some peripherals. Plenty of peripherals names made little sens=
e
> > and had zero consistency, in fact, many names were different depending =
on
> > the place they were used! -- "flashnand"+"nand_flash"+"FNAND" etc,
> > "QUADSPI"+"QSPI" etc etc so we also re-normalized the names to match li=
nux
> > conventions.
> >
> > * Other internal reasons I can't document here
> >
> > Also, the value here are made up anyway -- so I've decided to sort them=
 to
> > make sure any clock that has a parent is numbered *after* the parent...
>
> Well, all of that combines makes it very hard for us to review the list.

I understand -- the previous format was a lot more readable, here I had to
work to make the table as small as I could, and quite a few bits of readabi=
lity
were lost in the process. It's already a huge file.

I'm not sure if that would help, but here is the link to the old table
format I used
https://github.com/renesas-rz/rzn1_linux/blob/rzn1-stable/drivers/clk/rzn1/=
rzn1-clkctrl-tables.h

I had to throw that away to make up the new composite table that now contai=
ns
what was in the device tree file before. However the names are the same.

Perhaps I could change how I encode the register/bit pairs to use 8+8 bits =
to
make the hex constants more readable?

>
> >>    2. These definitions seems to be a mix of:
> >>         1. Internal core clocks,
> >>         2. Other core clocks,
> >>         3. Module clocks.
> >
> >>       The internal clocks do not need to be referenced from DT, so I w=
ould
> >>       not make them part of the DT bindings.
> >
> > Why? I'm told that "Bindings aren't for linux" -- why can't I imagine
> > 'something' needing them? Why would I decide NOT to include them,
> > as they are there? I 'factored' a few of them to the same number when
>
> Just general safety w.r.t. unchangeable DT definitions: anything that is
> not listed here cannot be declared wrong later.

Well, I need these #define *somewhere* as I use them in my driver. So what
do you want me to do?
+ Remove the header, move the constants into the driver?
+ Use hard coded numbers in the DT and remove the header entirely?
+ Duplicate the header, keep the full one with the driver, and only list
the CA7+UART0 one in the dt-binding and duplicate the ones I need as
I go along?

>
> > applicable.
>
> You're 100% sure they're the same?

Yes, the script logic hasn't changed in 2 years, and we've been using that
hierarchy extensively since.
Basically the logic is that if a clock doesn't have a gate and isn't a divi=
sor
of some sort, it's factored with it's parent clock... it used to be
done with a DT
alias of the same name.

>
> > This is all done automatically BTW -- a script takes the original clock=
ing
> > spreadsheet, and converts it into a table, correcting 'human input' as =
it
> > goes along.
>
> So the internal spreadsheet doesn't match the public documentation neithe=
r?

Nope, as usual, people who wrote the documentation went their own way at
some point, and didn't backport any changes they made.

> Gr{oetje,eeting}s,
>
>                         Geert

Cheers,
Michel
