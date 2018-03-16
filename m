From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 4/7] soc: qcom: rpmpd: Add support for get/set performance
 state
Date: Fri, 16 Mar 2018 11:22:05 +0530
Message-ID: <36687f34-449d-643c-251f-4469322db21e@codeaurora.org>
References: <20180316040824.21472-1-rnayak@codeaurora.org>
 <20180316040824.21472-5-rnayak@codeaurora.org>
 <20180316043535.GQ15832@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316043535.GQ15832@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 03/16/2018 10:05 AM, Viresh Kumar wrote:
> On 16-03-18, 09:38, Rajendra Nayak wrote:
>> With genpd now expecting powerdomain drivers supporting performance
>> state to support get/set performance state callbacks, add support for it
>> in the rpmpd driver.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>>  drivers/soc/qcom/rpmpd.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
>> index c8754d867c33..4058c5b450c6 100644
>> --- a/drivers/soc/qcom/rpmpd.c
>> +++ b/drivers/soc/qcom/rpmpd.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/of.h>
>>  #include <linux/of_device.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_opp.h>
>>  #include <linux/soc/qcom/smd-rpm.h>
>>  
>>  #include <dt-bindings/mfd/qcom-rpm.h>
>> @@ -29,6 +30,8 @@
>>  #define KEY_ENABLE		0x6e657773 /* swen */
>>  #define KEY_FLOOR_CORNER	0x636676   /* vfc */
>>  
>> +#define MAX_RPMPD_STATE		6
>> +
>>  #define DEFINE_RPMPD_CORN_SMPA(_platform, _name, _active, r_id)		\
>>  	static struct rpmpd _platform##_##_active;			\
>>  	static struct rpmpd _platform##_##_name = {			\
>> @@ -222,6 +225,43 @@ static int rpmpd_power_off(struct generic_pm_domain *domain)
>>  	return ret;
>>  }
>>  
>> +static int rpmpd_set_performance(struct generic_pm_domain *domain,
>> +			     unsigned int state)
>> +{
>> +	int ret = 0;
>> +	struct rpmpd *pd = domain_to_rpmpd(domain);
>> +
>> +	mutex_lock(&rpmpd_lock);
>> +
>> +	if (state > MAX_RPMPD_STATE)
>> +		goto out;
>> +
>> +	pd->corner = state;
>> +
>> +	if (!pd->enabled && (pd->key != KEY_FLOOR_CORNER))
>> +		goto out;
>> +
>> +	ret = rpmpd_aggregate_corner(pd);
>> +
>> +out:
>> +	mutex_unlock(&rpmpd_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static unsigned int rpmpd_get_performance(struct generic_pm_domain *genpd,
>> +					  struct dev_pm_opp *opp)
>> +{
>> +	struct device_node *np;
>> +	unsigned int corner = 0;
>> +
>> +	np = dev_pm_opp_get_of_node(opp);
>> +	of_property_read_u32(np, "qcom,level", &corner);
> 
> Don't we want to error out or do something else in case of an error ?

yes, I missed the error checks, will add.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
