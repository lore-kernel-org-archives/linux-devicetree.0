Return-Path: <SRS0=qjSo=MA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41421 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbeIRSat (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Sep 2018 14:30:49 -0400
MIME-Version: 1.0
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org> <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org> <CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
 <c4bd550f-5319-9d92-a30a-1d12fc9bbcab@linaro.org> <CAMuHMdUs-YNQk1wmbqQvz_n9xq04=gkyL1uBJdg9ExA9Lmg5uw@mail.gmail.com>
 <a160b76b-8dca-81e8-e958-d8b92bdc8928@linaro.org> <CAMuHMdV3Ai+CLHBJ_GH9d=JN0cmiaQT3eSfNGRgiiMffgK7stg@mail.gmail.com>
 <ba334f02-ac37-0908-ec0c-da8a6459fab4@linaro.org> <TYXPR01MB1568B71126AB4A2BDB78BF1F8A000@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_JsqJ84FW8a8eaHPsJAM9R3tYVzOJxp7=Fq+xWzBPVV03fhg@mail.gmail.com>
 <TY1PR01MB15621F2C9CC30B20BF5E09A18A050@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAL_JsqJorfOhuwiRk9vbfZ_6B8s-EM7k+RTJmC4La76NzY5tuw@mail.gmail.com>
 <TY1PR01MB15629984AA415D4F876B86038A040@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <e4b750b4-2e99-ac24-d7aa-db05a6872a8b@linaro.org> <CAMuHMdWOc=p-y4cB=8Y5+HRxRdVqXxE7TaSXkcOO9AMaB+1Mqg@mail.gmail.com>
 <TY1PR01MB15627A875767E1428E6C7DCE8A1A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdXy=NXgqc0p5x+dp6u45LkYENNA6mjECwnOYOURE_+yCg@mail.gmail.com>
 <TY1PR01MB1562DB2A1F955F52807F8AC88A1E0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWOR91HWNGnQAfkjesg_89=AuxUy0RnE3R7=3=KZ_0Kyg@mail.gmail.com> <TY1PR01MB15621E4C1E84A6E3BC4B94CF8A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15621E4C1E84A6E3BC4B94CF8A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 14:58:02 +0200
Message-ID: <CAMuHMdV1LvTrf3jw+JMkAC=skxB48--AYm_eJtZJqt9374Sd3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Sep 18, 2018 at 1:55 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, September 18, 2018, linux-renesas-soc-owner@vger.kernel.org wrote:
> > > I've coded this up and it works fine.
> >
> > While I don't doubt this works fine, your DT is no longer describing
> > hardware, but also software policy.
> >
> > I think the proper solution, maximizing code reuse, is to:
> >   - Split off early clocks from cpg_mssr_info.core_clks[] and .mod_clk[]
> > into
> >     cpg_mssr_info.early_core_clks[] and .early_mod_clks[],
>
> This is where I got into trouble.
> I originally just tried to register all the core clocks in the early
> init. But then I had issues when the platform probe came in later and
> wanted to do the same thing.
>
> For example, the clock tree for OSTM is:
>   EXTAL -> PLL -> P1C -> OSTM
>
> Of course there are other non-early module that use the P1C clock.
>
> Do you think it would be OK if I just registers all the core clock in
> early init, then just pass back the clk pointers to cpg_mssr_probe later
> (to let the platform driver manage them)?

Just move EXTAL, PLL, and P1C from cpg_mssr_info.core_clks[] to
.early_core_clks[], and move OSTM[01] from .mod_clks[] to
.early_mod_clks[]?

Then the early init from CLK_OF_DECLARE() will just register the
early clocks, and cpg_mssr_probe() can take care of the remaining parts?

Does that make sense?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
