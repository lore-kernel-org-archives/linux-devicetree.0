From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v3 7/7] soc: qcom: rpmpd/rpmhpd: Add a max vote on all
 corners at init
Date: Wed, 13 Jun 2018 15:28:08 -0700
Message-ID: <414598de-00a1-9ce7-3a7e-4a95fd1bd35d@codeaurora.org>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-8-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612044052.4402-8-rnayak@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Rajendra,

On 06/11/2018 09:40 PM, Rajendra Nayak wrote:
> As we move from no clients/consumers in kernel voting on corners,
> to *some* voting and some not voting, we might end up in a situation
> where the clients which remove votes can adversly impact others

s/adversly/adversely/

> who still don't have a way to vote.
> 
> To avoid this situation, have a max vote on all corners at init.
> This should/can be removed once we have all clients moved to
> be able to vote/unvote for themselves.

This change seems like a hack.  Do you intend for it to be merged and then
later reverted in Linus's tree?  Could it instead be implemented in a way
that does not require reverting and instead is enabled by some DT
property?  Alternatively, could this feature be added to the power domain
core since it is relatively generic?


> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/soc/qcom/rpmhpd.c | 12 +++++++++++-
>  drivers/soc/qcom/rpmpd.c  |  9 +++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 7083ec1590ff..3c753d33aeee 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -329,7 +329,7 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
>  
>  static int rpmhpd_probe(struct platform_device *pdev)
>  {
> -	int i, ret;
> +	int i, ret, max_level;
>  	size_t num;
>  	struct genpd_onecell_data *data;
>  	struct rpmhpd **rpmhpds;
> @@ -390,6 +390,16 @@ static int rpmhpd_probe(struct platform_device *pdev)
>  		pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
>  
>  		data->domains[i] = &rpmhpds[i]->pd;
> +
> +		/*
> +		 * Until we have all consumers voting on corners
> +		 * just vote the max corner on all PDs
> +		 * This should ideally be *removed* once we have
> +		 * all (most) consumers being able to vote
> +		 */
> +		max_level = rpmhpds[i]->level_count - 1;
> +		rpmhpd_set_performance(&rpmhpds[i]->pd, rpmhpds[i]->level[max_level]);
> +		rpmhpd_power_on(&rpmhpds[i]->pd);

Clearly these calls will result in max level requests being sent for all
power domains at probe time.  However, it isn't clear that this will
actually help at runtime in these two cases:

1. A consumer enables and then disables a power domain.
	- It seems like the PD would just be disabled in this case.

2. A consumer sets a non-max performance state of a power domain.
	- It seems like the PD would just be set to the new lower
	  performance state since the max vote isn't known to the
	  PD core for aggregation purposes.

Thanks,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
