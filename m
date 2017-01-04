From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpio: pca953x: Add optional reset gpio control
Date: Wed, 4 Jan 2017 12:25:33 +0200
Message-ID: <e043cb00-9b8e-edec-0949-b23fbed6e2c5@mentor.com>
References: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
 <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483391271-17304-2-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Steve,

On 01/02/2017 11:07 PM, Steve Longerbeam wrote:
> Add optional reset-gpios pin control. If present, de-assert the
> specified reset gpio pin to bring the chip out of reset.
> 
> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |  4 ++++
>  drivers/gpio/gpio-pca953x.c                             | 11 +++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index 08dd15f..da54f4c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -29,6 +29,10 @@ Required properties:
>  	onsemi,pca9654
>  	exar,xra1202
>  
> +Optional properties:
> + - reset-gpios: GPIO specification for the RESET input
> +
> +

Drop the surplus empty line above.

>  Example:
>  
>  
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index d5d72d8..ca2ddea 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -22,6 +22,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/acpi.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/gpio/consumer.h>
>  
>  #define PCA953X_INPUT		0
>  #define PCA953X_OUTPUT		1
> @@ -754,8 +755,18 @@ static int pca953x_probe(struct i2c_client *client,
>  		invert = pdata->invert;
>  		chip->names = pdata->names;
>  	} else {
> +		struct gpio_desc *reset_gpio;
> +
>  		chip->gpio_start = -1;
>  		irq_base = 0;
> +
> +		/* see if we need to de-assert a reset pin */
> +		reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_LOW);
> +		if (IS_ERR(reset_gpio)) {
> +			dev_err(&client->dev, "request for reset pin failed\n");

I'm not confident that the error message is wanted here, you may consider either
to remove it or at least print it out if (PTR_ERR(reset_gpio) != -EPROBE_DEFER).

> +			return PTR_ERR(reset_gpio);
> +		}
>  	}
>  
>  	chip->client = client;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
