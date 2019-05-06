Return-Path: <SRS0=1TVW=TG=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v2 2/2] leds: spi-byte: add single byte SPI LED driver
References: <20190505125242.10298-1-oss@c-mauderer.de>
 <20190505125242.10298-2-oss@c-mauderer.de>
 <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com> <20190505201218.GA21957@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <1c318194-f57f-4807-5f94-8cca8e1c4b9e@gmail.com>
Date: Mon, 6 May 2019 20:19:45 +0200
MIME-Version: 1.0
In-Reply-To: <20190505201218.GA21957@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: oss@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 5/5/19 10:12 PM, Pavel Machek wrote:
> Hi!
> 
>>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>> +	if (!led)
>>> +		return -ENOMEM;
>>> +
>>> +	led->spi = spi;
>>> +	strlcpy(led->name, name, sizeof(led->name));
>>> +	mutex_init(&led->mutex);
>>> +	led->off_value = off_value;
>>> +	led->max_value = max_value;
>>> +	led->ldev.name = led->name;
>>> +	led->ldev.brightness = LED_OFF;
>>
>> This line is redundant - already zeroed by kzalloc.
> 
> Actually I'd prefer to leave it in. Yes, LED_OFF == 0, and will
> probably stay == 0 in future, but...

but what? I don't really see a sufficient justification for
leaving it. Just redundant line. In other place in my LED naming
patch set you wondered if it wouldn't have been better to initialize
a struct partly using initialization list, I suspect to save few
LOC. So here you seem to be inconsistent :-)

-- 
Best regards,
Jacek Anaszewski
