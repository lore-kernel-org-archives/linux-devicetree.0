From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v10 4/6] dts-bindings: leds: Document the naming
 requirement for LED properties
Date: Thu, 10 Oct 2019 12:31:51 +0200
Message-ID: <f281d352-ec3e-f80a-66ea-b955609f2531@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-5-jjhiblot@ti.com> <20191009192628.GA24087@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009192628.GA24087@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, sre@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 09/10/2019 21:26, Rob Herring wrote:
> On Wed, Oct 09, 2019 at 10:51:25AM +0200, Jean-Jacques Hiblot wrote:
>> LED properties must be named "leds" in the same way that PWM, clocks or
>> PHY properties are names respectively "pwms", "clocks" and "phys".
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   .../devicetree/bindings/leds/common.txt       | 20 ++++++++++++++++---
>>   1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>> index 9fa6f9795d50..31b8c1f68d27 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -10,6 +10,9 @@ can influence the way of the LED device initialization, the LED components
>>   have to be tightly coupled with the LED device binding. They are represented
>>   by child nodes of the parent LED device binding.
>>   
>> +LED properties should be named "leds". The exact meaning of each leds
>> +property must be documented in the device tree binding for each device.
>> +
> This is worded oddly. The property is 'leds' and it is always a list of
> phandles to LED device nodes. It is present in an LED consumer device.

How about:

[...]

A LED consumer device has a 'leds' property. This property is always a list
of phandles to LED nodes (child node of a LED device node).

led_device {
     ...

     led0: led@0 {
         ...
     };

     led1: led@1 {
         ...
     };
};

consumer {
     ...
     leds = <led0>, <led1>;
};

>
>>   
>>   Optional properties for child nodes:
>>   - led-sources : List of device current outputs the LED is connected to. The
>> @@ -165,9 +168,20 @@ led-controller@30 {
>>   		function-enumerator = <2>;
>>           };
>>   
>> -        led@3 {
>> +        bkl_led0: led@3 {
>>   		reg = <3>;
>> -		function = LED_FUNCTION_INDICATOR;
>> -		function-enumerator = <3>;
>> +		function = LED_FUNCTION_BACKLIGHT;
>> +		function-enumerator = <1>;
>>           };
>> +
>> +        bkl_led1: led@4 {
>> +		reg = <4>;
>> +		function = LED_FUNCTION_BACKLIGHT;
>> +		function-enumerator = <2>;
>> +        };
>> +};
>> +
>> +
>> +backlight@40 {
> Either needs 'reg' or the unit-address dropped.
>
>> +	leds = <&bkl_led0> , <&bkl_led1>;
> drop the space            ^
>
>>   };
>> -- 
>> 2.17.1
>>
