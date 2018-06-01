From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v2 5/6] soc: qcom: rpmh powerdomain driver
Date: Fri, 1 Jun 2018 12:19:42 -0700
Message-ID: <6075eeb8-ffb4-e7af-03a8-deed0444cb8c@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
 <20180525100121.28214-6-rnayak@codeaurora.org>
 <215deee5-6472-d587-9a90-f7158162ed82@codeaurora.org>
 <6817acaf-9a68-5cd5-4dd0-ebe12a9aa057@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6817acaf-9a68-5cd5-4dd0-ebe12a9aa057@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hello Rajendra,

On 06/01/2018 01:48 AM, Rajendra Nayak wrote:
> On 05/26/2018 06:38 AM, David Collins wrote:
>>
>>> +	[1] = &sdm845_mx,
>>> +	[2] = &sdm845_mx_ao,
>>> +	[3] = &sdm845_cx,
>>> +	[4] = &sdm845_cx_ao,
>>> +	[5] = &sdm845_lmx,
>>> +	[6] = &sdm845_lcx,
>>> +	[7] = &sdm845_gfx,
>>> +	[8] = &sdm845_mss,
>>> +};
>>> +
>>> +static const struct rpmhpd_desc sdm845_desc = {
>>> +	.rpmhpds = sdm845_rpmhpds,
>>> +	.num_pds = ARRAY_SIZE(sdm845_rpmhpds),
>>> +};
>>> +
>>> +static const struct of_device_id rpmhpd_match_table[] = {
>>> +	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
>>> +	{ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, rpmhpd_match_table);
>>> +
>>> +static int rpmhpd_send_corner(struct rpmhpd *pd, int state, unsigned int corner)
>>> +{
>>> +	struct tcs_cmd cmd = {
>>> +		.addr = pd->addr,
>>> +		.data = corner,
>>> +	};
>>> +
>>> +	return rpmh_write(pd->dev, state, &cmd, 1);
>> This can be optimized by calling rpmh_write_async() whenever the corner
>> being sent is smaller than the last value sent.  That way, no time is
>> wasted waiting for an ACK when decreasing voltage.  Would you mind adding
>> the necessary check and previous request caching for this?
> 
> is it safe to assume all sleep votes can be sent as async always? and only
> active votes could be sync/async depending on the last value sent?

Yes, rpmh_write_async() can always be used for RPMH_SLEEP_STATE and
RPMH_WAKE_ONLY_STATE.  The rpmh_write() vs rpmh_write_async() distinction
only matters for RPMH_ACTIVE_ONLY_STATE.

Take care,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
