From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 3/9] soc: qcom: rpmpd: Modify corner defining macros
Date: Mon, 25 Mar 2019 09:37:57 +0530
Message-ID: <6d1453af-b01f-9e5a-4c9a-b2af00d1f05f@codeaurora.org>
References: <20190324175007.29040-1-sibis@codeaurora.org>
 <20190324175007.29040-4-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324175007.29040-4-sibis@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 3/24/2019 11:20 PM, Sibi Sankar wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> QCS404 uses individual resource type magic for each power-domain, so
> adjust the macros slightly to make them reusable for this.
> 
> [sibi: Extend rpmpd corner pair to a generic rpmpd pair]

This needs to be right above your SoB I think.

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>   drivers/soc/qcom/rpmpd.c | 39 +++++++++++++++++----------------------
>   1 file changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 71fdfafad2ea..17cd59d1ac3b 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -17,8 +17,8 @@
>   #define domain_to_rpmpd(domain) container_of(domain, struct rpmpd, pd)
>   
>   /* Resource types */
> -#define RPMPD_SMPA 0x61706d73
> -#define RPMPD_LDOA 0x616f646c
> +#define RPMPD_SMPA 0x61706d73 /* smpa */
> +#define RPMPD_LDOA 0x616f646c /* ldoa */
>   
>   /* Operation Keys */
>   #define KEY_CORNER		0x6e726f63 /* corn */
> @@ -27,46 +27,41 @@
>   
>   #define MAX_RPMPD_STATE		6
>   
> -#define DEFINE_RPMPD_CORNER_SMPA(_platform, _name, _active, r_id)		\
> +#define DEFINE_RPMPD_PAIR(_platform, _name, _active, r_type, r_key,	\
> +			  r_id)						\
>   	static struct rpmpd _platform##_##_active;			\
>   	static struct rpmpd _platform##_##_name = {			\
>   		.pd = {	.name = #_name,	},				\
>   		.peer = &_platform##_##_active,				\
> -		.res_type = RPMPD_SMPA,					\
> +		.res_type = RPMPD_##r_type,				\
>   		.res_id = r_id,						\
> -		.key = KEY_CORNER,					\
> +		.key = KEY_##r_key,					\
>   	};								\
>   	static struct rpmpd _platform##_##_active = {			\
>   		.pd = { .name = #_active, },				\
>   		.peer = &_platform##_##_name,				\
>   		.active_only = true,					\
> -		.res_type = RPMPD_SMPA,					\
> +		.res_type = RPMPD_##r_type,				\
>   		.res_id = r_id,						\
> -		.key = KEY_CORNER,					\
> +		.key = KEY_##r_key,					\
>   	}
>   
> -#define DEFINE_RPMPD_CORNER_LDOA(_platform, _name, r_id)			\
> +#define DEFINE_RPMPD_CORNER(_platform, _name, r_type, r_id)		\
>   	static struct rpmpd _platform##_##_name = {			\
>   		.pd = { .name = #_name, },				\
> -		.res_type = RPMPD_LDOA,					\
> +		.res_type = RPMPD_##r_type,				\
>   		.res_id = r_id,						\
>   		.key = KEY_CORNER,					\
>   	}
>   
> -#define DEFINE_RPMPD_VFC(_platform, _name, r_id, r_type)		\
> +#define DEFINE_RPMPD_VFC(_platform, _name, r_type, r_id)		\
>   	static struct rpmpd _platform##_##_name = {			\
>   		.pd = { .name = #_name, },				\
> -		.res_type = r_type,					\
> +		.res_type = RPMPD_##r_type,				\
>   		.res_id = r_id,						\
>   		.key = KEY_FLOOR_CORNER,				\
>   	}
>   
> -#define DEFINE_RPMPD_VFC_SMPA(_platform, _name, r_id)			\
> -	DEFINE_RPMPD_VFC(_platform, _name, r_id, RPMPD_SMPA)
> -
> -#define DEFINE_RPMPD_VFC_LDOA(_platform, _name, r_id)			\
> -	DEFINE_RPMPD_VFC(_platform, _name, r_id, RPMPD_LDOA)
> -
>   struct rpmpd_req {
>   	__le32 key;
>   	__le32 nbytes;
> @@ -96,12 +91,12 @@ struct rpmpd_desc {
>   static DEFINE_MUTEX(rpmpd_lock);
>   
>   /* msm8996 RPM Power domains */
> -DEFINE_RPMPD_CORNER_SMPA(msm8996, vddcx, vddcx_ao, 1);
> -DEFINE_RPMPD_CORNER_SMPA(msm8996, vddmx, vddmx_ao, 2);
> -DEFINE_RPMPD_CORNER_LDOA(msm8996, vddsscx, 26);
> +DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
> +DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
> +DEFINE_RPMPD_CORNER(msm8996, vddsscx, LDOA, 26);
>   
> -DEFINE_RPMPD_VFC_SMPA(msm8996, vddcx_vfc, 1);
> -DEFINE_RPMPD_VFC_LDOA(msm8996, vddsscx_vfc, 26);
> +DEFINE_RPMPD_VFC(msm8996, vddcx_vfc, SMPA, 1);
> +DEFINE_RPMPD_VFC(msm8996, vddsscx_vfc, LDOA, 26);
>   
>   static struct rpmpd *msm8996_rpmpds[] = {
>   	[MSM8996_VDDCX] =	&msm8996_vddcx,
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
