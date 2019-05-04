Return-Path: <SRS0=vTZI=TE=c-mauderer.de=list@kernel.org>
Subject: Re: [PATCH 2/2] leds: ubnt-spi: Add Ubnt AirCube ISP LED driver
References: <20190504122825.11883-1-list@c-mauderer.de>
 <20190504122825.11883-2-list@c-mauderer.de> <20190504162009.GB24060@amd>
From: Christian Mauderer <list@c-mauderer.de>
Message-ID: <111a3461-d784-021b-d6d6-9a74d5bb3a42@c-mauderer.de>
Date: Sat, 4 May 2019 18:43:14 +0200
MIME-Version: 1.0
In-Reply-To: <20190504162009.GB24060@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>, oss@c-mauderer.de
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

First: Thanks for the quick review. I haven't expected an answer for
some days.

On 04/05/2019 18:20, Pavel Machek wrote:
> On Sat 2019-05-04 14:28:25, list@c-mauderer.de wrote:
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
>> This driver adds support for the custom LED controller used in Ubiquity
>> airCube ISP devices and most likely some other simmilar Ubiquity
>> products.
> 
> similar.

I'll change that. And I noted another typo too: The company is called
Ubiquiti ...

> 
>> +config LEDS_UBNT_SPI
>> +	tristate "LED support for Ubnt aircube ISP custom SPI LED controller"
>> +	depends on LEDS_CLASS
>> +	depends on SPI
>> +	depends on OF
>> +	help
>> +	  This option enables basic support for the LED controller used in
>> +	  Ubiquity airCube ISP devices. The controller is microcontroller based
>> +	  and uses a single byte on the SPI to set brightness or blink patterns.
> 
>> +/*
>> + *  Custom controller based LED controller used in Ubiquity airCube ISP.
>> + *
>> + *  Reverse engineered protocol:
>> + *  - The device uses only a single byte sent via SPI.
>> + *  - The SPI input doesn't contain any relevant information.
>> + *  - Higher two bits set a mode. Lower six bits are a parameter.
>> + *  - Mode: 00 -> set brightness between 0x00 (min) and 0x3F (max)
>> + *  - Mode: 01 -> pulsing pattern (min -> max -> min) with an interval. From
>> + *    some tests, the period is about (50ms + 102ms * parameter). There is a
>> + *    slightly different pattern starting from 0x100 (longer gap between the
>> + *    pulses) but the time still follows that calculation.
>> + *  - Mode: 10 -> same as 01 but with only a ramp from min to max. Again a
>> + *    slight jump in the pattern at 0x100.
>> + *  - Mode: 11 -> blinking (off -> 25% -> off -> 25% -> ...) with a period of
>> + *    (105ms * parameter)
>> + *
>> + *  NOTE: This driver currently only implements mode 00 (brightness).
>> + */
> 
> Aha, so this is not as simple as I thought.

Yes, right. But maybe implementing a generic driver would be a good idea
anyway. I don't think that it is useful to support more than the
brightness in the near future. Currently the only application I know of
would be to port OpenWRT to the device. OpenWRT only switches the LED to
max or min.

If you don't object, I'll use the generic approach (including the name
change to led-spi-byte).

> 
> "Slightly different pattern starting from 0x100"? What does 0x100 mean
> here.

That should be 0x10 instead of 0x100. So for example the jump from 0x4f
to 0x50. But if I use the generic approach, that text will change anyway.

> 
>> +	mutex_init(&led->mutex);
>> +	led->ldev.name = led->name;
>> +	led->ldev.brightness = LED_OFF;
>> +	led->ldev.max_brightness = led->max_bright - led->off_bright;
> 
> What happens when DTS has off_bright > max_bright? :-).

That slipped me. I'll create a check for that.

> 
>> +
>> +static int ubnt_spi_remove(struct spi_device *spi)
>> +{
>> +	struct ubnt_spi_led	*led = spi_get_drvdata(spi);
>> +
>> +	led_classdev_unregister(&led->ldev);
>> +
>> +	return 0;
>> +}
> 
> Do you need to do mutex_destroy?

Yes. I'll add it.

> 									Pavel
> 
