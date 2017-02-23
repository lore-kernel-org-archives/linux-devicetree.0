From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] iio: accel: adxl345: Add SPI support
Date: Thu, 23 Feb 2017 18:58:12 +0200
Message-ID: <CAHp75VfbfRB_7Y2CRrJRYHqnJNMYD1hKScGr0HLSpFSGgJtymA@mail.gmail.com>
References: <cover.1487757223.git.eraretuya@gmail.com> <515297e48abd139993cab56dbf980711400d6534.1487757223.git.eraretuya@gmail.com>
 <CAHp75VdmB1YqY4YyntbvHUaK_9yjY8wFeX6i9hmMDaScajKNOw@mail.gmail.com> <cb64adc9-f468-11f8-4a8a-fd3f5779fee0@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cb64adc9-f468-11f8-4a8a-fd3f5779fee0-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 6:47 PM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
> On 02/23/2017 05:43 PM, Andy Shevchenko wrote:
>> On Wed, Feb 22, 2017 at 12:23 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Add SPI driver that initializes SPI regmap for the adxl345 core driver.
>>> The driver supports the same functionality as I2C namely the x, y, z and
>>> scale readings.

>>>  config ADXL345_I2C
>>>         tristate
>>>         select REGMAP_I2C
>>>
>>> +config ADXL345_SPI
>>> +       tristate
>>> +       select REGMAP_SPI
>>
>> Hmm...
>> I saw another pattern
>>
>> Library / core part is non-visible to user, while
>> SPI and I2C parts are selectable by user.
>>
>> Why do you use inverted pattern? What did I miss?
>
> The first version of the patch used the other pattern SPI/I2C visible.
> Jonathan suggested this other pattern. I prefer the explicit SPI/I2C visible
> pattern, but in the end it doesn't really matter as long as both work.

Yes, but this pattern makes extra footprint of the kernel and
basically dead code when I would like, for example, to have SPI bus
enabled, I2C module available, but SPI module not compiled.

Other one is when I want to have one compiled in, one as a module by
whatever reason.

At the end I have no strong opinion, though rationale for the opposite is above.

-- 
With Best Regards,
Andy Shevchenko
