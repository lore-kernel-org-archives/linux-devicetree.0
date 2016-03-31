From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5] iio: dac: Add support for the AD5592R/AD5593R ADCs/DACs
Date: Thu, 31 Mar 2016 10:01:06 +0200
Message-ID: <CACRpkdYAqPn9o-wMbb-iZn7bjad8u9JmdwRqwrjFMArPrOXEOQ@mail.gmail.com>
References: <1458721195-28915-1-git-send-email-michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458721195-28915-1-git-send-email-michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 23, 2016 at 9:19 AM,  <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org> wrote:

> From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
>
> This patch adds support for the AD5592R (spi) and AD5593R (i2c)
> ADC/DAC/GPIO devices.
>
> Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>

For this v5 version:
Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

I'm fine with this new gpiochip driver being merged into the
IIO tree.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
