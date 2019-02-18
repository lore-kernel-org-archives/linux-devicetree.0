Return-Path: <SRS0=XEtX=QZ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190216174859.15738-1-marek.vasut@gmail.com> <CAMuHMdXeuaqLEFfV6_7cPdiq_+vuo97brx1Xa1N6c_GFSKmM0A@mail.gmail.com>
 <8374074b-9ef0-1286-71b4-756934e7d405@gmail.com>
In-Reply-To: <8374074b-9ef0-1286-71b4-756934e7d405@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Feb 2019 20:21:26 +0100
Message-ID: <CAMuHMdVex9js2_yvrFoG+CM1WQE42RpZEJ3vEqB-ziQt-zdKVw@mail.gmail.com>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
Content-Type: text/plain; charset="UTF-8"
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Harald Geyer <harald@ccbib.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Marek,

On Mon, Feb 18, 2019 at 8:04 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 2/18/19 10:30 AM, Geert Uytterhoeven wrote:
> > On Sun, Feb 17, 2019 at 8:00 AM <marek.vasut@gmail.com> wrote:
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Reword the binding document to make it clear how the propeties work
> >> and which properties affect which other properties.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

> >> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> >> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> >> @@ -4,16 +4,25 @@ Required properties:
> >>  - compatible           : Must be "regulator-gpio".
> >>  - regulator-name       : Defined in regulator.txt as optional, but required
> >>                           here.
> >> -- states               : Selection of available voltages and GPIO configs.
> >> -                          if there are no states, then use a fixed regulator
> >> +- states               : Selection of available voltages/currents provided by
> >> +                         this regulator and matching GPIO configurations to
> >> +                         achieve them. If there are no states in the "states"
> >> +                         array, use a fixed regulator instead.
> >>
> >>  Optional properties:
> >> -- enable-gpio          : GPIO to use to enable/disable the regulator.
> >> -- gpios                        : GPIO group used to control voltage.
> >> -- gpios-states         : gpios pin's initial states array. 0: LOW, 1: HIGH.
> >> -                         defualt is LOW if nothing is specified.
> >> +- enable-gpio          : GPIO used to enable/disable the regulator.
> >
> > According to modern GPIO rules, that should be "enable-gpios" (plural) ...
>
> Isn't that changing the ABI spec then ?

of_find_gpio() supports both anyway, through gpio_suffixes[].

> >> +                         Warning, the GPIO phandle flags are ignored and the
> >> +                         GPIO polarity is controlled solely by the presence
> >> +                         of "enable-active-high" DT property. This is due to
> >> +                         compatibility with old DTs.
> >
> > Wasn't the purpose of the various *active-* flags to accommodate GPIOs
> > lacking a flags cell (i.e. typically #gpio-cells = <1>)?
>
> Yes
>
> > When the flags cell is present, there's indeed opportunity for confusion
> > (and breakage), combined with the presence/lack of *active-* below...
>
> The code is rather clear that the flags cell is ignored.
>
> drivers/gpio/gpiolib-of.c:
>  91 /*
>  92  * The regulator GPIO handles are specified such that the
>  93  * presence or absence of "enable-active-high" solely controls
>  94  * the polarity of the GPIO line. Any phandle flags must
>  95  * be actively ignored.
>  96  */

Yeah, the code is the binding doc...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
