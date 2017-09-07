From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 6/6] gpio: uniphier: add UniPhier GPIO controller driver
Date: Thu, 7 Sep 2017 14:41:40 -0500
Message-ID: <CAL_Jsq+Da1=myQGEpA_0f+dEU0Rk6RB3BJHVCzq0M0MyJ3UDoQ@mail.gmail.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com> <1504784522-26841-7-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504784522-26841-7-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 7, 2017 at 6:42 AM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> This GPIO controller device is used on UniPhier SoCs.
>
> It also serves as an interrupt controller, but interrupt signals are
> just delivered to the parent irqchip without any latching or OR'ing.
> This is implemented by using hierarchy IRQ domain.
>
> Implementation note:
> Unfortunately, the IRQ mapping from this controller to the parent is
> random. (48, 49, ..., 63, 154, 155, ...)
> If "interrupts" property is used, IRQ resources may be statically
> allocated when platform devices are populated from DT.  This can be
> a problem for the hierarchy IRQ domain because IRQ allocation must
> happen from the outer-most domain up to the root domain in order to
> build up the stacked IRQ.  (https://lkml.org/lkml/2017/7/6/758)
> Solutions to work around it could be to hard-code parent hwirqs or
> to invent a driver-specific DT property.
>
> Here, the new API irq_domain_push_irq() was merged by v4.14-rc1.
> It allows to add irq_data to the existing hierarchy.  It will help
> to make this driver work whether the parent has already initialized
> the hierarchy or not.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>
> Changes in v4:
>   - Add COMPILE_TEST and select IRQ_DOMAIN_HIERARCHY
>   - Reimplement irqchip part by using irq_domain_push_irq()
>
> Changes in v3:
>   - Add .irq_set_affinity() hook
>   - Use irq_domain_create_hierarchy() instead of legacy
>     irq_domain_add_hierarchy()
>
> Changes in v2:
>   - Remove +32 offset for parent interrupts to follow the GIC
>     binding convention
>   - Let uniphier_gpio_irq_alloc() fail if nr_irqs != 1
>   - Allocate gpio_chip statically because just one instance is
>     supported
>   - Fix suspend and resume hooks
>
>  .../devicetree/bindings/gpio/gpio-uniphier.txt     |  43 ++

What happened to my ack? One line here more that before, but I'm not
going to diff your patches for you.

BTW, it is preferred to split bindings to a separate patch.

>  MAINTAINERS                                        |   1 +
>  drivers/gpio/Kconfig                               |   8 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-uniphier.c                       | 486 +++++++++++++++++++++
>  include/dt-bindings/gpio/uniphier-gpio.h           |  18 +
>  6 files changed, 557 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
>  create mode 100644 drivers/gpio/gpio-uniphier.c
>  create mode 100644 include/dt-bindings/gpio/uniphier-gpio.h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
