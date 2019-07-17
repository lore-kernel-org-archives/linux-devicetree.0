From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 05/26] leds: core: Add support for composing LED class
 device names
Date: Wed, 17 Jul 2019 23:03:01 +0200
Message-ID: <1cc95085-2465-9f01-094b-c4233cd665c1@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-6-jacek.anaszewski@gmail.com>
 <20190703220043.GA876@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703220043.GA876@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On 7/4/19 12:00 AM, Pavel Machek wrote:
> Hi!
> 
> Sorry for the delay.

No problem.

>> @@ -27,6 +29,18 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>>  LIST_HEAD(leds_list);
>>  EXPORT_SYMBOL_GPL(leds_list);
>>  
>> +const char *led_colors[LED_COLOR_ID_MAX] = {
> 
> const char * const , if we want to play that game?

Ack.

>> +	[LED_COLOR_ID_WHITE] = "white",
>> +	[LED_COLOR_ID_RED] = "red",
>> +	[LED_COLOR_ID_GREEN] = "green",
>> +	[LED_COLOR_ID_BLUE] = "blue",
>> +	[LED_COLOR_ID_AMBER] = "amber",
>> +	[LED_COLOR_ID_VIOLET] = "violet",
>> +	[LED_COLOR_ID_YELLOW] = "yellow",
>> +	[LED_COLOR_ID_IR] = "ir",
>> +};
>> +EXPORT_SYMBOL_GPL(led_colors);
>> +
> 
>> +	if (fwnode_property_present(fwnode, "label")) {
>> +		ret = fwnode_property_read_string(fwnode, "label", &props->label);
>> +		if (ret)
>> +			dev_err(dev, "Error parsing \'label\' property (%d)\n", ret);
>> +		return;
> 
> I don't think you need to escape ' with \.

Right.

>> +	if (fwnode_property_present(fwnode, "function")) {
>> +		ret = fwnode_property_read_string(fwnode, "function", &props->function);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"Error parsing \'function\' property (%d)\n",
>> +				ret);
>> +		}
>> +	} else {
>> +		return;
>> +	}
> 
>> +
>> +	if (fwnode_property_present(fwnode, "function-enumerator")) {
> 
> I'd do if (!fwnode_property_present()) return; in both occasions, to
> save an indentation level; but that's nitpicking.

Ack.

>> +	if (props.label) {
>> +		/*
>> +		 * If init_data.devicename is NULL, then it indicates that
>> +		 * DT label should be used as-is for LED class device name.
>> +		 * Otherwise the label is prepended with devicename to compose
>> +		 * the final LED class device name.
>> +		 */
>> +		if (!devicename) {
>> +			strncpy(led_classdev_name, props.label,
>> +				LED_MAX_NAME_SIZE);
>> +		} else {
>> +			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
>> +				 devicename, props.label);
>> +		}
> 
> Unlike snprintf(), strncpy() does not guarantee NULL termination.

Indeed. I'll change strncpy to strscpy.

> I did not check the shell script.
> 
> With that fixed,
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks!

-- 
Best regards,
Jacek Anaszewski
