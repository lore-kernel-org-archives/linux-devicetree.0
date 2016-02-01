From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [RFC v3 01/14] WIP: clk: add Atheros AR724X/AR913X/AR933X SoCs
 clock driver
Date: Mon, 1 Feb 2016 03:23:34 +0300
Message-ID: <20160201032334.bdaed0e5de613c63b7205df3@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
	<1453580251-2341-2-git-send-email-antonynpavlov@gmail.com>
	<20160130002734.GX12841@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160130002734.GX12841@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-mips@linux-mips.org, Alban Bedel <albeu@free.fr>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 29 Jan 2016 16:27:34 -0800
Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 01/23, Antony Pavlov wrote:
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
>=20
> Is there a binding document for this?

Yes, there is the binding document: Documentation/devicetree/bindings/c=
lock/qca,ath79-pll.txt
Anyway I suppose I have to update it in RFCv5.

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
> > diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
> > new file mode 100644
> > index 0000000..75338a7
> > --- /dev/null
> > +++ b/drivers/clk/clk-ath79.c
> > @@ -0,0 +1,193 @@
> > +/*
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include "clk.h"
>=20
> Don't include this header.

Ok, I'll try to drop it in RFC v5.


> > +
> > +#include <dt-bindings/clock/ath79-clk.h>
> > +
> > +#include "asm/mach-ath79/ar71xx_regs.h"
> > +#include "asm/mach-ath79/ath79.h"
>=20
> Can we get away without including these headers?

I have dropped ath79.h and ath79-clk.h in RFCv4.

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
>=20
> Why are we using clkdev? Can't we use DT lookups?

Hmm, I have just reused legacy ath79_add_sys_clkdev() function.
I'll try to see how to use DT lookups.

> > +	if (err)
> > +		panic("unable to register %s clock device", id);
> > +
> > +	return clk;
> > +}
> > +
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
> > +
> > +	of_ref_rate =3D clk_get_rate(ref_clk);
> > +
> > +	ref_rate =3D AR724X_BASE_FREQ;
> > +
> > +	if (of_ref_rate !=3D ref_rate) {
> > +		pr_err("ref_rate !=3D of_ref_rate\n");
> > +		ref_rate =3D of_ref_rate;
> > +	}
> > +
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
> > +
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
> > +
> > +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
>=20
> What if this fails?

Ok, I'll add return code result checks as drivers/clk/ingenic/cgu.c doe=
s.
=20
> > +}
> > +
> > +static void __init ar933x_clk_init(struct device_node *np)
> > +{
> > +	struct clk *ref_clk;
> > +	unsigned long of_ref_rate;
> > +	unsigned long ref_rate;
> > +	unsigned long cpu_rate;
> > +	unsigned long ddr_rate;
> > +	unsigned long ahb_rate;
> > +	u32 clock_ctrl;
> > +	u32 cpu_config;
> > +	u32 freq;
> > +	u32 t;
> > +
> > +	ref_clk =3D of_clk_get(np, 0);
> > +	if (IS_ERR(ref_clk)) {
> > +		pr_err("%s: of_clk_get failed\n", np->full_name);
> > +		return;
> > +	}
> > +
> > +	of_ref_rate =3D clk_get_rate(ref_clk);
> > +
> > +	t =3D ath79_reset_rr(AR933X_RESET_REG_BOOTSTRAP);
> > +	if (t & AR933X_BOOTSTRAP_REF_CLK_40)
> > +		ref_rate =3D 40 * MHZ;
> > +	else
> > +		ref_rate =3D 25 * MHZ;
> > +
> > +	if (ref_rate !=3D of_ref_rate) {
>=20
> Does this happen? I'd prefer we find a way to avoid calling
> of_clk_get() and clk_get_rate() in this driver.
>=20
> > +		pr_err("ref_rate !=3D of_ref_rate\n");
> > +		ref_rate =3D of_ref_rate;
> > +	}
> > +
> > +	clock_ctrl =3D ath79_pll_rr(AR933X_PLL_CLOCK_CTRL_REG);
> > +	if (clock_ctrl & AR933X_PLL_CLOCK_CTRL_BYPASS) {
> > +		cpu_rate =3D ref_rate;
> > +		ahb_rate =3D ref_rate;
> > +		ddr_rate =3D ref_rate;
>=20
> So if it's in bypass, why not register fixed factor clocks of
> 1/1 and set the parent to ref_clk?

I suppose that realising clocks as "real clocks with clk_ops" will be m=
ore simple
solution.

> > +	} else {
> > +		cpu_config =3D ath79_pll_rr(AR933X_PLL_CPU_CONFIG_REG);
> > +
> > +		t =3D (cpu_config >> AR933X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
> > +		    AR933X_PLL_CPU_CONFIG_REFDIV_MASK;
> > +		freq =3D ref_rate / t;
> > +
> > +		t =3D (cpu_config >> AR933X_PLL_CPU_CONFIG_NINT_SHIFT) &
> > +		    AR933X_PLL_CPU_CONFIG_NINT_MASK;
> > +		freq *=3D t;
> > +
> > +		t =3D (cpu_config >> AR933X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
> > +		    AR933X_PLL_CPU_CONFIG_OUTDIV_MASK;
> > +		if (t =3D=3D 0)
> > +			t =3D 1;
> > +
> > +		freq >>=3D t;
> > +
> > +		t =3D ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_CPU_DIV_SHIFT) &
> > +		     AR933X_PLL_CLOCK_CTRL_CPU_DIV_MASK) + 1;
> > +		cpu_rate =3D freq / t;
> > +
> > +		t =3D ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_DDR_DIV_SHIFT) &
> > +		      AR933X_PLL_CLOCK_CTRL_DDR_DIV_MASK) + 1;
> > +		ddr_rate =3D freq / t;
> > +
> > +		t =3D ((clock_ctrl >> AR933X_PLL_CLOCK_CTRL_AHB_DIV_SHIFT) &
> > +		     AR933X_PLL_CLOCK_CTRL_AHB_DIV_MASK) + 1;
> > +		ahb_rate =3D freq / t;
>=20
> These look like something we could implement as real clocks with
> clk_ops. The parent still looks like ref_clk, but we would be
> reading hardware in recalc_rate to figure out what the rate is.

Hmm. I have already realized this solution in 2014 for barebox
please see http://lists.infradead.org/pipermail/barebox/2014-March/0184=
14.html

Current RFC v3 driver is based on arch/mips/ath79/clock.c, but
I suppose I have to use barebox driver as a base for RFC v5 driver.

> > +	}
> > +
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
> > +	ath79_clks[ATH79_CLK_UART] =3D ath79_add_sys_clkdev("uart", ref_r=
ate);
> > +
> > +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> > +}
> > +CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ar724x_clk_init);
> > +CLK_OF_DECLARE(ar933x_clk, "qca,ar9330-pll", ar933x_clk_init);
>=20
> Is there a reason this isn't a platform driver?

We already have legacy platform driver arch/mips/ath79/clock.c.
I'm trying to realize modern clk driver and then adapt it to use with l=
egacy code.

--=A0
Best regards,
=A0 Antony Pavlov
