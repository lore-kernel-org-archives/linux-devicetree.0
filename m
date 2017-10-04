From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: add support for RZ/A1L
Date: Wed, 4 Oct 2017 16:49:45 +0200
Message-ID: <CAMuHMdVmFNyE0QfdWZ5X6fRp4xJy9k+uN7h+zi5_WAG1dcJV5g@mail.gmail.com>
References: <20171003073334.18917-1-chris.brandt@renesas.com>
 <20171003073334.18917-3-chris.brandt@renesas.com> <CAMuHMdVU_dmMvfSNQXOON1doW98EjRY9p8XT6XP7ccxa7414bw@mail.gmail.com>
 <SG2PR06MB1165B7C76F5E5528FDF7B7408A730@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUh05qyi3eoao0KbahGD1NfEnGm03JpcZuFHVrEBSBU1Q@mail.gmail.com> <SG2PR06MB1165243813B8D662AE93911E8A730@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165243813B8D662AE93911E8A730@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Wed, Oct 4, 2017 at 4:43 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> To be clear:
>
> On Wednesday, October 04, 2017 1, Geert Uytterhoeven wrote:
>> >> You could use "renesas,r7s72100-ports" as a fallback property for
>> RZ/A1M,
>> >> though.
>> >
>> > Do you mean in the DT? Or in pinctrl-rza1.c?
>>
>> I mean in DT, i.e.:
>>
>>         pinctrl: pin-controller@fcfe3000 {
>>                 compatible = "renesas,r7s72101-ports", "renesas,r7s72100-
>> ports";
>>                 ...
>>
>> That way you don't have to extend the pinctrl driver.
>
> I will submit a v2 with:
>
> [ renesas,rza1-pinctrl.txt ]
>
> Required properties:
>   - compatible
>     this shall be "renesas,r7s72100-ports" for RZ/A1H,
>     "renesas,r7s72101-ports" for RZ/M or

... with a fallback for "renesas,r7s72100-ports, as RZ/A1M is compatible
with RZ/A1H (and I assume RZ/A1H is the predecessor?).

>     "renesas,r7s72102-ports" for RZ/A1L
>
>
> [ r7s72100.dtsi ]
>         pinctrl: pin-controller@fcfe3000 {
>                 compatible = "renesas,r7s72101-ports", "renesas,r7s72100-ports";

I meant in r7s72101.dtsi (which we don't have!).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
