From: tom burkart <tom@aussec.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pps: descriptor-based gpio,
 capture-clear addition
Date: Sat, 17 Nov 2018 21:35:22 +1100
Message-ID: <20181117213522.12672utznrvpbn56@www.aussec.com>
References: <20181114125432.16044-1-tom@aussec.com>
 <20181114125432.16044-2-tom@aussec.com> <20181116224919.GA18008@bogus>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8;
 DelSp="Yes";
 format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116224919.GA18008@bogus>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring <robh@kernel.org>:

> On Wed, Nov 14, 2018 at 11:54:29PM +1100, Tom Burkart wrote:
>> This patch changes the devicetree bindings for the pps-gpio driver
>> from the integer based ABI to the descriptor based ABI.
> ? That has nothing to do with DT.

I believe it does, as the change in ABI forces a rename in the DT  
naming convention.
This is due to the descriptor based ABI appending "-gpio" or "-gpios" (see
Documentation/gpio/base.txt.)
Admittedly, I may have called it by the wrong name due to ignorance,  
my apologies.

>>  It also adds
>> documentation for the device tree capture-clear option.  The legacy
>> device tree entry for the GPIO pin is supported.
>>
>> Signed-off-by: Tom Burkart <tom@aussec.com>
>> ---
>>  Documentation/devicetree/bindings/pps/pps-gpio.txt | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt  
>> b/Documentation/devicetree/bindings/pps/pps-gpio.txt
>> index 3683874832ae..6c9fc0998d94 100644
>> --- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
>> +++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
>> @@ -5,19 +5,23 @@ a GPIO pin.
>>
>>  Required properties:
>>  - compatible: should be "pps-gpio"
>> -- gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
>> +- pps-gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
>> +Alternatively (DEPRECATED), instead of pps-gpios above, it may have:
>> +- gpios: one PPS GPIO as above
>>
>>  Optional properties:
>>  - assert-falling-edge: when present, assert is indicated by a falling edge
>>                         (instead of by a rising edge)
>> +- capture-clear: when present, also capture the PPS clear event
>
> Is this a h/w thing? or driver configuration?

Driver configuration.  Most of the code was present in the driver, yet  
it was not documented, or usable due to a two line (code) omission  
(the value was not being fetched from DT).

>>
>>  Example:
>>  	pps {
>>  		pinctrl-names = "default";
>>  		pinctrl-0 = <&pinctrl_pps>;
>>
>> -		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
>> +		pps-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
>>  		assert-falling-edge;
>> +		capture-clear;
>>
>>  		compatible = "pps-gpio";
>>  	};
>> --
>> 2.12.3
>>
>
>
