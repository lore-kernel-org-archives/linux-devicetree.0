From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/5] clocksource: stm32: convert driver to timer_of
Date: Thu, 19 Oct 2017 11:07:08 +0200
Message-ID: <10c85c67-df79-0f1a-dd64-8b6840d371c7@linaro.org>
References: <1508331506-23782-1-git-send-email-benjamin.gaignard@linaro.org>
 <1508331506-23782-3-git-send-email-benjamin.gaignard@linaro.org>
 <alpine.DEB.2.20.1710182028080.2477@nanos>
 <CA+M3ks4Eg2-S8yDZuMd-jqZ6g2efvveU_WwQEh0rPZW0fGDt3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+M3ks4Eg2-S8yDZuMd-jqZ6g2efvveU_WwQEh0rPZW0fGDt3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, Julien Thierry <julien.thierry-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/10/2017 21:32, Benjamin Gaignard wrote:
> 2017-10-18 20:31 GMT+02:00 Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>:
>> On Wed, 18 Oct 2017, Benjamin Gaignard wrote:
>>
>>> Convert driver to use timer_of helpers. This allow to remove
>>> custom proprietary structure.
>>>
>>> Increase min delta value because if it is too small it could
>>> generate too much interrupts and the system will not be able
>>> to catch them all.
>>
>> This does two completely independent changes at once. What the heck has
>> increasing min delta to do with converting it to timer_of() helpers?
>>
>> Nothing at all. So please split this into two distinct patches. Each doing
>> ONE thing.
> 
> I will do that.

With push ups.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
