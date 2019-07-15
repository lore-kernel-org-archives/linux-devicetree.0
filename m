From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] leds: Add control of the voltage/current regulator
 to the LED core
Date: Mon, 15 Jul 2019 13:59:27 -0500
Message-ID: <9c17e9cc-8162-7b5d-2db9-d2bed20969c5@ti.com>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-3-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715155657.22976-3-jjhiblot@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

JJ

On 7/15/19 10:56 AM, Jean-Jacques Hiblot wrote:
> A LED is usually powered by a voltage/current regulator. Let the LED core
> know about it. This allows the LED core to turn on or off the power supply
> as needed.

This allows the LED core to turn on or off managed power supplies.


>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   drivers/leds/led-class.c | 15 ++++++++++++
>   drivers/leds/led-core.c  | 50 +++++++++++++++++++++++++++++++++++++---
>   drivers/leds/leds.h      |  1 +
>   include/linux/leds.h     |  4 ++++
>   4 files changed, 67 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 4793e77808e2..cadd43c30d50 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -253,6 +253,7 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
>   {
>   	char name[LED_MAX_NAME_SIZE];
>   	int ret;
> +	struct regulator *regulator;
>   
>   	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
>   	if (ret < 0)
> @@ -272,6 +273,20 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
>   		dev_warn(parent, "Led %s renamed to %s due to name collision",
>   				led_cdev->name, dev_name(led_cdev->dev));
>   
> +	regulator = devm_regulator_get_optional(led_cdev->dev, "power");
Store the regulator in  led_cdev->regulator and drop the else case below.
> +	if (IS_ERR(regulator)) {
> +		if (PTR_ERR(regulator) != -ENODEV) {
> +			dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
> +				led_cdev->name);
> +			device_unregister(led_cdev->dev);
> +			mutex_unlock(&led_cdev->led_access);
> +			return PTR_ERR(regulator);
> +		}
> +		led_cdev->regulator = NULL;
> +	} else {
> +		led_cdev->regulator = regulator;
> +	}
> +
>   	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>   		ret = led_add_brightness_hw_changed(led_cdev);
>   		if (ret) {
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 7107cd7e87cf..a12b880b0a2f 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -23,6 +23,33 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>   LIST_HEAD(leds_list);
>   EXPORT_SYMBOL_GPL(leds_list);
>   
> +static bool __led_need_regulator_update(struct led_classdev *led_cdev,
> +					int brightness)
> +{
> +	bool new_state = (brightness != LED_OFF);
> +
> +	return led_cdev->regulator && led_cdev->regulator_state != new_state;
> +}
> +
> +static int __led_handle_regulator(struct led_classdev *led_cdev,
> +				int brightness)
> +{
> +	int rc;

Should there be a check for the regulator pointer.

If (!led_cdev->regulator)

     return 0;


Otherwise

Reviewed-by: Dan Murphy <dmurphy@ti.com>

<snip>
