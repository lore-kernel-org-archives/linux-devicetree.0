From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 7/9] soc: mediatek: pwrap: add MediaTek MT6380 as one
 slave of pwrap
Date: Tue, 10 Oct 2017 12:02:05 +0200
Message-ID: <0491f3fc-0404-c775-70f3-8bc86b3cf6c8@gmail.com>
References: <cover.1502779753.git.sean.wang@mediatek.com>
 <398d87c6ae2b414016fc0c0a9c6bada3ce746118.1502779753.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <398d87c6ae2b414016fc0c0a9c6bada3ce746118.1502779753.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/15/2017 11:09 AM, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Add MediaTek MT6380 regulator becoming one of PMIC wrapper slave
> and also add extra new regmap_config of 32-bit mode for MT6380
> since old regmap_config of 16-bit mode can't be fit into the need.
> 
> Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 1f8b69a..047e3d9 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -501,6 +501,7 @@ struct pmic_wrapper;
>   struct pwrap_slv_type {
>   	const u32 *dew_regs;
>   	enum pmic_type type;
> +	const struct regmap_config *regmap;
>   	/* pwrap operations are highly associated with the PMIC types,
>   	 * so the pointers added increases flexibility allowing determination
>   	 * which type is used by the detection through device tree.
> @@ -1109,7 +1110,7 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
>   	return IRQ_HANDLED;
>   }
>   
> -static const struct regmap_config pwrap_regmap_config = {
> +static const struct regmap_config pwrap_regmap_config16 = {
>   	.reg_bits = 16,
>   	.val_bits = 16,
>   	.reg_stride = 2,
> @@ -1118,9 +1119,19 @@ static const struct regmap_config pwrap_regmap_config = {
>   	.max_register = 0xffff,
>   };
>   
> +static const struct regmap_config pwrap_regmap_config32 = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.reg_read = pwrap_regmap_read,
> +	.reg_write = pwrap_regmap_write,
> +	.max_register = 0xffff,
> +};
> +
>   static const struct pwrap_slv_type pmic_mt6323 = {
>   	.dew_regs = mt6323_regs,
>   	.type = PMIC_MT6323,
> +	.regmap = &pwrap_regmap_config16,
>   	.pwrap_read = pwrap_read16,
>   	.pwrap_write = pwrap_write16,
>   };
> @@ -1128,6 +1139,7 @@ static const struct pwrap_slv_type pmic_mt6323 = {
>   static const struct pwrap_slv_type pmic_mt6380 = {
>   	.dew_regs = NULL,
>   	.type = PMIC_MT6380,
> +	.regmap = &pwrap_regmap_config32,
>   	.pwrap_read = pwrap_read32,
>   	.pwrap_write = pwrap_write32,
>   };
> @@ -1135,6 +1147,7 @@ static const struct pwrap_slv_type pmic_mt6380 = {
>   static const struct pwrap_slv_type pmic_mt6397 = {
>   	.dew_regs = mt6397_regs,
>   	.type = PMIC_MT6397,
> +	.regmap = &pwrap_regmap_config16,
>   	.pwrap_read = pwrap_read16,
>   	.pwrap_write = pwrap_write16,
>   };
> @@ -1144,9 +1157,15 @@ static const struct of_device_id of_slave_match_tbl[] = {
>   		.compatible = "mediatek,mt6323",
>   		.data = &pmic_mt6323,
>   	}, {
> +		/* The MT6380 slave device is directly pointed to the regulator
> +		 * device which is different from the cases MT6323 and MT6397
> +		 * where they're one kind of MFDs.
> +		 */
> +		.compatible = "mediatek,mt6380-regulator",
> +		.data = &pmic_mt6380,

I understand that mt6380 only provides a regulator and no other function other 
PMICs provide, right?

Then maybe write a comment like:
The MT6380 PMIC only implements a regulator, so we bind it directly instead of 
using a MFD. If so, we should state that in the pwrap bindings document, I think.

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
