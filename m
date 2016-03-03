From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] hwmon: Create an NSA320 hardware monitoring driver
Date: Wed, 2 Mar 2016 20:38:54 -0800
Message-ID: <56D7BFDE.8090804@roeck-us.net>
References: <1456698614-15176-1-git-send-email-linux@baker-net.org.uk>
 <1456698614-15176-3-git-send-email-linux@baker-net.org.uk>
 <56D3948D.6000805@roeck-us.net> <56D77AA4.2080908@baker-net.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D77AA4.2080908-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Baker <linux-u8Lxuz9p/S1csCcyGdaD/Q@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, carl.wolfgang-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/02/2016 03:43 PM, Adam Baker wrote:
> On 29/02/16 00:45, Guenter Roeck wrote:
>
>>> +
>>> +/*
>>> + * Although this protocol looks similar to SPI the long delay
>>> + * between the active (aka chip select) signal and the shorter
>>> + * delay between clock pulses are needed for reliable operation.
>>> + * The delays provided are taken from the manufacturer kernel,
>>> + * testing suggest they probably incorporate a reasonable safety
>>> + * margin. (The single device tested became unreliable if the
>>> + * delay was reduced to 1/10th of this value.)
>>> + */
>>> +static unsigned long nsa320_hwmon_update(struct device *dev)
>>
>> Please make this either int or s32.
>>
>>> +{
>>> +    u32 mcu_data;
>>
>> You can (and should) still use u32 here.
>>
>
>
> I'm a bit puzzled by your reasoning for preferring a signed value for the return value. The only reason I can think of is that the error return value is negative, however the macro to test if it is an error value is not looking at whether the value is negative
>
> #define IS_ERR_VALUE(x) unlikely((x) >= (unsigned long)-MAX_ERRNO)
>
> Functionally using any of s32, int or unsigned long will make no difference, the mask operations ensure that the top bit can't possibly be set so using a signed type doesn't, in this circumstance, risk an undefined result from the shift operation. The choice of type is therefore a matter of readability rather than function so if you still prefer s32 I'll respin it to use that.
>

IS_ERR_VALUE _only_ works with unsigned long if sizeof(long) = sizeof(int).
Someone may at some point in the future not realize this and change the function
return value to unsigned int or u32, thinking that an unsigned long is unnecessary,
and introduce a bug. Many users of IS_ERR_VALUE in the kernel actually
suffer from this problem. I prefer code which is less prone to such
unintentionally introduced problems.

I also dislike using unsigned variables to return negative error codes unless
there is a really good reason for doing it. Such a reason does not exist here.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
