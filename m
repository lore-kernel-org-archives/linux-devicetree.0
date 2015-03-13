From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 02/12] irqchip: nvic: support hierarchy irq domain
Date: Fri, 13 Mar 2015 18:35:26 +0100
Message-ID: <CALszF6Di4kngd1Rzp9G=xwWPc4FqOPpA+5s+jrRSUGjs8OiCLg@mail.gmail.com>
References: <1426203380-7155-1-git-send-email-stefan@agner.ch>
	<1426203380-7155-3-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426203380-7155-3-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, marc.zyngier-5wv7dgnIgG8@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-03-13 0:36 GMT+01:00 Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>:
> Add support for hierarchy irq domain. Use to support the interrupt
> router found in Vybrid SoC, which is between the NVIC and the
> peripherals.
>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  drivers/irqchip/irq-nvic.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
> index 4ff0805..5fac910 100644
> --- a/drivers/irqchip/irq-nvic.c
> +++ b/drivers/irqchip/irq-nvic.c
> @@ -49,6 +49,31 @@ nvic_handle_irq(irq_hw_number_t hwirq, struct pt_regs *regs)
>         handle_IRQ(irq, regs);
>  }
>
> +static int nvic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> +                               unsigned int nr_irqs, void *arg)
> +{
> +       int i, ret;
> +       irq_hw_number_t hwirq;
> +       unsigned int type = IRQ_TYPE_NONE;
> +       struct of_phandle_args *irq_data = arg;
> +
> +       ret = irq_domain_xlate_onecell(domain, irq_data->np, irq_data->args,
> +                                  irq_data->args_count, &hwirq, &type);
> +       if (ret)
> +               return ret;
> +
> +       for (i = 0; i < nr_irqs; i++)
> +               irq_map_generic_chip(domain, virq + i, hwirq + i);
> +
> +       return 0;
> +}
> +
> +static const struct irq_domain_ops nvic_irq_domain_ops = {
> +       .xlate = irq_domain_xlate_onecell,
> +       .alloc = nvic_irq_domain_alloc,

.alloc is only available with CONFIG_IRQ_DOMAIN_HIERARCHY=y, and it is
not selected by in the config ARM_NVIC entry.
It breaks the build with my STM32 series.

Once selected, the build is fine, and the board boots successfully.


Best regards,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
