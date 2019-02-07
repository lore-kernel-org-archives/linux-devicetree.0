From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V2 2/2] hwmon: pwm-fan: Add optional regulator support
Date: Thu, 7 Feb 2019 10:18:26 -0800
Message-ID: <20190207181826.GA27492@roeck-us.net>
References: <1549557480-14436-1-git-send-email-stefan.wahren@i2se.com>
 <1549557480-14436-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549557480-14436-3-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 07, 2019 at 05:38:00PM +0100, Stefan Wahren wrote:
> This adds optional regulator support to the pwm-fan driver. This is
> necessary for pwm fans which are powered by a switchable supply.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/hwmon/pwm-fan.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 2c94482..344915c 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -23,6 +23,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwm.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sysfs.h>
>  #include <linux/thermal.h>
>  
> @@ -31,6 +32,7 @@
>  struct pwm_fan_ctx {
>  	struct mutex lock;
>  	struct pwm_device *pwm;
> +	struct regulator *reg_en;
>  	unsigned int pwm_value;
>  	unsigned int pwm_fan_state;
>  	unsigned int pwm_fan_max_state;
> @@ -231,6 +233,21 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, ctx);
>  
> +	ctx->reg_en = devm_regulator_get_optional(&pdev->dev, "fan");
> +	if (IS_ERR(ctx->reg_en)) {
> +		if (PTR_ERR(ctx->reg_en) == -ENODEV)
> +			ctx->reg_en = NULL;
> +		else
> +			return PTR_ERR(ctx->reg_en);

		if PTR_ERR(ctx->reg_en) != -ENODEV)
			return PTR_ERR(ctx->reg_en);
		ctx->reg_en = NULL;

would be a bit easier to read and avoid an else.

> +	} else {
> +		ret = regulator_enable(ctx->reg_en);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"Failed to enable fan supply: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	ctx->pwm_value = MAX_PWM;
>  
>  	/* Set duty cycle to maximum allowed and enable PWM output */
> @@ -241,7 +258,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	ret = pwm_apply_state(ctx->pwm, &state);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to configure PWM\n");
> -		return ret;
> +		goto err_reg_disable;
>  	}
>  
>  	hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, "pwmfan",
> @@ -277,6 +294,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	state.enabled = false;
>  	pwm_apply_state(ctx->pwm, &state);
>  
> +err_reg_disable:
> +	if (ctx->reg_en)
> +		regulator_disable(ctx->reg_en);
> +
>  	return ret;
>  }
>  
> @@ -287,6 +308,10 @@ static int pwm_fan_remove(struct platform_device *pdev)
>  	thermal_cooling_device_unregister(ctx->cdev);
>  	if (ctx->pwm_value)
>  		pwm_disable(ctx->pwm);
> +
> +	if (ctx->reg_en)
> +		regulator_disable(ctx->reg_en);
> +
>  	return 0;
>  }
>  
> @@ -299,6 +324,12 @@ static int pwm_fan_suspend(struct device *dev)
>  
>  	pwm_get_args(ctx->pwm, &args);
>  
> +	if (ctx->reg_en) {
> +		ret = regulator_disable(ctx->reg_en);
> +		if (ret)
> +			dev_err(dev, "Failed to disable fan supply: %d\n", ret);

This is a bit weird. The error is returned to the caller, but only if
ctx->pwm_value is 0. Otherwise it is ignored. This warrants an explanation
(and some selling) if it is on purpose.

> +	}
> +
>  	if (ctx->pwm_value) {
>  		ret = pwm_config(ctx->pwm, 0, args.period);
>  		if (ret < 0)
> @@ -317,6 +348,12 @@ static int pwm_fan_resume(struct device *dev)
>  	unsigned long duty;
>  	int ret;
>  
> +	if (ctx->reg_en) {
> +		ret = regulator_enable(ctx->reg_en);
> +		if (ret)
> +			dev_err(dev, "Failed to enable fan supply: %d\n", ret);

Does it really make sense here to ignore this error ? After all,
the fan will likely not work if that error really happens. Doesn't
that count as resume failure ?

> +	}
> +
>  	if (ctx->pwm_value == 0)
>  		return 0;
>  
> -- 
> 2.7.4
> 
