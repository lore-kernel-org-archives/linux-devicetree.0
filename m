From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v2 2/2] leds: Add control of the voltage/current regulator
 to the LED core
Date: Wed, 17 Jul 2019 15:14:21 +0200
Message-ID: <3b8e5847-6859-d78d-6274-7a879557dcae@ti.com>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-3-jjhiblot@ti.com>
 <9c17e9cc-8162-7b5d-2db9-d2bed20969c5@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9c17e9cc-8162-7b5d-2db9-d2bed20969c5@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dan,

On 15/07/2019 20:59, Dan Murphy wrote:
> JJ
>
> On 7/15/19 10:56 AM, Jean-Jacques Hiblot wrote:
>> A LED is usually powered by a voltage/current regulator. Let the LED 
>> core
>> know about it. This allows the LED core to turn on or off the power 
>> supply
>> as needed.
>
> This allows the LED core to turn on or off managed power supplies.
>
>
>>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---

>>       if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>>           ret = led_add_brightness_hw_changed(led_cdev);
>>           if (ret) {
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index 7107cd7e87cf..a12b880b0a2f 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -23,6 +23,33 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>>   LIST_HEAD(leds_list);
>>   EXPORT_SYMBOL_GPL(leds_list);
>>   +static bool __led_need_regulator_update(struct led_classdev 
>> *led_cdev,
>> +                    int brightness)
>> +{
>> +    bool new_state = (brightness != LED_OFF);
>> +
>> +    return led_cdev->regulator && led_cdev->regulator_state != 
>> new_state;
>> +}
>> +
>> +static int __led_handle_regulator(struct led_classdev *led_cdev,
>> +                int brightness)
>> +{
>> +    int rc;
>
> Should there be a check for the regulator pointer.
>
> If (!led_cdev->regulator)
>
>     return 0;

Not required because __led_need_regulator_update() returns false if 
led_cdev->regulator is NULL.

Thanks for the review

JJ

>
>
> Otherwise
>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
>
> <snip>
>
