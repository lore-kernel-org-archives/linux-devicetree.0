From: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v2 5/5] iio: adc: at91-sama5d2_adc: use max sample rate
Date: Wed, 18 Oct 2017 11:49:46 +0300
Message-ID: <14117d77-00b8-66eb-922c-e56f624633f5@microchip.com>
References: <1507703732-29175-1-git-send-email-eugen.hristev@microchip.com>
 <1507703732-29175-6-git-send-email-eugen.hristev@microchip.com>
 <20171015112847.5c035e7a@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171015112847.5c035e7a@archlinux>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 15.10.2017 13:28, Jonathan Cameron wrote:
> On Wed, 11 Oct 2017 09:35:32 +0300
> Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org> wrote:
> 
>> Change driver settings to use maximum sample rate clock.
>> This is useful to achieve best possible sampling rate
>> if we use DMA.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> 
> I would normally expect this to have some bearing on the
> noise levels on the measured signals.  All I can find
> is a reference to the track time being 15*a single
> clock cycle.  We could change this so that it is appropriate
> for the currently samping frequency rather than leaving it
> as a fixed value.

Actually this is the startup (default) value. The sampling frequency
can be changed from sysfs.
I will drop this change to let the ADC work with minimum frequency
at startup and user can change it from sysfs if greater speed is
required (as with the watermark).

Thanks !
Eugen
> 
> Jonathan
> 
>> ---
>>   drivers/iio/adc/at91-sama5d2_adc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
>> index 7e51ecb..b76f88f 100644
>> --- a/drivers/iio/adc/at91-sama5d2_adc.c
>> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
>> @@ -934,7 +934,7 @@ static void at91_adc_hw_init(struct at91_adc_state *st)
>>   	at91_adc_writel(st, AT91_SAMA5D2_MR,
>>   			AT91_SAMA5D2_MR_TRANSFER(2) | AT91_SAMA5D2_MR_ANACH);
>>   
>> -	at91_adc_setup_samp_freq(st, st->soc_info.min_sample_rate);
>> +	at91_adc_setup_samp_freq(st, st->soc_info.max_sample_rate);
>>   }
>>   
>>   static ssize_t at91_adc_get_fifo_state(struct device *dev,
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
