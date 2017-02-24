From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v3 4/4] iio: accel: adxl345: Add SPI support
Date: Fri, 24 Feb 2017 10:22:41 +0100
Message-ID: <13912e47-1e3e-e68e-1e91-4a174f33fda5@metafoo.de>
References: <cover.1487757223.git.eraretuya@gmail.com>
 <515297e48abd139993cab56dbf980711400d6534.1487757223.git.eraretuya@gmail.com>
 <CAHp75VdmB1YqY4YyntbvHUaK_9yjY8wFeX6i9hmMDaScajKNOw@mail.gmail.com>
 <cb64adc9-f468-11f8-4a8a-fd3f5779fee0@metafoo.de>
 <CAHp75VfbfRB_7Y2CRrJRYHqnJNMYD1hKScGr0HLSpFSGgJtymA@mail.gmail.com>
 <20170224091231.GC5012@Socrates-UM>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170224091231.GC5012@Socrates-UM>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/24/2017 10:12 AM, Eva Rachel Retuya wrote:
> On Thu, Feb 23, 2017 at 06:58:12PM +0200, Andy Shevchenko wrote:
>> On Thu, Feb 23, 2017 at 6:47 PM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>>> On 02/23/2017 05:43 PM, Andy Shevchenko wrote:
>>>> On Wed, Feb 22, 2017 at 12:23 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> Add SPI driver that initializes SPI regmap for the adxl345 core driver.
>>>>> The driver supports the same functionality as I2C namely the x, y, z and
>>>>> scale readings.
>>
>>>>>  config ADXL345_I2C
>>>>>         tristate
>>>>>         select REGMAP_I2C
>>>>>
>>>>> +config ADXL345_SPI
>>>>> +       tristate
>>>>> +       select REGMAP_SPI
>>>>
>>>> Hmm...
>>>> I saw another pattern
>>>>
>>>> Library / core part is non-visible to user, while
>>>> SPI and I2C parts are selectable by user.
>>>>
>>>> Why do you use inverted pattern? What did I miss?
>>>
>>> The first version of the patch used the other pattern SPI/I2C visible.
>>> Jonathan suggested this other pattern. I prefer the explicit SPI/I2C visible
>>> pattern, but in the end it doesn't really matter as long as both work.
>>
>> Yes, but this pattern makes extra footprint of the kernel and
>> basically dead code when I would like, for example, to have SPI bus
>> enabled, I2C module available, but SPI module not compiled.
>>
>> Other one is when I want to have one compiled in, one as a module by
>> whatever reason.
>>
>> At the end I have no strong opinion, though rationale for the opposite is above.
>>
> 
> Hello Lars and Andy,
> 
> I'll revert to the explicit SPI/I2C pattern in order to give more
> freedom in configuring as per the scenarios previously stated.

Please check with Jonathan before you do, in the end he'll have to apply the
patch.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
