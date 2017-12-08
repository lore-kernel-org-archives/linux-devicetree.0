From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 3/6] clocksource: stm32: only use 32 bits timers
Date: Fri, 8 Dec 2017 14:47:58 +0100
Message-ID: <24aab0ad-956f-536b-257a-f4278443a9fb@linaro.org>
References: <20171208113250.359-1-benjamin.gaignard@st.com>
 <20171208113250.359-4-benjamin.gaignard@st.com>
 <56efa18e-481b-bd1b-7a54-db4a21073313@linaro.org>
 <CA+M3ks5CY79SHqcfhgySgsQuPVQyJWHQJ0=OT3Zvxvu2LfUOaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+M3ks5CY79SHqcfhgySgsQuPVQyJWHQJ0=OT3Zvxvu2LfUOaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/12/2017 14:05, Benjamin Gaignard wrote:
> 2017-12-08 13:51 GMT+01:00 Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>> On 08/12/2017 12:32, Benjamin Gaignard wrote:
>>> From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>
>>> The clock driving counters is at 90MHz so the maximum period
>>> for 16 bis counters is around 728us (2^16 / 90.000.000).
>>> For 32 bits counters this period is close 47 secondes which is
>>> more acceptable.
>>>
>>> When using 16 bits counters the kernel may not be able to boot
>>> because it has a too high overhead compare to the clockevent period.
>>> Downgrading the rating of 16bits counter won't change anything
>>> to this problem so this patch remove 16 bits counters support
>>> and makes sure that they won't be probed anymore.
>>
>> Benjamin,
>>
>> there is an inconsistency in this description and the patchset. This is
>> why it is so confusing to review and understand the purpose.
>>
>> Why are you preventing the clockevents to work with 16bits while the
>> issue is related to the clocksource you introduce in the next patch ?
> 
> No the issue is existing also for clockevent because the max period is
> around 728us so the interrupt will fire each 728us which is really too much.

No, that is because you ripped out in this patch the prescaler which was
1024.

Are you the author of this series ?

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
