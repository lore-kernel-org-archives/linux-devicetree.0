From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v3 2/3] leds: Add control of the voltage/current regulator
 to the LED core
Date: Thu, 18 Jul 2019 15:31:56 +0200
Message-ID: <49152281-059c-6006-4c0f-a6be96a12707@ti.com>
References: <20190717135948.19340-1-jjhiblot@ti.com>
 <20190717135948.19340-3-jjhiblot@ti.com>
 <4bd3b558-ea5b-0d2e-16b2-5b2e8bb484d2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4bd3b558-ea5b-0d2e-16b2-5b2e8bb484d2@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 18/07/2019 14:24, Jacek Anaszewski wrote:
> Hi Jean,
>
> Thank you for the updated patch set.
>
> I have some more comments below.
>
> On 7/17/19 3:59 PM, Jean-Jacques Hiblot wrote:
>>   
>> +static bool __led_need_regulator_update(struct led_classdev *led_cdev,
>> +					int brightness)
>> +{
>> +	bool new_state = (brightness != LED_OFF);
> How about:
>
> bool new_state = !!brightness;

Throughout the code LED_OFF is used when the LED is turned off. I think 
it would be more consistent to use it there too.

>
>> +
>> +	return led_cdev->regulator && led_cdev->regulator_state != new_state;
>> +}
>> +static int __led_handle_regulator(struct led_classdev *led_cdev,
>> +				int brightness)
>> +{
>> +	int rc;
>> +
>> +	if (__led_need_regulator_update(led_cdev, brightness)) {
>> +
>> +		if (brightness != LED_OFF)
>> +			rc = regulator_enable(led_cdev->regulator);
>> +		else
>> +			rc = regulator_disable(led_cdev->regulator);
>> +		if (rc)
>> +			return rc;
>> +
>> +		led_cdev->regulator_state = (brightness != LED_OFF);
>> +	}
>> +	return 0;
>> +}
> Let's have these function names without leading underscores.
OK.
>
>>   static int __led_set_brightness(struct led_classdev *led_cdev,
>>   				enum led_brightness value)
>>   {
>> @@ -115,6 +142,8 @@ static void set_brightness_delayed(struct work_struct *ws)
>>   	if (ret == -ENOTSUPP)
>>   		ret = __led_set_brightness_blocking(led_cdev,
>>   					led_cdev->delayed_set_value);
>> +	__led_handle_regulator(led_cdev, led_cdev->delayed_set_value)
> If you called it from __led_set_brightness() and

We cannot call it from __led_set_brightness() because it is supposed not 
to block.

JJ
