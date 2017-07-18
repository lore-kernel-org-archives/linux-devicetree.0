From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 2/4] gpio: davinci: Handle the return value of
 davinci_gpio_irq_setup function
Date: Tue, 18 Jul 2017 11:54:20 -0500
Message-ID: <fcf0b39c-2683-e88d-b619-8ff66707b099@ti.com>
References: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
 <1500375436-9435-3-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1500375436-9435-3-git-send-email-j-keerthy@ti.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>, linus.walleij@linaro.org, ssantosh@kernel.org
Cc: robh+dt@kernel.org, nsekhar@ti.com, fcooper@ti.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Keerthy,

On 07/18/2017 05:57 AM, Keerthy wrote:
> Currently davinci_gpio_irq_setup return value is ignored. Handle the
> return value appropriately.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  drivers/gpio/gpio-davinci.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 2c88054..932f270 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -233,15 +233,23 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  		chips->regs[bank] = gpio_base + offset_array[bank];
>  
>  	ret = devm_gpiochip_add_data(dev, &chips->chip, chips);
> +	if (ret)
> +		goto err;
> +
> +	platform_set_drvdata(pdev, chips);
> +	ret = davinci_gpio_irq_setup(pdev);
>  	if (ret) {
> -		ctrl_num = 0;
> -		bank_base = 0;
> -		return ret;
> +		platform_set_drvdata(pdev, NULL);

This is not needed, driver core will set this automatically if probe fails.

> +		goto err;
>  	}
>  
> -	platform_set_drvdata(pdev, chips);
> -	davinci_gpio_irq_setup(pdev);
>  	return 0;
> +
> +err:
> +	ctrl_num = 0;
> +	bank_base = 0;

Same comments as on Patch 1.

regards
Suman
