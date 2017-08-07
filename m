From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: uniphier: add UniPhier GPIO controller driver
Date: Mon, 7 Aug 2017 14:42:19 +0200
Message-ID: <CACRpkdZWxjwDnVy5f2rLAWs=+T=5SnwyU8dz1FW1eg8dk8JN_Q@mail.gmail.com>
References: <1501758371-25316-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501758371-25316-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 3, 2017 at 1:06 PM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

> This GPIO controller device is used on UniPhier SoCs.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
(...)
> +static const u32 uniphier_gpio_irq_parent_hwirqs[] = {
> +       80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95,
> +       186, 187, 188, 189, 190, 249, 250, 251,
> +};
(..)
> +               /* parent is UniPhier AIDET */
> +               parent_fwspec.fwnode = domain->parent->fwnode;
> +               parent_fwspec.param_count = 2;
> +               parent_fwspec.param[0] = uniphier_gpio_irq_parent_hwirqs[hwirq];
> +               parent_fwspec.param[1] = type;
> +
> +               ret = irq_domain_alloc_irqs_parent(domain, virq, 1,
> +                                                  &parent_fwspec);

This is not right.

That parent IRQ needs to come from the device tree, not from a static array
like this, and it is definately to use hierarchical irqdomain.

Please look at similar drivers merged recently for inspiration:
gpio/gpio-xgene-sb.c
pinctrl/stm32/pinctrl-stm32.c

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
