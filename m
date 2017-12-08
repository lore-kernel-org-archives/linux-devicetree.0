From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 4/6] clocksource: stm32: only use 32 bits timers
Date: Fri, 8 Dec 2017 08:52:12 +0100
Message-ID: <4f9ed3dd-cf02-eed7-7fdd-38f8dc092eee@linaro.org>
References: <1510649563-22975-1-git-send-email-benjamin.gaignard@linaro.org>
 <1510649563-22975-5-git-send-email-benjamin.gaignard@linaro.org>
 <44bb54e6-c9e8-4b54-d490-a1800bf6d74c@linaro.org>
 <CA+M3ks5Q_ZUHODV=eA4caT9NdrxKw1qiaWwc87w9FiC_uqwfBQ@mail.gmail.com>
 <2afa343b-3a23-3352-33b3-2133678a4122@linaro.org>
 <CA+M3ks4KLy0VkJOSGR7tmefOT1rw9nrMsRQvwwK-YZQ7Gm7hQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+M3ks4KLy0VkJOSGR7tmefOT1rw9nrMsRQvwwK-YZQ7Gm7hQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, Julien Thierry <julien.thierry-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/12/2017 21:36, Benjamin Gaignard wrote:
> 2017-12-07 17:49 GMT+01:00 Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>> On 07/12/2017 17:33, Benjamin Gaignard wrote:
>>> 2017-12-07 16:27 GMT+01:00 Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>>>> On 14/11/2017 09:52, Benjamin Gaignard wrote:
>>>>> The clock driving counters is at 90MHz so the maximum period
>>>>> for 16 bis counters is around 750 ms which is a short period
>>>>> for a clocksource.
>>>>
>>>> Isn't it 728us ?
>>>
>>> yes it is: 2^16 / 90.000.000 => 728us
>>
>> Ok, now I can do the connection with the previous patch.
>>
>> So, the real issue of all this is the 16bits clocksource is wrapping up
>> every 728us, hence the clockevent periodically expires every ~728us to
>> keep the timekeeping consistent. Unfortunately, the kernel has a too
>> high overhead for this as the system is consistently processing this
>> timer leading to a CPU time resource starvation.
>>
>> Is that correct ?
> 
> Yes that is correct

Oh man. That was unclear since the beginning, we are not talking about
inaccurate clocksource or whatever but just these 16bits timers can't
work on Linux.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
