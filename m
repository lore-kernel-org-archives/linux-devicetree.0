From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [RFC v3 01/14] WIP: clk: add Atheros AR724X/AR913X/AR933X SoCs
 clock driver
Date: Sun, 31 Jan 2016 23:41:55 +0300
Message-ID: <20160131234155.eee918745880878963c044aa@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
	<1453580251-2341-2-git-send-email-antonynpavlov@gmail.com>
	<20160125232156.35c0ce3f@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160125232156.35c0ce3f@tock>
Sender: linux-clk-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Jan 2016 23:21:56 +0100
Alban <albeu@free.fr> wrote:

> On Sat, 23 Jan 2016 23:17:18 +0300
> Antony Pavlov <antonynpavlov@gmail.com> wrote:
>=20
> > TODO: get pll registers base address from devicetree node
> >=20
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > Cc: Alban Bedel <albeu@free.fr>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-mips@linux-mips.org
> > Cc: devicetree@vger.kernel.org
> > ---
> >  drivers/clk/Makefile                  |   1 +
> >  drivers/clk/clk-ath79.c               | 193 ++++++++++++++++++++++=
++++++++++++
> >  include/dt-bindings/clock/ath79-clk.h |  22 ++++
> >  3 files changed, 216 insertions(+)
> >=20
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 820714c..5101763 100644
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
> > index 0000000..75338a7
> > --- /dev/null
> > +++ b/drivers/clk/clk-ath79.c
> > @@ -0,0 +1,193 @@
> > +/*
> > + * Clock driver for Atheros AR724X/AR913X/AR933X SoCs
> > + *
> > + * Copyright (C) 2010-2011 Jaiganesh Narayanan <jnarayanan@atheros=
=2Ecom>
> > + * Copyright (C) 2011 Gabor Juhos <juhosg@openwrt.org>
> > + * Copyright (C) 2015 Alban Bedel <albeu@free.fr>
> > + * Copyright (C) 2016 Antony Pavlov <antonynpavlov@gmail.com>
> > + *
> > + * Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
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
> > +#include "clk.h"
> > +
> > +#include <dt-bindings/clock/ath79-clk.h>
> > +
> > +#include "asm/mach-ath79/ar71xx_regs.h"
> > +#include "asm/mach-ath79/ath79.h"
> > +
> > +#define MHZ (1000 * 1000)
> > +
> > +#define AR724X_BASE_FREQ	(40 * MHZ)
> > +
> > +static struct clk *ath79_clks[ATH79_CLK_END];
> > +
> > +static struct clk_onecell_data clk_data =3D {
> > +	.clks =3D ath79_clks,
> > +	.clk_num =3D ARRAY_SIZE(ath79_clks),
> > +};
> > +
> > +static struct clk *__init ath79_add_sys_clkdev(
> > +	const char *id, unsigned long rate)
> > +{
> > +	struct clk *clk;
> > +	int err;
> > +
> > +	clk =3D clk_register_fixed_rate(NULL, id, NULL, CLK_IS_ROOT, rate=
);
> > +	if (!clk)
> > +		panic("failed to allocate %s clock structure", id);
> > +
> > +	err =3D clk_register_clkdev(clk, id, NULL);
> > +	if (err)
> > +		panic("unable to register %s clock device", id);
> > +
> > +	return clk;
> > +}
> >
> > +static void __init ar724x_clk_init(struct device_node *np)
> > +{
> > +	struct clk *ref_clk;
> > +	unsigned long of_ref_rate;
> > +	unsigned long ref_rate;
> > +	unsigned long cpu_rate;
> > +	unsigned long ddr_rate;
> > +	unsigned long ahb_rate;
> > +	u32 pll;
> > +	u32 freq;
> > +	u32 div;
> > +
> > +	ref_clk =3D of_clk_get(np, 0);
> > +	if (IS_ERR(ref_clk)) {
> > +		pr_err("%s: of_clk_get failed\n", np->full_name);
> > +		return;
> > +	}
>=20
> It would be better to have this function take the ref clock as
> argument, to allow using it for both OF and legacy platforms.

I'll try to use this idea in v5 patch version.

> > +	of_ref_rate =3D clk_get_rate(ref_clk);
> > +
> > +	ref_rate =3D AR724X_BASE_FREQ;
> > +
> > +	if (of_ref_rate !=3D ref_rate) {
> > +		pr_err("ref_rate !=3D of_ref_rate\n");
> > +		ref_rate =3D of_ref_rate;
> > +	}
>=20
> I don't think that this test is really useful.

Yes, I can make this check optional.

> > +	pll =3D ath79_pll_rr(AR724X_PLL_REG_CPU_CONFIG);
> > +
> > +	div =3D ((pll >> AR724X_PLL_FB_SHIFT) & AR724X_PLL_FB_MASK);
> > +	freq =3D div * ref_rate;
> > +
> > +	div =3D ((pll >> AR724X_PLL_REF_DIV_SHIFT) & AR724X_PLL_REF_DIV_M=
ASK) * 2;
> > +	freq /=3D div;
> > +
> > +	cpu_rate =3D freq;
> > +
> > +	div =3D ((pll >> AR724X_DDR_DIV_SHIFT) & AR724X_DDR_DIV_MASK) + 1=
;
> > +	ddr_rate =3D freq / div;
> > +
> > +	div =3D (((pll >> AR724X_AHB_DIV_SHIFT) & AR724X_AHB_DIV_MASK) + =
1) * 2;
> > +	ahb_rate =3D cpu_rate / div;
>=20
> For a new driver it would make sense to use clk_register_divider() an=
d
> similar generic building blocks.
>=20
> > +	ath79_clks[ATH79_CLK_REF] =3D ath79_add_sys_clkdev("ref", ref_rat=
e);
> > +	ath79_clks[ATH79_CLK_CPU] =3D ath79_add_sys_clkdev("cpu", cpu_rat=
e);
> > +	ath79_clks[ATH79_CLK_DDR] =3D ath79_add_sys_clkdev("ddr", ddr_rat=
e);
> > +	ath79_clks[ATH79_CLK_AHB] =3D ath79_add_sys_clkdev("ahb", ahb_rat=
e);
> > +	ath79_clks[ATH79_CLK_WDT] =3D ath79_add_sys_clkdev("wdt", ahb_rat=
e);
> > +	ath79_clks[ATH79_CLK_UART] =3D ath79_add_sys_clkdev("uart", ahb_r=
ate);
>=20
> You shouldn't add ref, wdt and uart, they are not needed and make the
> driver incompatible with the current DT bindings.

Please describe the situation then this incompatibility does matter.

Current ath79 dt support is very preliminary and the only dt user
is 5-years old TP-Link WR1043ND so it's near impossible to break someth=
ink.

Anyway current ath79 dt binding is somewhat broken (see __your__ messag=
e 'Re: [RFC 1/4] WIP: MIPS: ath79: make ar933x clks more devicetree-fri=
endly' from 'Thu, 21 Jan 2016 12:03:20 +0100').


--=A0
Best regards,
=A0 Antony Pavlov
