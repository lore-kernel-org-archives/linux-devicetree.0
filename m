From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v5 4/8] soc: qcom: rpmpd: Add support for get/set
 performance state
Date: Wed, 5 Dec 2018 12:33:14 +0530
Message-ID: <d9317471-fb81-482a-22c1-4a7b466a1df4@codeaurora.org>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-5-rnayak@codeaurora.org>
 <154396526967.88331.13652897075952274639@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154396526967.88331.13652897075952274639@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/5/2018 4:44 AM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2018-12-03 21:21:15)
>> @@ -221,6 +224,47 @@ static int rpmpd_power_off(struct generic_pm_domain *domain)
>>          return ret;
>>   }
>>   
>> +static int rpmpd_set_performance(struct generic_pm_domain *domain,
>> +                                unsigned int state)
>> +{
>> +       int ret = 0;
>> +       struct rpmpd *pd = domain_to_rpmpd(domain);
>> +
>> +       mutex_lock(&rpmpd_lock);
>> +
>> +       if (state > MAX_RPMPD_STATE)
>> +               goto out;
> 
> Does this need to be under the mutex lock? Doesn't look like it.

Nope, will move it out.

> 
>> +
>> +       pd->corner = state;
>> +
>> +       if (!pd->enabled && (pd->key != KEY_FLOOR_CORNER))
> 
> Please drop useless parenthesis.

sure

> 
>> +               goto out;
>> +
>> +       ret = rpmpd_aggregate_corner(pd);
>> +
>> +out:
>> +       mutex_unlock(&rpmpd_lock);
>> +
>> +       return ret;
>> +}
>> +
>> +static unsigned int rpmpd_get_performance(struct generic_pm_domain *genpd,
>> +                                         struct dev_pm_opp *opp)
>> +{
>> +       struct device_node *np;
>> +       unsigned int corner = 0;
>> +
>> +       np = dev_pm_opp_get_of_node(opp);
>> +       if (of_property_read_u32(np, "qcom,level", &corner)) {
>> +               pr_err("%s: missing 'qcom,level' property\n", __func__);
> 
> We leak np reference here, assuming dev_pm_opp_get_of_node() returns an
> of_node_get() pointer to the caller.

good catch, will fix.

> 
>> +               return 0;
>> +       }
>> +
>> +       of_node_put(np);
> 
> This same code exists twice. Perhaps a helper needs to exist for
> qcom_rpm_get_performance() to pull the number out of the DT.

Sure I can make both drivers use a common helper instead of duplicating it.

> 
>> +
>> +       return corner;
>> +}
