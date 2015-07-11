From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/6] mfd: 88pm800: Add init time initial configuration
 support
Date: Sat, 11 Jul 2015 15:53:44 +0900
Message-ID: <55A0BD78.8050005@samsung.com>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org> <1436442431-3471-3-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436442431-3471-3-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

W dniu 09.07.2015 o 20:47, Vaibhav Hiremath pisze:
> This patch adds init time configuration of 88PM800/805 and
> 88PM860. It includes,
> 
>   - Enable BUCK clock gating in low power mode
>   - Full mode support for BUCK2 and 4
>   - Enable voltage change (LPF, DVC) in PMIC
> 
> Note that both 88PM800 and 88PM860 do share common configurations,
> but since I can not validate the configuration on 88PM800,
> restricting myself only to 88PM860.
> If anyone can validate on 88PM800, we can move common code accordingly.
> 
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Although I am not familiar with the device and driver, patch looks good
to me, except one idea below. Anyway feel free to add:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>


> ---
>  drivers/mfd/88pm800.c       | 64 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/88pm80x.h | 13 +++++++++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index 95c8ad4..80a1bc1 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -521,6 +521,63 @@ out:
>  	return ret;
>  }
>  
> +static int pm800_init_config(struct pm80x_chip *chip, struct device_node *np)
> +{
> +	int ret;
> +	unsigned int val;
> +
> +	switch (chip->type) {
> +	case CHIP_PM800:
> +	case CHIP_PM805:
> +		break;

It may be useful for future generations to put short notice here why
there is no init for these devices? I saw the explanation in commit
message but still someone in the future may look at the code and wonder
why only 88PM860 is initialized and the others are not?

Best regards,
Krzysztof

> +	case CHIP_PM860:
> +		/* Enable LDO and BUCK clock gating in low power mode */
> +		ret = regmap_update_bits(chip->regmap, PM800_LOW_POWER_CONFIG3,
> +					PM800_LDOBK_FREEZE, PM800_LDOBK_FREEZE);
> +		if (ret)
> +			goto error;
> +
> +		/* Enable voltage change in pmic, POWER_HOLD = 1 */
> +		ret = regmap_update_bits(chip->regmap, PM800_WAKEUP1,
> +					PM800_PWR_HOLD_EN, PM800_PWR_HOLD_EN);
> +		if (ret)
> +			goto error;
> +
> +		/*
> +		 * Set buck2 and buck4 driver selection to be full.
> +		 * The default value is 0, for full drive support
> +		 * it should be set to 1.
> +		 * In A1 version it will be set to 1 by default.
> +		 * To be on safer side, set it explicitly
> +		 */
> +		ret = regmap_update_bits(chip->subchip->regmap_power,
> +					PM860_BUCK2_MISC2,
> +					PM860_BUCK2_FULL_DRV,
> +					PM860_BUCK2_FULL_DRV);
> +		if (ret)
> +			goto error;
> +
> +		ret = regmap_update_bits(chip->subchip->regmap_power,
> +					PM860_BUCK4_MISC2,
> +					PM860_BUCK4_FULL_DRV,
> +					PM860_BUCK4_FULL_DRV);
> +		if (ret)
> +			goto error;
> +
> +
> +		break;
> +	default:
> +		dev_err(chip->dev, "Unknown device type: %d\n", chip->type);
> +		break;
> +	}
> +
> +	return 0;
> +
> +error:
> +	dev_err(chip->dev, "failed to access registers\n");
> +	return ret;
> +}
> +
>  static int pm800_probe(struct i2c_client *client,
>  				 const struct i2c_device_id *id)
>  {
> @@ -585,6 +642,13 @@ static int pm800_probe(struct i2c_client *client,
>  	if (pdata->plat_config)
>  		pdata->plat_config(chip, pdata);
>  
> +	/* common register configurations , init time only */
> +	ret = pm800_init_config(chip, np);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to configure 88pm800 devices\n");
> +		goto err_device_init;
> +	}
> +
>  	return 0;
>  
>  err_device_init:
> diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
> index 2e25fb1..2ef62af 100644
> --- a/include/linux/mfd/88pm80x.h
> +++ b/include/linux/mfd/88pm80x.h
> @@ -74,6 +74,7 @@ enum {
>  
>  /* Wakeup Registers */
>  #define PM800_WAKEUP1			(0x0D)
> +#define PM800_PWR_HOLD_EN		BIT(7)
>  
>  #define PM800_WAKEUP2			(0x0E)
>  #define PM800_WAKEUP2_INV_INT		BIT(0)
> @@ -87,7 +88,10 @@ enum {
>  /* Referance and low power registers */
>  #define PM800_LOW_POWER1		(0x20)
>  #define PM800_LOW_POWER2		(0x21)
> +
>  #define PM800_LOW_POWER_CONFIG3		(0x22)
> +#define PM800_LDOBK_FREEZE		BIT(7)
> +
>  #define PM800_LOW_POWER_CONFIG4		(0x23)
>  
>  /* GPIO register */
> @@ -279,6 +283,15 @@ enum {
>  #define PM805_EARPHONE_SETTING		(0x29)
>  #define PM805_AUTO_SEQ_SETTING		(0x2A)
>  
> +
> +/* 88PM860 Registers */
> +
> +#define PM860_BUCK2_MISC2		(0x7C)
> +#define PM860_BUCK2_FULL_DRV		BIT(2)
> +
> +#define PM860_BUCK4_MISC2		(0x82)
> +#define PM860_BUCK4_FULL_DRV		BIT(2)
> +
>  struct pm80x_rtc_pdata {
>  	int		vrtc;
>  	int		rtc_wakeup;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
