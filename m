From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: add support for RZ/A1L
Date: Wed, 4 Oct 2017 16:27:39 +0200
Message-ID: <CAMuHMdUh05qyi3eoao0KbahGD1NfEnGm03JpcZuFHVrEBSBU1Q@mail.gmail.com>
References: <20171003073334.18917-1-chris.brandt@renesas.com>
 <20171003073334.18917-3-chris.brandt@renesas.com> <CAMuHMdVU_dmMvfSNQXOON1doW98EjRY9p8XT6XP7ccxa7414bw@mail.gmail.com>
 <SG2PR06MB1165B7C76F5E5528FDF7B7408A730@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165B7C76F5E5528FDF7B7408A730@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Wed, Oct 4, 2017 at 4:16 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, October 04, 2017, Geert Uytterhoeven wrote:
>> >  Required properties:
>> >    - compatible
>> > -    this shall be "renesas,r7s72100-ports".
>> > +    this shall be "renesas,r7s72100-ports" for RZ/A1H and RZ/A1M or
>> > +    "renesas,r7s72102-ports" for RZ/A1L
>>
>> Shouldn't you also document "renesas,r7s72101-ports" for RZ/A1M?
>
> I was wondering if you were going to ask for that.

:-)

> I put "for RZ/A1H and RZ/A1M" in the DT documentation, but if you
> prefer, I can also just add to pinctrl-rza1.c:
>
> static const struct of_device_id rza1_pinctrl_of_match[] = {
>         {
>                 /* RZ/A1H */
>                 .compatible     = "renesas,r7s72100-ports",
>                 .data           = &rza1h_pmx_conf,
>         },
> +       {
> +               /* RZ/A1M */
> +               .compatible     = "renesas,r7s72101-ports",
> +               .data           = &rza1h_pmx_conf,
> +       },      {
>                 /* RZ/A1L */
>                 .compatible     = "renesas,r7s72102-ports",
>                 .data           = &rza1l_pmx_conf,
>         },
>         { }
> };
>
>
>
>> You could use "renesas,r7s72100-ports" as a fallback property for RZ/A1M,
>> though.
>
> Do you mean in the DT? Or in pinctrl-rza1.c?

I mean in DT, i.e.:

        pinctrl: pin-controller@fcfe3000 {
                compatible = "renesas,r7s72101-ports", "renesas,r7s72100-ports";
                ...

That way you don't have to extend the pinctrl driver.

>> BTW, is there a way to distinguish the various RZ/A1 SoCs at runtime?
>
> Sadly there is not.
>
> There is a unique ID number, but it is only accessible via JTAG
> externally.
>
> Internally, you would have to look for registers that don't exist (for
> the RZ/A1L). But for RZ/A1H vs RZ/A1M, the only actual difference is the
> amount of RAM, so you would have to do a set-and-test method on RAM.

If RZ/A1H and RZ/A1M differ in the amount of RAM only, I think you can
just consider them the same, though, and use the same DTS (assumed
the boot loader fills/corrects in the memory node).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
