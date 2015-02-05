From: Tien Hock Loh <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v9 2/2] drivers/gpio: Altera soft IP GPIO driver
Date: Thu, 5 Feb 2015 18:24:55 +0800
Message-ID: <CAOLUe6apL3zsO6qjwBmEutQBkJJX=F29WtPuio8y3y3ckDp_Lg@mail.gmail.com>
References: <1420510773-24605-1-git-send-email-thloh@altera.com>
 <1420510773-24605-3-git-send-email-thloh@altera.com> <20150106083039.GA9157@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150106083039.GA9157-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Cc: Tien Hock Loh <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, crope-X3B1VOXEql0@public.gmane.org, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 6, 2015 at 4:30 PM, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org> wrote:
> On 2015-01-06 at 03:19:33 +0100, thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
> [...]
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 633ec21..e38beff 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -156,6 +156,14 @@ config GPIO_DWAPB
>>         Say Y or M here to build support for the Synopsys DesignWare APB
>>         GPIO block.
>>
>> +config GPIO_ALTERA
>> +       tristate "Altera GPIO"
>> +       depends on OF_GPIO
>> +       help
>> +         Say Y or M here to build support for the Altera PIO device.
>> +
>> +      If driver is built as a module it will be called gpio-altera.
>
> Indentation looks odd. The tristate, depends and help lines should be
> indented by a tab and the help text should be indented by a tab followed
> by two spaces.
>

Yeah I didn't notice this. I'll fix it.

>> +
>>  config GPIO_IT8761E
>>       tristate "IT8761E GPIO support"
>>       depends on X86  # unconditional access to IO space.
>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> index 81755f1..239b28b 100644
> [...]
>> diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
>> new file mode 100644
>> index 0000000..a57b7ab
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-altera.c
> [...]
>> +int altera_gpio_probe(struct platform_device *pdev)
>> +{
>> +     struct device_node *node = pdev->dev.of_node;
>> +     int id, reg, ret;
>> +     struct altera_gpio_chip *altera_gc;
>> +
>> +     altera_gc = devm_kzalloc(&pdev->dev, sizeof(*altera_gc), GFP_KERNEL);
>> +     if (!altera_gc)
>> +             return -ENOMEM;
>> +
>> +     spin_lock_init(&altera_gc->gpio_lock);
>> +
>> +     id = pdev->id;
>
> id is assigned but never used.

I'll remove this.

>
>> +
>> +     if (of_property_read_u32(node, "altr,ngpio", &reg))
>> +             /*By default assume full GPIO controller*/
>
> Spaces missing after /* and before */
>
>> +             altera_gc->mmchip.gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
>> +     else
>> +             altera_gc->mmchip.gc.ngpio = reg;
>> +
>> +     if (altera_gc->mmchip.gc.ngpio > 32) {
>
> Why the magic number 32 here? Better use ALTERA_GPIO_MAX_NGPIO as well.

Noted.

>
>> +             dev_warn(&pdev->dev,
>> +                     "ngpio is greater than %d, defaulting to %d\n",
>> +                     ALTERA_GPIO_MAX_NGPIO, ALTERA_GPIO_MAX_NGPIO);
>> +             altera_gc->mmchip.gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
>> +     }
>> +
>> +     altera_gc->mmchip.gc.direction_input    = altera_gpio_direction_input;
>> +     altera_gc->mmchip.gc.direction_output   = altera_gpio_direction_output;
>> +     altera_gc->mmchip.gc.get                = altera_gpio_get;
>> +     altera_gc->mmchip.gc.set                = altera_gpio_set;
>> +     altera_gc->mmchip.gc.owner              = THIS_MODULE;
>> +     altera_gc->mmchip.gc.dev                = &pdev->dev;
>> +
>> +     ret = of_mm_gpiochip_add(node, &altera_gc->mmchip);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
>> +             return ret;
>> +     }
>> +
>> +     platform_set_drvdata(pdev, altera_gc);
>> +
>> +     altera_gc->mapped_irq = platform_get_irq(pdev, 0);
>> +
>> +     if (altera_gc->mapped_irq < 0)
>> +             goto skip_irq;
>> +
>> +     if (of_property_read_u32(node, "altr,interrupt-type", &reg)) {
>> +             ret = -EINVAL;
>> +             dev_err(&pdev->dev,
>> +                     "altr,interrupt-type value not set in device tree\n");
>> +             goto teardown;
>> +     }
>> +     altera_gc->interrupt_trigger = reg;
>> +
>> +     ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_irq_chip, 0,
>> +             handle_simple_irq, IRQ_TYPE_NONE);
>> +
>> +     if (ret) {
>> +             dev_info(&pdev->dev, "could not add irqchip\n");
>> +             return ret;
>> +     }
>> +
>> +     gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
>> +             &altera_irq_chip,
>> +             altera_gc->mapped_irq,
>> +             altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
>> +             altera_gpio_irq_leveL_high_handler :
>> +             altera_gpio_irq_edge_handler);
>> +
>> +skip_irq:
>> +     return 0;
>> +teardown:
>> +     pr_err("%s: registration failed with status %d\n",
>> +             node->full_name, ret);
>> +
>> +     return ret;
>> +}
>> +
>> +static int altera_gpio_remove(struct platform_device *pdev)
>> +{
>> +     struct altera_gpio_chip *altera_gc = platform_get_drvdata(pdev);
>> +
>> +     gpiochip_remove(&altera_gc->mmchip.gc);
>> +
>> +     irq_set_handler_data(altera_gc->mapped_irq, NULL);
>> +     irq_set_chained_handler(altera_gc->mapped_irq, NULL);
>> +     return -EIO;
>> +}
>> +
>> +static const struct of_device_id altera_gpio_of_match[] = {
>> +     { .compatible = "altr,pio-1.0", },
>> +     {},
>> +};
>> +MODULE_DEVICE_TABLE(of, altera_gpio_of_match);
>> +
>> +static struct platform_driver altera_gpio_driver = {
>> +     .driver = {
>> +             .name   = "altera_gpio",
>> +             .owner  = THIS_MODULE,
>
> No need to set this here, platform_driver_register will take care of it.
>

Noted.

>> +             .of_match_table = of_match_ptr(altera_gpio_of_match),
>> +     },
>> +     .probe          = altera_gpio_probe,
>> +     .remove         = altera_gpio_remove,
>> +};
>> +
>> +static int __init altera_gpio_init(void)
>> +{
>> +     return platform_driver_register(&altera_gpio_driver);
>> +}
>> +subsys_initcall(altera_gpio_init);
>> +
>> +static void __exit altera_gpio_exit(void)
>> +{
>> +     platform_driver_unregister(&altera_gpio_driver);
>> +}
>> +module_exit(altera_gpio_exit);
>> +
>> +MODULE_AUTHOR("Tien Hock Loh <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>");
>> +MODULE_DESCRIPTION("Altera GPIO driver");
>> +MODULE_LICENSE("GPL");
>> --
>> 1.7.11.GIT
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
>>

Regards,
Tien Hock Loh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
