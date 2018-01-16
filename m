From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 10/44] clk: davinci: New driver for davinci PSC clocks
Date: Tue, 16 Jan 2018 16:33:32 +0530
Message-ID: <e0a9af55-a8b1-c359-fe88-d038648e02f1@ti.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-11-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1515377863-20358-11-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 08 January 2018 07:47 AM, David Lechner wrote:
> This adds a new driver for mach-davinci PSC clocks. This is porting the
> code from arch/arm/mach-davinci/psc.c to the common clock framework and
> is converting it to use regmap to simplify the code. Additionally, it adds
> device tree support for these clocks.
> 
> Note: although there are similar clocks for TI Keystone we are not able
> to share the code for a few reasons. The keystone clocks are device tree
> only and use legacy one-node-per-clock bindings. Also the keystone driver
> makes the assumption that there is only one PSC per SoC and uses global
> variables, but here we have two controllers per SoC.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  drivers/clk/davinci/Makefile |   2 +
>  drivers/clk/davinci/psc.c    | 282 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/davinci/psc.h    |  49 ++++++++
>  3 files changed, 333 insertions(+)
>  create mode 100644 drivers/clk/davinci/psc.c
>  create mode 100644 drivers/clk/davinci/psc.h
> 
> diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
> index d471386..cd1bf2c 100644
> --- a/drivers/clk/davinci/Makefile
> +++ b/drivers/clk/davinci/Makefile
> @@ -8,4 +8,6 @@ obj-$(CONFIG_ARCH_DAVINCI_DM355)	+= pll-dm355.o
>  obj-$(CONFIG_ARCH_DAVINCI_DM365)	+= pll-dm365.o
>  obj-$(CONFIG_ARCH_DAVINCI_DM644x)	+= pll-dm644x.o
>  obj-$(CONFIG_ARCH_DAVINCI_DM646x)	+= pll-dm646x.o
> +
> +obj-y += psc.o
>  endif
> diff --git a/drivers/clk/davinci/psc.c b/drivers/clk/davinci/psc.c
> new file mode 100644
> index 0000000..a8b5f57
> --- /dev/null
> +++ b/drivers/clk/davinci/psc.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Clock driver for TI Davinci PSC controllers
> + *
> + * Copyright (C) 2017 David Lechner <david@lechnology.com>

2018

> + *
> + * Based on: drivers/clk/keystone/gate.c
> + * Copyright (C) 2013 Texas Instruments.
> + *	Murali Karicheri <m-karicheri2@ti.com>
> + *	Santosh Shilimkar <santosh.shilimkar@ti.com>
> + *
> + * And: arch/arm/mach-davinci/psc.c
> + * Copyright (C) 2006 Texas Instruments.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk/davinci.h>
> +#include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/of_address.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include "psc.h"
> +
> +/* PSC register offsets */
> +#define EPCPR			0x070
> +#define PTCMD			0x120
> +#define PTSTAT			0x128
> +#define PDSTAT(n)		(0x200 + 4 * (n))
> +#define PDCTL(n)		(0x300 + 4 * (n))
> +#define MDSTAT(n)		(0x800 + 4 * (n))
> +#define MDCTL(n)		(0xa00 + 4 * (n))
> +
> +/* PSC module states */
> +enum davinci_psc_state {
> +	PSC_STATE_SWRSTDISABLE	= 0,
> +	PSC_STATE_SYNCRST	= 1,
> +	PSC_STATE_DISABLE	= 2,
> +	PSC_STATE_ENABLE	= 3,
> +};
> +
> +#define MDSTAT_STATE_MASK	0x3f> +#define MDSTAT_MCKOUT		BIT(12)
> +#define PDSTAT_STATE_MASK	0x1f

GENMASK() for masks.

> +#define MDCTL_FORCE		BIT(31)
> +#define MDCTL_LRESET		BIT(8)
> +#define PDCTL_EPCGOOD		BIT(8)
> +#define PDCTL_NEXT		BIT(0)
> +
> +/**
> + * struct davinci_psc_clk - PSC clock structure
> + * @hw: clk_hw for the psc
> + * @regmap: PSC MMIO region
> + * @lpsc: Local PSC number (module id)
> + * @pd: Power domain
> + * @flags: LPSC_* quirk flags
> + */
> +struct davinci_psc_clk {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +	u32 lpsc;
> +	u32 pd;
> +	u32 flags;
> +};
> +
> +#define to_davinci_psc_clk(_hw) container_of(_hw, struct davinci_psc_clk, hw)
> +
> +static void psc_config(struct davinci_psc_clk *psc,
> +		       enum davinci_psc_state next_state)
> +{
> +	u32 epcpr, pdstat, mdstat, mdctl, ptstat;
> +
> +	mdctl = next_state;
> +	if (psc->flags & LPSC_FORCE)
> +		mdctl |= MDCTL_FORCE;
> +	regmap_write_bits(psc->regmap, MDCTL(psc->lpsc), MDSTAT_STATE_MASK,
> +			  mdctl);

Wont this ignore the MDCTL_FORCE bit since MDSTAT_STATE_MASK does not
cover that?

> +
> +	regmap_read(psc->regmap, PDSTAT(psc->pd), &pdstat);
> +	if ((pdstat & PDSTAT_STATE_MASK) == 0) {
> +		regmap_write_bits(psc->regmap, PDSTAT(psc->pd),
> +				  PDSTAT_STATE_MASK, PDCTL_NEXT);

Shouldn't this be a write to PDCTL register?

> +
> +		regmap_write(psc->regmap, PTCMD, BIT(psc->pd));
> +
> +		regmap_read_poll_timeout(psc->regmap, EPCPR, epcpr,
> +					 epcpr & BIT(psc->pd), 0, 0);
> +
> +		regmap_write_bits(psc->regmap, PDCTL(psc->pd), PDCTL_EPCGOOD,
> +				  PDCTL_EPCGOOD);
> +	} else {
> +		regmap_write(psc->regmap, PTCMD, BIT(psc->pd));
> +	}
> +
> +	regmap_read_poll_timeout(psc->regmap, PTSTAT, ptstat,
> +				 !(ptstat & BIT(psc->pd)), 0, 0);
> +
> +	regmap_read_poll_timeout(psc->regmap, MDSTAT(psc->lpsc), mdstat,
> +				 (mdstat & MDSTAT_STATE_MASK) == next_state,
> +				 0, 0);
> +}
> +

[...]

> +
> +/**
> + * davinci_psc_clk_register - register psc clock
> + * @dev: device that is registering this clock

No dev parameter below.

> + * @name: name of this clock
> + * @parent_name: name of clock's parent
> + * @regmap: PSC MMIO region
> + * @lpsc: local PSC number
> + * @pd: power domain
> + * @flags: LPSC_* flags
> + */
> +static struct clk *davinci_psc_clk_register(const char *name,
> +					    const char *parent_name,
> +					    struct regmap *regmap,
> +					    u32 lpsc, u32 pd, u32 flags)
> +{
> +	struct clk_init_data init;
> +	struct davinci_psc_clk *psc;
> +	struct clk *clk;
> +
> +	psc = kzalloc(sizeof(*psc), GFP_KERNEL);
> +	if (!psc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = &davinci_psc_clk_ops;
> +	init.parent_names = (parent_name ? &parent_name : NULL);
> +	init.num_parents = (parent_name ? 1 : 0);
> +	init.flags = CLK_SET_RATE_PARENT;

Is this needed since PSC does not cause any rate change?

> +
> +	if (flags & LPSC_ALWAYS_ENABLED)
> +		init.flags |= CLK_IS_CRITICAL;
> +
> +	psc->regmap = regmap;
> +	psc->hw.init = &init;
> +	psc->lpsc = lpsc;
> +	psc->pd = pd;
> +	psc->flags = flags;
> +
> +	clk = clk_register(NULL, &psc->hw);
> +	if (IS_ERR(clk))
> +		kfree(psc);
> +
> +	return clk;
> +}
> +
> +/*
> + * FIXME: This needs to be converted to a reset controller. But, the reset
> + * framework is currently device tree only.

Yeah, I see that __reset_control_get() fails with -EINVAL if there is no
of_node.

> + */
> +
> +static int davinci_psc_clk_reset(struct davinci_psc_clk *psc, bool reset)
> +{
> +	u32 mdctl;
> +
> +	if (IS_ERR_OR_NULL(psc))
> +		return -EINVAL;
> +
> +	mdctl = reset ? 0 : MDCTL_LRESET;
> +	regmap_write_bits(psc->regmap, MDCTL(psc->lpsc), MDCTL_LRESET, mdctl);
> +
> +	return 0;
> +}
> +
> +int davinci_clk_reset_assert(struct clk *clk)
> +{
> +	struct davinci_psc_clk *psc = to_davinci_psc_clk(__clk_get_hw(clk));
> +
> +	return davinci_psc_clk_reset(psc, true);
> +}
> +EXPORT_SYMBOL(davinci_clk_reset_assert);
> +
> +int davinci_clk_reset_deassert(struct clk *clk)
> +{
> +	struct davinci_psc_clk *psc = to_davinci_psc_clk(__clk_get_hw(clk));
> +
> +	return davinci_psc_clk_reset(psc, false);
> +}
> +EXPORT_SYMBOL(davinci_clk_reset_deassert);
> +

[...]

> diff --git a/drivers/clk/davinci/psc.h b/drivers/clk/davinci/psc.h
> new file mode 100644
> index 0000000..6022f6e
> --- /dev/null
> +++ b/drivers/clk/davinci/psc.h
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Clock driver for TI Davinci PSC controllers
> + *
> + * Copyright (C) 2017 David Lechner <david@lechnology.com>
> + */
> +
> +#ifndef __CLK_DAVINCI_PSC_H__
> +#define __CLK_DAVINCI_PSC_H__
> +
> +#include <linux/types.h>
> +
> +/* PSC quirk flags */
> +#define LPSC_ALWAYS_ENABLED	BIT(1) /* never disable this clock */
> +#define LPSC_FORCE		BIT(2) /* requires MDCTL FORCE bit */
> +#define LPSC_LOCAL_RESET	BIT(3) /* acts as reset provider */
> +
> +struct clk_onecell_data;

Rather clk-provider.h should be included in this file?

Thanks,
Sekhar
