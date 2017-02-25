From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] iio: accel: adxl345: Add SPI support
Date: Sat, 25 Feb 2017 15:09:36 +0000
Message-ID: <668ecb12-2a95-4e9c-8eab-509739d52d8c@kernel.org>
References: <cover.1487757223.git.eraretuya@gmail.com>
 <515297e48abd139993cab56dbf980711400d6534.1487757223.git.eraretuya@gmail.com>
 <CAHp75VdmB1YqY4YyntbvHUaK_9yjY8wFeX6i9hmMDaScajKNOw@mail.gmail.com>
 <cb64adc9-f468-11f8-4a8a-fd3f5779fee0@metafoo.de>
 <CAHp75VfbfRB_7Y2CRrJRYHqnJNMYD1hKScGr0HLSpFSGgJtymA@mail.gmail.com>
 <20170224091231.GC5012@Socrates-UM>
 <13912e47-1e3e-e68e-1e91-4a174f33fda5@metafoo.de>
 <CAHp75VfnnCe40V9k9zqyt4rkUYHgTDjfJ-y2qNV7SCxpLqhOtg@mail.gmail.com>
 <20170224143033.GD5012@Socrates-UM>
 <EA621197-929A-43D7-8E77-21991975F75E@jic23.retrosnub.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <EA621197-929A-43D7-8E77-21991975F75E-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24/02/17 19:46, Jonathan Cameron wrote:
> 
> 
> On 24 February 2017 14:30:35 GMT+00:00, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, Feb 24, 2017 at 01:48:39PM +0200, Andy Shevchenko wrote:
>>> On Fri, Feb 24, 2017 at 11:22 AM, Lars-Peter Clausen
>> <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>>>> On 02/24/2017 10:12 AM, Eva Rachel Retuya wrote:
>>>>> On Thu, Feb 23, 2017 at 06:58:12PM +0200, Andy Shevchenko wrote:
>>>>>> On Thu, Feb 23, 2017 at 6:47 PM, Lars-Peter Clausen
>> <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>>>>>>> On 02/23/2017 05:43 PM, Andy Shevchenko wrote:
>>>>>>>> On Wed, Feb 22, 2017 at 12:23 PM, Eva Rachel Retuya
>> <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>>>> I'll revert to the explicit SPI/I2C pattern in order to give more
>>>>> freedom in configuring as per the scenarios previously stated.
>>>>
>>>> Please check with Jonathan before you do, in the end he'll have to
>> apply the
>>>> patch.
>>>
>>> +1. I will be fine with either just need to make sure maintainer
>>> understands pros and cons.
>>>
>>
>> OK.
>>
>> Jonathan, please let me know whether to continue with your preferred
>> configuration or go with the "explicit" pattern that was discussed
>> here.
>>
> Have lost track. Will catch up with thread tomorrow and get back to you.
> 
Ah, now I have caught up, I'll go with the same no strong opinions.
Looks like it is 2 to one in favour of the explicit i2c / spi bits so
lets go with the original form.

Sorry for wasting your time on this Eva!

Divide is always between simplifying configurability of the kernel
vs minimising the extra code built that isn't needed.  Never entirely
obvious where that boundary falls and it really doesn't make that
much difference on either side.

Anyhow, at least you know the options and arguments either way now
so not completely wasted time.

Thanks,

Jonathan
> J
>> Thanks,
>> Eva
>>
>>> -- 
>>> With Best Regards,
>>> Andy Shevchenko
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-iio"
>> in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
