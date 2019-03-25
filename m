From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 2/9] soc: qcom: rpmpd: Add support to set rpmpd state
 to max
Date: Mon, 25 Mar 2019 09:36:19 +0530
Message-ID: <696866e5-740a-f7b0-5193-f79b5c1e908c@codeaurora.org>
References: <20190324175007.29040-1-sibis@codeaurora.org>
 <20190324175007.29040-3-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324175007.29040-3-sibis@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3/24/2019 11:20 PM, Sibi Sankar wrote:
> Add support to set rpmpd state to max across SoCs.

Changelog could be better, 'rpmpd max state varies across SoCs
and SoC families, add support in the driver to make it SoC/SoC
family specific'

> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>   drivers/soc/qcom/rpmpd.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 235d01870dd8..71fdfafad2ea 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -83,12 +83,14 @@ struct rpmpd {
>   	const int res_type;
>   	const int res_id;
>   	struct qcom_smd_rpm *rpm;
> +	unsigned int max_state;
>   	__le32 key;
>   };
>   
>   struct rpmpd_desc {
>   	struct rpmpd **rpmpds;
>   	size_t num_pds;
> +	unsigned int max_state;
>   };
>   
>   static DEFINE_MUTEX(rpmpd_lock);
> @@ -114,6 +116,7 @@ static struct rpmpd *msm8996_rpmpds[] = {
>   static const struct rpmpd_desc msm8996_desc = {
>   	.rpmpds = msm8996_rpmpds,
>   	.num_pds = ARRAY_SIZE(msm8996_rpmpds),
> +	.max_state = MAX_RPMPD_STATE,

Maybe this needs to be renamed to avoid confusion, MAX_8996_RPMPD_STATE?

>   };
>   
>   static const struct of_device_id rpmpd_match_table[] = {
> @@ -225,8 +228,8 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
>   	int ret = 0;
>   	struct rpmpd *pd = domain_to_rpmpd(domain);
>   
> -	if (state > MAX_RPMPD_STATE)
> -		state = MAX_RPMPD_STATE;
> +	if (state > pd->max_state)
> +		state = pd->max_state;
>   
>   	mutex_lock(&rpmpd_lock);
>   
> @@ -287,6 +290,7 @@ static int rpmpd_probe(struct platform_device *pdev)
>   		}
>   
>   		rpmpds[i]->rpm = rpm;
> +		rpmpds[i]->max_state = desc->max_state;
>   		rpmpds[i]->pd.power_off = rpmpd_power_off;
>   		rpmpds[i]->pd.power_on = rpmpd_power_on;
>   		rpmpds[i]->pd.set_performance_state = rpmpd_set_performance;
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
