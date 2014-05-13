From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Subject: Re: [PATCH v3 5/7] clk: sunxi: add PRCM (Power/Reset/Clock Management)
 clks support
Date: Tue, 13 May 2014 12:09:22 -0300
Message-ID: <537235A2.3010902@elopez.com.ar>
References: <1399633911-7094-1-git-send-email-boris.brezillon@free-electrons.com> <1399633911-7094-6-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399633911-7094-6-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

=46irst of all, thanks for working on this :)

While reading the code below I noticed a complete lack of comments. I=20
think it would be good to have at least some to aid readability,=20
considering these clocks are poorly documented on AW's material.

El 09/05/14 08:11, Boris BREZILLON escribi=F3:
> The PRCM (Power/Reset/Clock Management) unit provides several clock
> devices:
> - AR100 clk: used to clock the Power Management co-processor
> - AHB0 clk: used to clock the AHB0 bus
> - APB0 clk and gates: used to clk peripherals connected to the APB0 b=
us
>
> Add support for these clks in a separate driver so that they can be p=
robed
> as platform devices instead of registered during early init.
> This is needed to be able to probe PRCM MFD subdevices.
>
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   drivers/clk/sunxi/Makefile         |   2 +
>   drivers/clk/sunxi/clk-sun6i-prcm.c | 343 ++++++++++++++++++++++++++=
+++++++++++
>   2 files changed, 345 insertions(+)
>   create mode 100644 drivers/clk/sunxi/clk-sun6i-prcm.c
>
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index b5bac91..ef8cdc9 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -3,3 +3,5 @@
>   #
>
>   obj-y +=3D clk-sunxi.o clk-factors.o
> +
> +obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D clk-sun6i-prcm.o
> diff --git a/drivers/clk/sunxi/clk-sun6i-prcm.c b/drivers/clk/sunxi/c=
lk-sun6i-prcm.c
> new file mode 100644
> index 0000000..3efaf8f
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-sun6i-prcm.c
> @@ -0,0 +1,343 @@
> +/*
> + * Copyright (C) 2014 Free Electrons
> + *
> + * License Terms: GNU General Public License v2
> + * Author: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * Allwinner PRCM (Power/Reset/Clock Management) driver
> + *
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define SUN6I_APB0_GATES_MAX_SIZE	32
> +#define SUN6I_AR100_MAX_PARENTS		4
> +#define SUN6I_AR100_SHIFT_MASK		0x3
> +#define SUN6I_AR100_SHIFT_MAX		SUN6I_AR100_SHIFT_MASK
> +#define SUN6I_AR100_SHIFT_SHIFT		4
> +#define SUN6I_AR100_DIV_MASK		0x1f
> +#define SUN6I_AR100_DIV_MAX		(SUN6I_AR100_DIV_MASK + 1)
> +#define SUN6I_AR100_DIV_SHIFT		8
> +#define SUN6I_AR100_MUX_MASK		0x3
> +#define SUN6I_AR100_MUX_SHIFT		16
> +
> +struct ar100_clk {
> +	struct clk_hw hw;
> +	void __iomem *reg;
> +};
> +
> +static inline struct ar100_clk *to_ar100_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct ar100_clk, hw);
> +}
> +
> +static unsigned long ar100_recalc_rate(struct clk_hw *hw,
> +				       unsigned long parent_rate)
> +{
> +	struct ar100_clk *clk =3D to_ar100_clk(hw);
> +	u32 val =3D readl(clk->reg);
> +	int shift =3D (val >> SUN6I_AR100_SHIFT_SHIFT) & SUN6I_AR100_SHIFT_=
MASK;
> +	int div =3D (val >> SUN6I_AR100_DIV_SHIFT) & SUN6I_AR100_DIV_MASK;
> +
> +	return (parent_rate >> shift) / (div + 1);
> +}
> +
> +static long ar100_determine_rate(struct clk_hw *hw, unsigned long ra=
te,
> +				 unsigned long *best_parent_rate,
> +				 struct clk **best_parent_clk)
> +{
> +	int nparents =3D __clk_get_num_parents(hw->clk);
> +	long best_rate =3D -EINVAL;
> +	int i;
> +
> +	*best_parent_clk =3D NULL;
> +
> +	for (i =3D 0; i < nparents; i++) {
> +		unsigned long parent_rate;
> +		unsigned long tmp_rate;
> +		struct clk *parent;
> +		unsigned long div;
> +		int shift;
> +
> +		parent =3D clk_get_parent_by_index(hw->clk, i);
> +		parent_rate =3D __clk_get_rate(parent);
> +		div =3D DIV_ROUND_UP(parent_rate, rate);
> +
> +		shift =3D ffs(div) - 1;
> +		if (shift > SUN6I_AR100_SHIFT_MAX)
> +			shift =3D SUN6I_AR100_SHIFT_MAX;
> +
> +		div >>=3D shift;
> +
> +		while (div > SUN6I_AR100_DIV_MAX) {
> +			shift++;
> +			div >>=3D 1;
> +			if (shift > SUN6I_AR100_SHIFT_MAX)
> +				break;
> +		}
> +
> +		if (shift > SUN6I_AR100_SHIFT_MAX)
> +			continue;
> +
> +		tmp_rate =3D (parent_rate >> shift) / div;
> +		if (!*best_parent_clk || tmp_rate > best_rate) {
> +			*best_parent_clk =3D parent;
> +			*best_parent_rate =3D parent_rate;
> +			best_rate =3D tmp_rate;
> +		}
> +	}
> +
> +	return best_rate;
> +}
> +
> +static int ar100_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct ar100_clk *clk =3D to_ar100_clk(hw);
> +	u32 val =3D readl(clk->reg);
> +
> +	if (index >=3D SUN6I_AR100_MAX_PARENTS)
> +		return -EINVAL;
> +
> +	val &=3D ~(SUN6I_AR100_MUX_MASK << SUN6I_AR100_MUX_SHIFT);
> +	val |=3D (index << SUN6I_AR100_MUX_SHIFT);
> +	writel(val, clk->reg);
> +
> +	return 0;
> +}
> +
> +static u8 ar100_get_parent(struct clk_hw *hw)
> +{
> +	struct ar100_clk *clk =3D to_ar100_clk(hw);
> +	return (readl(clk->reg) >> SUN6I_AR100_MUX_SHIFT) &
> +	       SUN6I_AR100_MUX_MASK;
> +}
> +
> +static int ar100_set_rate(struct clk_hw *hw, unsigned long rate,
> +			  unsigned long parent_rate)
> +{
> +	unsigned long div =3D parent_rate / rate;
> +	struct ar100_clk *clk =3D to_ar100_clk(hw);
> +	u32 val =3D readl(clk->reg);
> +	int shift;
> +
> +	if (parent_rate % rate)
> +		return -EINVAL;
> +
> +	shift =3D ffs(div) - 1;
> +	if (shift > SUN6I_AR100_SHIFT_MAX)
> +		shift =3D SUN6I_AR100_SHIFT_MAX;
> +
> +	div >>=3D shift;
> +
> +	if (div > SUN6I_AR100_DIV_MAX)
> +		return -EINVAL;
> +
> +	val &=3D ~((SUN6I_AR100_SHIFT_MASK << SUN6I_AR100_SHIFT_SHIFT) |
> +		 (SUN6I_AR100_DIV_MASK << SUN6I_AR100_DIV_SHIFT));
> +	val |=3D (shift << SUN6I_AR100_SHIFT_SHIFT) |
> +	       (div << SUN6I_AR100_DIV_SHIFT);
> +	writel(val, clk->reg);
> +
> +	return 0;
> +}
> +
> +struct clk_ops ar100_ops =3D {
> +	.recalc_rate =3D ar100_recalc_rate,
> +	.determine_rate =3D ar100_determine_rate,
> +	.set_parent =3D ar100_set_parent,
> +	.get_parent =3D ar100_get_parent,
> +	.set_rate =3D ar100_set_rate,
> +};
> +
> +static int sun6i_a31_ar100_clk_register(struct platform_device *pdev=
)
> +{
> +	const char *parents[SUN6I_AR100_MAX_PARENTS];
> +	struct device_node *np =3D pdev->dev.of_node;
> +	const char *clk_name =3D np->name;
> +	struct clk_init_data init;
> +	struct ar100_clk *ar100;
> +	struct resource *r;
> +	struct clk *clk;
> +	int nparents;
> +	int i;
> +
> +	ar100 =3D devm_kzalloc(&pdev->dev, sizeof(*ar100), GFP_KERNEL);
> +	if (!ar100)
> +		return -ENOMEM;
> +
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ar100->reg =3D devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(ar100->reg))
> +		return PTR_ERR(ar100->reg);
> +
> +	nparents =3D of_clk_get_parent_count(np);
> +	if (nparents > SUN6I_AR100_MAX_PARENTS)
> +		nparents =3D SUN6I_AR100_MAX_PARENTS;
> +
> +	for (i =3D 0; i < nparents; i++)
> +		parents[i] =3D of_clk_get_parent_name(np, i);
> +
> +	of_property_read_string(np, "clock-output-names", &clk_name);
> +
> +	init.name =3D clk_name;
> +	init.ops =3D &ar100_ops;
> +	init.parent_names =3D parents;
> +	init.num_parents =3D nparents;
> +	init.flags =3D 0;
> +
> +	ar100->hw.init =3D &init;
> +
> +	clk =3D clk_register(&pdev->dev, &ar100->hw);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	return of_clk_add_provider(np, of_clk_src_simple_get, clk);
> +}
> +
> +static const struct clk_div_table sun6i_a31_apb0_divs[] =3D {
> +	{ .val =3D 0, .div =3D 2, },
> +	{ .val =3D 1, .div =3D 2, },
> +	{ .val =3D 2, .div =3D 4, },
> +	{ .val =3D 3, .div =3D 8, },
> +	{ /* sentinel */ },
> +};
> +
> +static int sun6i_a31_apb0_clk_register(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	const char *clk_name =3D np->name;
> +	const char *clk_parent;
> +	struct resource *r;
> +	void __iomem *reg;
> +	struct clk *clk;
> +
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	reg =3D devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +		clk_parent =3D of_clk_get_parent_name(np, 0);
> +	if (!clk_parent)
> +		return -EINVAL;

Indentation seems to be off here.

> +
> +	of_property_read_string(np, "clock-output-names", &clk_name);
> +
> +	clk =3D clk_register_divider_table(&pdev->dev, clk_name, clk_parent=
,
> +					 0, reg, 0, 2, 0, sun6i_a31_apb0_divs,
> +					 NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	return of_clk_add_provider(np, of_clk_src_simple_get, clk);
> +}
> +
> +static int sun6i_a31_apb0_gates_clk_register(struct platform_device =
*pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct clk_onecell_data *clk_data;
> +	const char *clk_parent;
> +	const char *clk_name;
> +	struct resource *r;
> +	void __iomem *reg;
> +	int gate_id;
> +	int ngates;
> +	int i;
> +
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	reg =3D devm_ioremap_resource(&pdev->dev, r);
> +	if (!reg)
> +		return PTR_ERR(reg);
> +
> +	clk_parent =3D of_clk_get_parent_name(np, 0);
> +	if (!clk_parent)
> +		return -EINVAL;
> +
> +	ngates =3D of_property_count_strings(np, "clock-output-names");
> +	if (ngates < 0)
> +		return ngates;
> +
> +	if (!ngates || ngates > SUN6I_APB0_GATES_MAX_SIZE)
> +		return -EINVAL;
> +
> +	clk_data =3D devm_kzalloc(&pdev->dev, sizeof(struct clk_onecell_dat=
a),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->clks =3D devm_kzalloc(&pdev->dev,
> +				      SUN6I_APB0_GATES_MAX_SIZE *
> +				      sizeof(struct clk *),
> +				      GFP_KERNEL);
> +	if (!clk_data->clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < ngates; i++) {
> +		of_property_read_string_index(np, "clock-output-names",
> +					      i, &clk_name);
> +
> +		gate_id =3D i;
> +		of_property_read_u32_index(np, "clock-indices", i, &gate_id);
> +
> +		WARN_ON(gate_id >=3D SUN6I_APB0_GATES_MAX_SIZE);
> +		if (gate_id >=3D SUN6I_APB0_GATES_MAX_SIZE)
> +			continue;
> +
> +		clk_data->clks[gate_id] =3D clk_register_gate(&pdev->dev,
> +							    clk_name,
> +							    clk_parent, 0,
> +							    reg, gate_id,
> +							    0, NULL);
> +		WARN_ON(IS_ERR(clk_data->clks[gate_id]));
> +	}
> +
> +	clk_data->clk_num =3D ngates;
> +
> +	return of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
> +}
> +
> +const struct of_device_id sun6i_a31_prcm_clk_dt_ids[] =3D {
> +	{
> +		.compatible =3D "allwinner,sun6i-a31-ar100-clk",
> +		.data =3D sun6i_a31_ar100_clk_register,
> +	},
> +	{
> +		.compatible =3D "allwinner,sun6i-a31-apb0-clk",
> +		.data =3D sun6i_a31_apb0_clk_register,
> +	},
> +	{
> +		.compatible =3D "allwinner,sun6i-a31-apb0-gates-clk",
> +		.data =3D sun6i_a31_apb0_gates_clk_register,
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static int sun6i_a31_prcm_clk_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	int (*register_func)(struct platform_device *pdev);
> +	const struct of_device_id *match;
> +
> +	match =3D of_match_node(sun6i_a31_prcm_clk_dt_ids, np);
> +	if (!match)
> +		return -EINVAL;
> +
> +	register_func =3D match->data;
> +	return register_func(pdev);
> +}
> +
> +static struct platform_driver sun6i_a31_prcm_clk_driver =3D {
> +	.driver =3D {
> +		.name =3D "sun6i-a31-prcm-clk",
> +		.owner =3D THIS_MODULE,
> +		.of_match_table =3D sun6i_a31_prcm_clk_dt_ids,
> +	},
> +	.probe =3D sun6i_a31_prcm_clk_probe,
> +};
> +module_platform_driver(sun6i_a31_prcm_clk_driver);
> +
> +MODULE_AUTHOR("Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>"=
);
> +MODULE_DESCRIPTION("Allwinner PRCM clock Driver");
> +MODULE_LICENSE("GPL v2");

Other than that, the code looks good to me. As we're nearing the merge=20
window and you need this for other drivers, let me know if you want me=20
to apply this and fixup the extra tab locally, or if you wish to respin=
=20
this patch with some more comments.

@Mike, any comments on this?

Cheers,

Emilio
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
