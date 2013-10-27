From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/4] charger-manager: Use IIO subsystem to read battery
 temperature instead of legacy method
Date: Mon, 28 Oct 2013 08:51:12 +0900
Message-ID: <526DA6F0.6060005@samsung.com>
References: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
 <1382446317-32613-3-git-send-email-cw00.choi@samsung.com>
 <20131027111739.GC2437@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131027111739.GC2437-5NIqAleC692hcjWhqY66xCZi+YwRKgec@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On 10/27/2013 08:17 PM, Pavel Machek wrote:
> Hi!
> 
>> diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
>> index e6f92b4..6700191 100644
>> --- a/drivers/power/Kconfig
>> +++ b/drivers/power/Kconfig
>> @@ -309,6 +309,7 @@ config CHARGER_MANAGER
>>  	bool "Battery charger manager for multiple chargers"
>>  	depends on REGULATOR && RTC_CLASS
>>  	select EXTCON
>> +	select IIO
>>  	help
>>            Say Y to enable charger-manager support, which allows multiple
>>            chargers attached to a battery and multiple batteries attached to a
> 
> Umm. Are there charger-manager users that don't have temperature sensor on IIO?

I'll remove tightly coupled dependency between IIO and Charger-manager.

> 
>> +	if (desc->channel) {
>> +		temp = iio_read_channel_raw(desc->channel, last_temp_mC);
>> +
>> +		/*
>> +		 * The charger-manager use IIO subsystem to read ADC raw data
>> +		 * from IIO ADC device drvier. The each device driver has
>> +		 * own non-standard ADC table. If user of charger-manager
>> +		 * would like to get correct temperature value, have to convert
>> +		 * 'last_temp_mC' variable according to proper calculation
>> +		 * method and own ADC table.
>> +		 */
>> +
>> +		if (*last_temp_mC >= desc->iio_adc_overheat)
>> +			temp = CM_TEMP_NORMAL;	/* Overheat */
>> +		else if (*last_temp_mC <= desc->iio_adc_cold)
>> +			temp = CM_TEMP_COLD;	/* Cold */
>> +		else
>> +			temp = CM_TEMP_NORMAL;	/* Normal */
> 
> Something is definitely wrong here.

I'll fix it as below:
temp = CM_TEMP_NORMAL;	/* Overheat */
-> temp = CM_TEMP_OVERHEAT;	/* Overheat */

Also, as you mentioned, this patch haven't included the converting sequence
from ADC value to correct temperature because currently iio driver haven't
support this feature. So, I'm going to discuss this issue on following mailing thread:
- https://lkml.org/lkml/2013/10/26/42

If I find proper method to get temperature on IIO driver, I'll modify it.

Thanks for your comment.

Best Regards,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
