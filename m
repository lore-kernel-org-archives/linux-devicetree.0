From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 4/7] extcon: arizona: Convert to gpiod
Date: Thu, 25 Jun 2015 09:13:31 +0900
Message-ID: <558B47AB.8050800@samsung.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1434731014-19980-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1434731014-19980-5-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Applied it.

Thanks,
Chanwoo Choi

On 06/20/2015 01:23 AM, Charles Keepax wrote:
> Convert to using the newer gpiod interface for the micd_pol_gpio.
> Although we still carry support for the old gpio interface from pdata.
> 
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/extcon/extcon-arizona.c |   41 ++++++++++++++++++++++++++++++++++----
>  1 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index b364b8b..8f0ef72 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -20,6 +20,7 @@
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
>  #include <linux/err.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
> @@ -95,6 +96,8 @@ struct arizona_extcon_info {
>  	int hpdet_ip_version;
>  
>  	struct extcon_dev *edev;
> +
> +	struct gpio_desc *micd_pol_gpio;
>  };
>  
>  static const struct arizona_micd_config micd_default_modes[] = {
> @@ -205,6 +208,10 @@ static void arizona_extcon_set_mode(struct arizona_extcon_info *info, int mode)
>  	if (arizona->pdata.micd_pol_gpio > 0)
>  		gpio_set_value_cansleep(arizona->pdata.micd_pol_gpio,
>  					info->micd_modes[mode].gpio);
> +	else
> +		gpiod_set_value_cansleep(info->micd_pol_gpio,
> +					 info->micd_modes[mode].gpio);
> +
>  	regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
>  			   ARIZONA_MICD_BIAS_SRC_MASK,
>  			   info->micd_modes[mode].bias <<
> @@ -1258,6 +1265,27 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>  				arizona->pdata.micd_pol_gpio, ret);
>  			goto err_register;
>  		}
> +	} else {
> +		if (info->micd_modes[0].gpio)
> +			mode = GPIOD_OUT_HIGH;
> +		else
> +			mode = GPIOD_OUT_LOW;
> +
> +		/* We can't use devm here because we need to do the get
> +		 * against the MFD device, as that is where the of_node
> +		 * will reside, but if we devm against that the GPIO
> +		 * will not be freed if the extcon driver is unloaded.
> +		 */
> +		info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
> +							 "wlf,micd-pol",
> +							 GPIOD_OUT_LOW);
> +		if (IS_ERR(info->micd_pol_gpio)) {
> +			ret = PTR_ERR(info->micd_pol_gpio);
> +			dev_err(arizona->dev,
> +				"Failed to get microphone polarity GPIO: %d\n",
> +				ret);
> +			goto err_register;
> +		}
>  	}
>  
>  	if (arizona->pdata.hpdet_id_gpio > 0) {
> @@ -1268,7 +1296,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>  		if (ret != 0) {
>  			dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
>  				arizona->pdata.hpdet_id_gpio, ret);
> -			goto err_register;
> +			goto err_gpio;
>  		}
>  	}
>  
> @@ -1320,7 +1348,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>  				dev_err(arizona->dev,
>  					"MICD ranges must be sorted\n");
>  				ret = -EINVAL;
> -				goto err_input;
> +				goto err_gpio;
>  			}
>  		}
>  	}
> @@ -1339,7 +1367,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>  			dev_err(arizona->dev, "Unsupported MICD level %d\n",
>  				info->micd_ranges[i].max);
>  			ret = -EINVAL;
> -			goto err_input;
> +			goto err_gpio;
>  		}
>  
>  		dev_dbg(arizona->dev, "%d ohms for MICD threshold %d\n",
> @@ -1412,7 +1440,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>  	if (ret != 0) {
>  		dev_err(&pdev->dev, "Failed to get JACKDET rise IRQ: %d\n",
>  			ret);
> -		goto err_input;
> +		goto err_gpio;
>  	}
>  
>  	ret = arizona_set_irq_wake(arizona, jack_irq_rise, 1);
> @@ -1483,7 +1511,8 @@ err_rise_wake:
>  	arizona_set_irq_wake(arizona, jack_irq_rise, 0);
>  err_rise:
>  	arizona_free_irq(arizona, jack_irq_rise, info);
> -err_input:
> +err_gpio:
> +	gpiod_put(info->micd_pol_gpio);
>  err_register:
>  	pm_runtime_disable(&pdev->dev);
>  	return ret;
> @@ -1495,6 +1524,8 @@ static int arizona_extcon_remove(struct platform_device *pdev)
>  	struct arizona *arizona = info->arizona;
>  	int jack_irq_rise, jack_irq_fall;
>  
> +	gpiod_put(info->micd_pol_gpio);
> +
>  	pm_runtime_disable(&pdev->dev);
>  
>  	regmap_update_bits(arizona->regmap,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
