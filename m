Return-Path: <SRS0=70Pc=TE=c-mauderer.de=oss@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <d1704398-ae90-b4e8-50d3-f9533d94ab2b@gmail.com>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <1ae5880f-7af3-ac14-6515-31217b6ed8fb@c-mauderer.de>
Date: Sat, 4 May 2019 22:01:07 +0200
MIME-Version: 1.0
In-Reply-To: <d1704398-ae90-b4e8-50d3-f9533d94ab2b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, list@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 04/05/2019 21:45, Jacek Anaszewski wrote:
> I missed two issues, please take a look below.
> 
>> On 5/4/19 2:28 PM, list@c-mauderer.de wrote:
>>> From: Christian Mauderer <oss@c-mauderer.de>
>>>
> [...]
>>> +- ubnt-spi,max_bright:    Value for the maximum brightness. Default 
> 
> From DT POV the only valid reason for which max brightness level would
> need to be limited is a protection against hardware damage. Please use
> led-max-microamp property for that if this is the case. Otherwise such
> setting can be skipped.
> 
> There are two bindings that allow for configuring max-brightness level
> but they quite old.
> 

My intention with that has been slightly different than limiting the
current:

The driver uses a very simple protocol for setting the brightness: It
sends one byte via SPI. The value of that byte can be (for that
controller) between 0 and 63. My intention when adding the limits has
been to allow adaption to similar hardware by changing the values. If
for example some other controller wants brightness values between 42 and
173 the off_bright could be set to 42 and the max_bright to 173.

Note that Pavel Machek suggested: "Alternatively, call its led-spi-byte,
or something, as it is really trivial protocol. Maybe other chips will
have same interface?"

If I follow that suggestion (which I think would be a good idea), I
would even need the values as mandatory ones instead of optional ones.
Would "led-spi-byte,off-value" and "led-spi-byte,max-value" be better
names in that case?

>>> value for that
>>> +            is 63.
>>> +- label:        A label for the LED. If one is given, the LED will be
>>> +            named "ubnt-spi:<label>" or "ubnt-spi::" otherwise.
>>> +
> 
> Please use just:
> 
> label : see Documentation/devicetree/bindings/leds/common.txt
> 
I'll use that.
