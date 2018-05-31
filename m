From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 5/6] clk: bd71837: Add driver for BD71837 PMIC clock
Date: Thu, 31 May 2018 08:10:39 -0700
Message-ID: <152777943977.144038.10971658990200651749@swboyd.mtv.corp.google.com>
References: <cover.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <3d9d7239331c30826a237ae55db28d918155d504.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3d9d7239331c30826a237ae55db28d918155d504.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, broonie@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com, mark.rutland@arm.com, mazziesaccount@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Quoting Matti Vaittinen (2018-05-30 01:43:19)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 41492e980ef4..4b045699bb5e 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -279,6 +279,15 @@ config COMMON_CLK_STM32H7
>         ---help---
>           Support for stm32h7 SoC family clocks
>  =

> +config COMMON_CLK_BD71837
> +       tristate "Clock driver for ROHM BD71837 PMIC MFD"
> +       depends on MFD_BD71837
> +       depends on I2C=3Dy

Why depend on I2C=3Dy?

> +       depends on OF

Why depend on OF?

> +       help
> +         This driver supports ROHM BD71837 PMIC clock.
> +
> +
>  source "drivers/clk/bcm/Kconfig"
>  source "drivers/clk/hisilicon/Kconfig"
>  source "drivers/clk/imgtec/Kconfig"
> diff --git a/drivers/clk/clk-bd71837.c b/drivers/clk/clk-bd71837.c
> new file mode 100644
> index 000000000000..91456d1077ac
> --- /dev/null
> +++ b/drivers/clk/clk-bd71837.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2018 ROHM Semiconductors
> +// bd71837.c  -- ROHM BD71837MWV clock driver
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/mfd/bd71837.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +
> +static int bd71837_clk_enable(struct clk_hw *hw);
> +static void bd71837_clk_disable(struct clk_hw *hw);
> +static int bd71837_clk_is_enabled(struct clk_hw *hw);
> +
> +struct bd71837_clk {
> +       struct clk_hw hw;
> +       uint8_t reg;
> +       uint8_t mask;
> +       unsigned long rate;
> +       struct platform_device *pdev;
> +       struct bd71837 *mfd;
> +};
> +
> +static unsigned long bd71837_clk_recalc_rate(struct clk_hw *hw,
> +                                            unsigned long parent_rate);
> +
> +static const struct clk_ops bd71837_clk_ops =3D {
> +       .recalc_rate =3D &bd71837_clk_recalc_rate,
> +       .prepare =3D &bd71837_clk_enable,
> +       .unprepare =3D &bd71837_clk_disable,
> +       .is_prepared =3D &bd71837_clk_is_enabled,
> +};

Move this structure after the function definitions. And drop the forward
declared functions.

> +
> +static int bd71837_clk_set(struct clk_hw *hw, int status)
> +{
> +       struct bd71837_clk *c =3D container_of(hw, struct bd71837_clk, hw=
);
> +
> +       return bd71837_update_bits(c->mfd, c->reg, c->mask, status);
> +}
> +
> +static void bd71837_clk_disable(struct clk_hw *hw)
> +{
> +       int rv;
> +       struct bd71837_clk *c =3D container_of(hw, struct bd71837_clk, hw=
);
> +
> +       rv =3D bd71837_clk_set(hw, 0);
> +       if (rv)
> +               dev_err(&c->pdev->dev, "Failed to disable 32K clk (%d)\n"=
, rv);

Why is a disable error message more important than an enable error
message?  Please drop this message and rely on callers to indicate if
enabling their clk didn't work for some reason.

> +}
> +
> +static int bd71837_clk_enable(struct clk_hw *hw)
> +{
> +       return bd71837_clk_set(hw, 1);
> +}
> +
> +static int bd71837_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct bd71837_clk *c =3D container_of(hw, struct bd71837_clk, hw=
);
> +
> +       return c->mask & bd71837_reg_read(c->mfd, c->reg);

Please put this on two or more lines so we know what the type of
bd71837_reg_read() returns:

	u32 reg =3D bd71837_reg_read(....)

	return c->mask & reg;


> +}
> +
> +static unsigned long bd71837_clk_recalc_rate(struct clk_hw *hw,
> +                                            unsigned long parent_rate)
> +{
> +       struct bd71837_clk *c =3D container_of(hw, struct bd71837_clk, hw=
);
> +
> +       return c->rate;

Recalc rate should read the hardware instead of returning a cached rate
unless it can't actually read hardware.

> +}
> +
> +static int bd71837_clk_probe(struct platform_device *pdev)
> +{
> +       struct bd71837_clk *c;
> +       int rval =3D -ENOMEM;
> +       struct bd71837 *mfd =3D dev_get_drvdata(pdev->dev.parent);
> +       const char *errstr =3D "memory allocation for bd71837 data failed=
";

We don't need allocation error messages.

> +       struct clk_init_data init =3D {
> +               .name =3D "bd71837-32k-out",
> +               .ops =3D &bd71837_clk_ops,
> +       };
> +
> +       c =3D kzalloc(sizeof(struct bd71837_clk), GFP_KERNEL);

Use sizeof(*c) instead so we don't have to worry about type mismatches.

> +       if (!c)
> +               goto err_out;
> +
> +       c->reg =3D BD71837_REG_OUT32K;
> +       c->mask =3D BD71837_OUT32K_EN;
> +       c->rate =3D BD71837_CLK_RATE;

Is the plan to have more clks supported by this driver in the future?
Because right now it seems to make a structure up and then hardcode the
members for a single clk so I'm not sure why those registers aren't just
hardcoded in the clk_ops functions that use them.

> +       c->mfd =3D mfd;
> +       c->pdev =3D pdev;
> +
> +       if (pdev->dev.of_node)

If there isn't an of_node it would be NULL, and then calling the
function below would cause it to not update the init name? Seems like it
could be called unconditionally.

> +               of_property_read_string_index(pdev->dev.of_node,
> +                                             "clock-output-names", 0,
> +                                             &init.name);
> +
> +       c->hw.init =3D &init;
> +
> +       errstr =3D "failed to register 32K clk";

The 'errstr' thing is not standard. Please just call dev_err() directly
with the string you want to print. And consider not printing anything at
all.

> +       rval =3D clk_hw_register(&pdev->dev, &c->hw);
> +       if (rval)
> +               goto err_free;
> +
> +       errstr =3D "failed to register clkdev for bd71837";
> +       rval =3D clk_hw_register_clkdev(&c->hw, init.name, NULL);

Are you using the clkdev lookup? Or this is just added for backup
purposes? If this is a mostly DT driver then please drop this part of
the patch and rely on of_clk_hw_add_provider() to handle the lookup
instead.

> +       if (rval)
> +               goto err_unregister;
> +
> +       platform_set_drvdata(pdev, c);
> +       dev_dbg(&pdev->dev, "bd71837_clk successfully probed\n");

There's a pr_debug() in really_probe() for this.

> +
> +       return 0;
> +
> +err_unregister:
> +       clk_hw_unregister(&c->hw);
> +err_free:
> +       kfree(c);
> +err_out:
> +       dev_err(&pdev->dev, "%s\n", errstr);
> +       return rval;
> +}
> +
> +static int bd71837_clk_remove(struct platform_device *pdev)
> +{
> +       struct bd71837_clk *c =3D platform_get_drvdata(pdev);
> +
> +       if (c) {
> +               clk_hw_unregister(&c->hw);

Use devm to register clks.

> +               kfree(c);

and devm_kzalloc()

> +               platform_set_drvdata(pdev, NULL);

This doesn't need to be done. Drop it.

> +       }
> +       return 0;
> +}
> +
