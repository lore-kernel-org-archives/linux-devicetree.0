From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v2 5/6] soc: qcom: rpmh powerdomain driver
Date: Tue, 29 May 2018 12:03:26 -0700
Message-ID: <06684883-43d8-be4b-b6ec-7f128c680d50@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
 <20180525100121.28214-6-rnayak@codeaurora.org>
 <215deee5-6472-d587-9a90-f7158162ed82@codeaurora.org>
 <6f8e5fe2-199d-ba1f-19d7-2faf276075f3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6f8e5fe2-199d-ba1f-19d7-2faf276075f3@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hello Rajendra,

On 05/29/2018 03:19 AM, Rajendra Nayak wrote:
> On 05/26/2018 06:38 AM, David Collins wrote:
>> On 05/25/2018 03:01 AM, Rajendra Nayak wrote:
>>> The RPMh powerdomain driver aggregates the corner votes from various
...
>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>> index a7a405178967..1faed239701d 100644
>>> --- a/drivers/soc/qcom/Kconfig
>>> +++ b/drivers/soc/qcom/Kconfig
>>> @@ -74,6 +74,15 @@ config QCOM_RMTFS_MEM
>>>  
>>>  	  Say y here if you intend to boot the modem remoteproc.
>>>  
>>> +config QCOM_RPMHPD
>>> +	tristate "Qualcomm RPMh Powerdomain driver"
>>
>> s/Qualcomm/Qualcomm Technologies, Inc./
> 
> All other config options in qcom/Kconfig use 'Qualcomm XYZ feature'
> for the comment. Maybe I will leave it that way for consistency?

I don't have a strong opinion about it.  I just want the legal folks to be
happy.  I'm fine with whatever achieves that goal.


>>> +
>>> +struct rpmhpd_desc {
>>> +	struct rpmhpd **rpmhpds;
>>> +	size_t num_pds;
>>> +};
>>
>> This struct could be removed and the per-platform arrays could instead be
>> NULL terminated.
> 
> Yes, but I would prefer it this way unless you have strong objections.
> Just makes it easier to do the allocations at probe for genpd_onecell_data structures.

I'm fine if you keep it as-is.  I mentioned the alternative because
Stephen had requested the same modification on my qcom-rpmh-regulator
driver patch [1].  Other reviewers may care about this point.


>> Is there an API to determine the currently operating performance state of
>> a given power domain?  Is this information accessible from userspace?  We
>> will definitely need this for general debugging.
> 
> A quick look shows me its not. I agree its a necessary feature for debug.
> I will add a patch to expose it via debugfs

Thanks


>>> +static int rpmhpd_probe(struct platform_device *pdev)
>>> +{
>>> +	int i, ret;
>>> +	size_t num;
>>> +	struct genpd_onecell_data *data;
>>> +	struct rpmhpd **rpmhpds;
>>> +	const struct rpmhpd_desc *desc;
>>> +
>>> +	desc = of_device_get_match_data(&pdev->dev);
>>> +	if (!desc)
>>> +		return -EINVAL;
>>> +
>>> +	rpmhpds = desc->rpmhpds;
>>> +	num = desc->num_pds;
>>> +
>>> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>>> +	if (!data)
>>> +		return -ENOMEM;
>>> +
>>> +	data->domains = devm_kcalloc(&pdev->dev, num, sizeof(*data->domains),
>>> +				     GFP_KERNEL);
>>> +	data->num_domains = num;
>>> +
>>> +	ret = cmd_db_ready();
>>> +	if (ret) {
>>> +		if (ret != -EPROBE_DEFER)
>>> +			dev_err(&pdev->dev, "Command DB unavailable, ret=%d\n",
>>> +				ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	for (i = 0; i < num; i++) {
>>> +		if (!rpmhpds[i])
>>> +			continue;
>>
>> Why is this check needed?
> 
> Just to check/ignore if there are any holes.
> maybe I should atleast throw a warning instead of silently ignoring it?

A warning message might be a good idea if this condition should ever be
reached but also doesn't necessarily imply that probing must be ceased.
It looks like of_genpd_add_provider_onecell() ignores the NULL initialized
data->domains[i] values so it should be safe to leave the holes in and not
decrement num_domains accordingly.

Take care,
David

[1]: https://lkml.org/lkml/2018/3/21/681

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
