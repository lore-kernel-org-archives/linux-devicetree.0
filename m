From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v8 3/3] mailbox: qcom: Add support for APCS clock
 controller
Date: Tue, 27 Jun 2017 19:21:20 +0300
Message-ID: <fca63479-8d47-1d89-eff8-179c13ef32fd@linaro.org>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
 <20170623161533.20449-4-georgi.djakov@linaro.org>
 <20170623174528.GC18666@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170623174528.GC18666@tuxbook>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 06/23/2017 08:45 PM, Bjorn Andersson wrote:
> On Fri 23 Jun 09:15 PDT 2017, Georgi Djakov wrote:
> 
>> +static int msm8916_register_clk(struct device *dev, void __iomem *base)
>> +{
> [..]
>> +	regmap = devm_regmap_init_mmio(dev, base, &a53cc_regmap_config);
>> +	if (IS_ERR(regmap)) {
>> +		ret = PTR_ERR(regmap);
>> +		dev_err(dev, "failed to init regmap mmio: %d\n", ret);
>> +		goto err;
>> +	}
> 
> I think it would be cleaner if you create the regmap in probe() and we
> use that throughout the driver - rather than using two different access
> mechanism.

Ok agree, will make sure its consistent.

> 
>> +
>> +	a53cc->clkr.regmap = regmap;
>> +
>> +	ret = devm_clk_register_regmap(dev, &a53cc->clkr);
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
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
> 
> Don't you need to clean up anything in the below error path and in
> remove()?

Right, will take care of it.

> 
>>  	offset = (unsigned long)of_device_get_match_data(&pdev->dev);
>>  
>>  	apcs->reg = base + offset;
> 
> Other than that I think this looks reasonable.

Thanks for your time!

BR,
Georgi

