From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv2 4/5] rtc: s5m: Add the support for S2MPS13 RTC
Date: Mon, 24 Nov 2014 19:46:51 +0900
Message-ID: <54730C9B.20807@samsung.com>
References: <1416301183-10478-1-git-send-email-cw00.choi@samsung.com>
 <1416301183-10478-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1416301183-10478-5-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Alessandro,

Could you please review these patchset?
Other patches of these patchset ended up getting Ack message from each Maintainer.

Best Regards,
Chanwoo Choi

On 11/18/2014 05:59 PM, Chanwoo Choi wrote:
> This patch adds only the compatible string for S2MPS13 RTC which is identical
> with S2MPS14 RTC driver.
> 
> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/rtc/rtc-s5m.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> index 8754c33..e5fdfd3 100644
> --- a/drivers/rtc/rtc-s5m.c
> +++ b/drivers/rtc/rtc-s5m.c
> @@ -191,6 +191,7 @@ static inline int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
>  		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
>  		val &= S5M_ALARM0_STATUS;
>  		break;
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		ret = regmap_read(info->s5m87xx->regmap_pmic, S2MPS14_REG_ST2,
>  				&val);
> @@ -254,6 +255,7 @@ static inline int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
>  	case S5M8767X:
>  		data &= ~S5M_RTC_TIME_EN_MASK;
>  		break;
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		data |= S2MPS_RTC_RUDR_MASK;
>  		break;
> @@ -311,7 +313,9 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	u8 data[info->regs->regs_count];
>  	int ret;
>  
> -	if (info->device_type == S2MPS14X) {
> +	switch (info->device_type) {
> +	case S2MPS13X:
> +	case S2MPS14X:
>  		ret = regmap_update_bits(info->regmap,
>  				info->regs->rtc_udr_update,
>  				S2MPS_RTC_RUDR_MASK, S2MPS_RTC_RUDR_MASK);
> @@ -333,6 +337,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  		break;
>  
>  	case S5M8767X:
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		s5m8767_data_to_tm(data, tm, info->rtc_24hr_mode);
>  		break;
> @@ -359,6 +364,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  		s5m8763_tm_to_data(tm, data);
>  		break;
>  	case S5M8767X:
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		ret = s5m8767_tm_to_data(tm, data);
>  		break;
> @@ -406,6 +412,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  		break;
>  
>  	case S5M8767X:
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		s5m8767_data_to_tm(data, &alrm->time, info->rtc_24hr_mode);
>  		alrm->enabled = 0;
> @@ -454,6 +461,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
>  		break;
>  
>  	case S5M8767X:
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		for (i = 0; i < info->regs->regs_count; i++)
>  			data[i] &= ~ALARM_ENABLE_MASK;
> @@ -498,6 +506,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
>  		break;
>  
>  	case S5M8767X:
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		data[RTC_SEC] |= ALARM_ENABLE_MASK;
>  		data[RTC_MIN] |= ALARM_ENABLE_MASK;
> @@ -537,6 +546,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  		break;
>  
>  	case S5M8767X:
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		s5m8767_tm_to_data(&alrm->time, data);
>  		break;
> @@ -641,6 +651,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
>  		ret = regmap_raw_write(info->regmap, S5M_ALARM0_CONF, data, 2);
>  		break;
>  
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		data[0] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
>  		ret = regmap_write(info->regmap, info->regs->ctrl, data[0]);
> @@ -678,6 +689,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	switch (pdata->device_type) {
> +	case S2MPS13X:
>  	case S2MPS14X:
>  		regmap_cfg = &s2mps14_rtc_regmap_config;
>  		info->regs = &s2mps_rtc_regs;
> @@ -831,6 +843,7 @@ static SIMPLE_DEV_PM_OPS(s5m_rtc_pm_ops, s5m_rtc_suspend, s5m_rtc_resume);
>  
>  static const struct platform_device_id s5m_rtc_id[] = {
>  	{ "s5m-rtc",		S5M8767X },
> +	{ "s2mps13-rtc",	S2MPS13X },
>  	{ "s2mps14-rtc",	S2MPS14X },
>  };
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
