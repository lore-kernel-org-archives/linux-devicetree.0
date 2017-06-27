From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 3/3] mailbox: qcom: Add support for APCS clock
 controller
Date: Tue, 27 Jun 2017 19:24:40 +0300
Message-ID: <0dc001d7-6ea4-4521-027e-5587a8188b1d@linaro.org>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
 <20170623161533.20449-4-georgi.djakov@linaro.org>
 <20170626224735.GQ4493@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170626224735.GQ4493-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 06/27/2017 01:47 AM, Stephen Boyd wrote:
> On 06/23, Georgi Djakov wrote:
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index 9924c6d7f05d..da363c6580da 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -11,6 +11,8 @@
>>   * GNU General Public License for more details.
>>   */
>>  
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/io.h>
>> @@ -19,6 +21,34 @@
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/mailbox_controller.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "../clk/qcom/clk-regmap.h"
>> +#include "../clk/qcom/clk-regmap-mux-div.h"
> 
> Why?
> 
>> +
>> +
>> +static int msm8916_register_clk(struct device *dev, void __iomem *base)
>> +{
>> +	struct clk_regmap_mux_div *a53cc;
>> +	struct clk *pclk;
>> +	struct regmap *regmap;
>> +	struct clk_init_data init = { };
>> +	int ret;
>> +
>> +	a53cc = devm_kzalloc(dev, sizeof(*a53cc), GFP_KERNEL);
>> +	if (!a53cc)
>> +		return -ENOMEM;
>> +
>> +	a53cc->reg_offset = 0x50;
>> +	a53cc->hid_width = 5;
>> +	a53cc->hid_shift = 0;
>> +	a53cc->src_width = 3;
>> +	a53cc->src_shift = 8;
>> +	a53cc->parent_map = gpll0_a53cc_map;
>> +
>> +	init.name = "a53mux";
>> +	init.parent_names = gpll0_a53cc;
>> +	init.num_parents = 2;
> 
> ARRAY_SIZE(gpll0_a53cc) instead of 2 please

Ok.

> 
>> +	init.ops = &clk_regmap_mux_div_ops;
>> +	init.flags = CLK_SET_RATE_PARENT;
>> +	a53cc->clkr.hw.init = &init;
>> +
>> +	pclk = __clk_lookup(gpll0_a53cc[1]);
> 
> Urgh.. ok. We can't clk_get()?

Ok, will do.

> 
>> +	if (!pclk)
>> +		return -EPROBE_DEFER;
>> +
>> +	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
>> +	ret = clk_notifier_register(pclk, &a53cc->clk_nb);
>> +	if (ret) {
>> +		dev_err(dev, "failed to register clock notifier: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	regmap = devm_regmap_init_mmio(dev, base, &a53cc_regmap_config);
>> +	if (IS_ERR(regmap)) {
>> +		ret = PTR_ERR(regmap);
>> +		dev_err(dev, "failed to init regmap mmio: %d\n", ret);
>> +		goto err;
>> +	}
>> +
>> +	a53cc->clkr.regmap = regmap;
>> +
>> +	ret = devm_clk_register_regmap(dev, &a53cc->clkr);
> 
> Regmap is not a requirement to work with the qcom clk driver.
> 

The other option then is to drop the regmap-mux-div patch and switch
to readl()/writel().

>> +	if (ret) {
>> +		dev_err(dev, "failed to register regmap clock: %d\n", ret);
>> +		goto err;
>> +	}
>> +
>> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
>> +				     &a53cc->clkr.hw);
>> +	if (ret) {
>> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
>> +		goto err;
>> +	}
>> +
>> +	return 0;
>> +
>> +err:
>> +	clk_notifier_unregister(pclk, &a53cc->clk_nb);
>> +	return ret;
>> +}
>> +
>>  static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>>  {
>> +	struct device_node *np = pdev->dev.of_node;
>>  	struct qcom_apcs_ipc *apcs;
>>  	struct resource *res;
>>  	unsigned long offset;
>> @@ -63,6 +178,13 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>>  	if (IS_ERR(base))
>>  		return PTR_ERR(base);
>>  
>> +	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
>> +		/* register the APCS mux and divider clock */
>> +		ret = msm8916_register_clk(&pdev->dev, base);
> 
> Register a child platform device here instead of creating clks in the
> same driver?

Ok, we can register a child platform device and create a separate driver
in drivers/clk. If we are dropping regmap, then we can also move the
mux-div clk ops and clk registration into the same file. I will give it
a try.

Thanks,
Georgi

> 
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	offset = (unsigned long)of_device_get_match_data(&pdev->dev);
>>  
>>  	apcs->reg = base + offset;
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
