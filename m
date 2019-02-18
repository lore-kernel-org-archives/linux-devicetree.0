Return-Path: <SRS0=XEtX=QZ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190216174859.15738-1-marek.vasut@gmail.com>
In-Reply-To: <20190216174859.15738-1-marek.vasut@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Feb 2019 10:30:56 +0100
Message-ID: <CAMuHMdXeuaqLEFfV6_7cPdiq_+vuo97brx1Xa1N6c_GFSKmM0A@mail.gmail.com>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
Content-Type: text/plain; charset="UTF-8"
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Harald Geyer <harald@ccbib.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Marek,

On Sun, Feb 17, 2019 at 8:00 AM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> Reword the binding document to make it clear how the propeties work
> and which properties affect which other properties.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> Note: The recent gpio-regulator rework caused breakage. While the
>       changes in the gpio-regulator code were according to the DT
>       binding document, they stopped working with older DTs. Make
>       the binding document clearer to prevent such breakage in the
>       future.

Thanks, adding more worms to the can, below...

> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> @@ -4,16 +4,25 @@ Required properties:
>  - compatible           : Must be "regulator-gpio".
>  - regulator-name       : Defined in regulator.txt as optional, but required
>                           here.
> -- states               : Selection of available voltages and GPIO configs.
> -                          if there are no states, then use a fixed regulator
> +- states               : Selection of available voltages/currents provided by
> +                         this regulator and matching GPIO configurations to
> +                         achieve them. If there are no states in the "states"
> +                         array, use a fixed regulator instead.
>
>  Optional properties:
> -- enable-gpio          : GPIO to use to enable/disable the regulator.
> -- gpios                        : GPIO group used to control voltage.
> -- gpios-states         : gpios pin's initial states array. 0: LOW, 1: HIGH.
> -                         defualt is LOW if nothing is specified.
> +- enable-gpio          : GPIO used to enable/disable the regulator.

According to modern GPIO rules, that should be "enable-gpios" (plural) ...

> +                         Warning, the GPIO phandle flags are ignored and the
> +                         GPIO polarity is controlled solely by the presence
> +                         of "enable-active-high" DT property. This is due to
> +                         compatibility with old DTs.

Wasn't the purpose of the various *active-* flags to accommodate GPIOs
lacking a flags cell (i.e. typically #gpio-cells = <1>)?
When the flags cell is present, there's indeed opportunity for confusion
(and breakage), combined with the presence/lack of *active-* below...

> +- enable-active-high   : Polarity of "enable-gpio" GPIO is active HIGH.
> +                         Default is active LOW.
> +- gpios                        : Array of one or more GPIO pins used to select the
> +                         regulator voltage/current listed in "states".
> +- gpios-states         : Initial state of GPIO pins in "gpios" array.
> +                         0: LOW, 1: HIGH.
> +                         Default is LOW if nothing else is specified.
>  - startup-delay-us     : Startup time in microseconds.
> -- enable-active-high   : Polarity of GPIO is active high (default is low).
>  - regulator-type       : Specifies what is being regulated, must be either
>                           "voltage" or "current", defaults to voltage.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
