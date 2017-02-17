From: Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/4] iio: trigger: Add OF support and GPIO based trigger
Date: Fri, 17 Feb 2017 18:23:41 +0200
Message-ID: <CAEnQRZDey70TR=nU4rpFyVMqDuUFAGc2SpNCmraUO5x29n1+ow@mail.gmail.com>
References: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487347429-31761-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 17, 2017 at 6:03 PM, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:
> Hi,
>
> I send this as an RFC, as I'm digging to try to get as generic
> as possible GPIO based trigger support, as discussed earlier in
> other patchset "Add EXTI GPIO trigger support to STM32 ADC":
> https://www.spinics.net/lists/arm-kernel/msg559091.html
>
> Following various comments on this, I sent this RFC to address two
> topics, that I see as possible prerequisite:
> - Add trigger OF support
> - GPIO based trigger

I wonder if we could use configfs to create and configure
a GPIO based trigger.

You should just create another trigger type (look into
drivers/iio/trigger/iio-trig-hrtimer.c)
the userspace API will look like this:

# cd /config/iio/triggers
# insert your iio-trig-gpio
# setup the global parameters for the GPIO (the local params can be
set via dts/acpi)
# cd /config/iio/trigers/gpios/

#mkdir t1

And this will create an io-gpio-trigger named t1.

Not sure this fits your usecase but would be nice to consider.

thanks,
Daniel.
