From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: [PATCH v3 0/4] iio: adc: Maxim max9611 driver
Date: Sun, 26 Mar 2017 10:18:04 +0100
Message-ID: <26ADB8F7-CC86-450B-9C78-EDEFF4880C11@jic23.retrosnub.co.uk>
References: <1490369323-13866-1-git-send-email-jacopo+renesas@jmondi.org> <CAMuHMdWojCNtJBQxP6E+hdscCQ7U28RGWsPfhXidxJDu-aTQOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWojCNtJBQxP6E+hdscCQ7U28RGWsPfhXidxJDu-aTQOw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 26 March 2017 10:07:58 BST, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>Hi Jacopo, Jonathan,
>
>On Fri, Mar 24, 2017 at 4:28 PM, Jacopo Mondi
><jacopo+renesas@jmondi.org> wrote:
>> Third round for Maxim max9611/max9612 high-side current sense
>amplifier driver.
>>
>> For reference, a simplified integration schematic drawing is here
>reported:
>>
>>  ----o----/\/\/-----o-------|LOAD|---
>>      |    shunt     |
>>  ____|______________|___
>>  |  RS+            RS-  |
>>  |   |-----gain-----|   |
>>  |          |           |
>>  |          |           |
>>  |max9611   |->| ADC |===== I2c
>>  |______________________|
>>
>> public datasheet available at
>> https://datasheets.maximintegrated.com/en/ds/MAX9611-MAX9612.pdf
>>
>> In v2 all channels whose values are calculated using parameters
>> depending on the applied gain have been transformed in "processed"
>channels.
>>
>> In v3 fixed DT bindings to use a more generic name for ADC nodes, and
>shunt
>> resistor description property.
>>
>> output reported from iio_info tool:
>> iio:device0: max9611_vdd
>>                 6 channels found:
>>                         voltage0:  (input)
>>                         1 channel-specific attributes found:
>>                                 attr 0: input value: 4.085000000
>>                         voltage1:  (input)
>>                         3 channel-specific attributes found:
>>                                 attr 0: scale value: 14
>>                                 attr 1: offset value: 1
>>                                 attr 2: raw value: 59
>>                         shunt:  (input)
>>                         2 channel-specific attributes found:
>>                                 attr 0: resistor_power value: 5000
>>                                 attr 1: resistor_current value: 5000
>>                         power:  (input)
>>                         1 channel-specific attributes found:
>>                                 attr 0: input value: 663.404000000
>>                         temp:  (input)
>>                         2 channel-specific attributes found:
>>                                 attr 0: scale value: 0.480076812
>>                                 attr 1: raw value: 59
>>                         current:  (input)
>>                         1 channel-specific attributes found:
>>                                 attr 0: input value: 817.000000000
>
>I'm a bit puzzled about Jonathan's request to have two separate
>attributes
>for the single shunt resistor value.  While they do apply to two
>calculated
>channels, they're the same physical property, and can never be
>different.

Yes but under abi any attribute with no channel as part of name applies to all input channels.
On the inside part kind of sensible as sort of applies to all.

Here we would have a shunt on the temperature channel...




>
>Furthermore, in the above output they do not show up as attributes of
>the
>"power" and "current" channels, but as attributes of a separate "shunt"
>channel. Is that intentional?
>
Shouldn't be own channels, naming currently wrong. I raised that in review.

>For comparison, with ina226 on BayLibre ACME, which uses a similar
>configuration, I get:
>
>    iio:device0: ina226
>        5 channels found:
>            voltage0:  (input)
>            6 channel-specific attributes found:
>                attr 0: scale value: 0.002500000
>                attr 1: raw value: 979
>                attr 2: integration_time value: 0.001100
>                attr 3: index value: 0
>                attr 4: en value: 0
>                attr 5: type value: le:u16/16>>0
>            voltage1:  (input)
>            6 channel-specific attributes found:
>                attr 0: integration_time value: 0.001100
>                attr 1: raw value: 4007
>                attr 2: scale value: 1.250000000
>                attr 3: en value: 0
>                attr 4: index value: 1
>                attr 5: type value: le:u16/16>>0
>            power2:  (input)
>            5 channel-specific attributes found:
>                attr 0: raw value: 49
>                attr 1: scale value: 25.000000000
>                attr 2: index value: 2
>                attr 3: type value: le:u16/16>>0
>                attr 4: en value: 0
>            current3:  (input)
>            5 channel-specific attributes found:
>                attr 0: scale value: 1
>                attr 1: raw value: 245
>                attr 2: type value: le:u16/16>>0
>                attr 3: index value: 3
>                attr 4: en value: 0
>            timestamp:  (input)
>            3 channel-specific attributes found:
>                attr 0: type value: le:s64/64>>0
>                attr 1: index value: 4
>                attr 2: en value: 0
>        6 device-specific attributes found:
>                attr 0: in_oversampling_ratio value: 4
>                attr 1: in_shunt_resistor value: 10000
>                attr 2: in_allow_async_readout value: 0
>                attr 3: integration_time_available value: 0.000140
>0.000204 0.000332 0.000588 0.001100 0.002116 0.004156 0.008244
>                attr 4: in_sampling_frequency value: 114
>                attr 5: in_active value: 1
>
>(note that the last "in_active" property does not exist in the mainline
> version of the driver).
>
>Here the shunt resistor value is a (single) device-specific attribute,
>which
>makes more sense to me, as in-se the shunt resistor value is not a
>property
>of just the "current" and "power" channels, but a property of the
>(external)
>device configuration.
Sort of but userspace will be dumb about it and apply it to all channels. Only reason this isn't 
happening here is userspace doesn't know about it.

So arguably we got it slightly wrong here...

J
>
>Thanks!
>
>Gr{oetje,eeting}s,
>
>                        Geert
>
>--
>Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
>geert@linux-m68k.org
>
>In personal conversations with technical people, I call myself a
>hacker. But
>when I'm talking to journalists I just say "programmer" or something
>like that.
>                                -- Linus Torvalds
>--
>To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
