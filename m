From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 02/15] clk: sunxi-ng: Add common infrastructure
Date: Thu, 9 Jun 2016 09:39:11 +0200
Message-ID: <20160609093911.709051316db35fe272dc51e7@free.fr>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
	<20160607204154.31967-3-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160607204154.31967-3-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  7 Jun 2016 22:41:41 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Start our new clock infrastructure by adding the registration code, c=
ommon
> structure and common code.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> ---
> Changes from v1:
>   - Moved from of_iomap to of_io_request_and_map
>   - Change lock bit feature name to PLL_LOCK
>   - Fixed bug in clocks description array iteration
>   - Changed clock register offset size to u16
> ---
>  drivers/clk/Makefile              |  1 +
>  drivers/clk/sunxi-ng/Makefile     |  2 +
>  drivers/clk/sunxi-ng/ccu_common.c | 99 +++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/sunxi-ng/ccu_common.h | 74 +++++++++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_mult.h   | 15 ++++++
>  drivers/clk/sunxi-ng/ccu_reset.c  | 55 ++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_reset.h  | 40 ++++++++++++++++
>  7 files changed, 286 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/Makefile
>  create mode 100644 drivers/clk/sunxi-ng/ccu_common.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_common.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu_mult.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu_reset.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_reset.h
>=20
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index dcc5e698ff6d..7a44a1526d60 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_ARCH_SOCFPGA)		+=3D socfpga/
>  obj-$(CONFIG_PLAT_SPEAR)		+=3D spear/
>  obj-$(CONFIG_ARCH_STI)			+=3D st/
>  obj-$(CONFIG_ARCH_SUNXI)		+=3D sunxi/
> +obj-$(CONFIG_ARCH_SUNXI)		+=3D sunxi-ng/
>  obj-$(CONFIG_ARCH_TEGRA)		+=3D tegra/
>  obj-y					+=3D ti/
>  obj-$(CONFIG_ARCH_U8500)		+=3D ux500/
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Mak=
efile
> new file mode 100644
> index 000000000000..bd3461b0f38c
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -0,0 +1,2 @@
> +obj-y +=3D ccu_common.o
> +obj-y +=3D ccu_reset.o
> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng=
/ccu_common.c
> new file mode 100644
> index 000000000000..618fb26974c8
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_common.c
> @@ -0,0 +1,99 @@
> +/*
> + * Copyright 2016 Maxime Ripard
> + *
> + * Maxime Ripard <maxime.ripard@free-electrons.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/iopoll.h>
> +#include <linux/slab.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_reset.h"
> +
> +static DEFINE_SPINLOCK(ccu_lock);
> +
> +void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
> +{
> +	u32 reg;
> +
> +	if (!(common->features & CCU_FEATURE_PLL_LOCK))
> +		return;

	if (!lock)
		return;

seems simpler and permits to remove the feature flag

> +
> +	WARN_ON(readl_relaxed_poll_timeout(common->base + common->reg, reg,
> +					   !(reg & lock), 100, 70000));
> +}
> +
> +int sunxi_ccu_probe(struct device_node *node, void __iomem *reg,
> +		    const struct sunxi_ccu_desc *desc)
> +{
> +	struct ccu_common **cclks =3D desc->clks;
> +	size_t num_clks =3D desc->num_clks;
> +	struct clk_onecell_data *data;
> +	struct ccu_reset *reset;
> +	struct clk **clks;
> +	int i, ret;
> +
> +	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	clks =3D kcalloc(num_clks, sizeof(struct clk *), GFP_KERNEL);
> +	if (!clks)
> +		return -ENOMEM;
> +
> +	data->clks =3D clks;
> +	data->clk_num =3D num_clks;
> +
> +	for (i =3D 0; i < num_clks; i++) {
> +		struct ccu_common *cclk =3D cclks[i];
> +		struct clk *clk;
> +
> +		if (!cclk) {
> +			clks[i] =3D ERR_PTR(-ENOENT);
> +			continue;
> +		}
> +
> +		cclk->base =3D reg;
> +		cclk->lock =3D &ccu_lock;
> +
> +		clk =3D clk_register(NULL, &cclk->hw);
> +		if (IS_ERR(clk))
> +			continue;

On error, clks[i] is not initialized. I would better see:

		if (IS_ERR(clk))
			pr_err("Clock %d err %d\n", i, (int) PTR_ERR(clk));

> +
> +		clks[i] =3D clk;
> +	}
> +
> +	ret =3D of_clk_add_provider(node, of_clk_src_onecell_get, data);
> +	if (ret)
> +		goto err_clk_unreg;
> +
> +	reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);
> +	reset->rcdev.of_node =3D node;
> +	reset->rcdev.ops =3D &ccu_reset_ops;
> +	reset->rcdev.owner =3D THIS_MODULE;
> +	reset->rcdev.nr_resets =3D desc->num_resets;
> +	reset->base =3D reg;
> +	reset->lock =3D &ccu_lock;
> +	reset->reset_map =3D desc->resets;
> +
> +	ret =3D reset_controller_register(&reset->rcdev);
> +	if (ret)
> +		goto err_of_clk_unreg;
> +
> +	return 0;
> +
> +err_of_clk_unreg:
> +err_clk_unreg:
> +	return ret;
> +}
> diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng=
/ccu_common.h
> new file mode 100644
> index 000000000000..fda245020273
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_common.h
> @@ -0,0 +1,74 @@
> +/*
> + * Copyright (c) 2016 Maxime Ripard. All rights reserved.
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _COMMON_H_
> +#define _COMMON_H_
> +
> +#include <linux/compiler.h>
> +#include <linux/clk-provider.h>
> +
> +#define CCU_FEATURE_GATE		BIT(0)
> +#define CCU_FEATURE_PLL_LOCK		BIT(1)
> +#define CCU_FEATURE_FRACTIONAL		BIT(2)
> +#define CCU_FEATURE_VARIABLE_PREDIV	BIT(3)
> +#define CCU_FEATURE_FIXED_PREDIV	BIT(4)
> +#define CCU_FEATURE_FIXED_POSTDIV	BIT(5)
> +
> +struct device_node;
> +
> +#define SUNXI_HW_INIT(_name, _parent, _ops, _flags)			\
> +	&(struct clk_init_data) {					\
> +		.flags		=3D _flags,				\
> +		.name		=3D _name,				\
> +		.parent_names	=3D (const char *[]) { _parent },		\
> +		.num_parents	=3D 1,					\
> +		.ops 		=3D _ops,					\
> +	}
> +
> +#define SUNXI_HW_INIT_PARENTS(_name, _parents, _ops, _flags)		\
> +	&(struct clk_init_data) {					\
> +		.flags		=3D _flags,				\
> +		.name		=3D _name,				\
> +		.parent_names	=3D _parents,				\
> +		.num_parents	=3D ARRAY_SIZE(_parents),			\
> +		.ops 		=3D _ops,					\
> +	}
> +
> +struct ccu_common {
> +	void __iomem	*base;
> +	u16		reg;
> +
> +	unsigned long	features;

u16 should be enough for now

> +	spinlock_t	*lock;
> +	struct clk_hw	hw;
> +};
> +
> +static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
	[snip]

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
