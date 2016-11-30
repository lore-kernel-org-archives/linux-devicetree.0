MIME-Version: 1.0
In-Reply-To: <20161124102529.20212-4-stephen.boyd@linaro.org>
References: <20161124102529.20212-1-stephen.boyd@linaro.org>
	<20161124102529.20212-4-stephen.boyd@linaro.org>
Date: Wed, 30 Nov 2016 16:48:26 -0600
Message-ID: <CAL_JsqLXUYWnhdW=vdpdGmzyH_xNrn=ckxhK4rTyO8wBisAGCg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: Support gpio nexus dt bindings
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>
List-ID: <devicetree@vger.kernel.org>



On Thu, Nov 24, 2016 at 4:25 AM, Stephen Boyd <stephen.boyd@linaro.org> wrote:
> Platforms like 96boards have a standardized connector/expansion
> slot that exposes signals like GPIOs to expansion boards in an
> SoC agnostic way. We'd like the DT overlays for the expansion
> boards to be written once without knowledge of the SoC on the
> other side of the connector. This avoids the unscalable
> combinatorial explosion of a different DT overlay for each
> expansion board and SoC pair.
>
> Now that we have nexus support in the OF core let's change the
> function call here that parses the phandle lists of gpios to use
> the nexus variant. This allows us to remap phandles and their
> arguments through any number of nexus nodes and end up with the
> actual gpio provider being used.
>
> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>
> TODO: Document gpio-map and gpio-map-mask in GPIO devicetree binding
>
>  drivers/gpio/gpiolib-of.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index ecad3f0e3b77..3117397c4c41 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -71,8 +71,9 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
>         struct gpio_desc *desc;
>         int ret;
>
> -       ret = of_parse_phandle_with_args(np, propname, "#gpio-cells", index,
> -                                        &gpiospec);
> +       ret = of_parse_phandle_with_args_map(np, propname, "#gpio-cells",
> +                                            "gpio-map", "gpio-map-mask",
> +                                            index, &gpiospec);
>         if (ret) {
>                 pr_debug("%s: can't parse '%s' property of node '%s[%d]'\n",
>                         __func__, propname, np->full_name, index);
> --
> 2.10.0.297.gf6727b0
>
