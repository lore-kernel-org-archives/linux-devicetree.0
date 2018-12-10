Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47544 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbeLJNpA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Dec 2018 08:45:00 -0500
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
Message-ID: <45fc55d2-8c8c-e831-cdaa-970d382a432f@ti.com>
Date: Mon, 10 Dec 2018 15:46:35 +0200
MIME-Version: 1.0
In-Reply-To: <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Cc: =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 10/12/2018 11.53, Peter Ujfalusi wrote:
> 
> 
> On 10/12/2018 9.05, Peter Ujfalusi wrote:
>> Tony,
>>
>> On 06/12/2018 1.03, Tony Lindgren wrote:
>>> Earlier attempt to move am335x mcasp to probe with ti-sysc
>>> interconnect target module caused audio to stop working and and
>>> the dts changes were reverted by commit 5d2632a577ba ("ARM: dts:
>>> Revert am335x mcasp ti-sysc changes").
>>>
>>> Turns out we were missing the l3 data port ranges for mcasp. This
>>> caused mcasp dma to attempt to use wrong port address. So let's
>>> try again essentially reverting the earlier revert and adding the
>>> missing l3 data port ranges.
>>>
>>> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>>
>>> Peter, can you please test with your bbb + audio cape?
>>
>> Works fine on bbb + audio cape.
>> For some reason my am335x-evm-sk is not booting up at all w/ linux-next,
>> but I believe it is not related to this (disabled audio and still not
>> booting).
> 
> bisect on next-20181207 (am335x-evm-sk) points to:
> Author: Tony Lindgren <tony@atomide.com>
> 87fc89ced3a78f7f0845afab1934d509ef4ad0f2
> ARM: dts: am335x: Move l4 child devices to probe them with ti-sysc
> 
> when looking for the non booting of am335x-evm-sk (nothing printed on
> serial after stating kernel).
> 
> However there is another issue: the kernel boots, but ethernet is not
> working in the kernel. That is pointing to:
> Author: Tero Kristo <t-kristo@ti.com>
> 69fd70c7ff31d3f00833c472c3994a02bb0ab287
> ARM: dts: am33xx: convert to use new clkctrl layout
> 
> any idea what might causes these?

Things definitely go wrong at 69fd70c7ff31d3f00833c472c3994a02bb0ab287:

git checkout -b blah 69fd70c7ff31d3f00833c472c3994a02bb0ab287
# can not mount the rootfs via nfs

git revert 69fd70c7ff31d3f00833c472c3994a02bb0ab287
# boots up via nfs rootfs.

At commit 69fd70c7ff31d3f00833c472c3994a02bb0ab287 the bbb is not
booting via nfs rootfs either.

Can not find where the ethernet started to work after these on bbb, but
it does work on top of next-20181207.

> 
>>
>> Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>
>>>
>>> ---
>>>  arch/arm/boot/dts/am33xx-l4.dtsi | 42 +++++++++++++++++++++++++++-----
>>>  arch/arm/boot/dts/am33xx.dtsi    | 29 ----------------------
>>>  2 files changed, 36 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
>>> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
>>> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
>>> @@ -824,7 +824,9 @@
>>>  	ranges = <0x00000000 0x48000000 0x100000>,	/* segment 0 */
>>>  		 <0x00100000 0x48100000 0x100000>,	/* segment 1 */
>>>  		 <0x00200000 0x48200000 0x100000>,	/* segment 2 */
>>> -		 <0x00300000 0x48300000 0x100000>;	/* segment 3 */
>>> +		 <0x00300000 0x48300000 0x100000>,	/* segment 3 */
>>> +		 <0x46000000 0x46000000 0x400000>,	/* l3 data port */
>>> +		 <0x46400000 0x46400000 0x400000>;	/* l3 data port */
>>>  
>>>  	segment@0 {					/* 0x48000000 */
>>>  		compatible = "simple-bus";
>>> @@ -881,7 +883,9 @@
>>>  			 <0x000cc000 0x000cc000 0x001000>,	/* ap 89 */
>>>  			 <0x000cd000 0x000cd000 0x001000>,	/* ap 90 */
>>>  			 <0x000ca000 0x000ca000 0x001000>,	/* ap 91 */
>>> -			 <0x000cb000 0x000cb000 0x001000>;	/* ap 92 */
>>> +			 <0x000cb000 0x000cb000 0x001000>,	/* ap 92 */
>>> +			 <0x46000000 0x46000000 0x400000>,	/* l3 data port */
>>> +			 <0x46400000 0x46400000 0x400000>;	/* l3 data port */
>>>  
>>>  		target-module@8000 {			/* 0x48008000, ap 6 10.0 */
>>>  			compatible = "ti,sysc";
>>> @@ -1055,8 +1059,21 @@
>>>  			clock-names = "fck";
>>>  			#address-cells = <1>;
>>>  			#size-cells = <1>;
>>> -			ranges = <0x0 0x38000 0x2000>;
>>> -			status = "disabled";
>>> +			ranges = <0x0 0x38000 0x2000>,
>>> +				 <0x46000000 0x46000000 0x400000>;
>>> +
>>> +			mcasp0: mcasp@0 {
>>> +				compatible = "ti,am33xx-mcasp-audio";
>>> +				reg = <0x0 0x2000>,
>>> +				      <0x46000000 0x400000>;
>>> +				reg-names = "mpu", "dat";
>>> +				interrupts = <80>, <81>;
>>> +				interrupt-names = "tx", "rx";
>>> +				status = "disabled";
>>> +				dmas = <&edma 8 2>,
>>> +					<&edma 9 2>;
>>> +				dma-names = "tx", "rx";
>>> +			};
>>>  		};
>>>  
>>>  		target-module@3c000 {			/* 0x4803c000, ap 20 32.0 */
>>> @@ -1073,8 +1090,21 @@
>>>  			clock-names = "fck";
>>>  			#address-cells = <1>;
>>>  			#size-cells = <1>;
>>> -			ranges = <0x0 0x3c000 0x2000>;
>>> -			status = "disabled";
>>> +			ranges = <0x0 0x3c000 0x2000>,
>>> +				 <0x46400000 0x46400000 0x400000>;
>>> +
>>> +			mcasp1: mcasp@0 {
>>> +				compatible = "ti,am33xx-mcasp-audio";
>>> +				reg = <0x0 0x2000>,
>>> +				      <0x46400000 0x400000>;
>>> +				reg-names = "mpu", "dat";
>>> +				interrupts = <82>, <83>;
>>> +				interrupt-names = "tx", "rx";
>>> +				status = "disabled";
>>> +				dmas = <&edma 10 2>,
>>> +					<&edma 11 2>;
>>> +				dma-names = "tx", "rx";
>>> +			};
>>>  		};
>>>  
>>>  		target-module@40000 {			/* 0x48040000, ap 22 1e.0 */
>>> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
>>> --- a/arch/arm/boot/dts/am33xx.dtsi
>>> +++ b/arch/arm/boot/dts/am33xx.dtsi
>>> @@ -440,36 +440,7 @@
>>>  			       <&edma 5 0>;
>>>  			dma-names = "tx", "rx";
>>>  		};
>>> -
>>> -		mcasp0: mcasp@48038000 {
>>> -			compatible = "ti,am33xx-mcasp-audio";
>>> -			ti,hwmods = "mcasp0";
>>> -			reg = <0x48038000 0x2000>,
>>> -			      <0x46000000 0x400000>;
>>> -			reg-names = "mpu", "dat";
>>> -			interrupts = <80>, <81>;
>>> -			interrupt-names = "tx", "rx";
>>> -			status = "disabled";
>>> -			dmas = <&edma 8 2>,
>>> -				<&edma 9 2>;
>>> -			dma-names = "tx", "rx";
>>> -		};
>>> -
>>> -		mcasp1: mcasp@4803c000 {
>>> -			compatible = "ti,am33xx-mcasp-audio";
>>> -			ti,hwmods = "mcasp1";
>>> -			reg = <0x4803C000 0x2000>,
>>> -			      <0x46400000 0x400000>;
>>> -			reg-names = "mpu", "dat";
>>> -			interrupts = <82>, <83>;
>>> -			interrupt-names = "tx", "rx";
>>> -			status = "disabled";
>>> -			dmas = <&edma 10 2>,
>>> -				<&edma 11 2>;
>>> -			dma-names = "tx", "rx";
>>> -		};
>>>  	};
>>> -
>>>  };
>>>  
>>>  #include "am33xx-l4.dtsi"
>>>
>>
>> - Péter
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>
> 
> - Péter
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
