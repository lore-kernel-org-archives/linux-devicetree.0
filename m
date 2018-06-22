Return-Path: <SRS0=l8JL=JI=gmail.com=dmitry.torokhov@kernel.org>
Date: Fri, 22 Jun 2018 11:52:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 4/5] input: pm8941-pwrkey: Abstract register offsets and
 event code
Message-ID: <20180622185236.GD92912@dtor-ws>
References: <20180618143548.29900-1-vkoul@kernel.org>
 <20180618143548.29900-5-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180618143548.29900-5-vkoul@kernel.org>
To: Vinod Koul <vinod.koul@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 18, 2018 at 08:05:47PM +0530, Vinod Koul wrote:
> In order to support resin thru the pwrkey driver (they are very
> similar in nature) we need to abstract the handling in this driver.
> 
> First we abstract pull_up_bit and status_bit along in driver data.
> The event code sent for key events is quiried from DT.
> 
> Since the device can be child of pon lookup regmap and reg from
> parent if lookup fails (we are child).
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/input/misc/pm8941-pwrkey.c | 56 +++++++++++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> index 18ad956454f1..aedb6ea2b50a 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
> @@ -20,6 +20,7 @@
>  #include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
> @@ -42,6 +43,10 @@
>  #define PON_DBC_CTL			0x71
>  #define  PON_DBC_DELAY_MASK		0x7
>  
> +struct pm8941_data {
> +	unsigned int pull_up_bit;
> +	unsigned int status_bit;
> +};
>  
>  struct pm8941_pwrkey {
>  	struct device *dev;
> @@ -52,6 +57,9 @@ struct pm8941_pwrkey {
>  
>  	unsigned int revision;
>  	struct notifier_block reboot_notifier;
> +
> +	unsigned int code;
> +	const struct pm8941_data *data;
>  };
>  
>  static int pm8941_reboot_notify(struct notifier_block *nb,
> @@ -124,7 +132,8 @@ static irqreturn_t pm8941_pwrkey_irq(int irq, void *_data)
>  	if (error)
>  		return IRQ_HANDLED;
>  
> -	input_report_key(pwrkey->input, KEY_POWER, !!(sts & PON_KPDPWR_N_SET));
> +	input_report_key(pwrkey->input, pwrkey->code,
> +			 !!(sts & pwrkey->data->status_bit));

Since we are changing this: input core will normalize the value for you,
no need for doing double negation here.

>  	input_sync(pwrkey->input);
>  
>  	return IRQ_HANDLED;
> @@ -157,6 +166,7 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>  {
>  	struct pm8941_pwrkey *pwrkey;
>  	bool pull_up;
> +	struct device *parent;
>  	u32 req_delay;
>  	int error;
>  
> @@ -175,11 +185,20 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	pwrkey->dev = &pdev->dev;
> +	pwrkey->data = of_device_get_match_data(&pdev->dev);
>  
> -	pwrkey->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	parent = pdev->dev.parent;
> +	pwrkey->regmap = dev_get_regmap(parent, NULL);
>  	if (!pwrkey->regmap) {
> -		dev_err(&pdev->dev, "failed to locate regmap\n");
> -		return -ENODEV;
> +		/*
> +		 * we failed to get regmap for parent, check if
> +		 * parent->parent has it (device would be child of pon)
> +		 */
> +		pwrkey->regmap = dev_get_regmap(parent->parent, NULL);
> +		if (!pwrkey->regmap) {
> +			dev_err(&pdev->dev, "failed to locate regmap\n");
> +			return -ENODEV;
> +		}
>  	}
>  
>  	pwrkey->irq = platform_get_irq(pdev, 0);
> @@ -190,8 +209,13 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>  
>  	error = of_property_read_u32(pdev->dev.of_node, "reg",
>  				     &pwrkey->baseaddr);
> -	if (error)
> -		return error;
> +	if (error) {
> +		/* check if parent has reg before bailing */
> +		error = of_property_read_u32(pdev->dev.parent->of_node,
> +					     "reg", &pwrkey->baseaddr);
> +		if (error)
> +			return error;

I do not want us blindly look up into parent for individual properties.
We need to decide early on if we are dealing with subnode or older
binding and stick to it.

> +	}
>  
>  	error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_REV2,
>  			    &pwrkey->revision);
> @@ -200,13 +224,20 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>  		return error;
>  	}
>  
> +	error = of_property_read_u32(pdev->dev.of_node, "linux,code",
> +				     &pwrkey->code);
> +	if (error) {
> +		dev_err(&pdev->dev, "no linux,code assuming power%d\n", error);

This is not an error. dev_dbg or dev_info at most.

> +		pwrkey->code = KEY_POWER;
> +	}
> +
>  	pwrkey->input = devm_input_allocate_device(&pdev->dev);
>  	if (!pwrkey->input) {
>  		dev_dbg(&pdev->dev, "unable to allocate input device\n");
>  		return -ENOMEM;
>  	}
>  
> -	input_set_capability(pwrkey->input, EV_KEY, KEY_POWER);
> +	input_set_capability(pwrkey->input, EV_KEY, pwrkey->code);
>  
>  	pwrkey->input->name = "pm8941_pwrkey";
>  	pwrkey->input->phys = "pm8941_pwrkey/input0";
> @@ -225,8 +256,8 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>  
>  	error = regmap_update_bits(pwrkey->regmap,
>  				   pwrkey->baseaddr + PON_PULL_CTL,
> -				   PON_KPDPWR_PULL_UP,
> -				   pull_up ? PON_KPDPWR_PULL_UP : 0);
> +				   pwrkey->data->pull_up_bit,
> +				   pull_up ? pwrkey->data->pull_up_bit : 0);
>  	if (error) {
>  		dev_err(&pdev->dev, "failed to set pull: %d\n", error);
>  		return error;
> @@ -271,8 +302,13 @@ static int pm8941_pwrkey_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct pm8941_data pwrkey_data = {
> +	.pull_up_bit = PON_KPDPWR_PULL_UP,
> +	.status_bit = PON_KPDPWR_N_SET,
> +};
> +
>  static const struct of_device_id pm8941_pwr_key_id_table[] = {
> -	{ .compatible = "qcom,pm8941-pwrkey" },
> +	{ .compatible = "qcom,pm8941-pwrkey", .data = &pwrkey_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pm8941_pwr_key_id_table);
> -- 
> 2.14.4
> 

Thanks.

-- 
Dmitry
