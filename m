From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/6] mfd: 88pm800: Add 88pm860 device support
Date: Fri, 10 Jul 2015 17:33:14 +0530
Message-ID: <559FB482.4020503@linaro.org>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org>	<CAJKOXPetR4KkfRVNz_QtVfFnjQ7p455QknErr1gnK9iBYgRY+A@mail.gmail.com>	<559E6C9A.8090004@linaro.org>	<559E6EBA.3020401@linaro.org> <CAJKOXPeF6N_=FhBYOYTTxnGgU8GcTrbqthPNU=bXBfo7Db0Lkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPeF6N_=FhBYOYTTxnGgU8GcTrbqthPNU=bXBfo7Db0Lkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thursday 09 July 2015 06:58 PM, Krzysztof Kozlowski wrote:
> 2015-07-09 21:53 GMT+09:00 Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>>
>>
>> On Thursday 09 July 2015 06:14 PM, Vaibhav Hiremath wrote:
>>>
>>>
>>>
>>> On Thursday 09 July 2015 05:34 PM, Krzysztof Kozlowski wrote:
>>>>
>>>> 2015-07-09 20:47 GMT+09:00 Vaibhav Hiremath
>>>> <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>>>>>
>>>>> 88PM860 falls under 88pm800 family of devices, with some feature
>>>>> additions, for example, support for dual phase on BUCK1.
>>>>
>>>>
>>>> Hi,
>>>>
>>>> There are already drivers for 88PM860: mfd, charger and battery. Isn't
>>>> you duplicating existing code?
>>>>
>>>
>>> Can you please point me to MFD driver for 88PM860 (Not the charger and
>>> battery, as I treat them subdevice) ???
>>>
>>> I do not think 88PM860 MFD driver is supported already. Correct me if I
>>> am wrong.
>>>
>>
>> If you are referring to 88pm860x driver, then the answer is NO,
>> as they both are totally different.
>
> I am confused... so the driver drivers/mfd/88pm860x-core.c and its
> child drivers do not support 88pm860 device? They support 88pm860x
> device which is totally different than 88pm860 device?
>

Yes, that's correct.
That's my understanding as well.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
