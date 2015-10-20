From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 2/4] mfd: tps65086: Add driver for the TPS65086 PMIC
Date: Tue, 20 Oct 2015 09:58:51 -0500
Message-ID: <562656AB.3060808@ti.com>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-3-git-send-email-afd@ti.com> <20151019092336.GI31804@x1>
 <56251468.7030609@ti.com> <20151020100214.GM31804@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151020100214.GM31804@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/20/2015 05:02 AM, Lee Jones wrote:
> On Mon, 19 Oct 2015, Andrew F. Davis wrote:
>> On 10/19/2015 04:23 AM, Lee Jones wrote:
>>> On Fri, 16 Oct 2015, Andrew F. Davis wrote:
>>>
>>>> Add support for the TPS65912 device. It provides communication
>>>> through I2C and contains the following components:
>>>>
>>>>   - Regulators
>>>>   - Load switches
>>>>   - GPO controller
>>>
>>> What's a GPO controller?
>>
>> General Purpose Output, this controller only has output control, it's
>> listed in the data-sheet this way, and other drivers have used this term.
>
> Okay.
>
>>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>>> ---
>>>>   drivers/mfd/Kconfig          |  13 ++++
>>>>   drivers/mfd/Makefile         |   1 +
>>>>   drivers/mfd/tps65086.c       | 145 +++++++++++++++++++++++++++++++++++++++++++
>>>>   include/linux/mfd/tps65086.h | 120 +++++++++++++++++++++++++++++++++++
>>>>   4 files changed, 279 insertions(+)
>>>>   create mode 100644 drivers/mfd/tps65086.c
>>>>   create mode 100644 include/linux/mfd/tps65086.h
>>>>
>>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>>> index 99d6367..ab3b392 100644
>>>> --- a/drivers/mfd/Kconfig
>>>> +++ b/drivers/mfd/Kconfig
>>>> @@ -1093,6 +1093,19 @@ config TPS6507X
>>>>   	  This driver can also be built as a module.  If so, the module
>>>>   	  will be called tps6507x.
>>>>
>>>> +config MFD_TPS65086
>>>> +	tristate "TI TPS65086x Power Management chips"
>>>
>>> Use the full name:
>>>
>>>    "TI TPS65086x Power Management Integrated Chips (PMICs)"
>>>
>>>> +	select REGMAP
>>>> +	select REGMAP_IRQ
>>>> +	select REGMAP_I2C
>>>> +	depends on I2C
>>>
>>> REGMAP_I2C already depends on I2C.
>>>
>>
>> So if I force REGMAP_I2C to =y without depending on I2C then couldn't
>> REGMAP_I2C get selected without I2C enabled? Selecting doesn't force
>> the selected item's dependencies still right?
>
> Try it out. :)
>

OK, I just tried a little test and it did as I expected, I was able to
select a symbol and it did not enable its dependency, so this would
break build. So, I'm still confused, why does REGMAP_I2C depending
on I2C matter? What are you suggesting my Kconfig should look like?

>>>> +	depends on OF || COMPILE_TEST
>>>> +	help
>>>> +	  If you say yes here you get support for the TPS65086 series of
>>>> +	  Power Management chips.
>>>
>>> I'd remove the line break.
>>>
>>>> +	  These include voltage regulators, GPO and other features
>>>
>>> GPIO?
>>>
>>>> +	  that are often used in portable devices.
>>>
>>> This is meant to be a 'help', so instead of staying "and some other
>>> stuff", please list them.
>>>
>>
>> This seems to be what other devices do, I'll change it to something
>> else then.
>
> If you know what the "other features" are, it's best to name them.
>

I was giving a generic description of a PMIC, I didn't really want to
list all the features and start marketing the part in the Kconfig, unless
you want, I'm sure TI won't mind the advertisement. :)

I'm not sure why we write so much about these driver parts at all in the
help, people who need them know what they are, it's not like some core
kernel config option that people might be undecided on and need explained
its function.

>>>>   config TPS65911_COMPARATOR
>>>>   	tristate
>>>>
>>>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>>>> index a59e3fc..7adb902 100644
>>>> --- a/drivers/mfd/Makefile
>>>> +++ b/drivers/mfd/Makefile
>>>> @@ -66,6 +66,7 @@ obj-$(CONFIG_MFD_WM8994)	+= wm8994-core.o wm8994-irq.o wm8994-regmap.o
>>>>   obj-$(CONFIG_TPS6105X)		+= tps6105x.o
>>>>   obj-$(CONFIG_TPS65010)		+= tps65010.o
>>>>   obj-$(CONFIG_TPS6507X)		+= tps6507x.o
>>>> +obj-$(CONFIG_MFD_TPS65086)	+= tps65086.o
>>>>   obj-$(CONFIG_MFD_TPS65217)	+= tps65217.o
>>>>   obj-$(CONFIG_MFD_TPS65218)	+= tps65218.o
>>>>   obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
>>>> diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
>>>> new file mode 100644
>>>> index 0000000..be6d678
>>>> --- /dev/null
>>>> +++ b/drivers/mfd/tps65086.c
>>>> @@ -0,0 +1,145 @@
>>>> +/*
>>>> + * Driver for TI TPS65086x PMICs
>>>
>>> I'd suggest removing the driver part.  We know it's a driver.
>>
>> Again this is what almost every other driver does,
>
> Almost every other driver.  That's some statement.
>
> I count 42%. ;)
>

I'm finding in drivers/mfd ~89% of drivers mention at some point that
they are a driver. But I do admit my original statement was based on a
quick monte carlo selection of a couple files. :)

>> I'm not sure how
>> else to describe this file without using the word driver.
>
> Perhaps I'm getting picky in my old age, but I think I'd prefer to see:
>
>    TI TPS65086x PMIC support
>

Still not sure this describes the file, maybe we could just drop that
line completely from files with an obvious purpose? Doesn't really bother
me ether way.

> [...]
>
