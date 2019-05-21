From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 1/9] soc: qcom: rpmpd: fixup rpmpd set performance
 state
Date: Tue, 21 May 2019 17:09:33 +0530
Message-ID: <20190521113933.GJ15118@vkoul-mobl>
References: <20190513102015.26551-1-sibis@codeaurora.org>
 <20190513102015.26551-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190513102015.26551-2-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org, david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, marc.w.gonzalez@free.fr
List-Id: devicetree@vger.kernel.org

On 13-05-19, 15:50, Sibi Sankar wrote:
> Remoteproc q6v5-mss calls set_performace_state with INT_MAX on

s/performace/performance

> rpmpd. This is currently ignored since it is greater than the
> max supported state. Fixup rpmpd state to max if the required
> state is greater than all the supported states.
> 
> Fixes: 075d3db8d10d ("soc: qcom: rpmpd: Add support for get/set performance state")
> 
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmpd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 005326050c23..235d01870dd8 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -226,7 +226,7 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
>  	struct rpmpd *pd = domain_to_rpmpd(domain);
>  
>  	if (state > MAX_RPMPD_STATE)
> -		goto out;
> +		state = MAX_RPMPD_STATE;
>  
>  	mutex_lock(&rpmpd_lock);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
~Vinod
