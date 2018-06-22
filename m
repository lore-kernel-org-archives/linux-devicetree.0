Return-Path: <SRS0=/LiY=JI=linaro.org=bjorn.andersson@kernel.org>
Date: Fri, 22 Jun 2018 14:10:05 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/5] input: pm8941-pwrkey: Abstract register offsets and
 event code
Message-ID: <20180622211005.GI3402@tuxbook-pro>
References: <20180618143548.29900-1-vkoul@kernel.org>
 <20180618143548.29900-5-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180618143548.29900-5-vkoul@kernel.org>
To: Vinod Koul <vinod.koul@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon 18 Jun 07:35 PDT 2018, Vinod Koul wrote:
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
[..]
>  struct pm8941_pwrkey {
>  	struct device *dev;
> @@ -52,6 +57,9 @@ struct pm8941_pwrkey {
>  
>  	unsigned int revision;
>  	struct notifier_block reboot_notifier;
> +
> +	unsigned int code;

pwrkey->code is passed into of_property_read_u32(), so make it u32 here
instead.

> +	const struct pm8941_data *data;
>  };
>  
[..]
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

I agree with Dmitry's comment here.

The order of these operations are not significant, so you can easily
move this into above "fallback" and read "reg" from the dev itself in
and else block.

> +		/* check if parent has reg before bailing */
> +		error = of_property_read_u32(pdev->dev.parent->of_node,
> +					     "reg", &pwrkey->baseaddr);
> +		if (error)
> +			return error;
> +	}

Apart from this the patch looks good.

Regards,
Bjorn
