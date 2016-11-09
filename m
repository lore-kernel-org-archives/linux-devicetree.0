From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pinctrl: sunxi: Add support for interrupt debouncing
Date: Wed, 9 Nov 2016 09:50:59 +0100
Message-ID: <CACRpkdYmt=4xaQF4n6zxU-mF35VOhsBaeORaz90J1443EsXuLw@mail.gmail.com>
References: <cover.61acad25a6fb233e39141b52acd217415281bd73.1478636546.git-series.maxime.ripard@free-electrons.com>
 <7dbb47b16d83b843705aa05d4a5f1f7dfdc4e9a3.1478636546.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7dbb47b16d83b843705aa05d4a5f1f7dfdc4e9a3.1478636546.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 8, 2016 at 9:24 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> The pin controller found in the Allwinner SoCs has support for interrupts
> debouncing.
>
> However, this is not done per-pin, preventing us from using the generic
> pinconf binding for that, but per irq bank, which, depending on the SoC,
> ranges from one to five.
>
> Introduce a device-wide property to deal with this using a microsecond
> resolution. We can re-use the per-pin input-debounce property for that, so
> let's do it!
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

I like this! Minor nits inline:

> +- clocks: phandle to the clocks feeding the pin controller:
> +  - "apb": the gated APB parent clock
> +  - "hosc": the high frequency oscillator in the system
> +  - "losc": the low frequency oscillator in the system
> +
> +Note: For backward compatibility reasons, the hosc and losc clocks are only
> +required if you need to use the optional input-debounce property. Any new
> +device tree should set them.
> +
> +Optional properties:
> +  - input-debounce: Array of debouncing periods in microseconds. One period per
> +    irq bank found in the controller

Looks good to me. Cutting the DT people some slack to look at this
before merging.

> +static int sunxi_pinctrl_compute_debounce(struct clk *clk, int freq, int *diff)
> +{
> +       unsigned long clock = clk_get_rate(clk);
> +       unsigned int best_diff = ~0, best_div;
> +       int i;
> +
> +       for (i = 0; i < 8; i++) {
> +               int cur_diff = abs(freq - (clock >> i));
> +
> +               if (cur_diff < best_diff) {
> +                       best_diff = cur_diff;
> +                       best_div = i;
> +               }
> +       }
> +
> +       *diff = best_diff;
> +       return best_div;
> +}

Kerneldoc or function name should reflect that what this function
does is to find the best divisor.

> +static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
> +                                       struct device_node *node)
> +{
> +       unsigned int hosc_diff, losc_diff;
> +       unsigned int hosc_div, losc_div;
> +       struct clk *hosc, *losc;
> +       u8 div, src;
> +       int i, ret;
> +
> +       /* Deal with old DTs that didn't have the oscillators */
> +       if (of_count_phandle_with_args(node, "clocks", "#clock-cells") != 3)
> +               return 0;

Clever, nice.

> +       /* If we don't have any setup, bail out */
> +       if (!of_find_property(node, "input-debounce", NULL))
> +               return 0;
> +
> +       losc = devm_clk_get(pctl->dev, "losc");
> +       if (IS_ERR(losc))
> +               return PTR_ERR(losc);
> +
> +       hosc = devm_clk_get(pctl->dev, "hosc");
> +       if (IS_ERR(hosc))
> +               return PTR_ERR(hosc);
> +
> +       for (i = 0; i < pctl->desc->irq_banks; i++) {
> +               unsigned long debounce_freq;
> +               u32 debounce;
> +
> +               ret = of_property_read_u32_index(node, "input-debounce",
> +                                                i, &debounce);
> +               if (ret)
> +                       return ret;
> +
> +               debounce_freq = USEC_PER_SEC / debounce;

Arithmetics! Would you like to use
DIV_ROUND_UP()? or DIV_ROUND_CLOSEST()?

Apart from that I like this patch a lot.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
