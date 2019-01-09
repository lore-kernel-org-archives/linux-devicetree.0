From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v10 2/9] OPP: Add support for parsing the 'opp-level'
 property
Date: Wed, 9 Jan 2019 14:53:47 +0530
Message-ID: <47fc34b9-02f0-1216-0a01-cddb45af6df4@codeaurora.org>
References: <20190109090420.8100-1-rnayak@codeaurora.org>
 <20190109090420.8100-3-rnayak@codeaurora.org>
 <20190109091210.jw6gw5qif55p7wes@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190109091210.jw6gw5qif55p7wes@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: andy.gross@linaro.org, robh@kernel.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org



On 1/9/2019 2:42 PM, Viresh Kumar wrote:
> On 09-01-19, 14:34, Rajendra Nayak wrote:
>> Now that the OPP bindings are updated to include an optional
>> 'opp-level' property, add support to parse it from device tree
>> and store it as part of dev_pm_opp structure.
>> Also add and export an helper 'dev_pm_opp_get_level()' that can be
>> used to get the level value read from device tree when present.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/opp/core.c     | 18 ++++++++++++++++++
>>   drivers/opp/of.c       |  5 ++++-
>>   drivers/opp/opp.h      |  2 ++
>>   include/linux/pm_opp.h |  7 +++++++
>>   4 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> index e5507add8f04..738b1783aa65 100644
>> --- a/drivers/opp/core.c
>> +++ b/drivers/opp/core.c
>> @@ -130,6 +130,24 @@ unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp)
>>   }
>>   EXPORT_SYMBOL_GPL(dev_pm_opp_get_freq);
>>   
>> +/**
>> + * dev_pm_opp_get_level() - Gets the level corresponding to an available opp
>> + * @opp:	opp for which level value has to be returned for
>> + *
>> + * Return: level read from device tree corresponding to the opp, else
>> + * return 0
> 
> All a full-stop here.

will do

> 
>> + */
>> +unsigned int dev_pm_opp_get_level(struct dev_pm_opp *opp)
>> +{
>> +	if (IS_ERR_OR_NULL(opp) || !opp->available) {
>> +		pr_err("%s: Invalid parameters\n", __func__);
>> +		return 0;
>> +	}
>> +
>> +	return opp->level;
>> +}
>> +EXPORT_SYMBOL_GPL(dev_pm_opp_get_level);
>> +
>>   /**
>>    * dev_pm_opp_is_turbo() - Returns if opp is turbo OPP or not
>>    * @opp: opp for which turbo mode is being verified
>> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
>> index 06f0f632ec47..8274d3ba2c5b 100644
>> --- a/drivers/opp/of.c
>> +++ b/drivers/opp/of.c
>> @@ -568,7 +568,7 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
>>   {
>>   	struct dev_pm_opp *new_opp;
>>   	u64 rate = 0;
>> -	u32 val;
>> +	u32 val, level = 0;
>>   	int ret;
>>   	bool rate_not_available = false;
>>   
>> @@ -594,6 +594,9 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
>>   		new_opp->rate = (unsigned long)rate;
>>   	}
>>   
>> +	if (!of_property_read_u32(np, "opp-level", &level))
>> +		new_opp->level = level;
>> +
> 
> What about
> 
>          of_property_read_u32(np, "opp-level", &new_opp->level);
> 
> ??

sure, will update

> 
>>   	/* Check if the OPP supports hardware's hierarchy of versions or not */
>>   	if (!_opp_is_supported(dev, opp_table, np)) {
>>   		dev_dbg(dev, "OPP not supported by hardware: %llu\n", rate);
>> diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
>> index e24d81497375..5accdd96867d 100644
>> --- a/drivers/opp/opp.h
>> +++ b/drivers/opp/opp.h
>> @@ -60,6 +60,7 @@ extern struct list_head opp_tables;
>>    * @suspend:	true if suspend OPP
>>    * @pstate: Device's power domain's performance state.
>>    * @rate:	Frequency in hertz
>> + * @level:	level value to be comminucated to remote power manager
> 
> Just say "performance level" here. Btw, communicated was also
> misspelled here.

will fix and respin

thanks for the review.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
