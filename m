From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 6/9] soc: mediatek: pwrap: update pwrap_init without
 slave programming
Date: Tue, 10 Oct 2017 11:53:01 +0200
Message-ID: <a90b5197-962b-a583-bed2-5ef39f5fca45@gmail.com>
References: <cover.1502779753.git.sean.wang@mediatek.com>
 <23b1e9fa5d4d8932b36e08d2a6713d4f33c055d9.1502779753.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <23b1e9fa5d4d8932b36e08d2a6713d4f33c055d9.1502779753.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/15/2017 11:09 AM, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
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
> index 9d1f4c6..1f8b69a 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -531,6 +531,7 @@ struct pmic_wrapper_type {
>   	u32 spi_w;
>   	u32 wdt_src;
>   	int has_bridge:1;
> +	int slv_program:1;

 From the commit log, it looks like that this depends on the PMIC used and not 
on the pmic_wrapper of the SoC. So we should put this into prawp_slv_type.

Regards,
Matthias

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
> +		/* Setup serial input delay */
> +		ret = pwrap_init_sidly(wrp);
> +		if (ret)
> +			return ret;
>   
> -	/* Enable dual IO mode */
> -	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_DIO_EN], 1);
> +		/* Enable dual IO mode */
> +		pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_DIO_EN], 1);
>   
> -	/* Check IDLE & INIT_DONE in advance */
> -	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle_and_sync_idle);
> -	if (ret) {
> -		dev_err(wrp->dev, "%s fail, ret=%d\n", __func__, ret);
> -		return ret;
> -	}
> +		/* Check IDLE & INIT_DONE in advance */
> +		ret = pwrap_wait_for_state(wrp,
> +					   pwrap_is_fsm_idle_and_sync_idle);
> +		if (ret) {
> +			dev_err(wrp->dev, "%s fail, ret=%d\n", __func__, ret);
> +			return ret;
> +		}
>   
> -	pwrap_writel(wrp, 1, PWRAP_DIO_EN);
> +		pwrap_writel(wrp, 1, PWRAP_DIO_EN);
>   
> -	/* Read Test */
> -	pwrap_read(wrp, wrp->slave->dew_regs[PWRAP_DEW_READ_TEST], &rdata);
> -	if (rdata != PWRAP_DEW_READ_TEST_VAL) {
> -		dev_err(wrp->dev, "Read test failed after switch to DIO mode: 0x%04x != 0x%04x\n",
> +		/* Read Test */
> +		pwrap_read(wrp,
> +			   wrp->slave->dew_regs[PWRAP_DEW_READ_TEST], &rdata);
> +		if (rdata != PWRAP_DEW_READ_TEST_VAL) {
> +			dev_err(wrp->dev,
> +				"Read failed on DIO mode: 0x%04x!=0x%04x\n",
>   				PWRAP_DEW_READ_TEST_VAL, rdata);
> -		return -EFAULT;
> -	}
> -
> -	/* Enable encryption */
> -	ret = pwrap_init_cipher(wrp);
> -	if (ret)
> -		return ret;
> +			return -EFAULT;
> +		}
>   
> -	/* Signature checking - using CRC */
> -	if (pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CRC_EN], 0x1))
> -		return -EFAULT;
> +		/* Enable encryption */
> +		ret = pwrap_init_cipher(wrp);
> +		if (ret)
> +			return ret;
>   
> -	pwrap_writel(wrp, 0x1, PWRAP_CRC_EN);
> -	pwrap_writel(wrp, 0x0, PWRAP_SIG_MODE);
> -	pwrap_writel(wrp, wrp->slave->dew_regs[PWRAP_DEW_CRC_VAL],
> -		     PWRAP_SIG_ADR);
> -	pwrap_writel(wrp, wrp->master->arb_en_all, PWRAP_HIPRIO_ARB_EN);
> +		/* Signature checking - using CRC */
> +		if (pwrap_write(wrp,
> +				wrp->slave->dew_regs[PWRAP_DEW_CRC_EN], 0x1))
> +			return -EFAULT;
> +
> +		pwrap_writel(wrp, 0x1, PWRAP_CRC_EN);
> +		pwrap_writel(wrp, 0x0, PWRAP_SIG_MODE);
> +		pwrap_writel(wrp, wrp->slave->dew_regs[PWRAP_DEW_CRC_VAL],
> +			     PWRAP_SIG_ADR);
> +		pwrap_writel(wrp,
> +			     wrp->master->arb_en_all, PWRAP_HIPRIO_ARB_EN);
> +	}
>   
>   	if (wrp->master->type == PWRAP_MT8135)
>   		pwrap_writel(wrp, 0x7, PWRAP_RRARB_EN);
> @@ -1059,8 +1070,11 @@ static int pwrap_init(struct pmic_wrapper *wrp)
>   	pwrap_writel(wrp, 0x1, PWRAP_WACS0_EN);
>   	pwrap_writel(wrp, 0x1, PWRAP_WACS1_EN);
>   	pwrap_writel(wrp, 0x1, PWRAP_WACS2_EN);
> -	pwrap_writel(wrp, 0x5, PWRAP_STAUPD_PRD);
> -	pwrap_writel(wrp, 0xff, PWRAP_STAUPD_GRPEN);
> +
> +	if (wrp->master->slv_program) {
> +		pwrap_writel(wrp, 0x5, PWRAP_STAUPD_PRD);
> +		pwrap_writel(wrp, 0xff, PWRAP_STAUPD_GRPEN);
> +	}
>   
>   	if (wrp->master->init_soc_specific) {
>   		ret = wrp->master->init_soc_specific(wrp);
> @@ -1146,6 +1160,7 @@ static const struct pmic_wrapper_type pwrap_mt2701 = {
>   	.spi_w = PWRAP_MAN_CMD_SPI_WRITE_NEW,
>   	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
>   	.has_bridge = 0,
> +	.slv_program = 1,
>   	.init_reg_clock = pwrap_mt2701_init_reg_clock,
>   	.init_soc_specific = pwrap_mt2701_init_soc_specific,
>   };
> @@ -1158,6 +1173,7 @@ static const struct pmic_wrapper_type pwrap_mt8135 = {
>   	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
>   	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
>   	.has_bridge = 1,
> +	.slv_program = 1,
>   	.init_reg_clock = pwrap_mt8135_init_reg_clock,
>   	.init_soc_specific = pwrap_mt8135_init_soc_specific,
>   };
> @@ -1170,6 +1186,7 @@ static const struct pmic_wrapper_type pwrap_mt8173 = {
>   	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
>   	.wdt_src = PWRAP_WDT_SRC_MASK_NO_STAUPD,
>   	.has_bridge = 0,
> +	.slv_program = 1,
>   	.init_reg_clock = pwrap_mt8173_init_reg_clock,
>   	.init_soc_specific = pwrap_mt8173_init_soc_specific,
>   };
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
