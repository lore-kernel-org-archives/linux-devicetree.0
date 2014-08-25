From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 5/5] Clk: RK808: Add clkout driver for RK808
Date: Sun, 24 Aug 2014 21:04:24 -0700
Message-ID: <CAD=FV=VKyBHyfOqSTYU89YU74K4Ck6cvFFxJ=WsSFFPW-TzujA@mail.gmail.com>
References: <1408792024-17367-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408792024-17367-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao@chr>
List-Id: devicetree@vger.kernel.org

Chris,

On Sat, Aug 23, 2014 at 4:07 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> ---
>
> Changes in v4:

Wait, is this v4 or v3?  The subject line still says v3, which is confusing.


> Advices by Doug
> - add a "#clock-cells" propertiy
> - update the example
>
> Changes in v3: None
> Changes in v2: None
>
>  drivers/clk/Kconfig                        |    9 ++
>  drivers/clk/Makefile                       |    1 +
>  drivers/clk/clk-rk808.c                    |  162 ++++++++++++++++++++++++++++
>  include/dt-bindings/clock/rockchip,rk808.h |   11 ++
>  4 files changed, 183 insertions(+)
>  create mode 100644 drivers/clk/clk-rk808.c
>  create mode 100644 include/dt-bindings/clock/rockchip,rk808.h
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index cfd3af7..84e0590 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -38,6 +38,15 @@ config COMMON_CLK_MAX77686
>         ---help---
>           This driver supports Maxim 77686 crystal oscillator clock.
>
> +config COMMON_CLK_RK808
> +       tristate "Clock driver for RK808"
> +       depends on MFD_RK808
> +       ---help---
> +         This driver supports RK808 crystal oscillator clock. These
> +         multi-function devices have two fixed-rate oscillators,
> +         clocked at 32KHz each. Clkout1 is always on, Clkout2 can off
> +         by control register.
> +
>  config COMMON_CLK_SI5351
>         tristate "Clock driver for SiLabs 5351A/B/C"
>         depends on I2C
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f537a0b..99f53d5 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_ARCH_NOMADIK)            += clk-nomadik.o
>  obj-$(CONFIG_ARCH_NSPIRE)              += clk-nspire.o
>  obj-$(CONFIG_COMMON_CLK_PALMAS)                += clk-palmas.o
>  obj-$(CONFIG_CLK_PPC_CORENET)          += clk-ppc-corenet.o
> +obj-$(CONFIG_COMMON_CLK_RK808)         += clk-rk808.o
>  obj-$(CONFIG_COMMON_CLK_S2MPS11)       += clk-s2mps11.o
>  obj-$(CONFIG_COMMON_CLK_SI5351)                += clk-si5351.o
>  obj-$(CONFIG_COMMON_CLK_SI570)         += clk-si570.o
> diff --git a/drivers/clk/clk-rk808.c b/drivers/clk/clk-rk808.c
> new file mode 100644
> index 0000000..50a25fc
> --- /dev/null
> +++ b/drivers/clk/clk-rk808.c
> @@ -0,0 +1,162 @@
> +/*
> + * Clkout driver for Rockchip RK808
> + *
> + * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
> + *
> + * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> + * Author: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

You have author below.  Why is it here, too?


> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/rk808.h>
> +#include <linux/i2c.h>
> +
> +struct rk808_clkout {
> +       struct rk808 *rk808;
> +       struct clk_onecell_data clk_data;
> +       struct clk_hw           clkout1_hw;
> +       struct clk_hw           clkout2_hw;
> +};
> +
> +static unsigned long rk808_clkout_recalc_rate(struct clk_hw *hw,
> +                                             unsigned long parent_rate)
> +{
> +       return 32768;
> +}
> +
> +static int rk808_clkout1_is_prepared(struct clk_hw *hw)
> +{
> +       return 1;
> +}
> +
> +static int rk808_clkout2_control(struct clk_hw *hw, bool enable)
> +{
> +       struct rk808_clkout *rk808_clkout = container_of(hw,
> +                                                        struct rk808_clkout,
> +                                                        clkout2_hw);
> +       struct rk808 *rk808 = rk808_clkout->rk808;
> +
> +       return regmap_update_bits(rk808->regmap, RK808_CLK32OUT_REG,
> +                                 CLK32KOUT2_EN, enable ? CLK32KOUT2_EN : 0);
> +}
> +
> +static int rk808_clkout2_prepare(struct clk_hw *hw)
> +{
> +       return rk808_clkout2_control(hw, 1);
> +}
> +
> +static void rk808_clkout2_unprepare(struct clk_hw *hw)
> +{
> +       rk808_clkout2_control(hw, 0);
> +}
> +
> +static int rk808_clkout2_is_prepared(struct clk_hw *hw)
> +{
> +       struct rk808_clkout *rk808_clkout = container_of(hw,
> +                                                        struct rk808_clkout,
> +                                                        clkout2_hw);
> +       struct rk808 *rk808 = rk808_clkout->rk808;
> +       uint32_t val;
> +
> +       int ret = regmap_read(rk808->regmap, RK808_CLK32OUT_REG, &val);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       return (val & CLK32KOUT2_EN) ? 1 : 0;
> +}
> +
> +static const struct clk_ops rk808_clkout1_ops = {
> +       .is_prepared = rk808_clkout1_is_prepared,
> +       .recalc_rate = rk808_clkout_recalc_rate,
> +};
> +
> +static const struct clk_ops rk808_clkout2_ops = {
> +       .prepare = rk808_clkout2_prepare,
> +       .unprepare = rk808_clkout2_unprepare,
> +       .is_prepared = rk808_clkout2_is_prepared,
> +       .recalc_rate = rk808_clkout_recalc_rate,
> +};
> +
> +static int rk808_clkout_probe(struct platform_device *pdev)
> +{
> +       struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
> +       struct i2c_client *client = rk808->i2c;
> +       struct device_node *node = client->dev.of_node;
> +       struct clk_init_data init;

Seems safer to have "= {};" here.  Looks like you're initting
everything, but still...


> +       struct clk **clk_table;
> +       struct rk808_clkout *rk808_clkout;
> +
> +       rk808_clkout = devm_kzalloc(&client->dev,
> +                                   sizeof(*rk808_clkout), GFP_KERNEL);
> +       if (!rk808_clkout)
> +               return -ENOMEM;
> +
> +       rk808_clkout->rk808 = rk808;
> +
> +       clk_table = devm_kzalloc(&client->dev,
> +                                2*sizeof(struct clk *), GFP_KERNEL);
> +       if (!clk_table)
> +               return -ENOMEM;
> +
> +       init.flags = CLK_IS_ROOT;
> +       init.parent_names = NULL;
> +       init.num_parents = 0;
> +       init.name = "rk808-clkout1";
> +       init.ops = &rk808_clkout1_ops;
> +       rk808_clkout->clkout1_hw.init = &init;
> +
> +       /* optional override of the clockname */
> +       of_property_read_string_index(node, "clock-output-names",
> +                                     0, &init.name);
> +
> +       clk_table[0] = devm_clk_register(&client->dev,
> +                                        &rk808_clkout->clkout1_hw);

Check for error value here?


> +
> +       init.name = "rk808-clkout2";
> +       init.ops = &rk808_clkout2_ops;
> +       rk808_clkout->clkout2_hw.init = &init;
> +
> +       /* optional override of the clockname */
> +       of_property_read_string_index(node, "clock-output-names",
> +                                     1, &init.name);
> +
> +       clk_table[1] = devm_clk_register(&client->dev,
> +                                        &rk808_clkout->clkout2_hw);

Check for error here?


> +
> +       rk808_clkout->clk_data.clks = clk_table;
> +       rk808_clkout->clk_data.clk_num = 2;
> +       of_clk_add_provider(node, of_clk_src_onecell_get, clk_table);

Return the result of of_clk_add_provider() since it returns an error.


> +
> +       return 0;
> +}
> +
> +static struct platform_driver rk808_clkout_driver = {
> +       .probe = rk808_clkout_probe,
> +       .driver         = {
> +               .name   = "rk808-clkout",
> +               .owner  = THIS_MODULE,
> +       },
> +};
> +
> +module_platform_driver(rk808_clkout_driver);

I have this feeling that we're going to want this to be
subsys_initcall() because it's such a core component and that will
mean the MFD will need to be subsys_initcall() and that will mean that
the i2c needs to be subsys_initcall().  ...but then everyone will yell
that everything in the system is supposed to be module-level.  ...so I
guess we'll just leave it as module_platform_driver() for now...


> +MODULE_DESCRIPTION("Clkout driver for the rk808 series PMICs");
> +MODULE_AUTHOR("Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> +MODULE_AUTHOR("Zhang Qing <zhanqging-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:rk808-clkout");
> diff --git a/include/dt-bindings/clock/rockchip,rk808.h b/include/dt-bindings/clock/rockchip,rk808.h

The "include/dt-bindings/clock/rockchip,rk808.h" file belongs in the
first patch.  It's part of the dt-bindings...


> new file mode 100644
> index 0000000..1a87343
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk808.h
> @@ -0,0 +1,11 @@
> +/*
> + * This header provides constants clk index RK808 pmic clkout
> + */
> +#ifndef _CLK_ROCKCHIP_RK808
> +#define _CLK_ROCKCHIP_RK808
> +
> +/* CLOCKOUT index */
> +#define RK808_CLKOUT0          0
> +#define RK808_CLKOUT1          1
> +
> +#endif
> --
> 1.7.9.5
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
