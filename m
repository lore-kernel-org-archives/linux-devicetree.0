Return-Path: <SRS0=LdpI=XG=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: Add docs for EL15203000
References: <20190909071632.14392-1-oleg@kaa.org.ua>
 <20190909071632.14392-2-oleg@kaa.org.ua>
 <0a24cdf0-4915-ff59-482d-d25def25d65f@ti.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c18f370a-1765-695f-59de-81192e4e75e8@gmail.com>
Date: Wed, 11 Sep 2019 23:09:34 +0200
MIME-Version: 1.0
In-Reply-To: <0a24cdf0-4915-ff59-482d-d25def25d65f@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Dan Murphy <dmurphy@ti.com>, Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, pavel@ucw.cz
Cc: Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 9/11/19 9:48 PM, Dan Murphy wrote:
> Oleh
> 
> On 9/9/19 2:16 AM, Oleh Kravchenko wrote:
>> Add documentation and example for dt-bindings EL15203000.
>> LED board (aka RED LED board) from Crane Merchandising Systems.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>   .../bindings/leds/leds-el15203000.txt         | 54 +++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-el15203000.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> new file mode 100644
>> index 000000000000..c00e1b55db97
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> @@ -0,0 +1,54 @@
>> +Crane Merchandising System - el15203000 LED driver
>> +--------------------------------------------------
>> +
>> +This LED Board (aka RED LEDs board) is widely used in
>> +coffee vending machines produced by Crane Merchandising Systems.
>> +
>> +Required properties:
>> +- compatible : "crane,el15203000"
>> +- reg :
>> +    see Documentation/devicetree/bindings/spi/spi-bus.txt
> 
> FYI this binding Documentation/devicetree/bindings/spi/spi-bus.txt
> points to spi-controller.yaml binding
> 
> so maybe update it to the correct binding.
> 
>> +- spi-max-frequency : (optional)
>> +    see Documentation/devicetree/bindings/spi/spi-bus.txt
> Your driver does not read spi-max-frequency, this is a property of the
> spi driver so I am not sure you
> 
> need to mention that here unless this property needs to be set
> specifically for this device.  If it does then it is not optional
> 
> for this device and it should be documented what the max freq is.

Right, this should have different form. We have two similar occurrences
in other LED bindings and in a few bindings pertinent to other
subsystems. This property is parsed in spi.c for each child node
of parent spi node.

It should be like below:

Property rules described in
Documentation/devicetree/bindings/spi/spi-bus.txt
apply. In particular, "reg" and "spi-max-frequency" properties must be
given.

>> +
>> +Optional LED sub-node properties:
>> +- function:
>> +    see Documentation/devicetree/bindings/leds/common.txt
> 
> You point the user to the common file but you use hard coded function
> names in the example.
> 
> The leds/common.txt file points to the include/dt-bindings/leds/common.h
> file and the binding says
> 
> "If there is no matching LED_FUNCTION available, add a new one."
> 
> Now I know we don't want to add the pipe, screen or vend so you probably
> do not want to have the user
> 
> going to that header.
> 
> Not sure how to fix this but the documentation is misleading. Jacek?

I'd just resort to common sense. If the function seems to be generic
enough then it deserves its own definition. We might change it to:

"If there is no matching LED_FUNCTION available and it is plausible
that it will be in demand in the future, add a new one."

> 
>> +- color:
>> +    see Documentation/devicetree/bindings/leds/common.txt
>> +- label:
>> +    see Documentation/devicetree/bindings/leds/common.txt (deprecated)
> 
> Not sure if someone asked for this here but since this is a new driver
> it should not even speak of the "label" property.

Agreed.

-- 
Best regards,
Jacek Anaszewski
