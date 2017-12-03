From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v2,2/3] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Date: Sun, 3 Dec 2017 10:58:34 -0800
Message-ID: <20171203185834.GA6772@roeck-us.net>
References: <20171102035349.1902-3-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171102035349.1902-3-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 02, 2017 at 02:53:48PM +1100, Joel wrote:
> The ASPEED SoC must deassert a reset in order to use the PWM/tach
> peripheral.
> 
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

I have not heard from anyone objecting to this change, so I am going to
accept it. See below for a list of changes required to get there.

> ---
> v2:
>  - Correct horrible mistakes
>  - Boot tested and hwmon sysfs files checked
> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 63a95e23ca81..77bb7a4bbed4 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -19,6 +19,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/reset.h>
>  #include <linux/sysfs.h>
>  #include <linux/thermal.h>
>  
> @@ -181,6 +182,7 @@ struct aspeed_cooling_device {
>  
>  struct aspeed_pwm_tacho_data {
>  	struct regmap *regmap;
> +	struct reset_control *rst;
>  	unsigned long clk_freq;
>  	bool pwm_present[8];
>  	bool fan_tach_present[16];
> @@ -931,6 +933,15 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  			&aspeed_pwm_tacho_regmap_config);
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
> +
> +	priv->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->rst)) {
> +		dev_err(dev,
> +			"missing or invalid reset controller device tree entry");
> +		return PTR_ERR(priv->rst);
> +	}
> +	reset_control_deassert(priv->rst);
> +
>  	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE, 0);
>  	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE_EXT, 0);
>  
> @@ -960,6 +971,15 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(hwmon);
>  }
>  
> +static int aspeed_pwm_tacho_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_pwm_tacho_data *priv = platform_get_drvdata(pdev);
> +
> +	reset_control_assert(priv->rst);

This asserts reset before the hwmon device is removed. Please use
devm_add_action_or_reset() after reset_control_deassert() to avoid
this problem.

> +
> +	return 0;
> +}
> +
>  static const struct of_device_id of_pwm_tacho_match_table[] = {
>  	{ .compatible = "aspeed,ast2400-pwm-tacho", },
>  	{ .compatible = "aspeed,ast2500-pwm-tacho", },
> @@ -969,6 +989,7 @@ MODULE_DEVICE_TABLE(of, of_pwm_tacho_match_table);
>  
>  static struct platform_driver aspeed_pwm_tacho_driver = {
>  	.probe		= aspeed_pwm_tacho_probe,
> +	.remove 	= aspeed_pwm_tacho_remove,

... and by doing that you won't need the remove function, and you don't
have to fix the checkpatch error here.

>  	.driver		= {
>  		.name	= "aspeed_pwm_tacho",
>  		.of_match_table = of_pwm_tacho_match_table,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
