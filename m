From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] iio: dac: Add support for the AD5592R/AD5593R
 ADCs/DACs
Date: Mon, 28 Mar 2016 16:05:58 +0100
Message-ID: <56F94856.60504@kernel.org>
References: <1457009883-4017-1-git-send-email-michael.hennerich@analog.com>
 <56DAEDF4.6040008@kernel.org> <56DD7548.8050306@analog.com>
 <CACRpkdY=n30A5UkRX7avP7eWrPffh3faF8K_Ey2f2cs1GRZP7g@mail.gmail.com>
 <56EFFBB6.40806@analog.com>
 <CACRpkdYFUUoG--47qFA_za9X07qukST1vMBEoVC6J4z2LHcs3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYFUUoG--47qFA_za9X07qukST1vMBEoVC6J4z2LHcs3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=c5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22/03/16 08:49, Linus Walleij wrote:
> On Mon, Mar 21, 2016 at 2:48 PM, Michael Hennerich
> <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> The thing is that the device directly supports an OPEN DRAIN mode.
>>
>> If the consumer asks for open drain mode - everything works as expected.
>> However instead of utilizing the on-chip feature, GPIOLIB will emulate open
>> drain behaviour by configuring the chip for input when someone writes logic
>> high.
>>
>> So the comment above was really meant to say -
>> remove on-chip OPEN DRAIN mode, consumers should use the GPIOLIB
>> implementation if required.
> 
> This is very interesting.
> 
> So if a hardware has *real* open drain, i.e. a bit in hardware that says
> "set me in open drain mode" we should manage this in gpiolib
> and provide a special callback in the vtable for it, right? Because it
> is certainly better to do this with hardware, if we can.
H*** yeah.  Funny how open drain stuff is popping up left right and centre
all of a sudden.
> 
> I'll send a draft patch and we can see if this is what you want.
Cool.  I like fast solutions ;)
> 
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
