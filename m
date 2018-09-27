From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: renesas,rzn1-pinctrl: documentation
Date: Thu, 27 Sep 2018 17:15:54 +0200
Message-ID: <CAMuHMdV1n9KgU+6LxY3_jHTqgL1gKs+54yY0qjnwBeQX7UdOSg@mail.gmail.com>
References: <20180927135922.12015-1-phil.edworthy@renesas.com> <20180927135922.12015-2-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927135922.12015-2-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>, Rob Herring <robh+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Rutland <mark.rutland@arm.com>, Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 3:59 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The Renesas RZ/N1 device family PINCTRL node description.
>
> Based on a patch originally written by Michel Pollet at Renesas.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v6:
>  - Instead of combining the pin nr and func into a single element, use
>    a pair of 8-bit elements.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt

> +- Pin multiplexing sub-nodes:
> +  A pin multiplexing sub-node describes how to configure a set of
> +  (or a single) pin in some desired alternate function mode.
> +  A single sub-node may define several pin configurations.
> +  Please refer to pinctrl-bindings.txt to get to know more on generic
> +  pin properties usage.
> +
> +  The allowed generic formats for a pin multiplexing sub-node are the
> +  following ones:
> +
> +  node-1 {
> +      pinmux = /bits/ 8 <PIN_NR MUX_FUNC>, <PIN_NR MUX_FUNC>, ... ;
> +      GENERIC_PINCONFIG;
> +  };

and

> +  Example:
> +  A serial communication interface with a TX output pin and an RX input pin.
> +
> +  &pinctrl {
> +       pins_uart0: pins_uart0 {
> +               pinmux = /bits/ 8 <
> +                       103 RZN1_FUNC_UART0_I   /* UART0_TXD */
> +                       104 RZN1_FUNC_UART0_I   /* UART0_RXD */
> +               >;
> +       };
> +  };

So the above is in response to Rob's comment on v4:

| > +#define RZN1_MUX(_gpio, _func) \
| > +       (((RZN1_FUNC_##_func) << 8) | (_gpio))
|
| I'm not a fan of token pasting and it also goes against kernel style.
| If every other Renesas platform is doing this, then fine. Otherwise,
| you can express it in pretty much the same (source) space:
|
| pinmux = <RZN1_MUX_UART0_I 104>;
|
| Yes, this is 2 cells instead of 1, but if you care about space, you
| can use 8 or 16 bit size.

I'm not so much impressed by the "/bits/ 8" part.
No other pinctrl bindings uses this.
We do have RZA1_PINMUX() and STM32_PINMUX() macros.

Rob: Is this really what you intended?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
