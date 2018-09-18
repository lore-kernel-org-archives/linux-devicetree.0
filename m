Return-Path: <SRS0=npSy=MA=gmail.com=geert.uytterhoeven@kernel.org>
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
 <CAMuHMdXy=NXgqc0p5x+dp6u45LkYENNA6mjECwnOYOURE_+yCg@mail.gmail.com> <TY1PR01MB1562DB2A1F955F52807F8AC88A1E0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562DB2A1F955F52807F8AC88A1E0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 09:24:54 +0200
Message-ID: <CAMuHMdWOR91HWNGnQAfkjesg_89=AuxUy0RnE3R7=3=KZ_0Kyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

CC linux-clk

On Mon, Sep 17, 2018 at 8:57 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, September 14, 2018, Geert Uytterhoeven wrote:
> > > Just FYI, for the heck of it, I tried and hacked in registering the
> > > clock driver using CLK_OF_DECLARE since that happens before the
> > > TIMER_OF_DECLARE timers are probed.
> > >
> > > But, I got this result:
> > >
> > > [    0.000000] Driver 'renesas-cpg-mssr' was unable to register with
> > bus_type 'platform' because the bus was not initialized.
> >
> > Indeed, you cannot register a platform device from CLK_OF_DECLARE().
> > Instead, you have to operate on the passed struct device_node pointer,
> > cfr. the old RZ/A1 clock driver.
>
> How about this proposal:
>
> I leave the current OSTM timer driver as it is today with
> TIMER_OF_DECLARE.
>
> But, I modify the clock driver so it registers a mini driver with
> CLK_OF_DECLARE that can enable individual HW module clocks using
> clk_register_fixed_rate. Once those modules/clocks are enabled, they are enabled
> forever.
>
> Also, later on when the full platform driver is probed, for any of those
> early clocks that were created, it basically ignores them.
>
>
> To use this early clock, you add this to your board's .dts file as such:
>
>
> /* Special Early CPG clocks */
> / {
>                 cpg_early: clock-controller@early {
>                 #clock-cells = <2>;
>                 compatible = "renesas,r7s9210-cpg-mssr-early";
>         };
> };
>
> /* High resolution System tick timers */
> &ostm0 {
>         status = "okay";
>         clocks = <&cpg_early CPG_MOD 36>;       /* replace .dtsi setting */
>         power-domains = <&cpg_early>;           /* replace .dtsi setting */
> };
> &ostm1 {
>         status = "okay";
>         clocks = <&cpg_early CPG_MOD 35>;       /* replace .dtsi setting */
>         power-domains = <&cpg_early>;           /* replace .dtsi setting */
> };
>
>
> I've coded this up and it works fine.

While I don't doubt this works fine, your DT is no longer describing
hardware, but also software policy.

I think the proper solution, maximizing code reuse, is to:
  - Split off early clocks from cpg_mssr_info.core_clks[] and .mod_clk[] into
    cpg_mssr_info.early_core_clks[] and .early_mod_clks[],
  - Split off early handling from cpg_mssr_probe(), to be called
      a. from CLK_OF_DECLARE() in r7s9210-cpg-mssr.c, OR
      b. from cpg_mssr_probe() if !cpg_mssr_info.early_core_clks.

BTW, this will also be needed for migrating other CA9-based SoCs to
renesas-cpg-mssr.c, as these don't have an ARM architectured timer,
just like RZ/A2.

Ideally (in the long term), Linux should learn to track dependencies properly,
so it initialized all components in the required order, automatically.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
