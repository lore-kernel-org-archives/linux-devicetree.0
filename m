From: Tirupathi Reddy T <tirupath-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V5] clk: qcom: Add spmi_pmic clock divider support
Date: Fri, 17 Nov 2017 15:31:13 +0530
Message-ID: <86711b65-52a8-d96a-1039-3e5fc52a027f@codeaurora.org>
References: <1505817286-12445-1-git-send-email-tirupath@codeaurora.org>
 <20171115170647.GR11955@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171115170647.GR11955-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/15/2017 10:36 PM, Stephen Boyd wrote:
> On 09/19, Tirupathi Reddy wrote:
>> diff --git a/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>> new file mode 100644
>> index 0000000..e37a136
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>> @@ -0,0 +1,56 @@
>> +Qualcomm Technologies, Inc. SPMI PMIC clock divider (clkdiv)
>> +
>> +clkdiv configures the clock frequency of a set of outputs on the PMIC.
>> +These clocks are typically wired through alternate functions on
>> +gpio pins.
>> +
>> +=======================
>> +Properties
>> +=======================
>> +
>> +- compatible
>> +	Usage:      required
>> +	Value type: <string>
>> +	Definition: must be one of:
>> +		    "qcom,spmi-clkdiv"
>> +		    "qcom,pm8998-clkdiv"
>> +
>> +- reg
>> +	Usage:      required
>> +	Value type: <prop-encoded-array>
>> +	Definition: Addresses and sizes for the memory of this CLKDIV
> There's no size though.
Fixed in Patch version 6.
>
>> +		    peripheral.
>> +
>> +- clocks:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: reference to the xo clock.
>> +
>> +- clock-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "xo".
>> +
>> +- clock-cells:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: shall contain 1.
> Can we get a property to indicate the number of clks? Something
> like "qcom,num-clkdivs" or something like that. That would make
> things easier to handle in the driver because we could match the
> generic compatible and look for the property and then populate
> that many clks. Otherwise, we're going to need a "small" driver
> update for each PMIC just because the number of clks changes.
>
> Of course we're going to need to update the binding to add the
> new PMIC compatibles as new things are created, but I'd like to
> avoid driver updates for the compatible. If someone messes up the
> number we can always fallback to matching the more specific
> compatible and fix it up in the driver, but let's hope that
> doesn't happen.
Fixed in Patch version 6.
>
>> +
>> +=======
>> +Example
>> +=======
>> +
>> +pm8998_clk_divs: qcom,clock@5b00 {
> clock-controller@5b00?
Fixed in Patch version 6.
>
>> +	compatible = "qcom,pm8998-clkdiv";
>> +	reg = <0x5b00>;
>> +	#clock-cells = <1>;
>> +	clocks = <&xo_board>;
>> +	clock-names = "xo";
>> +
>> +	assigned-clocks = <&pm8998_clk_divs 1>,
>> +			  <&pm8998_clk_divs 2>,
>> +			  <&pm8998_clk_divs 3>;
>> +	assigned-clock-rates = <9600000>,
>> +			       <9600000>,
>> +			       <9600000>;
>> +};
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 9f6c278..dd5b18e 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -196,3 +196,12 @@ config MSM_MMCC_8996
>>   	  Support for the multimedia clock controller on msm8996 devices.
>>   	  Say Y if you want to support multimedia devices such as display,
>>   	  graphics, video encode/decode, camera, etc.
>> +
>> +config SPMI_PMIC_CLKDIV
>> +	tristate "spmi pmic clkdiv driver"
> Capitalize SPMI and PMIC and replace driver with something else.
Fixed in Patch version 6.
>
>> +	depends on (COMMON_CLK_QCOM && SPMI) || COMPILE_TEST
>> +	help
>> +	  This driver supports the clkdiv functionality on the Qualcomm
>> +	  Technologies, Inc. SPMI PMIC. It configures the frequency of
>> +	  clkdiv outputs on the PMIC. These clocks are typically wired
>> +	  through alternate functions on gpio pins.
> I rewrote a bunch of stuff in the driver. Let me know if anything
> doesn't work.
Verified. The changes look good.
>
> ----8<----
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index dd5b18ecd9d1..20b5d6fd501d 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -198,10 +198,10 @@ config MSM_MMCC_8996
>   	  graphics, video encode/decode, camera, etc.
>   
>   config SPMI_PMIC_CLKDIV
> -	tristate "spmi pmic clkdiv driver"
> +	tristate "SPMI PMIC clkdiv Support"
>   	depends on (COMMON_CLK_QCOM && SPMI) || COMPILE_TEST
>   	help
>   	  This driver supports the clkdiv functionality on the Qualcomm
>   	  Technologies, Inc. SPMI PMIC. It configures the frequency of
> -	  clkdiv outputs on the PMIC. These clocks are typically wired
> -	  through alternate functions on gpio pins.
> +	  clkdiv outputs of the PMIC. These clocks are typically wired
> +	  through alternate functions on GPIO pins.
> diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
> index af343ad2ee0b..a7217ee9f741 100644
> --- a/drivers/clk/qcom/clk-spmi-pmic-div.c
> +++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
> @@ -18,6 +18,7 @@
>   #include <linux/log2.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/slab.h>
> @@ -29,29 +30,12 @@
>   #define REG_EN_CTL			0x46
>   #define REG_EN_MASK			BIT(7)
>   
> -#define ENABLE_DELAY_NS(cxo_ns, div)	((2 + 3 * div) * cxo_ns)
> -#define DISABLE_DELAY_NS(cxo_ns, div)	((3 * div) * cxo_ns)
> -
> -#define CLK_SPMI_PMIC_DIV_OFFSET	1
> -
> -#define CLKDIV_XO_DIV_1_0		0
> -#define CLKDIV_XO_DIV_1			1
> -#define CLKDIV_XO_DIV_2			2
> -#define CLKDIV_XO_DIV_4			3
> -#define CLKDIV_XO_DIV_8			4
> -#define CLKDIV_XO_DIV_16		5
> -#define CLKDIV_XO_DIV_32		6
> -#define CLKDIV_XO_DIV_64		7
> -#define CLKDIV_MAX_ALLOWED		8
> -
>   struct clkdiv {
>   	struct regmap		*regmap;
>   	u16			base;
>   	spinlock_t		lock;
>   
> -	/* clock properties */
>   	struct clk_hw		hw;
> -	unsigned int		div_factor;
>   	unsigned int		cxo_period_ns;
>   };
>   
> @@ -62,94 +46,68 @@ static inline struct clkdiv *to_clkdiv(struct clk_hw *hw)
>   
>   static inline unsigned int div_factor_to_div(unsigned int div_factor)
>   {
> -	if (div_factor == CLKDIV_XO_DIV_1_0)
> -		return 1;
> +	if (!div_factor)
> +		div_factor = 1;
>   
> -	return 1 << (div_factor - CLK_SPMI_PMIC_DIV_OFFSET);
> +	return 1 << (div_factor - 1);
>   }
>   
>   static inline unsigned int div_to_div_factor(unsigned int div)
>   {
> -	return min(ilog2(div) + CLK_SPMI_PMIC_DIV_OFFSET,
> -		   CLKDIV_MAX_ALLOWED - 1);
> +	return min(ilog2(div) + 1, 7);
>   }
>   
>   static bool is_spmi_pmic_clkdiv_enabled(struct clkdiv *clkdiv)
>   {
>   	unsigned int val = 0;
>   
> -	regmap_read(clkdiv->regmap, clkdiv->base + REG_EN_CTL,
> -			 &val);
> -	return (val & REG_EN_MASK) ? true : false;
> +	regmap_read(clkdiv->regmap, clkdiv->base + REG_EN_CTL, &val);
> +
> +	return val & REG_EN_MASK;
>   }
>   
> -static int spmi_pmic_clkdiv_set_enable_state(struct clkdiv *clkdiv,
> -			bool enable_state)
> +static int
> +__spmi_pmic_clkdiv_set_enable_state(struct clkdiv *clkdiv, bool enable,
> +				    unsigned int div_factor)
>   {
> -	int rc;
> +	int ret;
> +	unsigned int ns = clkdiv->cxo_period_ns;
> +	unsigned int div = div_factor_to_div(div_factor);
>   
> -	rc = regmap_update_bits(clkdiv->regmap, clkdiv->base + REG_EN_CTL,
> -				REG_EN_MASK,
> -				(enable_state == true) ? REG_EN_MASK : 0);
> -	if (rc)
> -		return rc;
> +	ret = regmap_update_bits(clkdiv->regmap, clkdiv->base + REG_EN_CTL,
> +				 REG_EN_MASK, enable ? REG_EN_MASK : 0);
> +	if (ret)
> +		return ret;
>   
> -	if (enable_state == true)
> -		ndelay(ENABLE_DELAY_NS(clkdiv->cxo_period_ns,
> -				div_factor_to_div(clkdiv->div_factor)));
> +	if (enable)
> +		ndelay((2 + 3 * div) * ns);
>   	else
> -		ndelay(DISABLE_DELAY_NS(clkdiv->cxo_period_ns,
> -				div_factor_to_div(clkdiv->div_factor)));
> +		ndelay(3 * div * ns);
>   
> -	return rc;
> +	return 0;
>   }
>   
> -static int spmi_pmic_clkdiv_config_freq_div(struct clkdiv *clkdiv,
> -			unsigned int div)
> +static int spmi_pmic_clkdiv_set_enable_state(struct clkdiv *clkdiv, bool enable)
>   {
>   	unsigned int div_factor;
> -	unsigned long flags;
> -	bool enabled;
> -	int rc;
> -
> -	div_factor = div_to_div_factor(div);
> -
> -	spin_lock_irqsave(&clkdiv->lock, flags);
> -
> -	enabled = is_spmi_pmic_clkdiv_enabled(clkdiv);
> -	if (enabled) {
> -		rc = spmi_pmic_clkdiv_set_enable_state(clkdiv, false);
> -		if (rc)
> -			goto fail;
> -	}
>   
> -	rc = regmap_update_bits(clkdiv->regmap,
> -				clkdiv->base + REG_DIV_CTL1,
> -				DIV_CTL1_DIV_FACTOR_MASK, div_factor);
> -	if (rc)
> -		goto fail;
> +	regmap_read(clkdiv->regmap, clkdiv->base + REG_DIV_CTL1, &div_factor);
> +	div_factor &= DIV_CTL1_DIV_FACTOR_MASK;
>   
> -	clkdiv->div_factor = div_factor;
> -
> -	if (enabled)
> -		rc = spmi_pmic_clkdiv_set_enable_state(clkdiv, true);
> -
> -fail:
> -	spin_unlock_irqrestore(&clkdiv->lock, flags);
> -	return rc;
> +	return __spmi_pmic_clkdiv_set_enable_state(clkdiv, enable, div_factor);
>   }
>   
>   static int clk_spmi_pmic_div_enable(struct clk_hw *hw)
>   {
>   	struct clkdiv *clkdiv = to_clkdiv(hw);
>   	unsigned long flags;
> -	int rc;
> +	int ret;
>   
>   	spin_lock_irqsave(&clkdiv->lock, flags);
> -	rc = spmi_pmic_clkdiv_set_enable_state(clkdiv, true);
> +	ret = spmi_pmic_clkdiv_set_enable_state(clkdiv, true);
>   	spin_unlock_irqrestore(&clkdiv->lock, flags);
>   
> -	return rc;
> +	return ret;
>   }
>   
>   static void clk_spmi_pmic_div_disable(struct clk_hw *hw)
> @@ -163,35 +121,59 @@ static void clk_spmi_pmic_div_disable(struct clk_hw *hw)
>   }
>   
>   static long clk_spmi_pmic_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -			unsigned long *parent_rate)
> +					 unsigned long *parent_rate)
>   {
> -	unsigned long new_rate;
>   	unsigned int div, div_factor;
>   
>   	div = DIV_ROUND_UP(*parent_rate, rate);
>   	div_factor = div_to_div_factor(div);
> -	new_rate = *parent_rate / div_factor_to_div(div_factor);
> +	div = div_factor_to_div(div_factor);
>   
> -	return new_rate;
> +	return *parent_rate / div;
>   }
>   
> -static unsigned long clk_spmi_pmic_div_recalc_rate(struct clk_hw *hw,
> -			unsigned long parent_rate)
> +static unsigned long
> +clk_spmi_pmic_div_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>   {
>   	struct clkdiv *clkdiv = to_clkdiv(hw);
> -	unsigned long rate;
> +	unsigned int div_factor;
>   
> -	rate = parent_rate / div_factor_to_div(clkdiv->div_factor);
> +	regmap_read(clkdiv->regmap, clkdiv->base + REG_DIV_CTL1, &div_factor);
> +	div_factor &= DIV_CTL1_DIV_FACTOR_MASK;
>   
> -	return rate;
> +	return parent_rate / div_factor_to_div(div_factor);
>   }
>   
>   static int clk_spmi_pmic_div_set_rate(struct clk_hw *hw, unsigned long rate,
> -			unsigned long parent_rate)
> +				      unsigned long parent_rate)
>   {
>   	struct clkdiv *clkdiv = to_clkdiv(hw);
> +	unsigned int div_factor = div_to_div_factor(parent_rate / rate);
> +	unsigned long flags;
> +	bool enabled;
> +	int ret;
> +
> +	spin_lock_irqsave(&clkdiv->lock, flags);
> +	enabled = is_spmi_pmic_clkdiv_enabled(clkdiv);
> +	if (enabled) {
> +		ret = spmi_pmic_clkdiv_set_enable_state(clkdiv, false);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(clkdiv->regmap, clkdiv->base + REG_DIV_CTL1,
> +				 DIV_CTL1_DIV_FACTOR_MASK, div_factor);
> +	if (ret)
> +		goto unlock;
> +
> +	if (enabled)
> +		ret = __spmi_pmic_clkdiv_set_enable_state(clkdiv, true,
> +							  div_factor);
>   
> -	return spmi_pmic_clkdiv_config_freq_div(clkdiv, parent_rate / rate);
> +unlock:
> +	spin_unlock_irqrestore(&clkdiv->lock, flags);
> +
> +	return ret;
>   }
>   
>   static const struct clk_ops clk_spmi_pmic_div_ops = {
> @@ -203,30 +185,25 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
>   };
>   
>   struct spmi_pmic_div_clk_cc {
> -	struct clk_hw	**div_clks;
>   	int		nclks;
> +	struct clkdiv	clks[];
>   };
>   
> -#define SPMI_PMIC_CLKDIV_MIN_INDEX	1
> -
> -static struct clk_hw *spmi_pmic_div_clk_hw_get(struct of_phandle_args *clkspec,
> -				      void *data)
> +static struct clk_hw *
> +spmi_pmic_div_clk_hw_get(struct of_phandle_args *clkspec, void *data)
>   {
> -	struct spmi_pmic_div_clk_cc *clk_cc = data;
> -	unsigned int idx = (clkspec->args[0] - SPMI_PMIC_CLKDIV_MIN_INDEX);
> +	struct spmi_pmic_div_clk_cc *cc = data;
> +	int idx = clkspec->args[0] - 1; /* Start at 1 instead of 0 */
>   
> -	if (idx < 0 || idx >= clk_cc->nclks) {
> -		pr_err("%s: index value %u is invalid; allowed range: [%d, %d]\n",
> -		       __func__, clkspec->args[0], SPMI_PMIC_CLKDIV_MIN_INDEX,
> -		       clk_cc->nclks);
> +	if (idx < 0 || idx >= cc->nclks) {
> +		pr_err("%s: index value %u is invalid; allowed range [1, %d]\n",
> +		       __func__, clkspec->args[0], cc->nclks);
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	return clk_cc->div_clks[idx];
> +	return &cc->clks[idx].hw;
>   }
>   
> -#define SPMI_PMIC_DIV_CLK_SIZE		0x100
> -
>   static const struct of_device_id spmi_pmic_clkdiv_match_table[] = {
>   	{
>   		.compatible = "qcom,spmi-clkdiv",
> @@ -242,20 +219,21 @@ MODULE_DEVICE_TABLE(of, spmi_pmic_clkdiv_match_table);
>   
>   static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
>   {
> -	struct spmi_pmic_div_clk_cc *clk_cc;
> +	struct spmi_pmic_div_clk_cc *cc;
>   	struct clk_init_data init = {};
>   	struct clkdiv *clkdiv;
>   	struct clk *cxo;
>   	struct regmap *regmap;
>   	struct device *dev = &pdev->dev;
> +	struct device_node *of_node = dev->of_node;
>   	const char *parent_name;
> -	int nclks, i, rc, cxo_hz;
> +	int nclks, i, ret, cxo_hz;
>   	u32 start;
>   
> -	rc = of_property_read_u32(dev->of_node, "reg", &start);
> -	if (rc < 0) {
> +	ret = of_property_read_u32(of_node, "reg", &start);
> +	if (ret < 0) {
>   		dev_err(dev, "reg property reading failed\n");
> -		return rc;
> +		return ret;
>   	}
>   
>   	regmap = dev_get_regmap(dev->parent, NULL);
> @@ -264,62 +242,51 @@ static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> -	nclks = (uintptr_t)of_match_node(spmi_pmic_clkdiv_match_table,
> -					 dev->of_node)->data;
> -
> -	clkdiv = devm_kcalloc(dev, nclks, sizeof(*clkdiv), GFP_KERNEL);
> -	if (!clkdiv)
> -		return -ENOMEM;
> -
> -	clk_cc = devm_kzalloc(&pdev->dev, sizeof(*clk_cc), GFP_KERNEL);
> -	if (!clk_cc)
> -		return -ENOMEM;
> +	nclks = (uintptr_t)of_device_get_match_data(dev);
> +	if (!nclks)
> +		return -EINVAL;
>   
> -	clk_cc->div_clks = devm_kcalloc(&pdev->dev, nclks,
> -					sizeof(*clk_cc->div_clks), GFP_KERNEL);
> -	if (!clk_cc->div_clks)
> +	cc = devm_kzalloc(dev, sizeof(*cc) + sizeof(*cc->clks) * nclks,
> +			  GFP_KERNEL);
> +	if (!cc)
>   		return -ENOMEM;
> +	cc->nclks = nclks;
>   
>   	cxo = clk_get(dev, "xo");
>   	if (IS_ERR(cxo)) {
> -		rc = PTR_ERR(cxo);
> -		if (rc != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get xo clock");
> -		return rc;
> +		ret = PTR_ERR(cxo);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get xo clock\n");
> +		return ret;
>   	}
>   	cxo_hz = clk_get_rate(cxo);
>   	clk_put(cxo);
>   
> -	parent_name = of_clk_get_parent_name(dev->of_node, 0);
> +	parent_name = of_clk_get_parent_name(of_node, 0);
>   	if (!parent_name) {
>   		dev_err(dev, "missing parent clock\n");
>   		return -ENODEV;
>   	}
>   
>   	init.parent_names = &parent_name;
> -	init.num_parents = parent_name ? 1 : 0;
> +	init.num_parents = 1;
>   	init.ops = &clk_spmi_pmic_div_ops;
> -	init.flags = 0;
>   
> -	for (i = 0; i < nclks; i++) {
> +	for (i = 0, clkdiv = cc->clks; i < nclks; i++) {
>   		spin_lock_init(&clkdiv[i].lock);
> -		clkdiv[i].base = start + i * SPMI_PMIC_DIV_CLK_SIZE;
> +		clkdiv[i].base = start + i * 0x100;
>   		clkdiv[i].regmap = regmap;
>   		clkdiv[i].cxo_period_ns = NSEC_PER_SEC / cxo_hz;
>   		init.name = kasprintf(GFP_KERNEL, "div_clk%d", i + 1);
>   		clkdiv[i].hw.init = &init;
> -		rc = devm_clk_hw_register(dev, &clkdiv[i].hw);
> -		kfree(init.name); /* clock framework made a copy of the name */
> -		if (rc)
> -			return rc;
>   
> -		clk_cc->div_clks[i] = &clkdiv[i].hw;
> +		ret = devm_clk_hw_register(dev, &clkdiv[i].hw);
> +		kfree(init.name); /* clk framework made a copy */
> +		if (ret)
> +			return ret;
>   	}
>   
> -	clk_cc->nclks = nclks;
> -	rc = of_clk_add_hw_provider(pdev->dev.of_node, spmi_pmic_div_clk_hw_get,
> -				    clk_cc);
> -	return rc;
> +	return of_clk_add_hw_provider(of_node, spmi_pmic_div_clk_hw_get, cc);
>   }
>   
>   static int spmi_pmic_clkdiv_remove(struct platform_device *pdev)
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
