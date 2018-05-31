From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v7 1/5] dt-bindings: Add the r9a06g032-sysctrl.h file
Date: Thu, 31 May 2018 11:32:52 +0200
Message-ID: <CAMuHMdXQWSVh37HqrvFWeLNHZ5zNh0=9+hV0_nsQ9mi1HQSCaQ@mail.gmail.com>
References: <1527154169-32380-1-git-send-email-michel.pollet@bp.renesas.com>
 <1527154169-32380-2-git-send-email-michel.pollet@bp.renesas.com>
 <CAMuHMdVzN0Cbc9+MJqC4EzVgD3bkDixkf10NA13ko87cMwvpLA@mail.gmail.com> <CAMMfpEwpiZnZEykzxQJMTwE+cDnOD_qA3nUzyB96DGTWPzSJrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMMfpEwpiZnZEykzxQJMTwE+cDnOD_qA3nUzyB96DGTWPzSJrw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: M P <buserror@gmail.com>
Cc: Michel Pollet <michel.pollet@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Michel,

On Thu, May 31, 2018 at 11:11 AM, M P <buserror@gmail.com> wrote:
> On Fri, 25 May 2018 at 11:31, Geert Uytterhoeven <geert@linux-m68k.org>
> wrote:
>> On Thu, May 24, 2018 at 11:28 AM, Michel Pollet
>> <michel.pollet@bp.renesas.com> wrote:
>> > This adds the constants necessary to use the renesas,r9a06g032-sysctrl
> node.

>> > @@ -0,0 +1,187 @@
>> > +/* SPDX-License-Identifier: GPL-2.0 */
>> > +/*
>> > + * R9A06G032 sysctrl IDs
>> > + *
>> > + * Copyright (C) 2018 Renesas Electronics Europe Limited
>> > + *
>> > + * Michel Pollet <michel.pollet@bp.renesas.com>, <buserror@gmail.com>
>> > + * Derived from zx-reboot.c
>> > + */
>> > +
>> > +#ifndef __DT_BINDINGS_R9A06G032_SYSCTRL_H__
>> > +#define __DT_BINDINGS_R9A06G032_SYSCTRL_H__
>> > +
>> > +#define R9A06G032_CLKOUT                       0
>> > +#define R9A06G032_CLK_PLL_USB                  1
>> > +#define R9A06G032_CLK_48                       1 /* AKA CLK_PLL_USB *=
/
>> > +#define R9A06G032_CLKOUT_D10                   2
>> > +#define R9A06G032_CLKOUT_D16                   3
>> > +#define R9A06G032_MSEBIS_CLK                   3 /* AKA CLKOUT_D16 */
>> > +#define R9A06G032_MSEBIM_CLK                   3 /* AKA CLKOUT_D16 */
>> > +#define R9A06G032_CLKOUT_D160                  4
>> > +#define R9A06G032_CLKOUT_D1OR2                 5
>> > +#define R9A06G032_CLK_DDRPHY_PLLCLK            5 /* AKA CLKOUT_D1OR2 =
*/
>
>> [...]
>
>> I have 3 comments:
>
>>    1. I had expected this list to match (both name- and order-wise)
> Appendix
>>       C ("Clock Tree Structure") in the RZ/N1[DSL] User=E2=80=99s Manual=
: System
>>       Introduction, Multiplexing, Electrical and Mechanical Information.
>>       That would make it easier to review.
>
> Well, that document was made a *long* time after the internal documentati=
on
> we used to generate the clock lists. There are a few things we had to do:
>
> * Renumber peripherals. We decided a long time ago that u-boot and linux
> would stick to zero based peripherals, and not one based numbers. It's ne=
xt
> to impossible to keep mixing number based across software base, so we use
> UART0 while the hardware manual mentions UART1 -- It *is* documented
> extensively with out SDK, and makes life using linux a lot easier. It's
> across all our SDK, u-boot, webapps readmes, howtos etc.
>
> * Rename some peripherals. Plenty of peripherals names made little sense
> and had zero consistency, in fact, many names were different depending on
> the place they were used! -- "flashnand"+"nand_flash"+"FNAND" etc,
> "QUADSPI"+"QSPI" etc etc so we also re-normalized the names to match linu=
x
> conventions.
>
> * Other internal reasons I can't document here
>
> Also, the value here are made up anyway -- so I've decided to sort them t=
o
> make sure any clock that has a parent is numbered *after* the parent...

Well, all of that combines makes it very hard for us to review the list.

>>    2. These definitions seems to be a mix of:
>>         1. Internal core clocks,
>>         2. Other core clocks,
>>         3. Module clocks.
>
>>       The internal clocks do not need to be referenced from DT, so I wou=
ld
>>       not make them part of the DT bindings.
>
> Why? I'm told that "Bindings aren't for linux" -- why can't I imagine
> 'something' needing them? Why would I decide NOT to include them,
> as they are there? I 'factored' a few of them to the same number when

Just general safety w.r.t. unchangeable DT definitions: anything that is
not listed here cannot be declared wrong later.

> applicable.

You're 100% sure they're the same?

> This is all done automatically BTW -- a script takes the original clockin=
g
> spreadsheet, and converts it into a table, correcting 'human input' as it
> goes along.

So the internal spreadsheet doesn't match the public documentation neither?

>>    3. It looks like the module clocks can be referred to by register off=
set
>>       and bit position, which is similar to how this is handled on R-Car
>>       SoCs.
>>       Perhaps you can just drop the definitions for these from the heade=
r
>>       file, and refer to them by (combined) register offset and bit
> position
>>       instead?
>>       Or am I missing something?
>>       I believe this can also be done for the module resets (later).
>
> If you look in the .c file, you'll see that most gate have not just one
> register/bit pair associated with them -- there are several, spread
> across registers.. Also, there are clocks in there with two gates,
> or none. Given that, I've decided a separate numbering
> made sense.

OK, fair enough.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
