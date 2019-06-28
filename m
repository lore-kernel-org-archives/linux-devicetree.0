From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH RFC 3/4] cpufreq: qcom: Update the bandwidth levels on
 frequency change
Date: Fri, 28 Jun 2019 13:55:49 +0530
Message-ID: <aaf49cd8-bc0c-672f-2a20-67382e06461c@codeaurora.org>
References: <20190627133424.4980-1-sibis@codeaurora.org>
 <20190627133424.4980-4-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627133424.4980-4-sibis@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org, georgi.djakov@linaro.org
Cc: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, saravanak@google.com
List-Id: devicetree@vger.kernel.org


On 6/27/2019 7:04 PM, Sibi Sankar wrote:
> Add support to parse and update optional OPP tables attached to the
> cpu nodes when the OPP bandwidth values are populated to enable
> scaling of DDR/L3 bandwidth levels with frequency change.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
[]...

>   
> @@ -79,13 +108,29 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
>   {
>   	u32 data, src, lval, i, core_count, prev_cc = 0, prev_freq = 0, freq;
>   	u32 volt;
> +	u64 rate;
>   	unsigned int max_cores = cpumask_weight(policy->cpus);
>   	struct cpufreq_frequency_table	*table;
> +	struct device_node *opp_table_np, *np;
> +	int ret;
>   
>   	table = kcalloc(LUT_MAX_ENTRIES + 1, sizeof(*table), GFP_KERNEL);
>   	if (!table)
>   		return -ENOMEM;
>   
> +	ret = dev_pm_opp_of_add_table(cpu_dev);
> +	if (!ret) {
> +		/* Disable all opps and cross-validate against LUT */
> +		opp_table_np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
> +		for_each_available_child_of_node(opp_table_np, np) {
> +			ret = of_property_read_u64(np, "opp-hz", &rate);
> +			dev_pm_opp_disable(cpu_dev, rate);
> +		}
> +		of_node_put(opp_table_np);
> +	} else {
> +		dev_err(cpu_dev, "Couldn't add OPP table from dt\n");

The changelog seems to suggest specifying OPP tables in DT is optional,
but here we seem to error out if the tables are missing.

> +	}
> +
>   	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
>   		data = readl_relaxed(base + REG_FREQ_LUT +
>   				      i * LUT_ROW_SIZE);
> @@ -104,7 +149,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
>   
>   		if (freq != prev_freq && core_count == max_cores) {
>   			table[i].frequency = freq;
> -			dev_pm_opp_add(cpu_dev, freq * 1000, volt);
> +			qcom_cpufreq_update_opp(cpu_dev, freq, volt);
>   			dev_dbg(cpu_dev, "index=%d freq=%d, core_count %d\n", i,
>   				freq, core_count);
>   		} else {
> @@ -125,7 +170,8 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
>   			if (prev_cc != max_cores) {
>   				prev->frequency = prev_freq;
>   				prev->flags = CPUFREQ_BOOST_FREQ;
> -				dev_pm_opp_add(cpu_dev,	prev_freq * 1000, volt);
> +				qcom_cpufreq_update_opp(cpu_dev, prev_freq,
> +							volt);
>   			}
>   
>   			break;
> @@ -168,6 +214,7 @@ static void qcom_get_related_cpus(int index, struct cpumask *m)
>   static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   {
>   	struct device *dev = &global_pdev->dev;
> +	struct opp_table *opp_table = NULL;
>   	struct of_phandle_args args;
>   	struct device_node *cpu_np;
>   	struct device *cpu_dev;
> @@ -202,6 +249,8 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   	if (!base)
>   		return -ENOMEM;
>   
> +	opp_table = dev_pm_opp_set_paths(cpu_dev);
> +
>   	/* HW should be in enabled state to proceed */
>   	if (!(readl_relaxed(base + REG_ENABLE) & 0x1)) {
>   		dev_err(dev, "Domain-%d cpufreq hardware not enabled\n", index);
> @@ -237,6 +286,8 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   
>   	return 0;
>   error:
> +	if (opp_table)
> +		dev_pm_opp_put_paths(opp_table);
>   	devm_iounmap(dev, base);
>   	return ret;
>   }
> @@ -275,6 +326,8 @@ static struct cpufreq_driver cpufreq_qcom_hw_driver = {
>   
>   static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>   {
> +	struct opp_table *opp_table = NULL;
> +	struct device *cpu_dev;
>   	struct clk *clk;
>   	int ret;
>   
> @@ -294,6 +347,26 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>   
>   	global_pdev = pdev;
>   
> +	/* Check for optional interconnect paths on CPU0 */
> +	cpu_dev = get_cpu_device(0);
> +	if (!cpu_dev) {
> +		dev_err(&pdev->dev, "failed to get cpu0 device\n");
> +		return -ENODEV;
> +	}
> +
> +	opp_table = dev_pm_opp_set_paths(cpu_dev);
> +	if (IS_ERR(opp_table)) {
> +		ret = PTR_ERR(opp_table);
> +		if (ret == -EPROBE_DEFER) {
> +			dev_dbg(&pdev->dev, "defer icc set paths: %d\n", ret);
> +			return ret;
> +		}
> +		dev_err(&pdev->dev, "set paths failed ddr/l3 scaling off: %d\n",
> +			ret);

Here again, the interconnect paths don't seem to be optional as the comment
above suggests.

> +	} else {
> +		dev_pm_opp_put_paths(opp_table);
> +	}
> +
>   	ret = cpufreq_register_driver(&cpufreq_qcom_hw_driver);
>   	if (ret)
>   		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
