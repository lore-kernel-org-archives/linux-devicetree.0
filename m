From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 2/2] clk: max77620: Add clock driver for MAX77620/MAX20024
Date: Fri, 10 Jun 2016 09:20:44 -0400
Message-ID: <CABxcv=mrmN5Mzt595ZFgGbOoHJWQMwQ1wiCvcHEiWh_79EbJqQ@mail.gmail.com>
References: <1465553536-23838-1-git-send-email-ldewangan@nvidia.com>
	<1465553536-23838-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1465553536-23838-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Laxman,

On Fri, Jun 10, 2016 at 6:12 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> MAXIM MAX77620 is the power management IC with multiple DCDC/LDO(
> regulators, RTC, GPIOs, Watchdog, 32KHz clock source etc.
>
> Add support for controlling the 32KHz clock source via clock
> framework.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---

It looks very similar to the max77686 and max77802 drivers (with only
the difference in number of clock outputs), can you use the helpers in
drivers/clk/clk-max-gen.c ?

>  drivers/clk/Kconfig        |   9 +++
>  drivers/clk/Makefile       |   1 +
>  drivers/clk/clk-max77620.c | 143 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 153 insertions(+)
>  create mode 100644 drivers/clk/clk-max77620.c
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 98efbfc..149f813 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -34,6 +34,15 @@ source "drivers/clk/versatile/Kconfig"
>  config COMMON_CLK_MAX_GEN
>          bool
>
> +config COMMON_CLK_MAX77620
> +       tristate "Clock driver for Maxim 77620/MAX20024 MFD"
> +       depends on MFD_MAX77620
> +       ---help---
> +         This driver supports Maxim MAX77620/MAX20024 32KHz crystal
> +         oscillator. These multi-function devices have one fixed rate.
> +         The clock can be ON and OFF. Say y to make this driver as
> +         built-in and m to make it as module.
> +
>  config COMMON_CLK_MAX77686
>         tristate "Clock driver for Maxim 77686 MFD"
>         depends on MFD_MAX77686
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index dcc5e69..8c2de43 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_ARCH_CLPS711X)           += clk-clps711x.o
>  obj-$(CONFIG_ARCH_EFM32)               += clk-efm32gg.o
>  obj-$(CONFIG_ARCH_HIGHBANK)            += clk-highbank.o
>  obj-$(CONFIG_MACH_LOONGSON32)          += clk-ls1x.o
> +obj-$(CONFIG_COMMON_CLK_MAX77620)      += clk-max77620.o
>  obj-$(CONFIG_COMMON_CLK_MAX_GEN)       += clk-max-gen.o
>  obj-$(CONFIG_COMMON_CLK_MAX77686)      += clk-max77686.o
>  obj-$(CONFIG_COMMON_CLK_MAX77802)      += clk-max77802.o
> diff --git a/drivers/clk/clk-max77620.c b/drivers/clk/clk-max77620.c
> new file mode 100644
> index 0000000..615cf2e
> --- /dev/null
> +++ b/drivers/clk/clk-max77620.c
> @@ -0,0 +1,143 @@
> +/*
> + * Clock driver for Maxim Max77620 device.
> + *
> + * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mfd/max77620.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +struct max77620_clks_info {
> +       struct device *dev;
> +       struct regmap *rmap;
> +       struct clk *clk;
> +       struct clk_hw hw;
> +};
> +
> +static struct max77620_clks_info *to_max77620_clks_info(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct max77620_clks_info, hw);
> +}
> +
> +static unsigned long max77620_clks_recalc_rate(struct clk_hw *hw,
> +                                              unsigned long parent_rate)
> +{
> +       return 32768;
> +}
> +
> +static int max77620_clks_prepare(struct clk_hw *hw)
> +{
> +       struct max77620_clks_info *mci = to_max77620_clks_info(hw);
> +
> +       return regmap_update_bits(mci->rmap, MAX77620_REG_CNFG1_32K,
> +                                 MAX77620_CNFG1_32K_OUT0_EN,
> +                                 MAX77620_CNFG1_32K_OUT0_EN);
> +}
> +
> +static void max77620_clks_unprepare(struct clk_hw *hw)
> +{
> +       struct max77620_clks_info *mci = to_max77620_clks_info(hw);
> +
> +       regmap_update_bits(mci->rmap, MAX77620_REG_CNFG1_32K,
> +                          MAX77620_CNFG1_32K_OUT0_EN, 0);
> +}
> +
> +static int max77620_clks_is_prepared(struct clk_hw *hw)
> +{
> +       struct max77620_clks_info *mci = to_max77620_clks_info(hw);
> +       unsigned int rval;
> +       int ret;
> +
> +       ret = regmap_read(mci->rmap, MAX77620_REG_CNFG1_32K, &rval);
> +       if (ret < 0)
> +               return ret;
> +
> +       return !!(rval & MAX77620_CNFG1_32K_OUT0_EN);
> +}
> +
> +static struct clk_ops max77620_clks_ops = {
> +       .prepare        = max77620_clks_prepare,
> +       .unprepare      = max77620_clks_unprepare,
> +       .is_prepared    = max77620_clks_is_prepared,
> +       .recalc_rate    = max77620_clks_recalc_rate,
> +};
> +
> +struct clk_init_data max77620_clk_init_data = {
> +       .name = "clk-32k",
> +       .ops = &max77620_clks_ops,
> +       .flags = CLK_IGNORE_UNUSED,
> +};
> +

Is really needed to ignore this clock if unused? Consumers should
define this clock and enable if needed.

> +static int max77620_clks_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np = pdev->dev.parent->of_node;
> +       struct max77620_clks_info *mci;
> +       struct clk *clk;
> +       int ret;
> +
> +       mci = devm_kzalloc(&pdev->dev, sizeof(*mci), GFP_KERNEL);
> +       if (!mci)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, mci);
> +
> +       mci->dev = &pdev->dev;
> +       mci->rmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!mci->rmap) {
> +               dev_err(mci->dev, "Failed to get parent regmap\n");
> +               return -ENODEV;
> +       }
> +       mci->hw.init = &max77620_clk_init_data;
> +
> +       clk = devm_clk_register(&pdev->dev, &mci->hw);
> +       if (IS_ERR(clk)) {
> +               ret = PTR_ERR(clk);
> +               dev_err(mci->dev, "Fail to register clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       mci->clk = clk;
> +       ret = of_clk_add_provider(np, of_clk_src_simple_get, mci->clk);
> +       if (ret < 0)
> +               dev_err(&pdev->dev, "Fail to add clock driver, %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int max77620_clks_remove(struct platform_device *pdev)
> +{
> +       of_clk_del_provider(pdev->dev.parent->of_node);
> +
> +       return 0;
> +}
> +
> +static struct platform_device_id max77620_clks_devtype[] = {
> +       { .name = "max77620-clock", },
> +       {},
> +};
> +

Your Kconfig symbol is tristate so the driver can be built as a module
but autoload will not work because the driver is not exporting a
module alias.

IOW, you need MODULE_DEVICE_TABLE(platform, max77620_clks_devtype) here.

> +static struct platform_driver max77620_clks_driver = {
> +       .driver = {
> +               .name = "max77620-clock",
> +       },
> +       .probe = max77620_clks_probe,
> +       .remove = max77620_clks_remove,
> +       .id_table = max77620_clks_devtype,
> +};
> +
> +module_platform_driver(max77620_clks_driver);
> +
> +MODULE_DESCRIPTION("Clock driver for Maxim max77620 PMIC Device");
> +MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
