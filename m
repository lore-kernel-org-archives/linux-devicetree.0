Return-Path: <SRS0=1TVW=TG=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v2 2/2] leds: spi-byte: add single byte SPI LED driver
References: <20190505125242.10298-1-oss@c-mauderer.de>
 <20190505125242.10298-2-oss@c-mauderer.de>
 <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com> <20190505201218.GA21957@amd>
 <911128ec-1327-5895-d101-97801e9c777a@c-mauderer.de>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <cf99d1f1-4cb2-4e60-3ce1-d123f28536bc@gmail.com>
Date: Mon, 6 May 2019 20:34:14 +0200
MIME-Version: 1.0
In-Reply-To: <911128ec-1327-5895-d101-97801e9c777a@c-mauderer.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Christian Mauderer <oss@c-mauderer.de>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Christian,

On 5/6/19 10:48 AM, Christian Mauderer wrote:
> On 05/05/2019 22:12, Pavel Machek wrote:
>> Hi!
>>
>>>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>>> +	if (!led)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	led->spi = spi;
>>>> +	strlcpy(led->name, name, sizeof(led->name));
>>>> +	mutex_init(&led->mutex);
>>>> +	led->off_value = off_value;
>>>> +	led->max_value = max_value;
>>>> +	led->ldev.name = led->name;
>>>> +	led->ldev.brightness = LED_OFF;
>>>
>>> This line is redundant - already zeroed by kzalloc.
>>
>> Actually I'd prefer to leave it in. Yes, LED_OFF == 0, and will
>> probably stay == 0 in future, but...
>> 									Pavel
>>
> 
> Before I send v4: Currently the initial value isn't written to the LED
> anywhere. The state that is set by U-Boot is just kept till the first
> write to the brightness file.
> 
> I didn't implement "default-state" because the OpenWRT user space sets
> the LED anyway a few seconds later (which is still my use case for that
> driver). But now I noted that there is a remark in the documentation of
> the option "default-state" in devicetree/bindings/leds/common.txt: "The
> default is off if this property is not present."
> 
> Should I send an initial value to the device during initialization or is
> it OK to just keep the original state?

Yes, I would make use of default-state in this case.

-- 
Best regards,
Jacek Anaszewski
