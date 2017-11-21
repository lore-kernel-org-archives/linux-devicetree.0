From: Tirupathi Reddy T <tirupath@codeaurora.org>
Subject: Re: [PATCH V6] clk: qcom: Add spmi_pmic clock divider support
Date: Tue, 21 Nov 2017 14:42:35 +0530
Message-ID: <6e6399c9-f0a5-3048-d318-2bfc1ba85ded@codeaurora.org>
References: <1510912127-4582-1-git-send-email-tirupath@codeaurora.org>
 <20171117235611.GA13301@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171117235611.GA13301@codeaurora.org>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 11/18/2017 5:26 AM, Stephen Boyd wrote:
> On 11/17, Tirupathi Reddy wrote:
>> diff --git a/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>> new file mode 100644
>> index 0000000..2cf2aba
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
> Please move this to qcom,spmi-clkdiv.txt like other qcom bindings.
Addressed in next patch version[7]
>
>> @@ -0,0 +1,59 @@
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
>> +	Definition: must be "qcom,spmi-clkdiv".
>> +
>> +- reg
>> +	Usage:      required
>> +	Value type: <prop-encoded-array>
>> +	Definition: base address of CLKDIV peripherals.
>> +
>> +- qcom,num-clkdivs
>> +	Usage:      required
>> +	Value type: <u32>
>> +	Definition: number of CLKDIV peripherals.
> Would it work if we read the registers and looked for the clkdiv
> subtype ID? If we read something that doesn't match, break and
> stop adding clks? Or does reading the next "peripheral" cause
> some sort of crash and burn scenario where the device see an
> access control violation? Would be interesting to do it that way
> and avoid needing a new property in DT.
I feel it is better to go with the current design as we beforehand know the
#div-clk peripherals in a PMIC. Reading the next peripheral might result in
an unknown failure if there is no real peripheral there (PMIC peripherals
are not in contiguous address space).
>> +
>> +
>> +	parent_name = of_clk_get_parent_name(of_node, 0);
>> +	if (!parent_name) {
>> +		dev_err(dev, "missing parent clock\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	init.parent_names = &parent_name;
>> +	init.num_parents = 1;
>> +	init.ops = &clk_spmi_pmic_div_ops;
>> +
>> +	for (i = 0, clkdiv = cc->clks; i < nclks; i++) {
>> +		spin_lock_init(&clkdiv[i].lock);
>> +		clkdiv[i].base = start + i * 0x100;
>> +		clkdiv[i].regmap = regmap;
>> +		clkdiv[i].cxo_period_ns = NSEC_PER_SEC / cxo_hz;
>> +		init.name = kasprintf(GFP_KERNEL, "div_clk%d", i + 1);
> Hmm. Maybe we should just have this on the stack. 20 characters
> should be plenty?
Addressed in next patch version[7]
>> +		clkdiv[i].hw.init = &init;
>> +
>> +		ret = devm_clk_hw_register(dev, &clkdiv[i].hw);
>> +		kfree(init.name); /* clk framework made a copy */
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return of_clk_add_hw_provider(of_node, spmi_pmic_div_clk_hw_get, cc);
>> +}
>> +
>> +static int spmi_pmic_clkdiv_remove(struct platform_device *pdev)
>> +{
>> +	of_clk_del_provider(pdev->dev.of_node);
>> +
>> +	return 0;
> This can use devm now.
Addressed in next patch version.
>> +}
>> +
>> +static const struct of_device_id spmi_pmic_clkdiv_match_table[] = {
>> +	{ .compatible = "qcom,spmi-clkdiv" },
>> +	{ /* sentinel */ }
>> +};
> Nice!
Thanks

