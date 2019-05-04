Return-Path: <SRS0=CHRc=TE=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
Message-ID: <d1704398-ae90-b4e8-50d3-f9533d94ab2b@gmail.com>
Date: Sat, 4 May 2019 21:45:41 +0200
MIME-Version: 1.0
In-Reply-To: <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: list@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Christian Mauderer <oss@c-mauderer.de>
List-ID: <devicetree@vger.kernel.org>

I missed two issues, please take a look below.

> On 5/4/19 2:28 PM, list@c-mauderer.de wrote:
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
[...]
>> +- ubnt-spi,max_bright:    Value for the maximum brightness. Default 

 From DT POV the only valid reason for which max brightness level would
need to be limited is a protection against hardware damage. Please use
led-max-microamp property for that if this is the case. Otherwise such
setting can be skipped.

There are two bindings that allow for configuring max-brightness level
but they quite old.

>> value for that
>> +            is 63.
>> +- label:        A label for the LED. If one is given, the LED will be
>> +            named "ubnt-spi:<label>" or "ubnt-spi::" otherwise.
>> +

Please use just:

label : see Documentation/devicetree/bindings/leds/common.txt

-- 
Best regards,
Jacek Anaszewski
