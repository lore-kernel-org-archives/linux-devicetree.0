From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: "Generic" MMIO ADC
Date: Fri, 30 Jun 2017 15:59:59 +0200
Message-ID: <CACRpkdZ0FKgbVJeLoFcYZF8Xd+oYn8mja1dy-ij6ArNGNC7O8w@mail.gmail.com>
References: <b60def9a-45dc-bf97-e059-abbe105648b2@topic.nl> <20170630145319.20ec3696@jic23.retrosnub.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170630145319.20ec3696-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Cc: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 30, 2017 at 3:53 PM, Jonathan Cameron
<jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org> wrote:
> On Fri, 30 Jun 2017 10:44:42 +0200
> Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org> wrote:
>
>> =EF=BB=BFI'm writing an IIO driver for a custom IP, which is pretty simp=
le:
>>
>> - Map the registers to memory and register IRQ routine
>> - To start acquisition, write a value to the config register
>> - On interrupt, read data register, push it into queue
>> - To stop, write another value to config.
>>
>> Would it be useful to provide this as a generic driver in Linux, so that=
 you
>> can provide the config register and data register offsets and values in =
the
>> devicetree? That would make it work on a lot of similar project without
>> everyone coding the same thing.
>
> Hi Mike,
>
> I've brought in the devicetree bindings maintainers and list as well on t=
his
> discussion because in many ways it's more about the strategy on bindings
> than the actual driver...  Also Linus Walleij for any experience handing
> the gpio-mmio driver which strikes me as fairly similar in aim.

The gpio-mmio is for the simple case where we have one bit per
GPIO, one bit reads/writes value, one bit sets direction etc.

(I am happy we did not call it "gpio-simple" because these "simple"
things are seldom simple in practice. So MMIO ADC is a good name.)

I would ask the following architectural questions:

- Is it really that simple, no clocks, regulator etc?

- Is it advisible to have it as a child of a syscon, using "simple-mfd"
  to spawn the child device c.f.
  Documentation/devicetree/bindings/leds/register-bit-led.txt
  drivers/leds/leds-syscon.c

- drivers/power/reset/syscon-*
  also use the syscon child approach

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
