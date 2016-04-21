From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH 1/2 v6] clk/axs10x: Add I2S PLL clock driver
Date: Thu, 21 Apr 2016 18:55:35 +0100
Message-ID: <57191417.6040909@synopsys.com>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <6bae37562ffc6c62c015e12b7bf6a35c9a3e734d.1461258787.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <6bae37562ffc6c62c015e12b7bf6a35c9a3e734d.1461258787.git.joabreu@synopsys.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-snps-arc@lists.infradead.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: CARLOS.PALMINHA@synopsys.com, Alexey.Brodkin@synopsys.com, Vineet.Gupta1@synopsys.com, mturquette@baylibre.com, sboyd@codeaurora.org, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Adding device tree mailing list and Rob Herring.

On 21-04-2016 18:19, Jose Abreu wrote:
> The ARC SDP I2S clock can be programmed using a
> specific PLL.
>
> This patch has the goal of adding a clock driver
> that programs this PLL.
>
> At this moment the rate values are hardcoded in
> a table but in the future it would be ideal to
> use a function which determines the PLL values
> given the desired rate.
>
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> ---
>
> Changes v5 -> v6:
> * Use parent clock to determine PLL input rate instead of using hardcoded values
> * Documentation update (added 'clocks' field)
>
> Changes v4 -> v5:
> * Documentation update (as suggested by Alexey Brodkin)
> * Changed compatible string to "snps,axs10x-i2s-pll-clock" (as suggested by Alexey Brodkin)
>
> Changes v3 -> v4:
> * Added binding document (as suggested by Stephen Boyd)
> * Minor code style fixes (as suggested by Stephen Boyd)
> * Use ioremap (as suggested by Stephen Boyd)
> * Implement round_rate (as suggested by Stephen Boyd)
> * Change to platform driver (as suggested by Stephen Boyd)
> * Use {readl/writel}_relaxed (as suggested by Vineet Gupta)
>
> Changes v2 -> v3:
> * Implemented recalc_rate
>
> Changes v1 -> v2:
> * Renamed folder to axs10x (as suggested by Alexey Brodkin)
> * Added more supported rates
>
>  .../bindings/clock/axs10x-i2s-pll-clock.txt        |  25 +++
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/axs10x/Makefile                        |   1 +
>  drivers/clk/axs10x/i2s_pll_clock.c                 | 228 +++++++++++++++++++++
>  4 files changed, 255 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt
>  create mode 100644 drivers/clk/axs10x/Makefile
>  create mode 100644 drivers/clk/axs10x/i2s_pll_clock.c
>
> diff --git a/Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt b/Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt
> new file mode 100644
> index 0000000..5ffc8df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt
> @@ -0,0 +1,25 @@
> +Binding for the AXS10X I2S PLL clock
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible: shall be "snps,axs10x-i2s-pll-clock"
> +- reg : address and length of the I2S PLL register set.
> +- clocks: shall be the input parent clock phandle for the PLL.
> +- #clock-cells: from common clock binding; Should always be set to 0.
> +
> +Example:
> +	pll_clock: pll_clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <27000000>;
> +		#clock-cells = <0>;
> +	};
> +
> +	i2s_clock@100a0 {
> +		compatible = "snps,axs10x-i2s-pll-clock";
> +		reg = <0x100a0 0x10>;
> +		clocks = <&pll_clock>;
> +		#clock-cells = <0>;
> +	};
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 46869d6..2ca62dc6 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -84,3 +84,4 @@ obj-$(CONFIG_X86)			+= x86/
>  obj-$(CONFIG_ARCH_ZX)			+= zte/
>  obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
>  obj-$(CONFIG_H8300)		+= h8300/
> +obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
> diff --git a/drivers/clk/axs10x/Makefile b/drivers/clk/axs10x/Makefile
> new file mode 100644
> index 0000000..01996b8
> --- /dev/null
> +++ b/drivers/clk/axs10x/Makefile
> @@ -0,0 +1 @@
> +obj-y += i2s_pll_clock.o
> diff --git a/drivers/clk/axs10x/i2s_pll_clock.c b/drivers/clk/axs10x/i2s_pll_clock.c
> new file mode 100644
> index 0000000..411310d
> --- /dev/null
> +++ b/drivers/clk/axs10x/i2s_pll_clock.c
> @@ -0,0 +1,228 @@
> +/*
> + * Synopsys AXS10X SDP I2S PLL clock driver
> + *
> + * Copyright (C) 2016 Synopsys
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/device.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +
> +/* PLL registers addresses */
> +#define PLL_IDIV_REG	0x0
> +#define PLL_FBDIV_REG	0x4
> +#define PLL_ODIV0_REG	0x8
> +#define PLL_ODIV1_REG	0xC
> +
> +struct i2s_pll_cfg {
> +	unsigned int rate;
> +	unsigned int idiv;
> +	unsigned int fbdiv;
> +	unsigned int odiv0;
> +	unsigned int odiv1;
> +};
> +
> +static const struct i2s_pll_cfg i2s_pll_cfg_27m[] = {
> +	/* 27 Mhz */
> +	{ 1024000, 0x104, 0x451, 0x10E38, 0x2000 },
> +	{ 1411200, 0x104, 0x596, 0x10D35, 0x2000 },
> +	{ 1536000, 0x208, 0xA28, 0x10B2C, 0x2000 },
> +	{ 2048000, 0x82, 0x451, 0x10E38, 0x2000 },
> +	{ 2822400, 0x82, 0x596, 0x10D35, 0x2000 },
> +	{ 3072000, 0x104, 0xA28, 0x10B2C, 0x2000 },
> +	{ 2116800, 0x82, 0x3CF, 0x10C30, 0x2000 },
> +	{ 2304000, 0x104, 0x79E, 0x10B2C, 0x2000 },
> +	{ 0, 0, 0, 0, 0 },
> +};
> +
> +static const struct i2s_pll_cfg i2s_pll_cfg_28m[] = {
> +	/* 28.224 Mhz */
> +	{ 1024000, 0x82, 0x105, 0x107DF, 0x2000 },
> +	{ 1411200, 0x28A, 0x1, 0x10001, 0x2000 },
> +	{ 1536000, 0xA28, 0x187, 0x10042, 0x2000 },
> +	{ 2048000, 0x41, 0x105, 0x107DF, 0x2000 },
> +	{ 2822400, 0x145, 0x1, 0x10001, 0x2000 },
> +	{ 3072000, 0x514, 0x187, 0x10042, 0x2000 },
> +	{ 2116800, 0x514, 0x42, 0x10001, 0x2000 },
> +	{ 2304000, 0x619, 0x82, 0x10001, 0x2000 },
> +	{ 0, 0, 0, 0, 0 },
> +};
> +
> +struct i2s_pll_clk {
> +	void __iomem *base;
> +	struct clk_hw hw;
> +	struct device *dev;
> +};
> +
> +static inline void i2s_pll_write(struct i2s_pll_clk *clk, unsigned int reg,
> +		unsigned int val)
> +{
> +	writel_relaxed(val, clk->base + reg);
> +}
> +
> +static inline unsigned int i2s_pll_read(struct i2s_pll_clk *clk,
> +		unsigned int reg)
> +{
> +	return readl_relaxed(clk->base + reg);
> +}
> +
> +static inline struct i2s_pll_clk *to_i2s_pll_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct i2s_pll_clk, hw);
> +}
> +
> +static inline unsigned int i2s_pll_get_value(unsigned int val)
> +{
> +	return (val & 0x3F) + ((val >> 6) & 0x3F);
> +}
> +
> +static const struct i2s_pll_cfg *i2s_pll_get_cfg(unsigned long prate)
> +{
> +	switch (prate) {
> +	case 27000000:
> +		return i2s_pll_cfg_27m;
> +	case 28224000:
> +		return i2s_pll_cfg_28m;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static unsigned long i2s_pll_recalc_rate(struct clk_hw *hw,
> +			unsigned long parent_rate)
> +{
> +	struct i2s_pll_clk *clk = to_i2s_pll_clk(hw);
> +	unsigned int idiv, fbdiv, odiv;
> +
> +	idiv = i2s_pll_get_value(i2s_pll_read(clk, PLL_IDIV_REG));
> +	fbdiv = i2s_pll_get_value(i2s_pll_read(clk, PLL_FBDIV_REG));
> +	odiv = i2s_pll_get_value(i2s_pll_read(clk, PLL_ODIV0_REG));
> +
> +	return ((parent_rate / idiv) * fbdiv) / odiv;
> +}
> +
> +static long i2s_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +			unsigned long *prate)
> +{
> +	struct i2s_pll_clk *clk = to_i2s_pll_clk(hw);
> +	const struct i2s_pll_cfg *pll_cfg = i2s_pll_get_cfg(*prate);
> +	int i;
> +
> +	if (!pll_cfg) {
> +		dev_err(clk->dev, "invalid parent rate=%ld\n", *prate);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; pll_cfg[i].rate != 0; i++)
> +		if (pll_cfg[i].rate == rate)
> +			return rate;
> +
> +	return -EINVAL;
> +}
> +
> +static int i2s_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			unsigned long parent_rate)
> +{
> +	struct i2s_pll_clk *clk = to_i2s_pll_clk(hw);
> +	const struct i2s_pll_cfg *pll_cfg = i2s_pll_get_cfg(parent_rate);
> +	int i;
> +
> +	if (!pll_cfg) {
> +		dev_err(clk->dev, "invalid parent rate=%ld\n", parent_rate);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; pll_cfg[i].rate != 0; i++) {
> +		if (pll_cfg[i].rate == rate) {
> +			i2s_pll_write(clk, PLL_IDIV_REG, pll_cfg[i].idiv);
> +			i2s_pll_write(clk, PLL_FBDIV_REG, pll_cfg[i].fbdiv);
> +			i2s_pll_write(clk, PLL_ODIV0_REG, pll_cfg[i].odiv0);
> +			i2s_pll_write(clk, PLL_ODIV1_REG, pll_cfg[i].odiv1);
> +			return 0;
> +		}
> +	}
> +
> +	dev_err(clk->dev, "invalid rate=%ld, parent_rate=%ld\n", rate,
> +			parent_rate);
> +	return -EINVAL;
> +}
> +
> +static const struct clk_ops i2s_pll_ops = {
> +	.recalc_rate = i2s_pll_recalc_rate,
> +	.round_rate = i2s_pll_round_rate,
> +	.set_rate = i2s_pll_set_rate,
> +};
> +
> +static int i2s_pll_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	const char *clk_name;
> +	const char *parent_name;
> +	struct clk *clk;
> +	struct i2s_pll_clk *pll_clk;
> +	struct clk_init_data init;
> +	struct resource *mem;
> +
> +	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> +	if (!pll_clk)
> +		return -ENOMEM;
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	pll_clk->base = devm_ioremap_resource(dev, mem);
> +	if (IS_ERR(pll_clk->base))
> +		return PTR_ERR(pll_clk->base);
> +
> +	clk_name = node->name;
> +	init.name = clk_name;
> +	init.ops = &i2s_pll_ops;
> +	parent_name = of_clk_get_parent_name(node, 0);
> +	init.parent_names = &parent_name;
> +	init.num_parents = 1;
> +	pll_clk->hw.init = &init;
> +	pll_clk->dev = dev;
> +
> +	clk = devm_clk_register(dev, &pll_clk->hw);
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "failed to register %s clock (%ld)\n",
> +				clk_name, PTR_ERR(clk));
> +		return PTR_ERR(clk);
> +	}
> +
> +	return of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +}
> +
> +static int i2s_pll_clk_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
> +	return 0;
> +}
> +
> +static const struct of_device_id i2s_pll_clk_id[] = {
> +	{ .compatible = "snps,axs10x-i2s-pll-clock", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, i2s_pll_clk_id);
> +
> +static struct platform_driver i2s_pll_clk_driver = {
> +	.driver = {
> +		.name = "axs10x-i2s-pll-clock",
> +		.of_match_table = i2s_pll_clk_id,
> +	},
> +	.probe = i2s_pll_clk_probe,
> +	.remove = i2s_pll_clk_remove,
> +};
> +module_platform_driver(i2s_pll_clk_driver);
> +
> +MODULE_AUTHOR("Jose Abreu <joabreu@synopsys.com>");
> +MODULE_DESCRIPTION("Synopsys AXS10X SDP I2S PLL Clock Driver");
> +MODULE_LICENSE("GPL v2");

