From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [RESEND/PATCH v6 1/3] clk: qcom: Add A53 PLL support
Date: Fri, 28 Oct 2016 19:47:55 +0300
Message-ID: <01b1f1c6-18f6-1aeb-c53f-34c00886b506@linaro.org>
References: <20161019132816.31073-1-georgi.djakov@linaro.org>
 <20161019132816.31073-2-georgi.djakov@linaro.org>
 <20161028014914.GF16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20161028014914.GF16026@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen, thanks for reviewing!

On 10/28/2016 04:49 AM, Stephen Boyd wrote:
> On 10/19, Georgi Djakov wrote:
>> Add support for the PLL, which generates the higher range of CPU
>> frequencies on MSM8916 platforms.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>
> Please Cc dt reviewers.

Ok, sure!

>
>> ---
>>  .../devicetree/bindings/clock/qcom,a53-pll.txt     | 17 ++++
>>  drivers/clk/qcom/Kconfig                           |  9 +++
>>  drivers/clk/qcom/Makefile                          |  1 +
>>  drivers/clk/qcom/a53-pll.c                         | 94 ++++++++++++++++++++++
>>  4 files changed, 121 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53-pll.txt
>>  create mode 100644 drivers/clk/qcom/a53-pll.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53-pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53-pll.txt
>> new file mode 100644
>> index 000000000000..50e71e4e13a6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,a53-pll.txt
>> @@ -0,0 +1,17 @@
>> +A53 PLL Binding
>> +---------------
>> +The A53 PLL is the main CPU PLL used for frequencies above 1GHz.
>
> Perhaps add which SoC(s) its in?

Ok, done!

>
>> +
>> +Required properties :
>> +- compatible : Shall contain only one of the following:
>> +
>> +		"qcom,a53-pll"
>
> And this could be something more SoC specific too?

I will make it qcom,a53pll-msm8916

>
>> +
>> +- reg : shall contain base register location and length
>> +
>> +Example:
>> +
>> +	a53pll: a53pll@0b016000 {
>
> Drop the leading 0

Ok, done!

>
>> +		compatible = "qcom,a53-pll";
>> +		reg = <0x0b016000 0x40>;
>
> Should probably have #clock-cells = <0> just in case.
>

Ok, done!

>> +	};
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 1fb1f5476cb0..7d27f47f0c92 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -29,3 +29,4 @@ obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
>>  obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
>>  obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
>>  obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
>> +obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
>> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
>> new file mode 100644
>> index 000000000000..43902080f34b
>> --- /dev/null
>> +++ b/drivers/clk/qcom/a53-pll.c
>> @@ -0,0 +1,94 @@
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
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>
> #include <linux/clk-provider.h>?
>

Ok.

>> +
>> +#include "clk-pll.h"
>> +#include "clk-regmap.h"
>> +
>> +static struct pll_freq_tbl a53pll_freq[] = {
>
> Can this be const?
>

Yes, done!

>> +	{  998400000, 52, 0x0, 0x1, 0 },
>> +	{ 1094400000, 57, 0x0, 0x1, 0 },
>> +	{ 1152000000, 62, 0x0, 0x1, 0 },
>> +	{ 1209600000, 65, 0x0, 0x1, 0 },
>> +	{ 1401600000, 73, 0x0, 0x1, 0 },
>> +};
>> +
>> +static const struct regmap_config a53pll_regmap_config = {
>> +	.reg_bits		= 32,
>> +	.reg_stride		= 4,
>> +	.val_bits		= 32,
>> +	.max_register		= 0x40,
>> +	.fast_io		= true,
>> +	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
>> +};
>> +
>> +static const struct of_device_id qcom_a53pll_match_table[] = {
>> +	{ .compatible = "qcom,a53-pll" },
>> +	{ }
>> +};
>> +
>> +static int qcom_a53pll_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct clk_pll *pll;
>> +	struct resource *res;
>> +	void __iomem *base;
>> +	struct regmap *regmap;
>> +	struct clk_init_data init;
>
> Initialize to { } for safety?
>

Ok!

>> +
>> +	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
>> +	if (!pll)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	regmap = devm_regmap_init_mmio(dev, base, &a53pll_regmap_config);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	pll->l_reg = 0x04,
>> +	pll->m_reg = 0x08,
>> +	pll->n_reg = 0x0c,
>> +	pll->config_reg = 0x14,
>> +	pll->mode_reg = 0x00,
>> +	pll->status_reg = 0x1c,
>> +	pll->status_bit = 16,
>> +	pll->freq_tbl = a53pll_freq,
>
> Replace commas with semicolon please.
>

Ah, right! Done!

>> +
>> +	init.name = node->name;
>
> Please just hardcode the string name for now. Best to not get
> tied down to DT node names if we don't need to.
>

Ok, will hardcode it as a53pll.

>> +	init.parent_names = (const char *[]){ "xo" },
>> +	init.num_parents = 1,
>> +	init.ops = &clk_pll_sr2_ops,
>> +	init.flags = CLK_IS_CRITICAL;
>> +	pll->clkr.hw.init = &init;
>> +
>> +	return devm_clk_register_regmap(dev, &pll->clkr);
>> +}
>> +
>> +static struct platform_driver qcom_a53pll_driver = {
>> +	.probe = qcom_a53pll_probe,
>> +	.driver = {
>> +		.name = "qcom-a53pll",
>> +		.of_match_table = qcom_a53pll_match_table,
>> +	},
>> +};
>> +
>> +builtin_platform_driver(qcom_a53pll_driver);
>
