From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/5] extcon: gpio: Convert the driver to use gpio desc API's
Date: Mon, 22 Sep 2014 17:07:41 +0900
Message-ID: <541FD8CD.1060400@samsung.com>
References: <1410236078-11713-1-git-send-email-george.cherian@ti.com>
 <1410236078-11713-3-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1410236078-11713-3-git-send-email-george.cherian-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rongjun.ying-kQvG35nSl+M@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi George,

This patch removes 'gpio_active_low' field of struct gpio_extcon_data.
But, include/linux/extcon-gpio.h has the description of 'gpio_active_low' field.

Also,
This patch has not included the any description/comment of removing 'gpio_active_low'.

Also,
How to set 'FLAG_ACTIVE_LOW' bit for gpio when using platform data?
This patch don't call 'set_bit()' function to set FLAG_ACTIVE_LOW flag.

Thanks,
Chanwoo Choi

On 09/09/2014 01:14 PM, George Cherian wrote:
> Convert the driver to use gpiod_* API's.
> 
> Signed-off-by: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/extcon/extcon-gpio.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index 72f19a3..25269f6 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -33,8 +33,7 @@
>  
>  struct gpio_extcon_data {
>  	struct extcon_dev *edev;
> -	unsigned gpio;
> -	bool gpio_active_low;
> +	struct gpio_desc *gpiod;
>  	const char *state_on;
>  	const char *state_off;
>  	int irq;
> @@ -50,9 +49,7 @@ static void gpio_extcon_work(struct work_struct *work)
>  		container_of(to_delayed_work(work), struct gpio_extcon_data,
>  			     work);
>  
> -	state = gpio_get_value(data->gpio);
> -	if (data->gpio_active_low)
> -		state = !state;
> +	state = gpiod_get_value(data->gpiod);
>  	extcon_set_state(data->edev, state);
>  }
>  
> @@ -106,22 +103,21 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  	}
>  	extcon_data->edev->name = pdata->name;
>  
> -	extcon_data->gpio = pdata->gpio;
> -	extcon_data->gpio_active_low = pdata->gpio_active_low;
> +	extcon_data->gpiod = gpio_to_desc(pdata->gpio);
>  	extcon_data->state_on = pdata->state_on;
>  	extcon_data->state_off = pdata->state_off;
>  	extcon_data->check_on_resume = pdata->check_on_resume;
>  	if (pdata->state_on && pdata->state_off)
>  		extcon_data->edev->print_state = extcon_gpio_print_state;
>  
> -	ret = devm_gpio_request_one(&pdev->dev, extcon_data->gpio, GPIOF_DIR_IN,
> +	ret = devm_gpio_request_one(&pdev->dev, pdata->gpio, GPIOF_DIR_IN,
>  				    pdev->name);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (pdata->debounce) {
> -		ret = gpio_set_debounce(extcon_data->gpio,
> -					pdata->debounce * 1000);
> +		ret = gpiod_set_debounce(extcon_data->gpiod,
> +					 pdata->debounce * 1000);
>  		if (ret < 0)
>  			extcon_data->debounce_jiffies =
>  				msecs_to_jiffies(pdata->debounce);
> @@ -133,7 +129,7 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  
>  	INIT_DELAYED_WORK(&extcon_data->work, gpio_extcon_work);
>  
> -	extcon_data->irq = gpio_to_irq(extcon_data->gpio);
> +	extcon_data->irq = gpiod_to_irq(extcon_data->gpiod);
>  	if (extcon_data->irq < 0)
>  		return extcon_data->irq;
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
