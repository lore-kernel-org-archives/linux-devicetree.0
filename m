From: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] iio: adc: Maxim max961x driver
Date: Mon, 27 Feb 2017 10:09:39 +0100
Message-ID: <9a1d0108-8508-adc5-8985-d1133a3317fd@jmondi.org>
References: <1487948756-25172-1-git-send-email-jacopo+renesas@jmondi.org>
 <f6b94b05-c0f8-239e-733d-dc93a7683184@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f6b94b05-c0f8-239e-733d-dc93a7683184-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,
On 25/02/2017 17:09, Jonathan Cameron wrote:
> On 24/02/17 15:05, Jacopo Mondi wrote:
>> Hello!
>>
>> This series adds driver and documentation for Maxim max9611/max9612
>> high-side current sense amplifier with 12-bit ADC and I2c interface.
>> It also registers two devices installed on VDD_0.8V and DVFS_0.8V lines
>> in Renesas r87796 Salvator-X board.
>>
>> The device provides several functionalities, and only some of them are
>> currently supported by this driver.
>> Particularly, the on-board op-amp and analog comparator are not currently
>> supported.
> More fun to come ;)
>>
>> A simplified integration schematic drawing is here reported:
>>
>>  ----o----/\/\/-----o-------|LOAD|---
>>      |    shunt     |
>>  ____|______________|___
>>  |  RS+            RS-  |
>>  |   |-----gain-----|   |
>>  |          |           |
>>  |          |           |
>>  |max961x   |->| ADC |===== I2c
>>  |______________________|
>>
>>
>> The device provides though its 12-bits ADC the following informations:
> information is it's own plural (silly English quirk of the day!)
>
>> - Common input voltage on RS+
>> - Voltage drop between RS+ and RS- ends
>> - Die temperature
>>
>> All of the above ones are exposed though IIO with _raw and _scale values
>> (plus _input for milli degree Celsius die temperature).
>>
>> From the above values the driver calculates the current flowing between
>> RS+ and RS- ends, using the shunt resistor value provided by device tree, and
>> the power load. Again this values are exposed through _raw and _scale
>> attributes, which I'm not completely sure it's acceptables as they are
>> calculated values and not natively provided by the current sense amplifier.
>> I would like to hear IIO people opinions on this, if they should be better
>> exposed though some other attributes which are not _raw and _scale, or if
>> their calculation should be completely left to userspace tools.
> So one element of the implementation is a problem.
> Because of the dynamic gain adjustment you are doing in the driver (which I
> rather like BTW) there will be instabilities in the computed values that
> userspace comes up with when we are near a transition for in the current
> sense amplifier gain.  We can't do that as crazy outputs will result
> (read offset and scale for possible different values of that gain then
> read the actual ADC value for a possible 3rd choice resulting in complete
> garbage).
>
> So there are two ways to avoid this:
> 1. Move all that magic into the original reads and apply the gain and offset
> before they get to userspace.
> 2. Provide enough information for userspace to be able to compute everything
> iff it is using buffered mode with a 'scan' covering all the channels in one
> go.  Even then we'd have to explicitly allow reading of the PGA gain as a
> channel, or make userspace responsible for doing your autogain stuff.
>
> 1 is probably easier but will make implementing 2 as a follow up will be tricky
> and would be needed if you want to read this stuff faster than sysfs will
> allow.
>
> It's a shame, but my gut feeling is you want to drop the autogain stuff
> as then it all becomes straight forward.
>
> What do others think?
>

Just to add the following element to the discussion.

The device supports cycling between channels by itself, sequentially 
cycling between them every 2 msec.
At the same time, gain setting is not involved in this procedure, and 
last applied is used on current sense voltage channel.

Still this does not help with un-synchronized reads of gain-dependent 
values, as offset and scale are.

Also, removing auto-gain setting routine will simplify stuff, but I 
don't see how all becomes straight forward then. I mean, if we keep gain 
at a fixed value, yes everything's easier, but it will work under a much 
more limited pre-conditions set...

Thanks
    j


> Jonathan
>>
>> Thanks
>>    j
>>
>> Jacopo Mondi (4):
>>   Documentation: dt-bindings: iio: Add max961x
>>   iio: Documentation: Add max961x sysfs documentation
>>   iio: adc: Add max9611/9612 ADC driver
>>   arm64: dts: salvator-x: Add current sense amplifiers
>>
>>  .../ABI/testing/sysfs-bus-iio-adc-max961x          |   5 +
>>  .../devicetree/bindings/iio/adc/max961x.txt        |  27 +
>>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  17 +
>>  drivers/iio/adc/Kconfig                            |  10 +
>>  drivers/iio/adc/Makefile                           |   1 +
>>  drivers/iio/adc/max961x.c                          | 648 +++++++++++++++++++++
>>  6 files changed, 708 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-max961x
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/max961x.txt
>>  create mode 100644 drivers/iio/adc/max961x.c
>>
>
