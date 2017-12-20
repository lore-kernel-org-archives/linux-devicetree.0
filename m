From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] pinctrl: mediatek: add pinctrl driver for MT7622 SoC
Date: Wed, 20 Dec 2017 08:58:02 +0100
Message-ID: <CACRpkdZX32bn+v_fmuaQqoeSTL8Vp_WOEvDBL-05m-AG26NTyg@mail.gmail.com>
References: <cover.1513059081.git.sean.wang@mediatek.com> <5b42c51c965fb2824646630dd93d3d531610e344.1513059081.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5b42c51c965fb2824646630dd93d3d531610e344.1513059081.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 12, 2017 at 7:24 AM,  <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Add support for pinctrl on MT7622 SoC. The IO core found on the SoC has
> the registers for pinctrl, pinconf and gpio mixed up in the same register
> range. However, the IO core for the MT7622 SoC is completely distinct from
> anyone of previous MediaTek SoCs which already had support, such as
> the hardware internal, register address map and register detailed
> definition for each pin.
>
> Therefore, instead, the driver is being newly implemented by reusing
> generic methods provided from the core layer with GENERIC_PINCONF,
> GENERIC_PINCTRL_GROUPS, and GENERIC_PINMUX_FUNCTIONS for the sake of code
> simplicity and rid of superfluous code. Where the function of pins
> determined by groups is utilized in this driver which can help developers
> less confused with what combinations of pins effective on the SoC and even
> reducing the mistakes during the integration of those relevant boards.
>
> As the gpio_chip handling is also only a few lines, the driver also
> implements the gpio functionality directly through GPIOLIB.
>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Patch applied. Very nice work!

As I've seen visiting Asia how popular MTK chips are for all kinds
of devices it's really nice to have proper upstream support directly from
Mediatek on these chips. You guys are awesome.

Some suggestions for improvements:

> +static void mtk_w32(struct mtk_pinctrl *pctl, u32 reg, u32 val)
> +{
> +       writel_relaxed(val, pctl->base + reg);
> +}
> +
> +static u32 mtk_r32(struct mtk_pinctrl *pctl, u32 reg)
> +{
> +       return readl_relaxed(pctl->base + reg);
> +}
> +
> +static void mtk_rmw(struct mtk_pinctrl *pctl, u32 reg, u32 mask, u32 set)
> +{
> +       u32 val;
> +
> +       val = mtk_r32(pctl, reg);
> +       val &= ~mask;
> +       val |= set;
> +       mtk_w32(pctl, reg, val);
> +}

Have you considered replacing this with regmap-mmio? It does pretty much
the same thing. It could be an improvemet reducing code a bit and making
it more generic. The error codes from eg regmap_update_bits() can be
safely ignored on MMIO maps.

> +static int mtk_build_gpiochip(struct mtk_pinctrl *hw, struct device_node *np)
> +{
> +       struct gpio_chip *chip = &hw->chip;
> +       int ret;
> +
> +       chip->label             = PINCTRL_PINCTRL_DEV;
> +       chip->parent            = hw->dev;
> +       chip->request           = gpiochip_generic_request;
> +       chip->free              = gpiochip_generic_free;
> +       chip->direction_input   = mtk_gpio_direction_input;
> +       chip->direction_output  = mtk_gpio_direction_output;

Please submit a patch implementing chip->get_direction(), it
is really helpful, especially for debugging.

If your pin controller later adds support for things that can be
used from the GPIO side, like open drain or debounce, then
please consider at that point to also implement
chip->set_config() in the gpio_chip. That way your GPIO consumers
can use e.g. open drain through pin control as back-end.
See drivers/pinctrl/intel/pinctrl-intel.c for an example.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
