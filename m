From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 4/4] iio: trigger: add GPIO trigger
Date: Sat, 18 Feb 2017 19:19:07 +0000
Message-ID: <3e2653fe-874c-d761-b274-ffe889df18a7@kernel.org>
References: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
 <1487347429-31761-5-git-send-email-fabrice.gasnier@st.com>
 <06f74b54-91fa-31c5-f015-52a6524059ef@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <06f74b54-91fa-31c5-f015-52a6524059ef-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/02/17 16:16, Lars-Peter Clausen wrote:
> On 02/17/2017 05:03 PM, Fabrice Gasnier wrote:
>> GPIOs can be used to generate triggers for any IIO device.
>> Introduce generic GPIO trigger driver. It offers some options
>> to tune polarity (e.g. rising/falling edge), and label so trigger
>> name may be customized.
>> By default, gpio triggers will be named gpiotrigX, where X is gpio
>> number as returned by desc_to_gpio() call.
>> Rising edge is selected if polarity isn't set.
> 
> If you want to use the GPIO only as an interrupt, just use it as an
> interrupt directly, no need to go the route via the GPIO.
Absolutely.  The majority of the bindings will then just become standard
interrupt bindings and will be effectively handled for you.

Please work to extend the existing interrupt trigger driver rather than adding
this new one.  That one actually started as a gpio trigger then got
generalised into a interrupt trigger later so lets not do that again ;)

Jonathan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
