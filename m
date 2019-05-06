Return-Path: <SRS0=1TVW=TG=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <4e91d5e7-a583-58d5-9c14-ad86029ed9e7@c-mauderer.de>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <98a6b6bb-0a45-39f1-f453-312340d9019d@gmail.com>
Date: Mon, 6 May 2019 21:06:58 +0200
MIME-Version: 1.0
In-Reply-To: <4e91d5e7-a583-58d5-9c14-ad86029ed9e7@c-mauderer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Christian Mauderer <oss@c-mauderer.de>, Rob Herring <robh+dt@kernel.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Christian,

On 5/6/19 7:03 PM, Christian Mauderer wrote:
> On 06/05/2019 18:21, Rob Herring wrote:
>> On Sun, May 5, 2019 at 3:00 PM <oss@c-mauderer.de> wrote:
[...]
> 
> I had a look at the functions in "struct led_classdev". There is a
> blink_set(..) function that expects that delay_on and delay_off can be
> set independent. That's not possible for hardware supported blinking on
> this device. 

If delay_on and delay_off values are not supported by the hardware,
then blink_set should return -EINVAL, which will result in activating
software blink fallback for given LED class device.

-- 
Best regards,
Jacek Anaszewski
