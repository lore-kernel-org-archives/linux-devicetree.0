From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: dac: Add support for the AD5592R/AD5593R ADCs/DACs
Date: Tue, 22 Mar 2016 11:50:42 +0100
Message-ID: <CACRpkdZk=wMEDCw4dm7VNhxtGeSKFb1ELV4Tosi00+jjcWFmFg@mail.gmail.com>
References: <1456407412-16218-1-git-send-email-michael.hennerich@analog.com>
	<56D1E1CB.6070704@kernel.org>
	<CACRpkdap_8YGCAvNeK7_0H2MDDnwQ9QDJH4O2SzEkDmczPGtLg@mail.gmail.com>
	<56F0001B.9010608@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F0001B.9010608-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 21, 2016 at 3:07 PM, Michael Hennerich
<michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org> wrote:
> On 03/11/2016 05:28 PM, Linus Walleij wrote:

>>>> +             mutex_lock(&iio_dev->mlock);
>>>> +             st->ops->reg_write(st, AD5592R_REG_RESET, 0xdac);
>>>> +             mutex_unlock(&iio_dev->mlock);
>>
>> What's that? (0xdac)? Clever magic?
>
> Clever magic - to avoid accidental resets.

I see. Put in a small comment like:

/* Writing this magic value resets the device */

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
