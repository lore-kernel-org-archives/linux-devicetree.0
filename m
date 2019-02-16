Return-Path: <SRS0=65PN=QX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from h1.radempa.de ([176.9.142.194]:53658 "EHLO mail.cosmopool.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727270AbfBPUVG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 16 Feb 2019 15:21:06 -0500
From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
In-reply-to: <20190216174859.15738-1-marek.vasut@gmail.com>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1233.1550348456.1@stardust.g4.wien.funkfeuer.at>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Feb 2019 21:20:56 +0100
Message-Id: <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
Sender: devicetree-owner@vger.kernel.org
To: marek.vasut@gmail.com
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

marek.vasut@gmail.com writes:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> =

> Reword the binding document to make it clear how the propeties work
> and which properties affect which other properties.
> =

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
> ---
>  .../bindings/regulator/gpio-regulator.txt     | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.=
txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> index 1f496159e2bb..acca13c1eaf3 100644
> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> @@ -4,16 +4,25 @@ Required properties:
>  - compatible		: Must be "regulator-gpio".
>  - regulator-name	: Defined in regulator.txt as optional, but required
>  			  here.
> -- states		: Selection of available voltages and GPIO configs.
> -                          if there are no states, then use a fixed regu=
lator
> +- states		: Selection of available voltages/currents provided by
> +			  this regulator and matching GPIO configurations to
> +			  achieve them. If there are no states in the "states"
> +			  array, use a fixed regulator instead.
>  =

>  Optional properties:
> -- enable-gpio		: GPIO to use to enable/disable the regulator.
> -- gpios			: GPIO group used to control voltage.
> -- gpios-states		: gpios pin's initial states array. 0: LOW, 1: HIGH.
> -			  defualt is LOW if nothing is specified.
> +- enable-gpio		: GPIO used to enable/disable the regulator.
> +			  Warning, the GPIO phandle flags are ignored and the
> +			  GPIO polarity is controlled solely by the presence
> +			  of "enable-active-high" DT property. This is due to
> +			  compatibility with old DTs.
> +- enable-active-high	: Polarity of "enable-gpio" GPIO is active HIGH.
> +			  Default is active LOW.
> +- gpios			: Array of one or more GPIO pins used to select the

I think this must be a required property.

> +			  regulator voltage/current listed in "states".
> +- gpios-states		: Initial state of GPIO pins in "gpios" array.
> +			  0: LOW, 1: HIGH.
> +			  Default is LOW if nothing else is specified.

This is not very clear. Maybe add an example below or explain it better.

I guess we can't change it now anymore anyway, but it's not clear to
me, why we have this in the first place: A regulator should only be
active when it has a consumer or is "always-on". IIRC the regulator
core automatically selects the lowest voltage/current compatible with
all consumers. It seems the only usecase is to specify an initial
state that is different from all states in the "states" property, before
the regulator is turned on for the first time. However it also is not
an off-state, because it won't be set again on turning the regulator off.

>  - startup-delay-us	: Startup time in microseconds.

Not relevant for your patch, but I wonder why this is not in the
generic regulator binding.

> -- enable-active-high	: Polarity of GPIO is active high (default is low)=
.
>  - regulator-type	: Specifies what is being regulated, must be either
>  			  "voltage" or "current", defaults to voltage.

HTH,
Harald
