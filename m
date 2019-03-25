From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 1/9] soc: qcom: rpmpd: fixup rpmpd set performance
 state
Date: Mon, 25 Mar 2019 09:33:01 +0530
Message-ID: <a224821a-6e28-cea5-9928-440f5e132460@codeaurora.org>
References: <20190324175007.29040-1-sibis@codeaurora.org>
 <20190324175007.29040-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324175007.29040-2-sibis@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 3/24/2019 11:19 PM, Sibi Sankar wrote:
> Fixup rpmpd state to max if the required state is greater than all the
> supported states.

This should also say why, 'so the clients which just want to vote on whatever
is the max state supported can do so by passing an INT_MAX'?

> 
> Fixes: 075d3db8d10d ("Add support for the .set_performace_state() and
> .opp_to_performance_state()")
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>   drivers/soc/qcom/rpmpd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 005326050c23..235d01870dd8 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -226,7 +226,7 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
>   	struct rpmpd *pd = domain_to_rpmpd(domain);
>   
>   	if (state > MAX_RPMPD_STATE)
> -		goto out;
> +		state = MAX_RPMPD_STATE;
>   
>   	mutex_lock(&rpmpd_lock);
>   
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
