Return-Path: <SRS0=64EP=6V=codeaurora.org=tirupath@kernel.org>
Subject: Re: [PATCH V1] clk: qcom: Add qpnp clock divider support
References: <1499945536-18281-1-git-send-email-tirupath@codeaurora.org>
 <1499945536-18281-2-git-send-email-tirupath@codeaurora.org>
 <20170714210837.GK22780@codeaurora.org>
From: Tirupathi Reddy T <tirupath@codeaurora.org>
Message-ID: <f488d813-9dcc-4d32-c40c-fa15bfdd2cf9@codeaurora.org>
Date: Tue, 18 Jul 2017 17:05:17 +0530
MIME-Version: 1.0
In-Reply-To: <20170714210837.GK22780@codeaurora.org>
Content-Type: multipart/alternative;
 boundary="------------FACB47EF1C5B6D58E3D2D2E3"
Content-Language: en-US
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------FACB47EF1C5B6D58E3D2D2E3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/2017 2:38 AM, Stephen Boyd wrote:
> On 07/13, Tirupathi Reddy wrote:
>> diff --git a/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt b/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt
>> new file mode 100644
>> index 0000000..03b7b70
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt
>> @@ -0,0 +1,52 @@
>> +Qualcomm Technologies, Inc. QPNP clock divider (clkdiv)
>> +
>> +clkdiv configures the clock frequency of a set of outputs on the PMIC.
>> +These clocks are typically wired through alternate functions on
>> +gpio pins.
>> +
>> +=======================
>> +Supported Properties
>> +=======================
>> +
>> +- compatible
>> +	Usage:      required
>> +	Value type: <string>
>> +	Definition: should be "qcom,qpnp-clkdiv".
>> +
>> +- reg
>> +	Usage:      required
>> +	Value type: <prop-encoded-array>
>> +	Definition: Addresses and sizes for the memory of this CLKDIV
>> +		    peripheral.
>> +
>> +- qcom,cxo-freq
>> +	Usage:      required
>> +	Value type: <u32>
>> +	Definition: The frequency of the crystal oscillator (CXO) clock in Hz.
> CXO should be a parent clk then. This could have clocks and
> clock-names properties for that and then be hooked up to
> xo_board.
Sure. I will address in the next patch set.
>> +
>> +- qcom,clkdiv-id
>> +	Usage:      required
>> +	Value type: <u32>
>> +	Definition: Integer value specifies the hardware identifier of this
>> +		    CLKDIV peripheral.
> This is to name the clk? You could use clock-output-names as
> that's more standard. But this is also sort of confusing. If
> there are multiple clkdivs then it would be good to combine them
> into one device node assuming they're all next to each other.
> This would be similar to how we handle gpios and regulators. Then
> the naming is simple enough to be an incrementing number.
Yes, multiple clkdivs present. We add sub-nodes for each clkdiv and 
parse them inside driver as separate clock.
>> +
>> +- qcom,clkdiv-init-freq
>> +	Usage:      optional
>> +	Value type: <u32>
>> +	Definition: Initial output frequency in Hz to configure for the CLKDIV
>> +		    peripheral. The initial frequency value should be less than
>> +		    or equal to CXO clock frequency and greater than or equal to
>> +		    CXO_freq/64.
> Use assigned-clock-rates instead.
Sure. I will address in the next patch set.
>> +
>> +=======
>> +Example
>> +=======
>> +
>> +qcom,clkdiv@5b00 {
>> +	compatible = "qcom,qpnp-clkdiv";
>> +	reg = <0x5b00 0x100>;
>> +
>> +	qcom,cxo-freq = <19200000>;
>> +	qcom,clkdiv-id = <1>;
>> +	qcom,clkdiv-init-freq = <9600000>;
>> +};
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 9f6c278..c68ae96 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -196,3 +196,12 @@ config MSM_MMCC_8996
>>   	  Support for the multimedia clock controller on msm8996 devices.
>>   	  Say Y if you want to support multimedia devices such as display,
>>   	  graphics, video encode/decode, camera, etc.
>> +
>> +config CLOCK_QPNP_DIV
>> +	tristate "QPNP PMIC clkdiv driver"
>> +	depends on COMMON_CLK_QCOM && SPMI
> COMPILE_TEST?
Sure. I will address in the next patch set.
>
>> +	help
>> +	  This driver supports the clkdiv functionality on the Qualcomm
>> +	  Technologies, Inc. QPNP PMIC. It configures the frequency of
> I'm not sure we ever really call it QPNP PMIC. I see one hit from
> grep for the thermal driver. Perhaps SPMI PMIC is more
> appropriate.
Sure. I will address in the next patch set.
>
>> +	  clkdiv outputs on the PMIC. These clocks are typically wired
>> +	  through alternate functions on gpio pins.
>> diff --git a/drivers/clk/qcom/clk-qpnp-div.c b/drivers/clk/qcom/clk-qpnp-div.c
>> new file mode 100644
>> index 0000000..416c20f
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-qpnp-div.c
>> @@ -0,0 +1,422 @@
>> +/* Copyright (c) 2017, The Linux Foundation. All rights reserved.
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
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/log2.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/types.h>
> bitops.h?
Sure. I will add it in the next patch set.
>
>> +
>> +#define Q_REG_DIV_CTL1			0x43
>> +#define Q_DIV_CTL1_DIV_FACTOR_MASK	GENMASK(2, 0)
>> +
>> +#define Q_REG_EN_CTL			0x46
>> +#define Q_REG_EN_MASK			BIT(7)
>> +#define Q_SET_EN			BIT(7)
>> +
>> +#define Q_CXO_PERIOD_NS(cxo_clk)	(NSEC_PER_SEC / cxo_clk)
>> +#define Q_DIV_PERIOD_NS(cxo_clk, div)	(NSEC_PER_SEC / (cxo_clk / div))
>> +#define Q_ENABLE_DELAY_NS(cxo_clk, div)	(2 * Q_CXO_PERIOD_NS(cxo_clk) + \
>> +					(3 * Q_DIV_PERIOD_NS(cxo_clk, div)))
>> +#define Q_DISABLE_DELAY_NS(cxo_clk, div) \
>> +					(3 * Q_DIV_PERIOD_NS(cxo_clk, div))
>> +
>> +#define CLK_QPNP_DIV_OFFSET		1
>> +
>> +enum q_clk_div_factor {
>> +	Q_CLKDIV_XO_DIV_1_0 = 0,
>> +	Q_CLKDIV_XO_DIV_1,
>> +	Q_CLKDIV_XO_DIV_2,
>> +	Q_CLKDIV_XO_DIV_4,
>> +	Q_CLKDIV_XO_DIV_8,
>> +	Q_CLKDIV_XO_DIV_16,
>> +	Q_CLKDIV_XO_DIV_32,
>> +	Q_CLKDIV_XO_DIV_64,
>> +	Q_CLKDIV_MAX_ALLOWED,
> Please make #defines for these instead of enum.
We used enum primarily for easy debug at runtime. For an example, The 
"div_factor" field
of "struct q_clkdiv" would always show the enumerated value which would 
help in
determining the configured absolute divider value rather than spending 
time in mapping
register bit values to absolute divider value.
>
>> +};
>> +
>> +enum q_clkdiv_state {
>> +	DISABLE = false,
>> +	ENABLE = true,
>> +};
> Uh no. Just use bool.
Sure. I will address in the next patch set.
>
>> +
>> +struct q_clkdiv {
>> +	struct regmap		*regmap;
>> +	struct device		*dev;
>> +
>> +	u16			base;
>> +	spinlock_t		lock;
>> +
>> +	/* clock properties */
>> +	struct clk_hw		hw;
>> +	unsigned int		cxo_hz;
> Drop.
cxo_hz is required to be populated at driver initialization and being 
used at runtime
for calculating the div value to be applied.
>
>> +	enum q_clk_div_factor	div_factor;
>> +	bool			enabled;
> Shouldn't be needed. Read the hardware instead.
This enabled field is required for the typical handling of set_rate in 
qpnp_clkdiv_config_freq_div().
**
>
>> +};
>> +
>> +static inline struct q_clkdiv *to_clkdiv(struct clk_hw *_hw)
> _hw can just be hw?
Sure. I will address it in next patch set.
>
>> +{
>> +	return container_of(_hw, struct q_clkdiv, hw);
>> +}
>> +
>> +static inline unsigned int div_factor_to_div(unsigned int div_factor)
>> +{
>> +	if (div_factor == Q_CLKDIV_XO_DIV_1_0)
>> +		return 1;
>> +
>> +	return 1 << (div_factor - CLK_QPNP_DIV_OFFSET);
>> +}
> Not sure, but it may be possible to reuse the code in
> clk-divider.c and treat this as a CLK_DIVIDER_POWER_OF_TWO?
Sure. I will check more on this.
>
>> +
>> +static inline unsigned int div_to_div_factor(unsigned int div)
>> +{
>> +	return ilog2(div) + CLK_QPNP_DIV_OFFSET;
>> +}
>> +
>> +static int qpnp_clkdiv_masked_write(struct q_clkdiv *q_clkdiv, u16 offset,
> Please replace instances of qpnp with spmi_pmic throughout this
> driver.
Sure. I will address it in next patch set.
> Also, why do we need a wrapper around regmap APIs? Please just
> use the APIs directly.
Sure. I will address it in next patch set.
>> +			u8 mask, u8 val)
>> +{
>> +	int rc;
>> +
>> +	rc = regmap_update_bits(q_clkdiv->regmap, q_clkdiv->base + offset, mask,
>> +				val);
>> +	if (rc)
>> +		dev_err(q_clkdiv->dev,
>> +			"Unable to regmap_update_bits to addr=%hx, rc(%d)\n",
>> +			q_clkdiv->base + offset, rc);
>> +
>> +	return rc;
>> +}
>> +
>> +static int qpnp_clkdiv_set_enable_state(struct q_clkdiv *q_clkdiv,
>> +			enum q_clkdiv_state enable_state)
>> +{
>> +	int rc;
>> +
>> +	rc = qpnp_clkdiv_masked_write(q_clkdiv, Q_REG_EN_CTL, Q_REG_EN_MASK,
>> +				(enable_state == ENABLE) ? Q_SET_EN : 0);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (enable_state == ENABLE)
>> +		ndelay(Q_ENABLE_DELAY_NS(q_clkdiv->cxo_hz,
>> +				div_factor_to_div(q_clkdiv->div_factor)));
> Can this factor can be precalculated at probe time based on
> XO rate? And then we just multiply that factor with the divider
> value to figure out how long to wait?
Sure. I will check more on this.
>
>> +	else
>> +		ndelay(Q_DISABLE_DELAY_NS(q_clkdiv->cxo_hz,
>> +				div_factor_to_div(q_clkdiv->div_factor)));
>> +
>> +	return rc;
>> +}
>> +
>> +static int qpnp_clkdiv_config_freq_div(struct q_clkdiv *q_clkdiv,
>> +			unsigned int div)
>> +{
>> +	unsigned int div_factor;
>> +	int rc;
>> +
>> +	div_factor = div_to_div_factor(div);
>> +	if (div_factor <= 0 || div_factor >= Q_CLKDIV_MAX_ALLOWED)
>> +		return -EINVAL;
>> +
>> +	if (q_clkdiv->enabled) {
>> +		rc = qpnp_clkdiv_set_enable_state(q_clkdiv, DISABLE);
>> +		if (rc) {
>> +			dev_err(q_clkdiv->dev, "unable to disable clock, rc = %d\n",
>> +				rc);
>> +			return rc;
>> +		}
>> +	}
>> +
>> +	rc = qpnp_clkdiv_masked_write(q_clkdiv, Q_REG_DIV_CTL1,
>> +				Q_DIV_CTL1_DIV_FACTOR_MASK, div_factor);
>> +	if (rc) {
>> +		dev_err(q_clkdiv->dev, "config divider failed, rc=%d\n",
>> +			rc);
>> +		return rc;
>> +	}
>> +
>> +	q_clkdiv->div_factor = div_factor;
>> +
>> +	if (q_clkdiv->enabled) {
>> +		rc = qpnp_clkdiv_set_enable_state(q_clkdiv, ENABLE);
>> +		if (rc)
>> +			dev_err(q_clkdiv->dev, "unable to re-enable clock, rc = %d\n",
>> +				rc);
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>> +static int clk_qpnp_div_enable(struct clk_hw *hw)
>> +{
>> +	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
>> +	unsigned long flags;
>> +	int rc;
>> +
>> +	spin_lock_irqsave(&q_clkdiv->lock, flags);
> What is this locking against? Rate change?
Yes, locking against "q_clkdiv->enabled".
>
>> +
>> +	rc =  qpnp_clkdiv_set_enable_state(q_clkdiv, ENABLE);
>> +	if (rc) {
>> +		dev_err(q_clkdiv->dev, "clk enable failed, rc=%d\n", rc);
>> +		goto fail;
>> +	}
>> +
>> +	q_clkdiv->enabled = true;
>> +
>> +fail:
>> +	spin_unlock_irqrestore(&q_clkdiv->lock, flags);
>> +	return rc;
>> +}
>> +
>> +static void clk_qpnp_div_disable(struct clk_hw *hw)
>> +{
>> +	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
>> +	unsigned long flags;
>> +	int rc;
>> +
>> +	spin_lock_irqsave(&q_clkdiv->lock, flags);
>> +
>> +	rc = qpnp_clkdiv_set_enable_state(q_clkdiv, DISABLE);
>> +	if (rc) {
>> +		dev_err(q_clkdiv->dev, "clk disable failed, rc=%d\n", rc);
>> +		goto fail;
>> +	}
>> +
>> +	q_clkdiv->enabled = false;
>> +
>> +fail:
>> +	spin_unlock_irqrestore(&q_clkdiv->lock, flags);
>> +}
>> +
>> +static long clk_qpnp_div_round_rate(struct clk_hw *hw, unsigned long rate,
>> +			unsigned long *parent_rate)
>> +{
>> +	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
>> +	unsigned long flags, new_rate;
>> +	unsigned int div, div_factor;
>> +
>> +	spin_lock_irqsave(&q_clkdiv->lock, flags);
>> +	if (rate <= 0 || rate > q_clkdiv->cxo_hz) {
> How can rate be less than zero? It's unsigned! And if it's
> greater than some parent rate, round_rate() should return the
> largest rate it can support (I guess parent_rate?)
Sure. I will address it in next patch set.
>
>> +		dev_err(q_clkdiv->dev, "invalid rate requested, rate = %lu\n",
>> +			rate);
>> +		spin_unlock_irqrestore(&q_clkdiv->lock, flags);
> Also what are we spinlocking for?
Seems locking is not required here. I will address it in next patch set.
>
>> +		return -EINVAL;
>> +	}
>> +
>> +	div = DIV_ROUND_UP(q_clkdiv->cxo_hz, rate);
>> +	div_factor = div_to_div_factor(div);
>> +	if (div_factor >= Q_CLKDIV_MAX_ALLOWED)
>> +		div_factor = Q_CLKDIV_MAX_ALLOWED - 1;
>> +	new_rate = q_clkdiv->cxo_hz / div_factor_to_div(div_factor);
>> +
>> +	spin_unlock_irqrestore(&q_clkdiv->lock, flags);
> Shouldn't need any spinlock here...
Seems locking is not required here. I will address it in next patch set.
>
>> +	return new_rate;
>> +}
>> +
>> +static unsigned long clk_qpnp_div_recalc_rate(struct clk_hw *hw,
>> +			unsigned long parent_rate)
>> +{
>> +	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
>> +	unsigned long rate, flags;
>> +
>> +	spin_lock_irqsave(&q_clkdiv->lock, flags);
>> +
>> +	rate = q_clkdiv->cxo_hz / div_factor_to_div(q_clkdiv->div_factor);
>> +
>> +	spin_unlock_irqrestore(&q_clkdiv->lock, flags);
> Also confused about spinlock usage here.
Seems locking is not required here. I will address it in next patch set
>
>> +	return rate;
>> +}
>> +
>> +static int clk_qpnp_div_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			unsigned long parent_rate)
>> +{
>> +	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
>> +	unsigned long flags;
>> +	int rc = 0;
>> +
>> +	spin_lock_irqsave(&q_clkdiv->lock, flags);
>> +	if (rate <= 0 || rate > q_clkdiv->cxo_hz) {
>> +		dev_err(q_clkdiv->dev, "invalid rate requested, rate = %lu\n",
>> +			rate);
>> +		rc = -EINVAL;
>> +		goto fail;
>> +	}
> Seems useless. Trust the framework won't call this op with a rate
> that's invalid.
I will check more on this and address in next patch set.
>
>> +
>> +	rc = qpnp_clkdiv_config_freq_div(q_clkdiv, q_clkdiv->cxo_hz / rate);
>> +	if (rc)
>> +		dev_err(q_clkdiv->dev, "clkdiv set rate(%lu) failed, rc = %d\n",
>> +			rate, rc);
>> +
>> +fail:
>> +	spin_unlock_irqrestore(&q_clkdiv->lock, flags);
>> +	return rc;
>> +}
>> +
>> +const struct clk_ops clk_qpnp_div_ops = {
> static?
Sure. I will address it in next patch set.
>
>> +	.enable = clk_qpnp_div_enable,
>> +	.disable = clk_qpnp_div_disable,
>> +	.set_rate = clk_qpnp_div_set_rate,
>> +	.recalc_rate = clk_qpnp_div_recalc_rate,
>> +	.round_rate = clk_qpnp_div_round_rate,
>> +};
>> +
>> +#define QPNP_CLKDIV_MAX_NAME_LEN	16
>> +
>> +static int qpnp_clkdiv_probe(struct platform_device *pdev)
>> +{
>> +	struct q_clkdiv *q_clkdiv;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *of_node = dev->of_node;
>> +	struct clk_init_data *init;
>> +	struct clk_onecell_data *clk_data;
>> +	struct clk *clk;
>> +	unsigned int base, div, init_freq;
>> +	int rc = 0, id;
> Leave rc unassigned.
Sure. I will address it in next patch set
>
>> +	char *clk_name;
>> +
>> +	q_clkdiv = devm_kzalloc(dev, sizeof(*q_clkdiv), GFP_KERNEL);
>> +	if (!q_clkdiv)
>> +		return -ENOMEM;
>> +
>> +	q_clkdiv->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (!q_clkdiv->regmap) {
>> +		dev_err(dev, "Couldn't get parent's regmap\n");
>> +		return -EINVAL;
>> +	}
>> +	q_clkdiv->dev = dev;
>> +
>> +	rc = of_property_read_u32(of_node, "reg", &base);
>> +	if (rc < 0) {
>> +		dev_err(dev, "Couldn't find reg in node = %s, rc = %d\n",
>> +			of_node->full_name, rc);
>> +		return rc;
>> +	}
>> +	q_clkdiv->base = base;
>> +
>> +	/* init clock properties */
>> +	rc = of_property_read_u32(of_node, "qcom,cxo-freq", &q_clkdiv->cxo_hz);
>> +	if (rc) {
>> +		dev_err(dev, "unable to get qcom,cxo-freq property, rc = %d\n",
>> +			rc);
>> +		return rc;
>> +	}
>> +
>> +	q_clkdiv->div_factor = Q_CLKDIV_XO_DIV_1_0;
>> +	rc = of_property_read_u32(of_node, "qcom,clkdiv-init-freq", &init_freq);
>> +	if (rc) {
>> +		if (rc != -EINVAL) {
>> +			dev_err(dev, "Unable to read initial frequency value, rc=%d\n",
>> +				rc);
>> +			return rc;
>> +		}
>> +	} else {
>> +		if (init_freq <= 0 || init_freq > q_clkdiv->cxo_hz) {
>> +			dev_err(dev, "invalid initial frequency specified, rate = %u\n",
>> +				init_freq);
>> +			return -EINVAL;
>> +		}
>> +
>> +		div = DIV_ROUND_UP(q_clkdiv->cxo_hz, init_freq);
>> +		q_clkdiv->div_factor = div_to_div_factor(div);
>> +		if (q_clkdiv->div_factor >= Q_CLKDIV_MAX_ALLOWED)
>> +			q_clkdiv->div_factor = Q_CLKDIV_MAX_ALLOWED - 1;
>> +		rc = qpnp_clkdiv_config_freq_div(q_clkdiv,
>> +				div_factor_to_div(q_clkdiv->div_factor));
>> +		if (rc) {
>> +			dev_err(dev, "Config initial frequency failed, rc = %d\n",
>> +				rc);
>> +			return rc;
>> +		}
>> +	}
> Hopefully a bunch of this code goes away.
I will check more on this and address in next patch set.
>
>> +
>> +	init = devm_kzalloc(dev, sizeof(*init), GFP_KERNEL);
>> +	if (!init)
>> +		return -ENOMEM;
>> +
>> +	rc = of_property_read_u32(of_node, "qcom,clkdiv-id", &id);
>> +	if (rc) {
>> +		dev_err(dev, "Unable to read clkdiv node id, rc = %d\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	clk_name = devm_kcalloc(dev, QPNP_CLKDIV_MAX_NAME_LEN,
>> +				sizeof(*clk_name), GFP_KERNEL);
>> +	if (!clk_name)
>> +		return -ENOMEM;
>> +	snprintf(clk_name, QPNP_CLKDIV_MAX_NAME_LEN, "qpnp_clkdiv_%d", id);
> devm_kasprintf? Also make sure to free the name after
> registration because we copy it over in the framework.
Sure. I will address it in next patch set
>
>> +
>> +	init->name = clk_name;
>> +	init->ops = &clk_qpnp_div_ops;
>> +	q_clkdiv->hw.init = init;
>> +	spin_lock_init(&q_clkdiv->lock);
>> +
>> +	clk_data = devm_kzalloc(dev, sizeof(*clk_data), GFP_KERNEL);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +
>> +	clk_data->clks = devm_kzalloc(dev, sizeof(*clk_data->clks), GFP_KERNEL);
>> +	if (!clk_data->clks)
>> +		return -ENOMEM;
>> +
>> +	clk = devm_clk_register(dev, &q_clkdiv->hw);
>> +	if (IS_ERR(clk)) {
>> +		dev_err(dev, "Unable to register qpnp div clock\n");
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	clk_data->clk_num = 1;
>> +	clk_data->clks[0] = clk;
>> +
>> +	rc = of_clk_add_provider(of_node, of_clk_src_onecell_get, clk_data);
> Please use the clk_hw_register() and of_clk_add_hw_provider()
> APIs.  Also if we have only one clk it should be
> of_clk_hw_simple_get() and have no cells in the binding. But, if
> there are multiple of these clks, then it will be onecell.
Sure. I will address it in next patch set
>
>> +	if (rc) {
>> +		dev_err(dev, "Unable to register qpnp div clock provider, rc = %d\n",
>> +			rc);
>> +		return rc;
>> +	}
>> +
>> +	dev_set_drvdata(dev, q_clkdiv);
> Unused? Remove?
Sure. I will address it in next patch set
>
>> +	dev_info(dev, "Registered %s successfully\n", clk_name);
> No noise please.
Sure. I will address it in next patch set
>
>> +
>> +	return rc;
>> +}
>> +
>> +static const struct of_device_id qpnp_clkdiv_match_table[] = {
>> +	{ .compatible = "qcom,qpnp-clkdiv" },
>> +	{}
>> +};
> Add a MODULE_DEVICE_TABLE() please.
Sure. I will address it in next patch set
>
>> +
>> +static struct platform_driver qpnp_clkdiv_driver = {
>> +	.driver		= {
>> +		.name	= "qcom,qpnp-clkdiv",
>> +		.of_match_table = qpnp_clkdiv_match_table,
>> +	},
>> +	.probe		= qpnp_clkdiv_probe,
>> +};
>> +
>> +static int __init qpnp_clkdiv_init(void)
>> +{
>> +	return platform_driver_register(&qpnp_clkdiv_driver);
>> +}
>> +module_init(qpnp_clkdiv_init);
>> +
>> +static void __exit qpnp_clkdiv_exit(void)
>> +{
>> +	return platform_driver_unregister(&qpnp_clkdiv_driver);
>> +}
>> +module_exit(qpnp_clkdiv_exit);
> Use module_platform_driver() macro.
Sure. I will address it in next patch set
>


--------------FACB47EF1C5B6D58E3D2D2E3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 7/15/2017 2:38 AM, Stephen Boyd
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">On 07/13, Tirupathi Reddy wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">diff --git a/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt b/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt
new file mode 100644
index 0000000..03b7b70
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/clk-qpnp-div.txt
@@ -0,0 +1,52 @@
+Qualcomm Technologies, Inc. QPNP clock divider (clkdiv)
+
+clkdiv configures the clock frequency of a set of outputs on the PMIC.
+These clocks are typically wired through alternate functions on
+gpio pins.
+
+=======================
+Supported Properties
+=======================
+
+- compatible
+	Usage:      required
+	Value type: &lt;string&gt;
+	Definition: should be "qcom,qpnp-clkdiv".
+
+- reg
+	Usage:      required
+	Value type: &lt;prop-encoded-array&gt;
+	Definition: Addresses and sizes for the memory of this CLKDIV
+		    peripheral.
+
+- qcom,cxo-freq
+	Usage:      required
+	Value type: &lt;u32&gt;
+	Definition: The frequency of the crystal oscillator (CXO) clock in Hz.
</pre>
      </blockquote>
      <pre wrap="">
CXO should be a parent clk then. This could have clocks and
clock-names properties for that and then be hooked up to
xo_board.
</pre>
    </blockquote>
    Sure. I will address in the next patch set.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+
+- qcom,clkdiv-id
+	Usage:      required
+	Value type: &lt;u32&gt;
+	Definition: Integer value specifies the hardware identifier of this
+		    CLKDIV peripheral.
</pre>
      </blockquote>
      <pre wrap="">
This is to name the clk? You could use clock-output-names as
that's more standard. But this is also sort of confusing. If
there are multiple clkdivs then it would be good to combine them
into one device node assuming they're all next to each other.
This would be similar to how we handle gpios and regulators. Then
the naming is simple enough to be an incrementing number.
</pre>
    </blockquote>
    Yes, multiple clkdivs present. We add sub-nodes for each clkdiv and
    parse them inside driver as separate clock.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+
+- qcom,clkdiv-init-freq
+	Usage:      optional
+	Value type: &lt;u32&gt;
+	Definition: Initial output frequency in Hz to configure for the CLKDIV
+		    peripheral. The initial frequency value should be less than
+		    or equal to CXO clock frequency and greater than or equal to
+		    CXO_freq/64.
</pre>
      </blockquote>
      <pre wrap="">
Use assigned-clock-rates instead.
</pre>
    </blockquote>
    Sure. I will address in the next patch set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+
+=======
+Example
+=======
+
+qcom,clkdiv@5b00 {
+	compatible = "qcom,qpnp-clkdiv";
+	reg = &lt;0x5b00 0x100&gt;;
+
+	qcom,cxo-freq = &lt;19200000&gt;;
+	qcom,clkdiv-id = &lt;1&gt;;
+	qcom,clkdiv-init-freq = &lt;9600000&gt;;
+};
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9f6c278..c68ae96 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -196,3 +196,12 @@ config MSM_MMCC_8996
 	  Support for the multimedia clock controller on msm8996 devices.
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
+
+config CLOCK_QPNP_DIV
+	tristate "QPNP PMIC clkdiv driver"
+	depends on COMMON_CLK_QCOM &amp;&amp; SPMI
</pre>
      </blockquote>
      <pre wrap="">
COMPILE_TEST?</pre>
    </blockquote>
    Sure. I will address in the next patch set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	help
+	  This driver supports the clkdiv functionality on the Qualcomm
+	  Technologies, Inc. QPNP PMIC. It configures the frequency of
</pre>
      </blockquote>
      <pre wrap="">
I'm not sure we ever really call it QPNP PMIC. I see one hit from
grep for the thermal driver. Perhaps SPMI PMIC is more
appropriate.</pre>
    </blockquote>
    Sure. I will address in the next patch set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	  clkdiv outputs on the PMIC. These clocks are typically wired
+	  through alternate functions on gpio pins.
diff --git a/drivers/clk/qcom/clk-qpnp-div.c b/drivers/clk/qcom/clk-qpnp-div.c
new file mode 100644
index 0000000..416c20f
--- /dev/null
+++ b/drivers/clk/qcom/clk-qpnp-div.c
@@ -0,0 +1,422 @@
+/* Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include &lt;linux/clk.h&gt;
+#include &lt;linux/clk-provider.h&gt;
+#include &lt;linux/delay.h&gt;
+#include &lt;linux/err.h&gt;
+#include &lt;linux/log2.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/of.h&gt;
+#include &lt;linux/platform_device.h&gt;
+#include &lt;linux/regmap.h&gt;
+#include &lt;linux/types.h&gt;
</pre>
      </blockquote>
      <pre wrap="">
bitops.h?</pre>
    </blockquote>
    Sure. I will add it in the next patch set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+#define Q_REG_DIV_CTL1			0x43
+#define Q_DIV_CTL1_DIV_FACTOR_MASK	GENMASK(2, 0)
+
+#define Q_REG_EN_CTL			0x46
+#define Q_REG_EN_MASK			BIT(7)
+#define Q_SET_EN			BIT(7)
+
+#define Q_CXO_PERIOD_NS(cxo_clk)	(NSEC_PER_SEC / cxo_clk)
+#define Q_DIV_PERIOD_NS(cxo_clk, div)	(NSEC_PER_SEC / (cxo_clk / div))
+#define Q_ENABLE_DELAY_NS(cxo_clk, div)	(2 * Q_CXO_PERIOD_NS(cxo_clk) + \
+					(3 * Q_DIV_PERIOD_NS(cxo_clk, div)))
+#define Q_DISABLE_DELAY_NS(cxo_clk, div) \
+					(3 * Q_DIV_PERIOD_NS(cxo_clk, div))
+
+#define CLK_QPNP_DIV_OFFSET		1
+
+enum q_clk_div_factor {
+	Q_CLKDIV_XO_DIV_1_0 = 0,
+	Q_CLKDIV_XO_DIV_1,
+	Q_CLKDIV_XO_DIV_2,
+	Q_CLKDIV_XO_DIV_4,
+	Q_CLKDIV_XO_DIV_8,
+	Q_CLKDIV_XO_DIV_16,
+	Q_CLKDIV_XO_DIV_32,
+	Q_CLKDIV_XO_DIV_64,
+	Q_CLKDIV_MAX_ALLOWED,
</pre>
      </blockquote>
      <pre wrap="">
Please make #defines for these instead of enum.</pre>
    </blockquote>
    We used enum primarily for easy debug at runtime. For an example,
    The "div_factor" field<br>
    of "struct q_clkdiv" would always show the enumerated value which
    would help in<br>
    determining the configured absolute divider value rather than
    spending time in mapping<br>
    register bit values to absolute divider value.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+};
+
+enum q_clkdiv_state {
+	DISABLE = false,
+	ENABLE = true,
+};
</pre>
      </blockquote>
      <pre wrap="">
Uh no. Just use bool.</pre>
    </blockquote>
    Sure. I will address in the next patch set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+struct q_clkdiv {
+	struct regmap		*regmap;
+	struct device		*dev;
+
+	u16			base;
+	spinlock_t		lock;
+
+	/* clock properties */
+	struct clk_hw		hw;
+	unsigned int		cxo_hz;
</pre>
      </blockquote>
      <pre wrap="">
Drop.</pre>
    </blockquote>
    cxo_hz is required to be populated at driver initialization and
    being used at runtime<br>
    for calculating the div value to be applied.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	enum q_clk_div_factor	div_factor;
+	bool			enabled;
</pre>
      </blockquote>
      <pre wrap="">
Shouldn't be needed. Read the hardware instead.</pre>
    </blockquote>
    This enabled field is required for the typical handling of set_rate
    in qpnp_clkdiv_config_freq_div().<br>
    <b></b>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+};
+
+static inline struct q_clkdiv *to_clkdiv(struct clk_hw *_hw)
</pre>
      </blockquote>
      <pre wrap="">
_hw can just be hw?</pre>
    </blockquote>
    Sure. I will address it in next patch set.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+{
+	return container_of(_hw, struct q_clkdiv, hw);
+}
+
+static inline unsigned int div_factor_to_div(unsigned int div_factor)
+{
+	if (div_factor == Q_CLKDIV_XO_DIV_1_0)
+		return 1;
+
+	return 1 &lt;&lt; (div_factor - CLK_QPNP_DIV_OFFSET);
+}
</pre>
      </blockquote>
      <pre wrap="">
Not sure, but it may be possible to reuse the code in
clk-divider.c and treat this as a CLK_DIVIDER_POWER_OF_TWO?</pre>
    </blockquote>
    Sure. I will check more on this.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+static inline unsigned int div_to_div_factor(unsigned int div)
+{
+	return ilog2(div) + CLK_QPNP_DIV_OFFSET;
+}
+
+static int qpnp_clkdiv_masked_write(struct q_clkdiv *q_clkdiv, u16 offset,
</pre>
      </blockquote>
      <pre wrap="">
Please replace instances of qpnp with spmi_pmic throughout this
driver.
</pre>
    </blockquote>
    Sure. I will address it in next patch set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">
Also, why do we need a wrapper around regmap APIs? Please just
use the APIs directly.
</pre>
    </blockquote>
    Sure. I will address it in next patch set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+			u8 mask, u8 val)
+{
+	int rc;
+
+	rc = regmap_update_bits(q_clkdiv-&gt;regmap, q_clkdiv-&gt;base + offset, mask,
+				val);
+	if (rc)
+		dev_err(q_clkdiv-&gt;dev,
+			"Unable to regmap_update_bits to addr=%hx, rc(%d)\n",
+			q_clkdiv-&gt;base + offset, rc);
+
+	return rc;
+}
+
+static int qpnp_clkdiv_set_enable_state(struct q_clkdiv *q_clkdiv,
+			enum q_clkdiv_state enable_state)
+{
+	int rc;
+
+	rc = qpnp_clkdiv_masked_write(q_clkdiv, Q_REG_EN_CTL, Q_REG_EN_MASK,
+				(enable_state == ENABLE) ? Q_SET_EN : 0);
+	if (rc)
+		return rc;
+
+	if (enable_state == ENABLE)
+		ndelay(Q_ENABLE_DELAY_NS(q_clkdiv-&gt;cxo_hz,
+				div_factor_to_div(q_clkdiv-&gt;div_factor)));
</pre>
      </blockquote>
      <pre wrap="">
Can this factor can be precalculated at probe time based on
XO rate? And then we just multiply that factor with the divider
value to figure out how long to wait?</pre>
    </blockquote>
    Sure. I will check more on this.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	else
+		ndelay(Q_DISABLE_DELAY_NS(q_clkdiv-&gt;cxo_hz,
+				div_factor_to_div(q_clkdiv-&gt;div_factor)));
+
+	return rc;
+}
+
+static int qpnp_clkdiv_config_freq_div(struct q_clkdiv *q_clkdiv,
+			unsigned int div)
+{
+	unsigned int div_factor;
+	int rc;
+
+	div_factor = div_to_div_factor(div);
+	if (div_factor &lt;= 0 || div_factor &gt;= Q_CLKDIV_MAX_ALLOWED)
+		return -EINVAL;
+
+	if (q_clkdiv-&gt;enabled) {
+		rc = qpnp_clkdiv_set_enable_state(q_clkdiv, DISABLE);
+		if (rc) {
+			dev_err(q_clkdiv-&gt;dev, "unable to disable clock, rc = %d\n",
+				rc);
+			return rc;
+		}
+	}
+
+	rc = qpnp_clkdiv_masked_write(q_clkdiv, Q_REG_DIV_CTL1,
+				Q_DIV_CTL1_DIV_FACTOR_MASK, div_factor);
+	if (rc) {
+		dev_err(q_clkdiv-&gt;dev, "config divider failed, rc=%d\n",
+			rc);
+		return rc;
+	}
+
+	q_clkdiv-&gt;div_factor = div_factor;
+
+	if (q_clkdiv-&gt;enabled) {
+		rc = qpnp_clkdiv_set_enable_state(q_clkdiv, ENABLE);
+		if (rc)
+			dev_err(q_clkdiv-&gt;dev, "unable to re-enable clock, rc = %d\n",
+				rc);
+	}
+
+	return rc;
+}
+
+static int clk_qpnp_div_enable(struct clk_hw *hw)
+{
+	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&amp;q_clkdiv-&gt;lock, flags);
</pre>
      </blockquote>
      <pre wrap="">
What is this locking against? Rate change?</pre>
    </blockquote>
    Yes, locking against "q_clkdiv-&gt;enabled". <br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+	rc =  qpnp_clkdiv_set_enable_state(q_clkdiv, ENABLE);
+	if (rc) {
+		dev_err(q_clkdiv-&gt;dev, "clk enable failed, rc=%d\n", rc);
+		goto fail;
+	}
+
+	q_clkdiv-&gt;enabled = true;
+
+fail:
+	spin_unlock_irqrestore(&amp;q_clkdiv-&gt;lock, flags);
+	return rc;
+}
+
+static void clk_qpnp_div_disable(struct clk_hw *hw)
+{
+	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&amp;q_clkdiv-&gt;lock, flags);
+
+	rc = qpnp_clkdiv_set_enable_state(q_clkdiv, DISABLE);
+	if (rc) {
+		dev_err(q_clkdiv-&gt;dev, "clk disable failed, rc=%d\n", rc);
+		goto fail;
+	}
+
+	q_clkdiv-&gt;enabled = false;
+
+fail:
+	spin_unlock_irqrestore(&amp;q_clkdiv-&gt;lock, flags);
+}
+
+static long clk_qpnp_div_round_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *parent_rate)
+{
+	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
+	unsigned long flags, new_rate;
+	unsigned int div, div_factor;
+
+	spin_lock_irqsave(&amp;q_clkdiv-&gt;lock, flags);
+	if (rate &lt;= 0 || rate &gt; q_clkdiv-&gt;cxo_hz) {
</pre>
      </blockquote>
      <pre wrap="">
How can rate be less than zero? It's unsigned! And if it's
greater than some parent rate, round_rate() should return the
largest rate it can support (I guess parent_rate?)</pre>
    </blockquote>
    Sure. I will address it in next patch set.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+		dev_err(q_clkdiv-&gt;dev, "invalid rate requested, rate = %lu\n",
+			rate);
+		spin_unlock_irqrestore(&amp;q_clkdiv-&gt;lock, flags);
</pre>
      </blockquote>
      <pre wrap="">
Also what are we spinlocking for?</pre>
    </blockquote>
    Seems locking is not required here. I will address it in next patch
    set.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+		return -EINVAL;
+	}
+
+	div = DIV_ROUND_UP(q_clkdiv-&gt;cxo_hz, rate);
+	div_factor = div_to_div_factor(div);
+	if (div_factor &gt;= Q_CLKDIV_MAX_ALLOWED)
+		div_factor = Q_CLKDIV_MAX_ALLOWED - 1;
+	new_rate = q_clkdiv-&gt;cxo_hz / div_factor_to_div(div_factor);
+
+	spin_unlock_irqrestore(&amp;q_clkdiv-&gt;lock, flags);
</pre>
      </blockquote>
      <pre wrap="">
Shouldn't need any spinlock here...</pre>
    </blockquote>
    Seems locking is not required here. I will address it in next patch
    set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	return new_rate;
+}
+
+static unsigned long clk_qpnp_div_recalc_rate(struct clk_hw *hw,
+			unsigned long parent_rate)
+{
+	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
+	unsigned long rate, flags;
+
+	spin_lock_irqsave(&amp;q_clkdiv-&gt;lock, flags);
+
+	rate = q_clkdiv-&gt;cxo_hz / div_factor_to_div(q_clkdiv-&gt;div_factor);
+
+	spin_unlock_irqrestore(&amp;q_clkdiv-&gt;lock, flags);
</pre>
      </blockquote>
      <pre wrap="">
Also confused about spinlock usage here.</pre>
    </blockquote>
    Seems locking is not required here. I will address it in next patch
    set
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	return rate;
+}
+
+static int clk_qpnp_div_set_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long parent_rate)
+{
+	struct q_clkdiv *q_clkdiv = to_clkdiv(hw);
+	unsigned long flags;
+	int rc = 0;
+
+	spin_lock_irqsave(&amp;q_clkdiv-&gt;lock, flags);
+	if (rate &lt;= 0 || rate &gt; q_clkdiv-&gt;cxo_hz) {
+		dev_err(q_clkdiv-&gt;dev, "invalid rate requested, rate = %lu\n",
+			rate);
+		rc = -EINVAL;
+		goto fail;
+	}
</pre>
      </blockquote>
      <pre wrap="">
Seems useless. Trust the framework won't call this op with a rate
that's invalid.</pre>
    </blockquote>
    I will check more on this and address in next patch set.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+	rc = qpnp_clkdiv_config_freq_div(q_clkdiv, q_clkdiv-&gt;cxo_hz / rate);
+	if (rc)
+		dev_err(q_clkdiv-&gt;dev, "clkdiv set rate(%lu) failed, rc = %d\n",
+			rate, rc);
+
+fail:
+	spin_unlock_irqrestore(&amp;q_clkdiv-&gt;lock, flags);
+	return rc;
+}
+
+const struct clk_ops clk_qpnp_div_ops = {
</pre>
      </blockquote>
      <pre wrap="">
static?</pre>
    </blockquote>
    Sure. I will address it in next patch set.
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	.enable = clk_qpnp_div_enable,
+	.disable = clk_qpnp_div_disable,
+	.set_rate = clk_qpnp_div_set_rate,
+	.recalc_rate = clk_qpnp_div_recalc_rate,
+	.round_rate = clk_qpnp_div_round_rate,
+};
+
+#define QPNP_CLKDIV_MAX_NAME_LEN	16
+
+static int qpnp_clkdiv_probe(struct platform_device *pdev)
+{
+	struct q_clkdiv *q_clkdiv;
+	struct device *dev = &amp;pdev-&gt;dev;
+	struct device_node *of_node = dev-&gt;of_node;
+	struct clk_init_data *init;
+	struct clk_onecell_data *clk_data;
+	struct clk *clk;
+	unsigned int base, div, init_freq;
+	int rc = 0, id;
</pre>
      </blockquote>
      <pre wrap="">
Leave rc unassigned.</pre>
    </blockquote>
    Sure. I will address it in next patch set
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	char *clk_name;
+
+	q_clkdiv = devm_kzalloc(dev, sizeof(*q_clkdiv), GFP_KERNEL);
+	if (!q_clkdiv)
+		return -ENOMEM;
+
+	q_clkdiv-&gt;regmap = dev_get_regmap(dev-&gt;parent, NULL);
+	if (!q_clkdiv-&gt;regmap) {
+		dev_err(dev, "Couldn't get parent's regmap\n");
+		return -EINVAL;
+	}
+	q_clkdiv-&gt;dev = dev;
+
+	rc = of_property_read_u32(of_node, "reg", &amp;base);
+	if (rc &lt; 0) {
+		dev_err(dev, "Couldn't find reg in node = %s, rc = %d\n",
+			of_node-&gt;full_name, rc);
+		return rc;
+	}
+	q_clkdiv-&gt;base = base;
+
+	/* init clock properties */
+	rc = of_property_read_u32(of_node, "qcom,cxo-freq", &amp;q_clkdiv-&gt;cxo_hz);
+	if (rc) {
+		dev_err(dev, "unable to get qcom,cxo-freq property, rc = %d\n",
+			rc);
+		return rc;
+	}
+
+	q_clkdiv-&gt;div_factor = Q_CLKDIV_XO_DIV_1_0;
+	rc = of_property_read_u32(of_node, "qcom,clkdiv-init-freq", &amp;init_freq);
+	if (rc) {
+		if (rc != -EINVAL) {
+			dev_err(dev, "Unable to read initial frequency value, rc=%d\n",
+				rc);
+			return rc;
+		}
+	} else {
+		if (init_freq &lt;= 0 || init_freq &gt; q_clkdiv-&gt;cxo_hz) {
+			dev_err(dev, "invalid initial frequency specified, rate = %u\n",
+				init_freq);
+			return -EINVAL;
+		}
+
+		div = DIV_ROUND_UP(q_clkdiv-&gt;cxo_hz, init_freq);
+		q_clkdiv-&gt;div_factor = div_to_div_factor(div);
+		if (q_clkdiv-&gt;div_factor &gt;= Q_CLKDIV_MAX_ALLOWED)
+			q_clkdiv-&gt;div_factor = Q_CLKDIV_MAX_ALLOWED - 1;
+		rc = qpnp_clkdiv_config_freq_div(q_clkdiv,
+				div_factor_to_div(q_clkdiv-&gt;div_factor));
+		if (rc) {
+			dev_err(dev, "Config initial frequency failed, rc = %d\n",
+				rc);
+			return rc;
+		}
+	}
</pre>
      </blockquote>
      <pre wrap="">
Hopefully a bunch of this code goes away.</pre>
    </blockquote>
    I will check more on this and address in next patch set.<br>
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+	init = devm_kzalloc(dev, sizeof(*init), GFP_KERNEL);
+	if (!init)
+		return -ENOMEM;
+
+	rc = of_property_read_u32(of_node, "qcom,clkdiv-id", &amp;id);
+	if (rc) {
+		dev_err(dev, "Unable to read clkdiv node id, rc = %d\n", rc);
+		return rc;
+	}
+
+	clk_name = devm_kcalloc(dev, QPNP_CLKDIV_MAX_NAME_LEN,
+				sizeof(*clk_name), GFP_KERNEL);
+	if (!clk_name)
+		return -ENOMEM;
+	snprintf(clk_name, QPNP_CLKDIV_MAX_NAME_LEN, "qpnp_clkdiv_%d", id);
</pre>
      </blockquote>
      <pre wrap="">
devm_kasprintf? Also make sure to free the name after
registration because we copy it over in the framework.</pre>
    </blockquote>
    Sure. I will address it in next patch set
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+	init-&gt;name = clk_name;
+	init-&gt;ops = &amp;clk_qpnp_div_ops;
+	q_clkdiv-&gt;hw.init = init;
+	spin_lock_init(&amp;q_clkdiv-&gt;lock);
+
+	clk_data = devm_kzalloc(dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data-&gt;clks = devm_kzalloc(dev, sizeof(*clk_data-&gt;clks), GFP_KERNEL);
+	if (!clk_data-&gt;clks)
+		return -ENOMEM;
+
+	clk = devm_clk_register(dev, &amp;q_clkdiv-&gt;hw);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Unable to register qpnp div clock\n");
+		return PTR_ERR(clk);
+	}
+
+	clk_data-&gt;clk_num = 1;
+	clk_data-&gt;clks[0] = clk;
+
+	rc = of_clk_add_provider(of_node, of_clk_src_onecell_get, clk_data);
</pre>
      </blockquote>
      <pre wrap="">
Please use the clk_hw_register() and of_clk_add_hw_provider()
APIs.  Also if we have only one clk it should be
of_clk_hw_simple_get() and have no cells in the binding. But, if
there are multiple of these clks, then it will be onecell.</pre>
    </blockquote>
    Sure. I will address it in next patch set
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	if (rc) {
+		dev_err(dev, "Unable to register qpnp div clock provider, rc = %d\n",
+			rc);
+		return rc;
+	}
+
+	dev_set_drvdata(dev, q_clkdiv);
</pre>
      </blockquote>
      <pre wrap="">
Unused? Remove?</pre>
    </blockquote>
    Sure. I will address it in next patch set
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+	dev_info(dev, "Registered %s successfully\n", clk_name);
</pre>
      </blockquote>
      <pre wrap="">
No noise please.</pre>
    </blockquote>
    Sure. I will address it in next patch set
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+	return rc;
+}
+
+static const struct of_device_id qpnp_clkdiv_match_table[] = {
+	{ .compatible = "qcom,qpnp-clkdiv" },
+	{}
+};
</pre>
      </blockquote>
      <pre wrap="">
Add a MODULE_DEVICE_TABLE() please.</pre>
    </blockquote>
    Sure. I will address it in next patch set
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+static struct platform_driver qpnp_clkdiv_driver = {
+	.driver		= {
+		.name	= "qcom,qpnp-clkdiv",
+		.of_match_table = qpnp_clkdiv_match_table,
+	},
+	.probe		= qpnp_clkdiv_probe,
+};
+
+static int __init qpnp_clkdiv_init(void)
+{
+	return platform_driver_register(&amp;qpnp_clkdiv_driver);
+}
+module_init(qpnp_clkdiv_init);
+
+static void __exit qpnp_clkdiv_exit(void)
+{
+	return platform_driver_unregister(&amp;qpnp_clkdiv_driver);
+}
+module_exit(qpnp_clkdiv_exit);
</pre>
      </blockquote>
      <pre wrap="">
Use module_platform_driver() macro.</pre>
    </blockquote>
    Sure. I will address it in next patch set
    <blockquote type="cite"
      cite="mid:20170714210837.GK22780@codeaurora.org">
      <pre wrap="">

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FACB47EF1C5B6D58E3D2D2E3--
