From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: hisilicon: add CRG driver for Hi3798CV200 SoC
Date: Wed, 14 Sep 2016 14:01:34 -0700
Message-ID: <20160914210134.GD7243@codeaurora.org>
References: <1473670888-17997-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473670888-17997-1-git-send-email-xuejiancheng@hisilicon.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, gaofei@hisilicon.com, hermit.wangheming@hisilicon.com, scott.bambrough@linaro.org, mark.gregotski@linaro.org
List-Id: devicetree@vger.kernel.org

On 09/12, Jiancheng Xue wrote:
> Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
> Generator) module generates clock and reset signals used
> by other module blocks on SoC.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>

Overall looks fine. Just a few nitpicks.

> ---
>  .../devicetree/bindings/clock/hi3519-crg.txt       |  46 ----
>  .../devicetree/bindings/clock/hisi-crg.txt         |  49 ++++

I wonder if git format-patch -M would make it more apparent about
what's changed across the file rename?

>  drivers/clk/hisilicon/Kconfig                      |   8 +
>  drivers/clk/hisilicon/Makefile                     |   1 +
>  drivers/clk/hisilicon/crg-hi3798cv200.c            | 304 +++++++++++++++++++++
>  drivers/clk/hisilicon/crg.h                        |  39 +++
>  include/dt-bindings/clock/histb-clock.h            |  64 +++++
>  7 files changed, 465 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/hi3519-crg.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/hisi-crg.txt
>  create mode 100644 drivers/clk/hisilicon/crg-hi3798cv200.c
>  create mode 100644 drivers/clk/hisilicon/crg.h
>  create mode 100644 include/dt-bindings/clock/histb-clock.h
> 
> diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
> index e169ec7..233d809 100644
> --- a/drivers/clk/hisilicon/Makefile
> +++ b/drivers/clk/hisilicon/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_ARCH_HI3xxx)	+= clk-hi3620.o
>  obj-$(CONFIG_ARCH_HIP04)	+= clk-hip04.o
>  obj-$(CONFIG_ARCH_HIX5HD2)	+= clk-hix5hd2.o
>  obj-$(CONFIG_COMMON_CLK_HI3519)	+= clk-hi3519.o
> +obj-$(CONFIG_COMMON_CLK_HI3798CV200) += crg-hi3798cv200.o

Tab this out?

>  obj-$(CONFIG_COMMON_CLK_HI6220)	+= clk-hi6220.o
>  obj-$(CONFIG_RESET_HISI)	+= reset.o
>  obj-$(CONFIG_STUB_CLK_HI6220)	+= clk-hi6220-stub.o
> diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
> new file mode 100644
> index 0000000..b763b99
> --- /dev/null
> +++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
> @@ -0,0 +1,304 @@
[...]
> +
> +static struct hisi_crg_funcs hi3798cv200_crg_funcs = {

const?

> +	.register_clks = hi3798cv200_clk_register,
> +	.unregister_clks = hi3798cv200_clk_unregister,
> +};
> +
> +/* hi3798CV200 sysctrl CRG */
> +
> +#define HI3798CV200_SYSCTRL_NR_CLKS 16
> +
> +static const struct hisi_gate_clock hi3798cv200_sysctrl_gate_clks[] = {
> +	{ IR_CLK, "clk_ir", "100m",
> +		CLK_SET_RATE_PARENT, 0x48, 4, 0, },
> +	{ TIMER01_CLK, "clk_timer01", "24m",
> +		CLK_SET_RATE_PARENT, 0x48, 6, 0, },
> +	{ UART0_CLK, "clk_uart0", "75m",
> +		CLK_SET_RATE_PARENT, 0x48, 10, 0, },
> +};
> +
> +static struct hisi_clock_data *hi3798cv200_sysctrl_clk_register(
> +					struct platform_device *pdev)
> +{
> +	struct hisi_clock_data *clk_data;
> +	int ret;
> +
> +	clk_data = hisi_clk_alloc(pdev, HI3798CV200_SYSCTRL_NR_CLKS);
> +	if (!clk_data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = hisi_clk_register_gate(hi3798cv200_sysctrl_gate_clks,
> +				ARRAY_SIZE(hi3798cv200_sysctrl_gate_clks),
> +				clk_data);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = of_clk_add_provider(pdev->dev.of_node,
> +			of_clk_src_onecell_get, &clk_data->clk_data);
> +	if (ret)
> +		goto unregister_gate;
> +
> +	return clk_data;
> +
> +unregister_gate:
> +	hisi_clk_unregister_gate(hi3798cv200_sysctrl_gate_clks,
> +				ARRAY_SIZE(hi3798cv200_sysctrl_gate_clks),
> +				clk_data);
> +	return ERR_PTR(ret);
> +}
> +
> +static void hi3798cv200_sysctrl_clk_unregister(struct platform_device *pdev)
> +{
> +	struct hisi_crg_dev *crg = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(pdev->dev.of_node);
> +
> +	hisi_clk_unregister_gate(hi3798cv200_sysctrl_gate_clks,
> +				ARRAY_SIZE(hi3798cv200_sysctrl_gate_clks),
> +				crg->clk_data);
> +}
> +
> +static struct hisi_crg_funcs hi3798cv200_sysctrl_funcs = {

const?

> +	.register_clks = hi3798cv200_sysctrl_clk_register,
> +	.unregister_clks = hi3798cv200_sysctrl_clk_unregister,
> +};
> +
> +static const struct of_device_id hi3798cv200_crg_match_table[] = {
> +	{ .compatible = "hisilicon,hi3798cv200-crg",
> +		.data = &hi3798cv200_crg_funcs},

Nitpick: please add a space before }

> +	{ .compatible = "hisilicon,hi3798cv200-sysctrl",
> +		.data = &hi3798cv200_sysctrl_funcs},

Nitpick: please add a space before }

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, hi3798cv200_clk_match_table);
> +
> +static int hi3798cv200_crg_probe(struct platform_device *pdev)
> +{
> +	struct hisi_crg_dev *crg;
> +	const struct of_device_id *match;
> +
> +	crg = devm_kmalloc(&pdev->dev, sizeof(*crg), GFP_KERNEL);
> +	if (!crg)
> +		return -ENOMEM;
> +
> +	match = of_match_node(hi3798cv200_crg_match_table, pdev->dev.of_node);
> +	crg->funcs = (struct hisi_crg_funcs *)match->data;

We can use of_device_get_match_data() here to simplify things.

> +
> +	crg->rstc = hisi_reset_init(pdev);
> +	if (!crg->rstc)
> +		return -ENOMEM;
> +
> diff --git a/drivers/clk/hisilicon/crg.h b/drivers/clk/hisilicon/crg.h
> new file mode 100644
> index 0000000..145b929
> --- /dev/null
> +++ b/drivers/clk/hisilicon/crg.h
> @@ -0,0 +1,39 @@
> +/*
> + * HiSilicon Clock and Reset Driver Header
> + *
> + * Copyright (c) 2016 HiSilicon Limited.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, write to the Free Software Foundation, Inc.,
> + * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + *
> + */
> +
> +#ifndef	__HISI_CRG_H
> +#define	__HISI_CRG_H

Weird tab here. Please replace with space.

> +
> +struct hisi_clock_data;
> +struct hisi_reset_controller;
> +
> +struct hisi_crg_funcs {
> +	struct hisi_clock_data*	(*register_clks)(struct platform_device *pdev);
> +	void (*unregister_clks)(struct platform_device *pdev);
> +};
> +
> +struct hisi_crg_dev {
> +	struct hisi_clock_data *clk_data;
> +	struct hisi_reset_controller *rstc;
> +	struct hisi_crg_funcs	*funcs;
> +};
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
