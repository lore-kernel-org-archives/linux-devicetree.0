From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 2/2] reset: Add basic single-register reset driver
Date: Mon, 29 May 2017 19:54:56 +0930
Message-ID: <CACPK8XeZEY6yVpf=Awmzju+W74-+4sRAQL3LK0nX9iN4_MrcKQ@mail.gmail.com>
References: <20170526033214.8081-1-joel@jms.id.au> <20170526033214.8081-3-joel@jms.id.au>
 <CAHp75VdXHnyTDJqZ8D+OxbrAXYQE+-sfTzYvfoo8FCe0SS35PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdXHnyTDJqZ8D+OxbrAXYQE+-sfTzYvfoo8FCe0SS35PA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Sun, May 28, 2017 at 12:41 AM, Andy Shevchenko
<andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, May 26, 2017 at 6:32 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
>> This driver is a basic single-register reset controller driver that
>> supports clearing a single bit in a register.
>>
>
> While this makes sense, I'm wondering if there can be generic
> interface for this from which we can derive this one and GPIO-based
> one.

Do we have a GPIO based one already? I couldn't find it.

Having a think, it would be a very similar looking driver, but with
little shared code. The context struct would contain a gpio pointer
instead of regmap, probe would request a GPIO instead of a regmap and
the assert/deassert/status callbacks would be gpiod_ calls.

Given this is four of the four functions in this driver, do you think would be
better off with two small drivers?

Cheers,

Joel

>
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> ---
>>  drivers/reset/Kconfig       |   6 +++
>>  drivers/reset/Makefile      |   1 +
>>  drivers/reset/reset-basic.c | 109 ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 116 insertions(+)
>>  create mode 100644 drivers/reset/reset-basic.c
>>
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index d21c07ccc94e..980cda887dfe 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -28,6 +28,12 @@ config RESET_ATH79
>>           This enables the ATH79 reset controller driver that supports the
>>           AR71xx SoC reset controller.
>>
>> +config RESET_BASIC
>> +       bool "Basic Reset Driver"
>> +       help
>> +         This enables a basic single-register reset controller driver that
>> +         supports clearing a single bit in a register.
>> +
>>  config RESET_BERLIN
>>         bool "Berlin Reset Driver" if COMPILE_TEST
>>         default ARCH_BERLIN
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 02a74db94339..e8e8869e098d 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -4,6 +4,7 @@ obj-$(CONFIG_ARCH_STI) += sti/
>>  obj-$(CONFIG_ARCH_TEGRA) += tegra/
>>  obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
>>  obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
>> +obj-$(CONFIG_RESET_BASIC) += reset-basic.o
>>  obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
>>  obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>>  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>> diff --git a/drivers/reset/reset-basic.c b/drivers/reset/reset-basic.c
>> new file mode 100644
>> index 000000000000..62a676de9f62
>> --- /dev/null
>> +++ b/drivers/reset/reset-basic.c
>> @@ -0,0 +1,109 @@
>> +/*
>> + * Copyright 2017 IBM Corperation
>> + *
>> + * Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/init.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/reset-controller.h>
>> +
>> +#define to_basic_reset_priv(p)         \
>> +       container_of((p), struct basic_reset_priv, rcdev)
>> +
>> +struct basic_reset_priv {
>> +       struct regmap *regmap;
>> +       struct reset_controller_dev rcdev;
>> +       u32 reg;
>> +};
>> +
>> +static int basic_reset_assert(struct reset_controller_dev *rcdev,
>> +                              unsigned long id)
>> +{
>> +       struct basic_reset_priv *priv = to_basic_reset_priv(rcdev);
>> +       u32 mask = BIT(id);
>> +
>> +       regmap_update_bits(priv->regmap, priv->reg, mask, mask);
>> +
>> +       return 0;
>> +}
>> +
>> +static int basic_reset_deassert(struct reset_controller_dev *rcdev,
>> +                                unsigned long id)
>> +{
>> +       struct basic_reset_priv *priv = to_basic_reset_priv(rcdev);
>> +       u32 mask = BIT(id);
>> +
>> +       regmap_update_bits(priv->regmap, priv->reg, mask, 0);
>> +
>> +       return 0;
>> +}
>> +
>> +static int basic_reset_status(struct reset_controller_dev *rcdev,
>> +                              unsigned long id)
>> +{
>> +       struct basic_reset_priv *priv = to_basic_reset_priv(rcdev);
>> +       u32 mask = BIT(id);
>> +       u32 val;
>> +
>> +       regmap_read(priv->regmap, priv->reg, &val);
>> +
>> +       return !!(val & mask);
>> +}
>> +
>> +static const struct reset_control_ops basic_reset_ops = {
>> +       .assert = basic_reset_assert,
>> +       .deassert = basic_reset_deassert,
>> +       .status = basic_reset_status,
>> +};
>> +
>> +static int basic_reset_probe(struct platform_device *pdev)
>> +{
>> +       struct device_node *parent_np = of_get_parent(pdev->dev.of_node);
>> +       struct basic_reset_priv *priv;
>> +       int ret;
>> +
>> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +       if (!priv)
>> +               return -ENOMEM;
>> +
>> +       priv->regmap = syscon_node_to_regmap(parent_np);
>> +       of_node_put(parent_np);
>> +       if (IS_ERR(priv->regmap))
>> +               return PTR_ERR(priv->regmap);
>> +
>> +       ret = of_property_read_u32(pdev->dev.of_node, "reg", &priv->reg);
>> +       if (ret)
>> +               return ret;
>> +
>> +       priv->rcdev.owner = THIS_MODULE;
>> +       priv->rcdev.ops = &basic_reset_ops;
>> +       priv->rcdev.of_node = pdev->dev.of_node;
>> +       priv->rcdev.nr_resets = 32;
>> +
>> +       return reset_controller_register(&priv->rcdev);
>> +}
>> +
>> +static const struct of_device_id basic_reset_dt_match[] = {
>> +       { .compatible = "reset-basic" },
>> +       { },
>> +};
>> +
>> +static struct platform_driver basic_reset_driver = {
>> +       .probe  = basic_reset_probe,
>> +       .driver = {
>> +               .name = "basic-reset",
>> +               .of_match_table = basic_reset_dt_match,
>> +       },
>> +};
>> +builtin_platform_driver(basic_reset_driver);
>> --
>> 2.11.0
>>
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
