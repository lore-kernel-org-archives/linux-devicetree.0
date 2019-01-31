From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] hwmon: pwm-fan: Add optional regulator support
Date: Thu, 31 Jan 2019 09:56:52 -0800
Message-ID: <20190131175651.GA16231@roeck-us.net>
References: <1548781631-5736-1-git-send-email-stefan.wahren@i2se.com>
 <1548781631-5736-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548781631-5736-2-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2019 at 06:07:11PM +0100, Stefan Wahren wrote:
> This adds optional regulator support to the pwm-fan driver. This is
> necessary for pwm fans which are powered by a switchable supply.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/hwmon/pwm-fan.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 2c94482..9e0591e 100644
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
> @@ -244,6 +246,23 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ctx->reg_en = devm_regulator_get_optional(&pdev->dev, "fan");
> +	if (!IS_ERR(ctx->reg_en)) {

It is customary to handle the error case first.

> +		ret = regulator_enable(ctx->reg_en);
> +		if (ret)
> +			dev_err(&pdev->dev,
> +				"Failed to enable fan supply: %d\n", ret);
> +	} else {
> +		switch (PTR_ERR(ctx->reg_en)) {
> +		case -ENODEV:
> +		case -ENOSYS:

Does devm_regulator_get_optional() ever return -ENOSYS ?
I glanced through other calls to devm_regulator_get_optional(),
but I don't see that check anywhere.

> +			ctx->reg_en = NULL;
> +			break;
> +		default:
> +			return PTR_ERR(ctx->reg_en);
> +		}

This is inconsistent. Provided regulators which fail to enable are
accepted, albeit with an error message, while unexpected errors from
devm_regulator_get_optional() result in a bailout. Please be consistent.

> +	}
> +
>  	hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, "pwmfan",
>  						       ctx, pwm_fan_groups);
>  	if (IS_ERR(hwmon)) {
> @@ -287,6 +306,10 @@ static int pwm_fan_remove(struct platform_device *pdev)
>  	thermal_cooling_device_unregister(ctx->cdev);
>  	if (ctx->pwm_value)
>  		pwm_disable(ctx->pwm);
> +
> +	if (ctx->reg_en)
> +		regulator_disable(ctx->reg_en);

As written, this is also called after regulator_enable() failed.
Same below.

> +
>  	return 0;
>  }
>  
> @@ -299,6 +322,12 @@ static int pwm_fan_suspend(struct device *dev)
>  
>  	pwm_get_args(ctx->pwm, &args);
>  
> +	if (ctx->reg_en) {
> +		ret = regulator_disable(ctx->reg_en);
> +		if (ret)
> +			dev_err(dev, "Failed to disable fan supply: %d\n", ret);
> +	}
> +
>  	if (ctx->pwm_value) {
>  		ret = pwm_config(ctx->pwm, 0, args.period);
>  		if (ret < 0)
> @@ -317,6 +346,12 @@ static int pwm_fan_resume(struct device *dev)
>  	unsigned long duty;
>  	int ret;
>  
> +	if (ctx->reg_en) {
> +		ret = regulator_enable(ctx->reg_en);
> +		if (ret)
> +			dev_err(dev, "Failed to enable fan supply: %d\n", ret);
> +	}
> +
>  	if (ctx->pwm_value == 0)
>  		return 0;
>  
