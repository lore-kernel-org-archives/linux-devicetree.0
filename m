From: Matheus Castello <matheus@castello.eng.br>
Subject: Re: [PATCH v2 2/4] dt-bindings: power: supply: Max17040: Add low
 level SOC alert threshold
Date: Sun, 26 May 2019 20:13:31 -0300
Message-ID: <bca953be-8e9e-b20c-abeb-42f3615c7ddb@castello.eng.br>
References: <CAJKOXPfvs=uETF0-xpwCWc5khSpWjpz2zz354Jcx1bVjm9cG2A@mail.gmail.com>
 <20190415012635.6369-1-matheus@castello.eng.br>
 <20190415012635.6369-3-matheus@castello.eng.br>
 <20190429221353.GA25837@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429221353.GA25837@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: sre@kernel.org, krzk@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, b.zolnierkie@samsung.com, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/29/19 7:13 PM, Rob Herring wrote:
> On Sun, Apr 14, 2019 at 10:26:33PM -0300, Matheus Castello wrote:
>> For configure low level state of charge threshold alert signaled from
>> max17040 we add "maxim,alert-soc-level" property.
>>
>> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
>> ---
>>   .../power/supply/max17040_battery.txt         | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/power/supply/max17040_battery.txt
>>
>> diff --git a/Documentation/devicetree/bindings/power/supply/max17040_battery.txt b/Documentation/devicetree/bindings/power/supply/max17040_battery.txt
>> new file mode 100644
>> index 000000000000..9b2cc67d556f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/supply/max17040_battery.txt
>> @@ -0,0 +1,24 @@
>> +max17040_battery
>> +~~~~~~~~~~~~~~~~
>> +
>> +Required properties :
>> + - compatible : "maxim,max17040" or "maxim,max77836-battery"
> 
> This is really a charger, not a battery.
> 

max17040 is a fuel gauge, max77836 MUIC has it integrated. Because of 
this we use it in the compatible list.

>> +
>> +Optional properties :
>> +- maxim,alert-soc-level :	The alert threshold that sets the state of
>> + 				charge level where an interrupt is generated.
>> +                          	Can be configured from 1 up to 32. If skipped
>> +				the power up default value of 4 will be used.
> 
> Units? This is a low or high alert? Does a common property make sense
> here?
> 

It is a low level alert. I will change the name of the property to 
"maxim,alert-low-soc-level" to make this clear and I will put the 
percent unit in the description.

I do not find any common property that I can use here, if I am wrong let 
me know.

>> +- interrupt-parent : 		The GPIO bank from the interrupt line.
> 
> Drop this. interrupt-parent is implied.

Ok, I will do.

> 
>> +- interrupts : 			Interrupt line see Documentation/devicetree/
>> +				bindings/interrupt-controller/interrupts.txt
>> +
>> +Example:
>> +
>> +	battery-charger@36 {
>> +		compatible = "maxim,max17040";
>> +		reg = <0x36>;
>> +		maxim,alert-soc-level = <10>;
>> +		interrupt-parent = <&gpio7>;
>> +		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> 
> Usually there are battery properties that need to be described too...
> 

I will fix this for "battery-fuel-gauge@36". I will also add the 
description for wake-source as optional property.

Thanks.

Best Regards,
Matheus Castello

>> +	};
>> -- 
>> 2.17.0
>>
