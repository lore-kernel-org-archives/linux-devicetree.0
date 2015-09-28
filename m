From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 3/5] mfd: tps65912: Add driver for the TPS65912 PMIC
Date: Mon, 28 Sep 2015 10:43:12 -0500
Message-ID: <56096010.5010202@ti.com>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-4-git-send-email-afd@ti.com> <20150925165059.GI27197@x1>
 <56059CDA.4020004@ti.com> <20150925212446.GL27197@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150925212446.GL27197@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2015 04:24 PM, Lee Jones wrote:
> On Fri, 25 Sep 2015, Andrew F. Davis wrote:
>
>> On 09/25/2015 11:50 AM, Lee Jones wrote:
>>> On Thu, 24 Sep 2015, Andrew F. Davis wrote:
>>>
>>>> This patch adds support for TPS65912 mfd device. It provides
>>>> communication through the I2C and SPI interfaces. It contains
>>>> the following components:
>>>>
>>>>   - Regulators
>>>>   - GPIO controller
>>>>
>>>> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
>>>> ---
>>>>   drivers/mfd/Kconfig          |  24 +++
>>>>   drivers/mfd/Makefile         |   3 +
>>>>   drivers/mfd/tps65912-core.c  | 114 +++++++++++++
>>>>   drivers/mfd/tps65912-i2c.c   |  86 ++++++++++
>>>>   drivers/mfd/tps65912-spi.c   |  85 ++++++++++
>>>>   include/linux/mfd/tps65912.h | 393 +++++++++++++++++++++++++++++++++++++++++++
>>>>   6 files changed, 705 insertions(+)
>>>>   create mode 100644 drivers/mfd/tps65912-core.c
>>>>   create mode 100644 drivers/mfd/tps65912-i2c.c
>>>>   create mode 100644 drivers/mfd/tps65912-spi.c
>>>>   create mode 100644 include/linux/mfd/tps65912.h
>>>
>>> [...]
>>>
>>>> +#define TPS65912_IRQ(_name, _reg, _offset)			\
>>>> +	[TPS65912_IRQ_ ## _name] = {				\
>>>> +		.mask = TPS65912_ ## _reg ## _ ## _name,	\
>>>> +		.reg_offset = _offset,				\
>>>> +	}
>>>
>>> I told you about this already.
>>>
>>> If you want this set to be merged for v4.3 then you'll need commit
>>> b4fe8ba ("regmap: Add generic macro to define regmap_irq") from my
>>> tree.
>>
>> You asked me to submit this to Mark Brown, I didn't realize you also
>> wanted me to use the one in your tree. Using yours will make my lines
>> over 80 chars and so it kind of defeats the purpose but I'll do it
>> for v4.
>
> I asked two of you to upstream a generic incarnation of your
> implementation.  The other guy got there first.  Now I want everyone
> to use it instead of hand-rolling their own.
>

Got it.

>>> [...]
>>>
>>>> +static struct i2c_driver tps65912_i2c_driver = {
>>>> +	.driver		= {
>>>> +		.name	= "tps65912",
>>>> +		.of_match_table = tps65912_i2c_of_match_table,
>>>
>>> of_match_ptr()
>>>
>>
>> Why? tps65912_i2c_of_match_table is always compiled in.
>
> But it needn't be.
>

This driver is DT only, would it make more sense to just add a dependency
on CONFIG_OF in the Kconfig? I don't see many other drivers that are DT
only doing this, the driver should compile just fine without OF enabled,
it just wont have DT functionality, so is it really dependent on OF?
The of_match_ptr(x) macro looks to be useful when the x is conditionally
compiled in, but in my case the x (my of_device_id table) is always compiled.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
