From: kgunda@codeaurora.org
Subject: Re: [PATCH V6 3/8] backlight: qcom-wled: Add new properties for
 PMI8998
Date: Tue, 15 Oct 2019 14:24:39 +0530
Message-ID: <2500384590b9f01116fc8ddf8f1b20b9@codeaurora.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-4-git-send-email-kgunda@codeaurora.org>
 <3836b382-a4e6-d6db-9667-1851a9cf0112@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3836b382-a4e6-d6db-9667-1851a9cf0112@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-10-01 20:42, Dan Murphy wrote:
> Kiran
> 
> On 9/30/19 1:39 AM, Kiran Gunda wrote:
>> Update the bindings with the new properties used for
>> PMI8998.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>> ---
>>   .../bindings/leds/backlight/qcom-wled.txt          | 76 
>> ++++++++++++++++++----
>>   1 file changed, 62 insertions(+), 14 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt 
>> b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>> index 14f28f2..9d840d5 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>> @@ -20,8 +20,7 @@ platforms. The PMIC is connected to the host 
>> processor via SPMI bus.
>>   - default-brightness
>>   	Usage:        optional
>>   	Value type:   <u32>
>> -	Definition:   brightness value on boot, value from: 0-4095
>> -		      Default: 2048
>> +	Definition:   brightness value on boot, value from: 0-4095.
>>     - label
>>   	Usage:        required
>> @@ -48,20 +47,24 @@ platforms. The PMIC is connected to the host 
>> processor via SPMI bus.
>>   - qcom,current-limit
>>   	Usage:        optional
>>   	Value type:   <u32>
>> -	Definition:   mA; per-string current limit
>> -		      value: For pm8941: from 0 to 25 with 5 mA step
>> -			     Default 20 mA.
>> -			     For pmi8998: from 0 to 30 with 5 mA step
>> -			     Default 25 mA.
>> +	Definition:   mA; per-string current limit; value from 0 to 25 with
>> +		      1 mA step.
>> +		      This property is supported only for pm8941.
>> +
>> +- qcom,current-limit-microamp
>> +	Usage:        optional
>> +	Value type:   <u32>
>> +	Definition:   uA; per-string current limit; value from 0 to 30000 
>> with
>> +		      2500 uA step.
>>     - qcom,current-boost-limit
>>   	Usage:        optional
>>   	Value type:   <u32>
>>   	Definition:   mA; boost current limit.
>>   		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
>> -		      1680. Default: 805 mA
>> +		      1680.
>>   		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
>> -		      1500. Default: 970 mA
>> +		      1500.
>>     - qcom,switching-freq
>>   	Usage:        optional
>> @@ -69,22 +72,66 @@ platforms. The PMIC is connected to the host 
>> processor via SPMI bus.
>>   	 Definition:   kHz; switching frequency; one of: 600, 640, 685, 
>> 738,
>>   		       800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200,
>>   		       4800, 9600.
>> -		       Default: for pm8941: 1600 kHz
>> -				for pmi8998: 800 kHz
>>     - qcom,ovp
>>   	Usage:        optional
>>   	Value type:   <u32>
>>   	Definition:   V; Over-voltage protection limit; one of:
>> -		      27, 29, 32, 35. default: 29V
>> +		      27, 29, 32, 35.
>>   		      This property is supported only for PM8941.
>>   +- qcom,ovp-millivolt
>> +	Usage:        optional
>> +	Value type:   <u32>
>> +	Definition:   mV; Over-voltage protection limit;
>> +		      For pmi8998: one of 18100, 19600, 29600, 31100
>> +		      If this property is not specified for PM8941, it
>> +		      falls back to "qcom,ovp" property.
>> +
>>   - qcom,num-strings
>>   	Usage:        optional
>>   	Value type:   <u32>
>>   	Definition:   #; number of led strings attached;
>> -		      value from 1 to 3. default: 2
>> -		      This property is supported only for PM8941.
>> +		      value: For PM8941 from 1 to 3.
>> +			     For PMI8998 from 1 to 4.
> 
> We probably don't need this since we define 1 led node per output. 
> And if you need to define
> 
> multiple strings per node then you use led-sources.
> 
> Then you will use fwnode_property_count_u32(child, "led-sources"); to
> get the number of outputs
> 
> 
I have kept this property as is to have the backward compatibility with 
pm8941-wled.
The backward compatibility is broken if this property is removed.

>> +
>> +- interrupts
>> +	Usage:        optional
>> +	Value type:   <prop encoded array>
>> +	Definition:   Interrupts associated with WLED. This should be
>> +		      "short" and "ovp" interrupts. Interrupts can be
>> +		      specified as per the encoding listed under
>> +		      Documentation/devicetree/bindings/spmi/
>> +		      qcom,spmi-pmic-arb.txt.
>> +
>> +- interrupt-names
>> +	Usage:        optional
>> +	Value type:   <string>
>> +	Definition:   Interrupt names associated with the interrupts.
>> +		      Must be "short" and "ovp". The short circuit detection
>> +		      is not supported for PM8941.
>> +
>> +- qcom,enabled-strings
>> +	Usage:        optional
>> +	Value tyoe:   <u32 array>
>> +	Definition:   Array of the WLED strings numbered from 0 to 3. Each
>> +		      string of leds are operated individually. Specify the
>> +		      list of strings used by the device. Any combination of
>> +		      led strings can be used.
> 
> We usually use the reg property per led node to denote what output is
> associated with which
> 
> property node.  And if you want to define multiple outputs per node
> then you need to use
> 
> led-sources
> 
> See leds-lm3697.txt for an example
> 
> Dan
As per the Qualcomm hardware recommendation , all the strings (leds) 
properties like
OVP, FSC and brightness etc .. should have the same values. That's why 
all the strings (leds)
and it's properties are mentioned in a single node.
