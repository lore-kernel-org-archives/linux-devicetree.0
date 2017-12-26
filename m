From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v3,2/2] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Date: Tue, 26 Dec 2017 09:24:44 -0800
Message-ID: <20171226172444.GA22827@roeck-us.net>
References: <20171223130528.5346-3-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171223130528.5346-3-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 23, 2017 at 11:35:28PM +1030, Joel wrote:
> The ASPEED SoC must deassert a reset in order to use the PWM/tach
> peripheral.
> 
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 63a95e23ca81..693a3d53cab5 100644
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
> @@ -905,6 +907,13 @@ static int aspeed_create_fan(struct device *dev,
>  	return 0;
>  }
>  
> +static void aspeed_pwm_tacho_remove(void *data)
> +{
> +	struct aspeed_pwm_tacho_data *priv = data;
> +
> +	reset_control_assert(priv->rst);
> +}
> +
>  static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -931,6 +940,19 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
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
> +	ret = devm_add_action_or_reset(dev, aspeed_pwm_tacho_remove, priv);
> +	if (ret)
> +		return ret;
> +
>  	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE, 0);
>  	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE_EXT, 0);
>  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
