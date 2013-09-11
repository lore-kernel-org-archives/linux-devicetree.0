From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/6] extcon-gpio: Add support for active-low presence
 detect pins
Date: Wed, 11 Sep 2013 11:14:36 +0900
Message-ID: <522FD20C.6080404@samsung.com>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
 <1377836978-24082-4-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1377836978-24082-4-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On 08/30/2013 01:29 PM, Guenter Roeck wrote:
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/extcon/extcon-gpio.c       |    4 +++-
>  include/linux/extcon/extcon-gpio.h |    1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index 973600e..d4e3c89 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -34,6 +34,7 @@
>  struct gpio_extcon_data {
>  	struct extcon_dev edev;
>  	unsigned gpio;
> +	bool gpio_active_low;
>  	const char *state_on;
>  	const char *state_off;
>  	int irq;
> @@ -48,7 +49,7 @@ static void gpio_extcon_work(struct work_struct *work)
>  		container_of(to_delayed_work(work), struct gpio_extcon_data,
>  			     work);
>  
> -	state = gpio_get_value(data->gpio);
> +	state = gpio_get_value(data->gpio) ^ data->gpio_active_low;

I prefer below modified code instead of exclusive keyword(^) to improve readability.

       state = gpio_get_value(data->gpio);
       if (data->gpio_active_low)
               state = !state;

>  	extcon_set_state(&data->edev, state);
>  }
>  
> @@ -96,6 +97,7 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  
>  	extcon_data->edev.name = pdata->name;
>  	extcon_data->gpio = pdata->gpio;
> +	extcon_data->gpio_active_low = pdata->gpio_active_low;
>  	extcon_data->state_on = pdata->state_on;
>  	extcon_data->state_off = pdata->state_off;
>  	if (pdata->state_on && pdata->state_off)
> diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extcon/extcon-gpio.h
> index 2d8307f..1613899 100644
> --- a/include/linux/extcon/extcon-gpio.h
> +++ b/include/linux/extcon/extcon-gpio.h
> @@ -41,6 +41,7 @@
>  struct gpio_extcon_platform_data {
>  	const char *name;
>  	unsigned gpio;
> +	bool gpio_active_low;

You have to add description of gpio_active_low as folloiwng patch:

diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extcon/extcon-gpio.h
index 7a2f27b..ff0bfcb 100644
--- a/include/linux/extcon/extcon-gpio.h
+++ b/include/linux/extcon/extcon-gpio.h
@@ -27,6 +27,9 @@
  * struct gpio_extcon_platform_data - A simple GPIO-controlled extcon device.
  * @name:              The name of this GPIO extcon device.
  * @gpio:              Corresponding GPIO.
+ * @gpio_active_low:   Boolean which is whether gpio active state is 1 or 0
+ *                     If true, low state of gpio means active.
+ *                     If false, high state of gpio means active.
  * @debounce:          Debounce time for GPIO IRQ in ms.
  * @irq_flags:         IRQ Flags (e.g., IRQF_TRIGGER_LOW).
  * @state_on:          print_state is overriden with state_on if attached.

Thanks,
Chanwoo Choi
