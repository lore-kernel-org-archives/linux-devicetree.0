From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [RESEND/PATCH v6 3/3] clk: qcom: Add A53 clock driver
Date: Fri, 28 Oct 2016 19:55:57 +0300
Message-ID: <173f4f0d-a201-d0e0-f8bb-db5122e5a78e@linaro.org>
References: <20161028015438.GG16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161028015438.GG16026@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/28/2016 04:54 AM, Stephen Boyd wrote:
> On 10/19, Georgi Djakov wrote:
>> Add a driver for the A53 Clock Controller. It is a hardware block that
>> implements a combined mux and half integer divider functionality. It can
>> choose between a fixed-rate clock or the dedicated A53 PLL. The source
>> and the divider can be set both at the same time.
>>
>> This is required for enabling CPU frequency scaling on platforms like
>> MSM8916.
>>
>
> Please Cc DT reviewers.
>

Ok, will do.

>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
>>  .../devicetree/bindings/clock/qcom,a53cc.txt       |  22 +++
>>  drivers/clk/qcom/Kconfig                           |   8 ++
>>  drivers/clk/qcom/Makefile                          |   1 +
>>  drivers/clk/qcom/a53cc.c                           | 155 +++++++++++++++++++++
>>  4 files changed, 186 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
>>  create mode 100644 drivers/clk/qcom/a53cc.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53cc.txt b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
>> new file mode 100644
>> index 000000000000..a025f062f177
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
>> @@ -0,0 +1,22 @@
>> +Qualcomm A53 CPU Clock Controller Binding
>> +------------------------------------------------
>> +The A53 CPU Clock Controller is hardware, which provides a combined
>> +mux and divider functionality for the CPU clocks. It can choose between
>> +a fixed rate clock and the dedicated A53 PLL.
>> +
>> +Required properties :
>> +- compatible : shall contain:
>> +
>> +			"qcom,a53cc"
>> +
>> +- reg : shall contain base register location and length
>> +	of the APCS region
>> +- #clock-cells : shall contain 1
>> +
>> +Example:
>> +
>> +	apcs: syscon@b011000 {
>> +		compatible = "qcom,a53cc", "syscon";
>
> Why is it a syscon? Is that part used?

It is not used in this patchset. I will remove the syscon part from the
example and will change the compatible to qcom,a53cc-msm8916, as this
also seems to be SoC specific.

>
>> +		reg = <0x0b011000 0x1000>;
>> +		#clock-cells = <1>;
>> +	};
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index a889f0b14b54..59dfcdc340e4 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -159,3 +159,11 @@ config QCOM_A53PLL
>>  	  support for CPU frequencies above 1GHz.
>>  	  Say Y if you want to support CPU frequency scaling on devices
>>  	  such as MSM8916.
>> +
>> +config QCOM_A53CC
>> +	bool "A53 Clock Controller"
>
> Can't these configs be tristate? Same applies to A53PLL.
>

I am using __clk_lookup() in this patch below, which is not exported.
The A53PLL could be a tristate, but i just made them both builtins for
consistency.

>> +	depends on COMMON_CLK_QCOM && QCOM_A53PLL
>> +	help
>> +	  Support for the A53 clock controller on some Qualcomm devices.
>> +	  Say Y if you want to support CPU frequency scaling on devices
>> +	  such as MSM8916.
>> diff --git a/drivers/clk/qcom/a53cc.c b/drivers/clk/qcom/a53cc.c
>> new file mode 100644
>> index 000000000000..4d20db9da407
>> --- /dev/null
>> +++ b/drivers/clk/qcom/a53cc.c
>> @@ -0,0 +1,155 @@
>> +/*
>> + * Copyright (c) 2016, Linaro Limited
>> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/cpu.h>
>
> Is this include used?

It isn't. Removed!

>
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-mux-div.h"
>> +
>> +enum {
>> +	P_GPLL0,
>> +	P_A53PLL,
>> +};
>> +
>> +static const struct parent_map gpll0_a53cc_map[] = {
>> +	{ P_GPLL0, 4 },
>> +	{ P_A53PLL, 5 },
>> +};
>> +
>> +static const char * const gpll0_a53cc[] = {
>> +	"gpll0_vote",
>> +	"a53pll",
>> +};
>> +
>> +static const struct regmap_config a53cc_regmap_config = {
>> +	.reg_bits		= 32,
>> +	.reg_stride		= 4,
>> +	.val_bits		= 32,
>> +	.max_register		= 0x1000,
>> +	.fast_io		= true,
>> +	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
>> +};
>> +
>> +static const struct of_device_id qcom_a53cc_match_table[] = {
>> +	{ .compatible = "qcom,a53cc" },
>> +	{ }
>> +};
>
> Can you move this down next to the driver please?
>

Ok, sure.

>> +
>> +/*
>> + * We use the notifier function for switching to a temporary safe configuration
>> + * (mux and divider), while the a53 pll is reconfigured.
>> + */
>> +static int a53cc_notifier_cb(struct notifier_block *nb, unsigned long event,
>> +			     void *data)
>> +{
>> +	int ret = 0;
>> +	struct clk_regmap_mux_div *md = container_of(nb,
>> +						     struct clk_regmap_mux_div,
>> +						     clk_nb);
>> +
>> +	if (event == PRE_RATE_CHANGE)
>> +		ret = __mux_div_set_src_div(md, md->safe_src, md->safe_div);
>> +
>> +	return notifier_from_errno(ret);
>> +}
>> +
>> +static int qcom_a53cc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct clk_regmap_mux_div *a53cc;
>> +	struct resource *res;
>> +	void __iomem *base;
>> +	struct clk *pclk;
>> +	struct regmap *regmap;
>> +	struct clk_init_data init;
>
>  = { } for safety?
>

Yes, thanks!

>> +	int ret;
>> +
>> +	a53cc = devm_kzalloc(dev, sizeof(*a53cc), GFP_KERNEL);
>> +	if (!a53cc)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	a53cc->reg_offset = 0x50,
>> +	a53cc->hid_width = 5,
>> +	a53cc->hid_shift = 0,
>> +	a53cc->src_width = 3,
>> +	a53cc->src_shift = 8,
>> +	a53cc->safe_src = 4,
>> +	a53cc->safe_div = 3,
>
> Replace commas with semicolons please.
>
> Also do we need the safe things to be part of the struct? The
> notifier is here so we could just as easily hard code these
> things in the notifier.
>

Ok, will hardcode it with some comment.

Thanks again for reviewing!

BR,
Georgi

>> +	a53cc->parent_map = gpll0_a53cc_map,
>> +
>> +	init.name = "a53mux",
>> +	init.parent_names = gpll0_a53cc,
>> +	init.num_parents = 2,
>> +	init.ops = &clk_regmap_mux_div_ops,
>> +	init.flags = CLK_SET_RATE_PARENT;
>> +	a53cc->clkr.hw.init = &init;
>> +
>> +	pclk = __clk_lookup(gpll0_a53cc[1]);
>> +	if (!pclk)
>> +		return -EPROBE_DEFER;
>> +
>> +	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
>> +	ret = clk_notifier_register(pclk, &a53cc->clk_nb);
>> +	if (ret) {
>> +		dev_err(dev, "failed to register clock notifier: %d\n", ret);
>> +		return ret;
>> +	}
>
