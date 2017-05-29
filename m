From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: sprd: Add Spreadtrum pin control driver
Date: Mon, 29 May 2017 18:28:49 +0200
Message-ID: <CACRpkdaBcGNTeUDCcVgK9JKZUPKD-qfO8PVHURR2F_pgvEgViQ@mail.gmail.com>
References: <a1fa5b612de318213bab4404997d133ed118f5d2.1495863824.git.baolin.wang@spreadtrum.com>
 <58b4b6fb2765ab9d5d3ac77f3854d0a88a0973bd.1495863824.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58b4b6fb2765ab9d5d3ac77f3854d0a88a0973bd.1495863824.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 27, 2017 at 7:56 AM, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:

> This patch adds the pin control driver for Spreadtrum SC9860 platform.
>
> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>

Overall I see that you want to store functions and groups in the device tree
using the current helpers from Tony. That is OK if you want to take that
approach, though I prefer the pins/groups/function encoding in plaintext.

But when it comes to pin config:

> +static int sprd_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin_id,
> +                           unsigned long *config)
> +{
> +       struct sprd_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +       struct sprd_pin *pin = sprd_pinctrl_get_pin_by_id(pctl, pin_id);
> +
> +       if (!pin)
> +               return -EINVAL;
> +
> +       if (pin->type == GLOBAL_CTRL_PIN) {
> +               *config = (readl((void __iomem *)pin->reg) >>
> +                          pin->bit_offset) & PINCTRL_BIT_MASK(pin->bit_width);
> +       } else {
> +               *config = readl((void __iomem *)pin->reg);
> +       }
> +
> +       return 0;
> +}
> +
> +static int sprd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
> +                           unsigned long *configs, unsigned int num_configs)
> +{
> +       struct sprd_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +       struct sprd_pin *pin = sprd_pinctrl_get_pin_by_id(pctl, pin_id);
> +       unsigned long reg;
> +       int i;
> +
> +       if (!pin)
> +               return -EINVAL;
> +
> +       for (i = 0; i < num_configs; i++) {
> +               if (pin->type == GLOBAL_CTRL_PIN) {
> +                       reg = readl((void __iomem *)pin->reg);
> +                       reg &= ~(PINCTRL_BIT_MASK(pin->bit_width)
> +                               << pin->bit_offset);
> +                       reg |= (configs[i] & PINCTRL_BIT_MASK(pin->bit_width))
> +                               << pin->bit_offset;
> +                       writel(reg, (void __iomem *)pin->reg);
> +               } else {
> +                       writel(configs[i], (void __iomem *)pin->reg);
> +               }
> +               pin->config = configs[i];
> +       }
> +
> +       return 0;
> +}

This is just hammering the register values, you have effectively defined your
register layout as your device tree ABI.

Please don't do this, please use genric pin config and use the approach
other drivers take with explicit strings encoding the pin configuration.

Even pinctrl-single that maintain quite a bit of muxing data in the device
tree still use the generic pin config API, see:
drivers/pinctrl/pinctrl-single.c
pcs_pinconf_get(), pcs_pinconf_set()

Same for group config.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
