From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [RFC v5 01/15] WIP: clk: add Atheros AR933X SoCs clock driver
Date: Thu, 11 Feb 2016 15:50:51 +0300
Message-ID: <20160211155051.d6378434246fe94ad4ed2760@gmail.com>
References: <1455005641-7079-1-git-send-email-antonynpavlov@gmail.com>
	<1455005641-7079-2-git-send-email-antonynpavlov@gmail.com>
	<20160209225134.2bb6b67c@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160209225134.2bb6b67c@tock>
Sender: linux-clk-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Marek Vasut <marex@denx.de>, Wills Wang <wills.wang@live.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 9 Feb 2016 22:51:34 +0100
Alban <albeu@free.fr> wrote:

> On Tue,  9 Feb 2016 11:13:47 +0300
> Antony Pavlov <antonynpavlov@gmail.com> wrote:
>=20
> > This driver can be easely upgraded for other Atheros
> > SoCs (e.g. AR724X/AR913X) support.
> >=20
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > Cc: Alban Bedel <albeu@free.fr>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Paul Burton <paul.burton@imgtec.com>
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-mips@linux-mips.org
> > Cc: devicetree@vger.kernel.org
> > ---
> >  drivers/clk/Makefile                  |   1 +
> >  drivers/clk/clk-ath79.c               | 354 ++++++++++++++++++++++=
++++++++++++
> >  include/dt-bindings/clock/ath79-clk.h |  22 +++
> >  3 files changed, 377 insertions(+)
> >=20
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index b038e36..d7ad50e 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -18,6 +18,7 @@ endif
> >  # hardware specific clock types
> >  # please keep this section sorted lexicographically by file/direct=
ory path name
> >  obj-$(CONFIG_MACH_ASM9260)		+=3D clk-asm9260.o
> > +obj-$(CONFIG_ATH79)			+=3D clk-ath79.o
> >  obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+=3D clk-axi-clkgen.o
> >  obj-$(CONFIG_ARCH_AXXIA)		+=3D clk-axm5516.o
> >  obj-$(CONFIG_COMMON_CLK_CDCE706)	+=3D clk-cdce706.o
> > diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
> > new file mode 100644
> > index 0000000..e899d31
> > --- /dev/null
> > +++ b/drivers/clk/clk-ath79.c
> > @@ -0,0 +1,354 @@
> > +/*
> > + * Clock driver for Atheros AR933X SoCs
> > + *
> > + * Copyright (C) 2016 Antony Pavlov <antonynpavlov@gmail.com>
> > + *
> > + * This driver is based on Ingenic CGU linux driver by Paul Burton
> > + * and AR9331 barebox driver by Antony Pavlov.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +
> > +#include <dt-bindings/clock/ath79-clk.h>
> > +
> > +#include "asm/mach-ath79/ar71xx_regs.h"
>=20
> This header shouldn't be used in new code, just defines the few
> registers needed here. Not using this header allow the driver
> to be built in compile test which increase test coverage.

ok.

> > +struct ath79_pll_info {
> > +	u32 div_shift;
> > +	u32 div_mask;
> > +};
> > +
> > +struct ath79_cblk;
> > +
> > +/**
> > + * struct ath79_clk_info - information about a clock
> > + * @name: name of the clock
> > + * @type: a bitmask formed from ATH79_CLK_* values
> > + * @parents: an index of parent of this clock
> > + *           within the clock_info array, or -1
> > + *           which correspond to no valid parent
> > + * @pll: information valid if type includes ATH79_CLK_PLL
> > + */
> > +struct ath79_clk_info {
> > +	const char *name;
> > +
> > +	enum {
> > +		ATH79_CLK_NONE		=3D 0,
> > +		ATH79_CLK_EXT		=3D 1,
> > +		ATH79_CLK_PLL		=3D 2,
> > +		ATH79_CLK_ALIAS		=3D 3,
> > +	} type;
> > +
> > +	struct ath79_cblk *cblk;
> > +	int parent;
> > +
> > +	struct ath79_pll_info pll;
> > +};
> > +
> > +struct ath79_cblk {
> > +	struct device_node *np;
> > +	void __iomem *base;
> > +
> > +	const struct ath79_clk_info *clock_info;
> > +	struct clk_onecell_data clocks;
> > +};
> > +
> > +/**
> > + * struct ath79_clk - private data for a clock
> > + * @hw: see Documentation/clk.txt
> > + * @cblk: a pointer to the cblk data
> > + * @idx: the index of this clock cblk->clock_info
> > + * @pll: information valid if type includes ATH79_CLK_PLL
> > + */
> > +struct ath79_clk {
> > +	struct clk_hw hw;
> > +	struct ath79_cblk *cblk;
> > +	unsigned idx;
> > +};
> > +
> > +#define to_ath79_clk(_hw) container_of(_hw, struct ath79_clk, hw)
> > +
> > +static const struct ath79_clk_info ar9331_clocks[] =3D {
> > +
> > +	/* External clock */
> > +	[ATH79_CLK_REF] =3D { "ref", ATH79_CLK_EXT },
> > +
> > +	[ATH79_CLK_CPU] =3D {
> > +		"cpu", ATH79_CLK_PLL,
> > +		.parent =3D ATH79_CLK_REF,
> > +		.pll =3D {
> > +			.div_shift =3D AR933X_PLL_CLOCK_CTRL_CPU_DIV_SHIFT,
> > +			.div_mask =3D AR933X_PLL_CLOCK_CTRL_CPU_DIV_MASK,
> > +		},
> > +	},
> > +
> > +	[ATH79_CLK_DDR] =3D {
> > +		"ddr", ATH79_CLK_PLL,
> > +		.parent =3D ATH79_CLK_REF,
> > +		.pll =3D {
> > +			.div_shift =3D AR933X_PLL_CLOCK_CTRL_DDR_DIV_SHIFT,
> > +			.div_mask =3D AR933X_PLL_CLOCK_CTRL_DDR_DIV_MASK,
> > +		},
> > +	},
> > +
> > +	[ATH79_CLK_AHB] =3D {
> > +		"ahb", ATH79_CLK_PLL,
> > +		.parent =3D ATH79_CLK_REF,
> > +		.pll =3D {
> > +			.div_shift =3D AR933X_PLL_CLOCK_CTRL_AHB_DIV_SHIFT,
> > +			.div_mask =3D AR933X_PLL_CLOCK_CTRL_AHB_DIV_MASK,
> > +		},
> > +	},
> > +
> > +	[ATH79_CLK_WDT] =3D {
> > +		"wdt", ATH79_CLK_ALIAS,
> > +		.parent =3D ATH79_CLK_AHB,
> > +	},
> > +
> > +	[ATH79_CLK_UART] =3D {
> > +		"uart", ATH79_CLK_ALIAS,
> > +		.parent =3D ATH79_CLK_REF,
> > +	},
> > +};
> > +
> > +struct ath79_cblk *
> > +ath79_cblk_new(const struct ath79_clk_info *clock_info,
> > +		unsigned num_clocks, struct device_node *np)
> > +{
> > +	struct ath79_cblk *cblk;
> > +
> > +	cblk =3D kzalloc(sizeof(*cblk), GFP_KERNEL);
> > +	if (!cblk)
> > +		goto err_out;
> > +
> > +	cblk->base =3D of_iomap(np, 0);
> > +	if (!cblk->base) {
> > +		pr_err("%s: failed to map clock block registers\n", __func__);
> > +		goto err_out_free;
> > +	}
> > +
> > +	cblk->np =3D np;
> > +	cblk->clock_info =3D clock_info;
> > +	cblk->clocks.clk_num =3D num_clocks;
> > +
> > +	return cblk;
> > +
> > +err_out_free:
> > +	kfree(cblk);
> > +
> > +err_out:
> > +	return NULL;
> > +}
> > +
> > +static unsigned long
> > +ath79_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate=
)
> > +{
> > +	struct ath79_clk *ath79_clk =3D to_ath79_clk(hw);
> > +	struct ath79_cblk *cblk =3D ath79_clk->cblk;
> > +	const struct ath79_clk_info *clk_info =3D &cblk->clock_info[ath79=
_clk->idx];
> > +	const struct ath79_pll_info *pll_info;
> > +	unsigned long rate;
> > +	unsigned long freq;
> > +	u32 clock_ctrl;
> > +	u32 cpu_config;
> > +	u32 t;
> > +
> > +	BUG_ON(clk_info->type !=3D ATH79_CLK_PLL);
>=20
> It's probably debatable if such a BUG_ON() is really needed.

In simple RFC v5 driver version this check is redundant.
I suppose it's reasonable for more advanced version of the driver.
=20
> > +	clock_ctrl =3D __raw_readl(cblk->base + AR933X_PLL_CLOCK_CTRL_REG=
);
> > +
> > +	if (clock_ctrl & AR933X_PLL_CLOCK_CTRL_BYPASS) {
> > +		return parent_rate;
> > +	}
>=20
> Those brace should goes away.

Ok.

> > +	cpu_config =3D __raw_readl(cblk->base + AR933X_PLL_CPU_CONFIG_REG=
);
> > +
> > +	t =3D (cpu_config >> AR933X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
> > +	    AR933X_PLL_CPU_CONFIG_REFDIV_MASK;
> > +	freq =3D parent_rate / t;
> > +
> > +	t =3D (cpu_config >> AR933X_PLL_CPU_CONFIG_NINT_SHIFT) &
> > +	    AR933X_PLL_CPU_CONFIG_NINT_MASK;
> > +	freq *=3D t;
> > +
> > +	t =3D (cpu_config >> AR933X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
> > +	    AR933X_PLL_CPU_CONFIG_OUTDIV_MASK;
> > +	if (t =3D=3D 0)
> > +		t =3D 1;
> > +
> > +	freq >>=3D t;
> > +
> > +	pll_info =3D &clk_info->pll;
> > +
> > +	t =3D ((clock_ctrl >> pll_info->div_shift) & pll_info->div_mask) =
+ 1;
> > +	rate =3D freq / t;
>=20
> If we just compute a fixed rate we could as well use
> clk_register_fixed_factor() and drop 80% of the code of this driver.

80% is an overstatement.

> > +	return rate;
> > +}
> > +
> > +static const struct clk_ops ath79_pll_clk_ops =3D {
> > +	.recalc_rate =3D ath79_pll_recalc_rate,
> > +};
> > +
> > +static int ath79_register_clock(struct ath79_cblk *cblk, unsigned =
idx)
> > +{
> > +	const struct ath79_clk_info *clk_info =3D &cblk->clock_info[idx];
> > +	const struct ath79_clk_info *parent_clk_info;
> > +	struct clk_init_data clk_init;
> > +	struct ath79_clk *ath79_clk =3D NULL;
> > +	struct clk *clk;
> > +	int err =3D -EINVAL;
> > +
> > +	if (clk_info->type =3D=3D ATH79_CLK_EXT) {
> > +		clk =3D of_clk_get_by_name(cblk->np, clk_info->name);
> > +		if (IS_ERR(clk)) {
> > +			pr_err("%s: no external clock '%s' provided\n",
> > +			       __func__, clk_info->name);
> > +			err =3D -ENODEV;
> > +			goto out;
> > +		}
> > +
> > +		err =3D clk_register_clkdev(clk, clk_info->name, NULL);
> > +		if (err) {
> > +			clk_put(clk);
> > +			goto out;
> > +		}
>=20
> clk_register_clkdev() and naming providers is not needed on OF
> platforms. This should only be used on legacy platforms.

I can't drop these clk_register_clkdev() just now without patching lega=
cy code.

If I just drop clk_register_clkdev() then I get

    Kernel panic - not syncing: unable to get cpu clock, err=3D-2

on start.


> > +		cblk->clocks.clks[idx] =3D clk;
> > +
> > +		return 0;
> > +	}
> > +
> > +	parent_clk_info =3D &cblk->clock_info[clk_info->parent];
> > +
> > +	if (clk_info->type =3D=3D ATH79_CLK_ALIAS) {
> > +		clk =3D clk_register_fixed_factor(NULL, clk_info->name,
> > +						parent_clk_info->name, 0, 1, 1);
> > +		if (IS_ERR(clk)) {
> > +			pr_err("%s: failed to register clock '%s'\n", __func__,
> > +			       clk_info->name);
> > +			err =3D PTR_ERR(clk);
> > +			goto out;
> > +		}
> > +
> > +		cblk->clocks.clks[idx] =3D clk;
> > +
> > +		return 0;
> > +	}
>=20
> I really don't get why you keep insisting on having those useless ali=
as
> clocks. Alias are only needed on legacy platforms to form connections
> between clock providers and consumers. On OF platforms these
> connections are nicely represented in the DT, so it is just not
> needed at all.

I have droppped these aliases in RFC v6 series.

--=A0
Best regards,
=A0 Antony Pavlov
