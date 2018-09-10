Return-Path: <SRS0=auRG=LY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42889 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbeIJTZU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Sep 2018 15:25:20 -0400
MIME-Version: 1.0
References: <20180907165849.106182-1-chris.brandt@renesas.com>
 <CAMuHMdXSmq_niZx6HWO-SYgXyzcUzx6VA+EsgvWNcFciR57CKw@mail.gmail.com> <TY1PR01MB1562E64853EEB282E7D6227B8A050@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562E64853EEB282E7D6227B8A050@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Sep 2018 16:30:45 +0200
Message-ID: <CAMuHMdXgDu2SeTqbx0ZVzSZ_QASery--2O23LXJoMgsn3StU7w@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Mon, Sep 10, 2018 at 4:16 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, September 10, 2018 1, Geert Uytterhoeven wrote:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in clk-renesas-for-v4.20.
>
> Thank you!
>
> Now that I have a clock, I can go ahead and submit a Device Tree.
> However, I still don't have a solution for my OSTM timer driver when
> using this new clock driver architecture.
>
> Should I remove the ostm entries in r7s9210_mod_clks[] before you queue
> it up?????

I see no issue with converting the OSTM driver to a platform driver (assumed
it works for you ;-)

> > One possible area for improvement is removing the unused entries in the
> > module clocks part of the priv->clks[] array:
> >
> > +       .num_hw_mod_clks = 11 * 32, /* includes STBCR0 which doesn't exist
> > */
> >
> > Due to having 8-bit instead of 32-bit registers, 11 * 24 entries are not
> > used.
> > Fixing that means adding more checks in several functions, though, so I
> > don't know if you want to go that far...
>
> That's basically why I didn't touch it. I didn't see any big benefit
> from a system resource point of view.

OK, so you are aware of it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
