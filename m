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
 <CAMuHMdXy=NXgqc0p5x+dp6u45LkYENNA6mjECwnOYOURE_+yCg@mail.gmail.com>
 <TY1PR01MB1562DB2A1F955F52807F8AC88A1E0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWOR91HWNGnQAfkjesg_89=AuxUy0RnE3R7=3=KZ_0Kyg@mail.gmail.com>
 <TY1PR01MB15621E4C1E84A6E3BC4B94CF8A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdV1LvTrf3jw+JMkAC=skxB48--AYm_eJtZJqt9374Sd3w@mail.gmail.com>
 <TY1PR01MB15625BAD12E2CB56AB47ACE88A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdVfa1yz=N=KCwXO=4TGGB113mTYqtB=0iYiaQVoTC260Q@mail.gmail.com> <TY1PR01MB1562ED7502A2D183B5A981588A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562ED7502A2D183B5A981588A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 18:16:53 +0200
Message-ID: <CAMuHMdWMtLSzP7nC+C=ND1O4BQY6DFzTFspchjwtsTGTqTURog@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Sep 18, 2018 at 5:52 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, September 18, 2018 1, Geert Uytterhoeven wrote:
> > > What do you see the .dtsi and .dts looking like?
> >
> > The part using CLK_OF_DECLARE() is not a platform driver. It does not
> > operate on a device (struct platform_device), but on a device node
> > (struct
> > device_node). Hence it would match against the same DT node, but map it
> > using of_iomap().  So you just need the existing "renesas,r7s9210-cpg-
> > mssr"
> > node.
>
> So...I tried that...and it doesn't work.
>
> Basically, this:
> CLK_OF_DECLARE(cpg_mstp_early_clks, "renesas,r7s9210-cpg-mssr",
>                rza2_cpg_mssr_early_init);
>
> But, what happens is that rza2_cpg_mssr_early_init gets called because
> it find a match against "renesas,r7s9210-cpg-mssr". But later after
> cpg_mssr_init gets call, cpg_mssr_probe never gets called. I assume that is
> because device "renesas,r7s9210-cpg-mssr" has already been matched to a
> driver.
>
> > Please have a look at e.g. "mediatek,mt2712-topckgen".
>
> One thing I don't understand is that in the early init, it registers a
> of_clk_add_provider. But then later in the probe, it register
> of_clk_add_provider again (on the same DT node). I guess you can do that????

Yeah, I noticed that, too.
It just adds the same xlate method and data pointer to the list.
So it's harmless, but unneeded.

> So I see what the mediatek is doing, but I can't seem to reproduce it. I
> must be missing something.

It's using CLK_OF_DECLARE_DRIVER(), which clears OF_POPULATED:

    /*
     * Use this macro when you have a driver that requires two initialization
     * routines, one at of_clk_init(), and one at platform device probe
     */
    #define CLK_OF_DECLARE_DRIVER(name, compat, fn) \
            static void __init name##_of_clk_init_driver(struct
device_node *np) \
            {                                                               \
                    of_node_clear_flag(np, OF_POPULATED);                   \
                    fn(np);                                                 \
            }                                                               \
            OF_DECLARE_1(clk, name, compat, name##_of_clk_init_driver)

Sorry for failing to tell you. I did know about that flag, but only remembered
due to your problem report.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
