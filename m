From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2] watchdog: GPIO-controlled watchdog
Date: Wed, 27 Nov 2013 04:22:54 -0800
Message-ID: <5295E41E.1040207@roeck-us.net>
References: <1385483188-12221-1-git-send-email-shc_work@mail.ru> <5294E05A.3040104@roeck-us.net> <1385537694.255779958@f424.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385537694.255779958-rnejLrYIlYtsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/26/2013 11:34 PM, Alexander Shiyan wrote:
> Hello.
>
>> On 11/26/2013 08:26 AM, Alexander Shiyan wrote:
>>> This patch adds a watchdog driver for devices controlled through GPIO,
>>> (Analog Devices ADM706, IC 555 etc).
>>>
>>> Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> ...
>>> +++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>>> @@ -0,0 +1,23 @@
>>> +* GPIO-controlled Watchdog
>>> +
>>> +Required Properties:
>>> +- compatible: Should contain "linux,wdt-gpio".
>>
>> Should ?
>>
>>> +- gpios: From common gpio binding; gpio connection to WDT reset pin.
>>> +- wdt-gpio,hw_algo: The algorithm used by the driver. Should be one
>>> +  of the following values:
>>
>> Should ?
>
> What wrong here?
>
> ...
>>> +Example:
>>> +	watchdog: watchdog {
>>> +		/* ADM706 */
>>> +		compatible = "linux,wdt-gpio";
>>
>> Oddly enough, the bindings could be used by non-Linux operating systems,
>> but who am I to argue. Fine if this is what the DT maintainers want to see.
>
> On my opinion this mean that this is not a real hardware, but hardware emulation,
> like some other driver does.
>
> ...
>>> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
>>> new file mode 100644
>>> index 0000000..c7166be
>>> --- /dev/null
>>> +++ b/drivers/watchdog/gpio_wdt.c
>>> @@ -0,0 +1,246 @@
>>> +/*
>>> + * Driver for watchdog device controlled through GPIO-line
>>> + *
>>> + * Author: 2013, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + */
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/module.h>
>>> +#include <linux/notifier.h>
>>> +#include <linux/of_gpio.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/reboot.h>
>>> +#include <linux/watchdog.h>
>>> +
>>> +#define SOFT_TIMEOUT_MIN	1
>>> +#define SOFT_TIMEOUT_DEF	60
>>> +#define SOFT_TIMEOUT_MAX	0xffff
>>> +
>>> +enum {
>>> +	HW_ALGO_TOGGLE,
>>> +	HW_ALGO_LEVEL,
>>> +};
>>> +
>>> +struct gpio_wdt_priv {
>>> +	int			gpio;
>>> +	bool			active_low;
>>> +	bool			state;
>>> +	unsigned int		hw_algo;
>>> +	unsigned int		hw_margin;
>>> +	unsigned long		last_jiffies;
>>> +	struct notifier_block	notifier;
>>> +	struct timer_list	timer;
>>> +	struct watchdog_device	wdd;
>>> +};
>>> +
>>> +static int gpio_wdt_disable(struct gpio_wdt_priv *priv)
>>> +{
>>> +	gpio_set_value_cansleep(priv->gpio, !priv->active_low);
>>> +
>>> +	/* Put GPIO back to tristate */
>>> +	if (priv->hw_algo == HW_ALGO_TOGGLE)
>>> +		return gpio_direction_input(priv->gpio);
>>> +
>> No disable for 'level' watchdogs ? Shouldn't it be set to the opposite
>> of priv->state ?
>>
>>> +	return 0;
>>
>> Since this is an internal function which never returns anything but 0,
>> you might as well make it void.
>
> "level" version will be disabled by
> "gpio_set_value_cansleep(priv->gpio, !priv->active_low);" line above.

Ok.

> "return" is used by "tristate" switch.
>

Just to return 0. That isn't really necessary. The caller could just return 0 by itself.

> ...
>>> +static void gpio_wdt_hwping(unsigned long data)
>>> +{
>>> +	struct watchdog_device *wdd = (struct watchdog_device *)data;
>>> +	struct gpio_wdt_priv *priv = watchdog_get_drvdata(wdd);
>>> +
>>> +	if (time_before(jiffies, priv->last_jiffies +
>>> +			msecs_to_jiffies(wdd->timeout * 1000))) {
>>> +		/* Restart timer */
>>> +		mod_timer(&priv->timer, jiffies + priv->hw_margin);
>>> +
>>> +		switch (priv->hw_algo) {
>>> +		case HW_ALGO_TOGGLE:
>>> +			/* Toggle output pin */
>>> +			priv->state = !priv->state;
>>> +			gpio_set_value_cansleep(priv->gpio, priv->state);
>>> +			break;
>>> +		case HW_ALGO_LEVEL:
>>> +			/* Pulse */
>>> +			gpio_set_value_cansleep(priv->gpio, !priv->active_low);
>>> +			udelay(1);
>>
>> Pretty arbitrary toggle time. Should this be a property ?
>
> What about 1/10 of hardware timeout?
>
Even worse, as it is an active wait and not sleep.

Not mandatory from my perspective, though; guess the property can be added later
if/when needed.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
