From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] gpio: Add GPIO driver for Spreadtrum SC9860 platform
Date: Thu, 1 Feb 2018 17:31:54 +0200
Message-ID: <CAHp75VdYjz6f2wBXsTL1kf5z-jcM68sMhtmkdgJM+TiPZb=gww@mail.gmail.com>
References: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517453568.git.baolin.wang@linaro.org>
 <62ceed73b65399099ccd76fe6b7331bcd253b027.1517453569.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <62ceed73b65399099ccd76fe6b7331bcd253b027.1517453569.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 1, 2018 at 5:04 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The Spreadtrum SC9860 platform GPIO controller contains 16 groups and
> each group contains 16 GPIOs. Each GPIO can set input/output and has
> the interrupt capability.

Just noticed couple of more improvements you can do.

> +       case IRQ_TYPE_EDGE_RISING:
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 1);
> +               irq_set_handler_locked(data, handle_edge_irq);
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 0);
> +               irq_set_handler_locked(data, handle_edge_irq);
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 1);
> +               irq_set_handler_locked(data, handle_edge_irq);
> +               break;
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 1);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 1);
> +               irq_set_handler_locked(data, handle_level_irq);
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 1);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 0);
> +               irq_set_handler_locked(data, handle_level_irq);
> +               break;
> +       default:
> +               return -EINVAL;

I guess you can use fallthrough and reduce some lines, but I have no
strong opinion which will look better.

> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       sprd_gpio->base = devm_ioremap_nocache(&pdev->dev, res->start,
> +                                              resource_size(res));

Didn't notice before, why not to simple call devm_ioremap_resource() ?

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
