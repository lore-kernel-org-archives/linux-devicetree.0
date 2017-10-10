From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 5/9] soc: mediatek: pwrap: add pwrap_write32 for
 writing in 32-bit mode
Date: Tue, 10 Oct 2017 11:38:36 +0200
Message-ID: <d34460e3-9233-3c31-578d-cf2fe91a4316@gmail.com>
References: <cover.1502779753.git.sean.wang@mediatek.com>
 <236a04acb383fc655549bc345a16a2d015e5727d.1502779753.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <236a04acb383fc655549bc345a16a2d015e5727d.1502779753.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/15/2017 11:09 AM, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Some regulators such as MediaTek MT6380 also has to be written in
> 32-bit mode. So the patch adds pwrap_write32, rename old pwrap_write
> into pwrap_write16 and one additional function pointer is introduced
> for increasing flexibility allowing the determination which mode is
> used by the pwrap slave detection through device tree.
> 
> Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 63 +++++++++++++++++++++++++++---------
>   1 file changed, 47 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 7cd581b..9d1f4c6 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -506,6 +506,7 @@ struct pwrap_slv_type {
>   	 * which type is used by the detection through device tree.
>   	 */
>   	int (*pwrap_read)(struct pmic_wrapper *wrp, u32 adr, u32 *rdata);
> +	int (*pwrap_write)(struct pmic_wrapper *wrp, u32 adr, u32 wdata);
>   };
>   
>   struct pmic_wrapper {
> @@ -600,22 +601,6 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
>   	} while (1);
>   }
>   
> -static int pwrap_write(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
> -{
> -	int ret;
> -
> -	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
> -	if (ret) {
> -		pwrap_leave_fsm_vldclr(wrp);
> -		return ret;
> -	}
> -
> -	pwrap_writel(wrp, (1 << 31) | ((adr >> 1) << 16) | wdata,
> -			PWRAP_WACS2_CMD);
> -
> -	return 0;
> -}
> -
>   static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
>   {
>   	int ret;
> @@ -672,6 +657,49 @@ static int pwrap_read(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
>   	return wrp->slave->pwrap_read(wrp, adr, rdata);
>   }
>   
> +static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
> +{
> +	int ret;
> +
> +	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
> +	if (ret) {
> +		pwrap_leave_fsm_vldclr(wrp);
> +		return ret;
> +	}
> +
> +	pwrap_writel(wrp, (1 << 31) | ((adr >> 1) << 16) | wdata,
> +		     PWRAP_WACS2_CMD);
> +
> +	return 0;
> +}
> +
> +static int pwrap_write32(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
> +{
> +	int ret, msb, rdata;
> +
> +	for (msb = 0; msb < 2; msb++) {
> +		ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
> +		if (ret) {
> +			pwrap_leave_fsm_vldclr(wrp);
> +			return ret;
> +		}
> +
> +		pwrap_writel(wrp, (1 << 31) | (msb << 30) | (adr << 16) |
> +			     ((wdata >> (msb * 16)) & 0xffff),
> +			     PWRAP_WACS2_CMD);
> +
> +		if (!msb)
> +			pwrap_read(wrp, adr, &rdata);

Just so that I understand, you have to read back the half-written register 
before you can write the second part?

Other then that it looks fine to me.

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
