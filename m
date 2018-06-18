From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH linux-next v5 07/13] dt-bindings: mfd: Add a document for
 PECI client mfd
Date: Mon, 18 Jun 2018 10:11:58 -0700
Message-ID: <fa5a5714-f363-93df-4314-a140eb85747a@linux.intel.com>
References: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
 <20180613061637.GI5278@dell>
 <2b5bbf01-8c9c-bb06-4559-00dae61d95de@linux.intel.com>
 <20180618060306.GD31141@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618060306.GD31141@dell>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, James Feist <james.feist@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Joel Stanley <joel@jms.id.au>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On 6/17/2018 11:03 PM, Lee Jones wrote:
> On Thu, 14 Jun 2018, Jae Hyun Yoo wrote:
> 
> [...]
> 
>>>> +Example:
>>>> +	peci-bus@0 {
>>>
>>> 0?
>>>
>>
>> Because the actual reg value of the peci bus is reg = <0x0 0x60> but
>> anyway it's an example.
>>
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <0>;
>>>
>>> No 'reg' property?
> 
> 0 is fine, but you really should have a 'reg' property.
> 

Okay, I'll add reg setting example.

>> This is the actual peci bus node which is a parent of this MFD node:
>> 	peci0: peci-bus@0 {
>> 		compatible = "aspeed,ast2500-peci";
>> 		reg = <0x0 0x60>;
>> 		#address-cells = <1>;
>> 		#size-cells = <0>;
>> 		interrupts = <15>;
>> 		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
>> 		resets = <&syscon ASPEED_RESET_PECI>;
>> 		clock-frequency = <24000000>;
>> 		msg-timing = <1>;
>> 		addr-timing = <1>;
>> 		rd-sampling-point = <8>;
>> 		cmd-timeout-ms = <1000>;
>> 	};
>>
>>>> +		< more properties >
>>>
>>> Remove this.
>>
>> I dropped all other properties into < more properties > because I want
>> to show the #address-cells and #size-cells to state its sub-nodes
>> should have a single unique reg value. Should I remove this line or the
>> whole parent node?
> 
> Just drop the properties which are unimportant for the example.  You
> do not need to replace them with anything, especially with a non-DT
> compliant string.
> 

Okay, I'll fix it. Thanks a lot!

>>>> +		peci-client@30 {
>>>> +			compatible = "intel,peci-client", "simple-mfd";
>>>> +			reg = <0x30>;
>>>> +		};
>>>> +
>>>> +		peci-client@31 {
>>>> +			compatible = "intel,peci-client", "simple-mfd";
>>>> +			reg = <0x31>;
>>>> +		};
>>>> +	};
>>>
> 
