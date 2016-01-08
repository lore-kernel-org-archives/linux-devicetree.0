From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH 5/6] rtc: max77620: add support for max77620/max20024
 RTC driver
Date: Fri, 8 Jan 2016 18:43:55 +0530
Message-ID: <568FB613.4000706@nvidia.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com> <1452177524-23192-6-git-send-email-ldewangan@nvidia.com> <CAJKOXPd938soaa5M0GFo5HpVCYzAS1w8j8Hko3Ja9mx47NYkEQ@mail.gmail.com> <568F8D7E.10500@nvidia.com> <568FB423.7030108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <568FB423.7030108-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Friday 08 January 2016 06:35 PM, Krzysztof Kozlowski wrote:
> W dniu 08.01.2016 o 19:20, Laxman Dewangan pisze:
>> Hi Krzysztof,
>> Thanks for review.
>>
>> Accepted most of review comment and will update in next patch.
>>
>> Answer to query:
>>
>>
>> On Friday 08 January 2016 07:33 AM, Krzysztof Kozlowski wrote:
>>
> Actually the MFD and other subsystems are quite decoupled already and
> support sharing drivers for common IP block. The problem is that we
> develop drivers in a coupled way. This is not only issue of this
> particular set of drivers. Others were developed in a same way.
>
> So instead I would be happy to see this driver developed in the
> decoupled way so existing RTC driver could be reused. If this requires
> changing existing MFD driver like max77686 then please go ahead. I may
> provide testing for that purpose. Something similar I made recently to
> the max77693 and max77843. Both devices have different parent MFD
> drivers but share some of the specific subsystem drivers: regulator and
> input/haptic.
I replied on other thread. I can decouple the RTC driver for max77620 
and will be available for review.
If it looks fine then we can modify the max6868 mfd driver to use this 
new driver for test purpose.


>>
>> For this, RTC alarm interrupt need to be EARLY_RESUME.
> Okay, this is quite common issue and I think this can be solved by
> disabling the IRQ in suspend:
> http://lxr.free-electrons.com/source/drivers/mfd/max77843.c#L205
>
> IMHO this would be preferred way because you won't be moving device
> suspend/resume callbacks to a syscore level.

I will try for disable_irq() in suspend and enable_irq() in resume.
I hope this will not affect the wakeup property from suspend.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
