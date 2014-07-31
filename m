From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Thu, 31 Jul 2014 15:26:59 +0300
Message-ID: <53DA3613.9010305@ti.com>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de> <1406728949-7560-3-git-send-email-sassmann@kpanic.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406728949-7560-3-git-send-email-sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/30/2014 05:02 PM, Stefan Assmann wrote:
> Adding a clock driver for the TI TWL6030. The driver prepares the
> CLK32KG clock, which is required for the wireless LAN.
>=20
> Signed-off-by: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/ti/twl6030.txt       |   4 +
>  drivers/clk/Kconfig                                |   7 +
>  drivers/clk/ti/Makefile                            |   1 +
>  drivers/clk/ti/clk-6030.c                          | 141 +++++++++++=
++++++++++
>  drivers/mfd/twl-core.c                             |   3 +
>  5 files changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/twl603=
0.txt
>  create mode 100644 drivers/clk/ti/clk-6030.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/ti/twl6030.txt b=
/Documentation/devicetree/bindings/clock/ti/twl6030.txt
> new file mode 100644
> index 0000000..d290ad4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/twl6030.txt
> @@ -0,0 +1,4 @@
> +Binding for TI TWL6030.
> +
> +Required properties:
> +- compatible: "ti,twl6030-clk32kg"


This is not really helping out. Where would you put this compatible? Ho=
w it is
related to twl6030?

> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 9f9c5ae..4e89e8b 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -65,6 +65,13 @@ config COMMON_CLK_S2MPS11
>  	  clock. These multi-function devices have two (S2MPS14) or three
>  	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
> =20
> +config CLK_TWL6030
> +	tristate "Clock driver for twl6030"
> +	depends on TWL4030_CORE
> +	---help---
> +	  Enable the TWL6030 clock CLK32KG which is disabled by default.
> +	  Needed on the Pandaboard for the wireless LAN.

This is not relevant information. I'm sure the CLK32KG from twl6030 can=
 be or
is used for other purposes on other boards.

> +
>  config CLK_TWL6040
>  	tristate "External McPDM functional clock from twl6040"
>  	depends on TWL6040_CORE
> diff --git a/drivers/clk/ti/Makefile b/drivers/clk/ti/Makefile
> index ed4d0aa..04f25ea 100644
> --- a/drivers/clk/ti/Makefile
> +++ b/drivers/clk/ti/Makefile
> @@ -10,4 +10,5 @@ obj-$(CONFIG_SOC_OMAP5)			+=3D $(clk-common) clk-54=
xx.o
>  obj-$(CONFIG_SOC_DRA7XX)		+=3D $(clk-common) clk-7xx.o \
>  					   clk-dra7-atl.o
>  obj-$(CONFIG_SOC_AM43XX)		+=3D $(clk-common) clk-43xx.o
> +obj-$(CONFIG_CLK_TWL6030)		+=3D $(clk-common) clk-6030.o
>  endif
> diff --git a/drivers/clk/ti/clk-6030.c b/drivers/clk/ti/clk-6030.c
> new file mode 100644
> index 0000000..baa965b
> --- /dev/null
> +++ b/drivers/clk/ti/clk-6030.c
> @@ -0,0 +1,141 @@
> +/*
> + * drivers/clk/ti/clk-6030.c
> + *
> + *  Copyright (C) 2014 Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Clock driver for ti twl6030.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/i2c/twl.h>
> +#include <linux/platform_device.h>
> +
> +struct twl6030_desc {
> +	struct clk *clk;
> +	struct clk_hw hw;
> +	bool enabled;
> +};
> +
> +#define to_twl6030_desc(_hw) container_of(_hw, struct twl6030_desc, =
hw)
> +
> +static int twl6030_clk32kg_prepare(struct clk_hw *hw)
> +{
> +	struct twl6030_desc *desc =3D to_twl6030_desc(hw);
> +	int ret;
> +
> +	ret =3D twl_i2c_write_u8(TWL_MODULE_PM_RECEIVER,
> +			       TWL6030_GRP_CON << TWL6030_CFG_STATE_GRP_SHIFT |
> +			       TWL6030_CFG_STATE_ON,
> +			       TWL6030_PM_RECEIVER_CLK32KG_CFG_STATE);

What is going to happen if someone ask for this clock before the twl-co=
re is
initialized?


> +	if (ret =3D=3D 0)
> +		desc->enabled =3D true;
> +
> +	return ret;
> +}
> +void twl6030_clk32kg_unprepare(struct clk_hw *hw)
> +{
> +	struct twl6030_desc *desc =3D to_twl6030_desc(hw);
> +
> +	twl_i2c_write_u8(TWL_MODULE_PM_RECEIVER,
> +			 TWL6030_GRP_CON << TWL6030_CFG_STATE_GRP_SHIFT |
> +			 TWL6030_CFG_STATE_OFF,
> +			 TWL6030_PM_RECEIVER_CLK32KG_CFG_STATE);
> +	desc->enabled =3D false;
> +}
> +
> +static int twl6030_clk32kg_is_prepared(struct clk_hw *hw)
> +{
> +	struct twl6030_desc *desc =3D to_twl6030_desc(hw);
> +
> +	return desc->enabled;
> +}
> +
> +static const struct clk_ops twl6030_clk32kg_ops =3D {
> +	.prepare	=3D twl6030_clk32kg_prepare,
> +	.unprepare	=3D twl6030_clk32kg_unprepare,
> +	.is_prepared	=3D twl6030_clk32kg_is_prepared,
> +};
> +
> +static void __init of_ti_twl6030_clk32kg_setup(struct device_node *n=
ode)
> +{
> +	struct twl6030_desc *clk_hw =3D NULL;
> +	struct clk_init_data init =3D { 0 };
> +	struct clk_lookup *clookup;
> +	struct clk *clk;
> +
> +	clookup =3D kzalloc(sizeof(*clookup), GFP_KERNEL);
> +	if (!clookup) {
> +		pr_err("%s: could not allocate clookup\n", __func__);
> +		return;
> +	}
> +	clk_hw =3D kzalloc(sizeof(*clk_hw), GFP_KERNEL);
> +	if (!clk_hw) {
> +		pr_err("%s: could not allocate clk_hw\n", __func__);
> +		goto err_clk_hw;
> +	}
> +
> +	clk_hw->hw.init =3D &init;
> +
> +	init.name =3D node->name;
> +	init.ops =3D &twl6030_clk32kg_ops;
> +	init.flags =3D CLK_IS_ROOT;
> +
> +	clk =3D clk_register(NULL, &clk_hw->hw);
> +	if (!IS_ERR(clk)) {
> +		clookup->con_id =3D kstrdup("clk32kg", GFP_KERNEL);
> +		clookup->clk =3D clk;
> +		clkdev_add(clookup);
> +
> +		return;
> +	}
> +
> +	kfree(clookup);
> +err_clk_hw:
> +	kfree(clk_hw);
> +}
> +CLK_OF_DECLARE(of_ti_twl6030_clk32kg, "ti,twl6030-clk32kg", of_ti_tw=
l6030_clk32kg_setup);
> +
> +static int of_twl6030_clk32kg_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct clk *clk;
> +	int ret =3D 0;
> +
> +	if (!node)
> +		return -ENODEV;
> +
> +	clk =3D clk_get(&pdev->dev, "clk32kg");
> +	if (IS_ERR(clk))
> +		ret =3D -EPROBE_DEFER;
> +	else
> +		clk_prepare(clk);

Why would you do this? The point of a clock provider is that you can
enable/disable the clock on demand. Here you enable the clock and leave=
 it
enabled for the rest of the time...

clk-dra7-atl deals with similar issue

> +
> +	return ret;
> +}
> +
> +static struct of_device_id of_twl6030_clk32kg_match_tbl[] =3D {
> +	{ .compatible =3D "ti,twl6030-clk32kg", },

Hrm, not sure if this is correct. you have "ti,twl6030-clk32kg" as comp=
atible
for the platform driver _and_ you have the same "ti,twl6030-clk32kg"
compatible for the declared clock.
This does not seams right.

I think you should not have compatible for the platform driver at all, =
rather
you need to create the needed platform device in the twl-core to probe =
the
driver, then look up for the clock node.

I think in terms of HW setup the Palmas clock is the closest to twl6030=
's 32K
clocks. It might worth taking a look at that for hints. It is not using
CLK_OF_DECLARE() since it is external chip, but it does the job.


> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_twl6030_clk32kg_match_tbl);
> +
> +static struct platform_driver twl6030_clk_driver =3D {
> +	.driver =3D {
> +		.name =3D "twl6030-clk32kg",
> +		.owner =3D THIS_MODULE,
> +		.of_match_table =3D of_twl6030_clk32kg_match_tbl,
> +	},
> +	.probe =3D of_twl6030_clk32kg_probe,
> +};
> +module_platform_driver(twl6030_clk_driver);
> +
> +MODULE_AUTHOR("Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>");
> +MODULE_DESCRIPTION("clock driver for TI SoC based boards with twl603=
0");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index db11b4f..440fe4e 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -34,6 +34,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/err.h>
>  #include <linux/device.h>
>  #include <linux/of.h>
> @@ -1012,6 +1013,8 @@ static void clocks_init(struct device *dev,
>  	u32 rate;
>  	u8 ctrl =3D HFCLK_FREQ_26_MHZ;
> =20
> +	of_clk_init(NULL);
> +

I don't think this is in the right place. twl-core should not call a ge=
neric
clk init function.

>  	osc =3D clk_get(dev, "fck");
>  	if (IS_ERR(osc)) {
>  		printk(KERN_WARNING "Skipping twl internal clock init and "
>=20


--=20
P=E9ter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
