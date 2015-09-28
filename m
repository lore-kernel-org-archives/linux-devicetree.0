From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 5/5] gpio: tps65912: Add GPIO driver for the TPS65912
 PMIC
Date: Mon, 28 Sep 2015 10:52:37 -0500
Message-ID: <56096245.8020100@ti.com>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-6-git-send-email-afd@ti.com>
 <CAAVeFuKu8R5GCQo3NySCOVLUew4_1qpYydHPAz9tfNorj27-NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuKu8R5GCQo3NySCOVLUew4_1qpYydHPAz9tfNorj27-NA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/27/2015 09:54 PM, Alexandre Courbot wrote:
> On Thu, Sep 24, 2015 at 11:52 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
>> This patch adds support for the TPS65912 PMIC GPIOs.
>>
>> TPS65912 has five configurable GPIOs that can be used for several
>> purposes.
>>
>> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
>> ---
>>   drivers/gpio/Kconfig         |   6 ++
>>   drivers/gpio/Makefile        |   1 +
>>   drivers/gpio/gpio-tps65912.c | 138 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 145 insertions(+)
>>   create mode 100644 drivers/gpio/gpio-tps65912.c
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index fb28483..82218fa 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -838,6 +838,12 @@ config GPIO_TPS65910
>>            Select this option to enable GPIO driver for the TPS65910
>>            chip family.
>>
>> +config GPIO_TPS65912
>> +       tristate "TI TPS65912 GPIO"
>> +       depends on MFD_TPS65912
>> +       help
>> +         This driver supports TPS65912 gpio chip
>> +
>>   config GPIO_TWL4030
>>          tristate "TWL4030, TWL5030, and TPS659x0 GPIOs"
>>          depends on TWL4030_CORE
>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> index 605bf89..f79a7c4 100644
>> --- a/drivers/gpio/Makefile
>> +++ b/drivers/gpio/Makefile
>> @@ -96,6 +96,7 @@ obj-$(CONFIG_GPIO_TIMBERDALE) += gpio-timberdale.o
>>   obj-$(CONFIG_GPIO_PALMAS)      += gpio-palmas.o
>>   obj-$(CONFIG_GPIO_TPS6586X)    += gpio-tps6586x.o
>>   obj-$(CONFIG_GPIO_TPS65910)    += gpio-tps65910.o
>> +obj-$(CONFIG_GPIO_TPS65912)    += gpio-tps65912.o
>>   obj-$(CONFIG_GPIO_TS5500)      += gpio-ts5500.o
>>   obj-$(CONFIG_GPIO_TWL4030)     += gpio-twl4030.o
>>   obj-$(CONFIG_GPIO_TWL6040)     += gpio-twl6040.o
>> diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
>> new file mode 100644
>> index 0000000..4707e62
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-tps65912.c
>> @@ -0,0 +1,138 @@
>> +/*
>> + * TI TPS65912x GPIO Driver
>> + *
>> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
>> + *
>> + * Author: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether expressed or implied; without even the implied warranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License version 2 for more details.
>> + *
>> + * Based on the Arizona GPIO driver and the previous TPS65912 driver by
>> + * Margarita Olaya Cabrera <magi-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
>> + */
>> +
>> +#include <linux/gpio.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +
>> +#include <linux/mfd/tps65912.h>
>> +
>> +struct tps65912_gpio {
>> +       struct tps65912 *tps;
>> +       struct gpio_chip gpio_chip;
>
> Nit: I'd suggest to put gpio_chip as the first member of your struct
> so that to_gpio() resolves to the same address. This may make the
> generated code neglectably smaller and faster.
>

ACK

>> +};
>> +
>> +#define to_gpio(gc) container_of(gc, struct tps65912_gpio, gpio_chip)
>
> Nit2: Maybe a more specific name (like tps_gpio()) would be better?
> It's local to this file though, so not a big deal.
>

ACK

>> +
>> +static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
>> +{
>> +       struct tps65912_gpio *gpio = to_gpio(gc);
>> +       int ret, val;
>> +
>> +       ret = regmap_read(gpio->tps->regmap, TPS65912_GPIO1 + offset, &val);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       return val & GPIO_STS_MASK;
>> +}
>> +
>> +static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
>> +                             int value)
>> +{
>> +       struct tps65912_gpio *gpio = to_gpio(gc);
>> +
>> +       regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
>> +                          GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
>> +}
>> +
>> +static int tps65912_gpio_output(struct gpio_chip *gc, unsigned offset,
>> +                               int value)
>> +{
>> +       struct tps65912_gpio *gpio = to_gpio(gc);
>> +
>> +       /* Set the initial value */
>> +       tps65912_gpio_set(gc, offset, value);
>> +
>> +       return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
>> +                                 GPIO_CFG_MASK, GPIO_CFG_MASK);
>> +}
>> +
>> +static int tps65912_gpio_input(struct gpio_chip *gc, unsigned offset)
>> +{
>> +       struct tps65912_gpio *gpio = to_gpio(gc);
>> +
>> +       return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
>> +                                 GPIO_CFG_MASK, 0);
>> +}
>> +
>> +static const struct of_device_id tps65912_gpio_of_match_table[] = {
>> +       { .compatible = "ti,tps65912-gpio", },
>> +       { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, tps65912_gpio_of_match_table);
>> +
>> +static struct gpio_chip template_chip = {
>> +       .label                  = "tps65912-gpio",
>> +       .owner                  = THIS_MODULE,
>> +       .direction_input        = tps65912_gpio_input,
>> +       .direction_output       = tps65912_gpio_output,
>> +       .get                    = tps65912_gpio_get,
>> +       .set                    = tps65912_gpio_set,
>> +       .can_sleep              = true,
>> +       .ngpio                  = 5,
>> +       .base                   = -1,
>> +};
>> +
>> +static int tps65912_gpio_probe(struct platform_device *pdev)
>> +{
>> +       struct tps65912_gpio *gpio;
>> +       int ret;
>> +
>> +       gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>> +       if (!gpio)
>> +               return -ENOMEM;
>> +
>> +       gpio->tps = dev_get_drvdata(pdev->dev.parent);
>> +       gpio->gpio_chip = template_chip;
>> +       ret = gpiochip_add(&gpio->gpio_chip);
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       platform_set_drvdata(pdev, gpio);
>> +
>> +       return 0;
>> +}
>> +
>> +static int tps65912_gpio_remove(struct platform_device *pdev)
>> +{
>> +       struct tps65912_gpio *gpio = platform_get_drvdata(pdev);
>> +
>> +       gpiochip_remove(&gpio->gpio_chip);
>> +
>> +       return 0;
>> +}
>> +
>> +static struct platform_driver tps65912_gpio_driver = {
>> +       .driver = {
>> +               .name = "tps65912-gpio",
>> +               .of_match_table = tps65912_gpio_of_match_table,
>> +       },
>> +       .probe = tps65912_gpio_probe,
>> +       .remove = tps65912_gpio_remove,
>> +};
>> +
>> +module_platform_driver(tps65912_gpio_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>");
>> +MODULE_DESCRIPTION("TPS65912 GPIO driver");
>> +MODULE_ALIAS("platform:tps65912-gpio");
>> +MODULE_LICENSE("GPL v2");
>
> Nice and simple driver - my remarks above should not be taken as a
> call to re-spin, just consider them if you need to send another
> version of this patchset.
>
> Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>

I'm going to have to send another spin of this patchset anyway so I'll
take them.

Thanks for the review,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
