From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v7 5/5] regulator: RK808: Remove pdata from the regulator
Date: Mon, 1 Sep 2014 21:20:58 -0700
Message-ID: <CAD=FV=VdvPbpgLMZXZ0ADg8KxtqQPo5C8ismgbVnfxd7Oina7A@mail.gmail.com>
References: <1409562468-16586-1-git-send-email-zyw@rock-chips.com>
	<1409564835-18522-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409564835-18522-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor@chromium.>
List-Id: devicetree@vger.kernel.org

Chris,

On Mon, Sep 1, 2014 at 2:47 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> ---
>
> Changes in v7:
> - remove pdata struct from header file, add rk808_regulator struct
>
> Changes in v6:
> - remove the redundant code
>
> Changes in v5:
> - re-edit base on Mark's branch
>
> Changes in v4:
> - use &client->dev replace rk808->dev
>
> Changes in v3: None
> Changes in v2:
> Adviced by Mark Browm:
> - change of_find_node_by_name to find_child_by_name
> - use RK808_NUM_REGULATORS as the name of the constant
> - create a pdata when missing platform data
> - use the rk808_reg name to supply_regulator name
> - replace regulator_register with devm_regulator_register
> - some other problem with coding style
>
>  drivers/regulator/rk808-regulator.c |   52 ++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
> index 0d11df1..4d543a9 100644
> --- a/drivers/regulator/rk808-regulator.c
> +++ b/drivers/regulator/rk808-regulator.c
> @@ -3,9 +3,6 @@
>   *
>   * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
>   *
> - * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> - * Author: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> - *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
>   * version 2, as published by the Free Software Foundation.
> @@ -14,28 +11,25 @@
>   * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>   * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>   * more details.
> - *
>   */
>
>  #include <linux/module.h>
> -#include <linux/init.h>
>  #include <linux/i2c.h>
> -#include <linux/err.h>
> -#include <linux/platform_device.h>
>  #include <linux/mfd/rk808.h>
> -#include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/of_regulator.h>
> -#include <linux/regmap.h>
> -#include <linux/slab.h>
> -/*
> - * Field Definitions.
> - */
> +
> +/* Field Definitions */
>  #define RK808_BUCK_VSEL_MASK   0x3f
>  #define RK808_BUCK4_VSEL_MASK  0xf
>  #define RK808_LDO_VSEL_MASK    0x1f
>
> +struct rk808_regulator {
> +       struct regulator_init_data *rk808_init_data[RK808_NUM_REGULATORS];
> +       struct device_node *of_node[RK808_NUM_REGULATORS];
> +};
> +
>  static const int buck_set_vol_base_addr[] = {
>         RK808_BUCK1_ON_VSEL_REG,
>         RK808_BUCK2_ON_VSEL_REG,
> @@ -50,10 +44,6 @@ static const int buck_contr_base_addr[] = {
>         RK808_BUCK4_CONFIG_REG,
>  };
>
> -#define rk808_BUCK_SET_VOL_REG(x) (buck_set_vol_base_addr[x])
> -#define rk808_BUCK_CONTR_REG(x) (buck_contr_base_addr[x])
> -#define rk808_LDO_SET_VOL_REG(x) (ldo_set_vol_base_addr[x])
> -
>  static const int ldo_set_vol_base_addr[] = {
>         RK808_LDO1_ON_VSEL_REG,
>         RK808_LDO2_ON_VSEL_REG,
> @@ -65,9 +55,7 @@ static const int ldo_set_vol_base_addr[] = {
>         RK808_LDO8_ON_VSEL_REG,
>  };
>
> -/*
> - * rk808 voltage number
> - */
> +/* rk808 voltage number */
>  static const struct regulator_linear_range rk808_buck_voltage_ranges[] = {
>         REGULATOR_LINEAR_RANGE(700000, 0, 63, 12500),
>  };
> @@ -295,7 +283,7 @@ static struct of_regulator_match rk808_reg_matches[] = {
>  };
>
>  static int rk808_regulator_dts(struct i2c_client *client,
> -                              struct rk808_board *pdata)
> +                              struct rk808_regulator *rk808_regulator)
>  {
>         struct device_node *np, *reg_np;
>         int i, ret;
> @@ -323,8 +311,9 @@ static int rk808_regulator_dts(struct i2c_client *client,
>                     !rk808_reg_matches[i].of_node)
>                         continue;
>
> -               pdata->rk808_init_data[i] = rk808_reg_matches[i].init_data;
> -               pdata->of_node[i] = rk808_reg_matches[i].of_node;
> +               rk808_regulator->rk808_init_data[i] =
> +                               rk808_reg_matches[i].init_data;
> +               rk808_regulator->of_node[i] = rk808_reg_matches[i].of_node;
>         }
>
>         return 0;
> @@ -334,26 +323,25 @@ static int rk808_regulator_probe(struct platform_device *pdev)
>  {
>         struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
>         struct i2c_client *client = rk808->i2c;
> -       struct rk808_board *pdata = dev_get_platdata(&client->dev);
> +       struct rk808_regulator *rk808_regulator;
>         struct regulator_config config = {};
>         struct regulator_dev *rk808_rdev;
>         struct regulator_init_data *reg_data;
>         int i = 0;
>         int ret = 0;
>
> -       if (!pdata) {
> -               pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> -               if (!pdata)
> -                       return -ENOMEM;
> -       }
> +       rk808_regulator = devm_kzalloc(&pdev->dev, sizeof(*rk808_regulator),
> +                                      GFP_KERNEL);
> +       if (!rk808_regulator)
> +               return -ENOMEM;

Totally remove rk808_regulator_dts() function.  Totally remove
"rk808_regulator" local variable (and allocation, and typedef).  Then
you can just use "rk808_reg_matches" in the "for" loop in your probe
function, right?  You're going to get rid of a ton of code...

Remember, you can also remove the check about "client->dev.of_node".
You depend on OF...  Also it appears that "of_regulator_match" prints
an error for you in at least the common error case, so I think you can
get rid of "failed to parse regulator data: %d\n" printout.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
