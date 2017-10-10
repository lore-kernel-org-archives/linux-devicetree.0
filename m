From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/7] soc: mediatek: pwrap: update pwrap_init without
 slave programming
Date: Tue, 10 Oct 2017 20:00:41 +0200
Message-ID: <f3a04159-8491-6ca6-d2ad-7df1dfd64331@gmail.com>
References: <cover.1505980364.git.sean.wang@mediatek.com>
 <604078485ca9ab04cea5bc531425d6035b27bc88.1505980364.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <604078485ca9ab04cea5bc531425d6035b27bc88.1505980364.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 09/21/2017 10:26 AM, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> pwrap initialization is highly associated with the base SoC, so
> update here for allowing pwrap_init without slave program which would be
> used to those PMICs without extra encryption on bus such as MT6380.
> 
> Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 91 +++++++++++++++++++++---------------
>   1 file changed, 54 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 27d7ccc..9c6d855 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -531,6 +531,7 @@ struct pmic_wrapper_type {
>   	u32 spi_w;
>   	u32 wdt_src;
>   	int has_bridge:1;
> +	int slv_program:1;
>   	int (*init_reg_clock)(struct pmic_wrapper *wrp);
>   	int (*init_soc_specific)(struct pmic_wrapper *wrp);
>   };
> @@ -999,9 +1000,12 @@ static int pwrap_init(struct pmic_wrapper *wrp)
>   	}
>   
>   	/* Reset SPI slave */
> -	ret = pwrap_reset_spislave(wrp);
> -	if (ret)
> -		return ret;
> +
> +	if (wrp->master->slv_program) {
> +		ret = pwrap_reset_spislave(wrp);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	pwrap_writel(wrp, 1, PWRAP_WRAP_EN);
>   
> @@ -1013,45 +1017,52 @@ static int pwrap_init(struct pmic_wrapper *wrp)
>   	if (ret)
>   		return ret;
>   
> -	/* Setup serial input delay */
> -	ret = pwrap_init_sidly(wrp);
> -	if (ret)
> -		return ret;
> +	if (wrp->master->slv_program) {

This if branch is really long and complex enough to put it into function apart.

Thanks,
Matthias

PD please take into account the comments I made on v3 of the series.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
