From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RFC 3/4] dt-bindings: iio: add support for GPIO triggers
Date: Thu, 23 Feb 2017 16:45:09 +0100
Message-ID: <a1064b5a-4258-795b-996b-50ece1c1ee6c@st.com>
References: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
 <1487347429-31761-4-git-send-email-fabrice.gasnier@st.com>
 <CACRpkdaFLMDhYZJrO=-MuSG31aO5vOZ2KX3_c95jzze46pymmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaFLMDhYZJrO=-MuSG31aO5vOZ2KX3_c95jzze46pymmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/23/2017 04:03 PM, Linus Walleij wrote:
> On Fri, Feb 17, 2017 at 5:03 PM, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:
>
>> Document Industrial I/O GPIO trigger support.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> (...)
>> +- gpio-trigger-rising-edge: A rising edge on GPIO will trigger.
>> +- gpio-trigger-falling-edge: A falling edge on GPIO will trigger.
>> +  Note: Both rising and falling edge may be used. In case none of
>> +  rising or falling edge is selected, rising edge is selected by
>> +  default.
>
> We have GPIO_ACTIVE*_HIGH and GPIO_ACTIVE_LOW in the
> gpios second cell already.
>
> Can't we simply use that and specify that for this usecase, reading
> that cell as GPIO_ACTIVE_HIGH == trigger on rising edge and
> GPIO_ACTIVE_LOW == trigger on falling edge?

Hi Linus,

Thanks for reviewing,

I think I'll simply drop patch 3 & 4, as suggested by Lars and Jonathan,
on patch 4, to use interrupt binding directly. Then standard interrupt
binding can be used instead.
Only thing is to add OF support for iio_interrupt_trigger.

BR,
Fabrice
>
> Yours,
> Linus Walleij
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
