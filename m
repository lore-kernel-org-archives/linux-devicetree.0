From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v3 6/7] soc: qcom: Add RPMh Power domain driver
Date: Thu, 14 Jun 2018 11:17:35 -0700
Message-ID: <bd8999bd-a3ae-b7e2-a805-b31d38571ec6@codeaurora.org>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-7-rnayak@codeaurora.org>
 <d438946d-3d6f-4436-27c7-3eae4559ec53@codeaurora.org>
 <f6b166ee-538f-c8b7-3be5-57c20a599d47@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6b166ee-538f-c8b7-3be5-57c20a599d47@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Rajendra,

On 06/13/2018 11:54 PM, Rajendra Nayak wrote:
> On 06/14/2018 06:02 AM, David Collins wrote:
>> On 06/11/2018 09:40 PM, Rajendra Nayak wrote:
...
>>> +static int rpmhpd_power_off(struct generic_pm_domain *domain)
>>> +{
>>> +	struct rpmhpd *pd = domain_to_rpmhpd(domain);
>>> +	int ret = 0;
>>> +
>>> +	mutex_lock(&rpmhpd_lock);
>>> +
>>> +	if (pd->level[0] == 0)
>>> +		ret = rpmhpd_aggregate_corner(pd, 0);
>>
>> I'm not sure that we want to have the 'pd->level[0] == 0' check,
>> especially when considering aggregation with the peer pd.  I understand
>> its intention to try to keep enable state and level setting orthogonal.
>> However, as it stands now, the final request sent to hardware would differ
>> depending upon the order of calls.  Consider the following example.
>>
>> Initial state:
>> pd->level[0] == 0
>> pd->corner = 5, pd->enabled = true, pd->active_only = false
>> pd->peer->corner = 7, pd->peer->enabled = true, pd->peer->active_only = true
>>
>> Outstanding requests:
>> RPMH_ACTIVE_ONLY_STATE = 7, RPMH_WAKE_ONLY_STATE = 7, RPMH_SLEEP_STATE = 5
>>
>> Case A:
>> 	1. set pd->corner = 6
>> 		--> new value request: RPMH_SLEEP_STATE = 6
>> 		--> duplicate value requests: RPMH_ACTIVE_ONLY_STATE = 7,
>> 			RPMH_WAKE_ONLY_STATE = 7
>> 	2. power_off pd->peer
>> 		--> no requests
> 
> I am not sure why there would be no requests, since we do end up aggregating
> with pd->peer->corner = 0.
> So the final state would be
> 
> RPMH_ACTIVE_ONLY_STATE = max(6, 0) = 6
> RPMH_WAKE_ONLY_STATE = 6
> RPMH_SLEEP_STATE = max(6, 0) = 6

Argh, my example was ruined by a one character typo.  I meant to have:

	Initial state:
	pd->level[0] != 0


>>
>> 	Final state:
>> 	RPMH_ACTIVE_ONLY_STATE = 7
>> 	RPMH_WAKE_ONLY_STATE = 7
>> 	RPMH_SLEEP_STATE = 6
>>
>> Case B:
>> 	1. power_off pd->peer
>> 		--> no requests
> 
> Here it would be again be aggregation based on pd->peer->corner = 0
> so,
> RPMH_ACTIVE_ONLY_STATE = max(5, 0) = 5
> RPMH_WAKE_ONLY_STATE = 5
> RPMH_SLEEP_STATE = max(5, 0) = 5
> 
>> 	2. set pd->corner = 6
>> 		--> new value requests: RPMH_ACTIVE_ONLY_STATE = 6,
>> 		       RPMH_WAKE_ONLY_STATE = 6, RPMH_SLEEP_STATE = 6
>>
>> 	Final state:
>> 	RPMH_ACTIVE_ONLY_STATE = 6
>> 	RPMH_WAKE_ONLY_STATE = 6
>> 	RPMH_SLEEP_STATE = 6
> 
> correct,
> RPMH_ACTIVE_ONLY_STATE = max(6, 0) = 6
> RPMH_WAKE_ONLY_STATE = 6
> RPMH_SLEEP_STATE = max(6, 0) = 6
> 
>>
>> Without the check, Linux would vote for the lowest supported level when
>> power_off is called.  This seems semantically reasonable given that the
>> consumer is ok with the power domain going fully off and that would be the
>> closest that we can get.
> 
> So are you suggesting I replace
> 
>>> +	if (pd->level[0] == 0)
>>> +		ret = rpmhpd_aggregate_corner(pd, 0);
> 
> with
> 
>>> +	ret = rpmhpd_aggregate_corner(pd, pd->level[0]);

Yes, this is the modification that I'm requesting.


> I can see what you said above makes sense but if its
>> Initial state:
>> pd->level[0] != 0
> 
> Was that what you meant?

Yes.


> I can't seem to see any ARC resources on 845 which seem to 
> have a 'pd->level[0] != 0' but looks like thats certainly a
> possibility we need to handle?

The command DB interface for ARC resources was designed to support the
situation of a power domain that could not be fully disabled and is
instead limited to some minimum level.

Thanks,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
