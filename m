From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: ARM: Fix the Generic Timers interrupt active level
 description
Date: Thu, 27 Nov 2014 15:48:47 +0000
Message-ID: <547747DF.9070402@arm.com>
References: <1417099005-18638-1-git-send-email-Liviu.Dudau@arm.com> <5477389A.8010606@arm.com> <20141127153453.GR828@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141127153453.GR828-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27/11/14 15:34, Liviu Dudau wrote:
> On Thu, Nov 27, 2014 at 02:43:38PM +0000, Marc Zyngier wrote:
>> On 27/11/14 14:36, Liviu Dudau wrote:
>>> The Cortex-A5x TRM states in paragraph "9.2 Generic Timer functional
>>> description" that generic timers provide an active-LOW interrupt
>>> output. Fix the device trees to correctly describe this.
>>>
>>> While doing this update the CPU mask to match the number of described
>>> CPUs as well.
>>>
>>> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>>> ---
>>>
>>> Arnd, Olof: This is on top of linux-next/master as it patches the Juno
>>> as well as all the other ARM DTs.
>>>
>>>  arch/arm64/boot/dts/arm/foundation-v8.dts  | 8 ++++----
>>>  arch/arm64/boot/dts/arm/juno.dts           | 8 ++++----
>>>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts | 8 ++++----
>>>  3 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/boot/dts/arm/foundation-v8.dts
>>> index 4a06090..27f3296 100644
>>> --- a/arch/arm64/boot/dts/arm/foundation-v8.dts
>>> +++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
>>> @@ -78,10 +78,10 @@
>>>  
>>>  	timer {
>>>  		compatible = "arm,armv8-timer";
>>> -		interrupts = <1 13 0xff01>,
>>> -			     <1 14 0xff01>,
>>> -			     <1 11 0xff01>,
>>> -			     <1 10 0xff01>;
>>> +		interrupts = <1 13 0xf08>,
>>> +			     <1 14 0xf08>,
>>> +			     <1 11 0xf08>,
>>> +			     <1 10 0xf08>;
>>>  		clock-frequency = <100000000>;
>>>  	};
>>>  
>>> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
>>> index 097ecc4..cb3073e 100644
>>> --- a/arch/arm64/boot/dts/arm/juno.dts
>>> +++ b/arch/arm64/boot/dts/arm/juno.dts
>>> @@ -98,10 +98,10 @@
>>>  
>>>  	timer {
>>>  		compatible = "arm,armv8-timer";
>>> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
>>> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
>>> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
>>> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>;
>>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
>>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
>>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
>>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
>>>  	};
>>>  
>>>  	pmu {
>>> diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
>>> index 572005e..efc59b3 100644
>>> --- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
>>> +++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
>>> @@ -81,10 +81,10 @@
>>>  
>>>  	timer {
>>>  		compatible = "arm,armv8-timer";
>>> -		interrupts = <1 13 0xff01>,
>>> -			     <1 14 0xff01>,
>>> -			     <1 11 0xff01>,
>>> -			     <1 10 0xff01>;
>>> +		interrupts = <1 13 0xf08>,
>>> +			     <1 14 0xf08>,
>>> +			     <1 11 0xf08>,
>>> +			     <1 10 0xf08>;
>>>  		clock-frequency = <100000000>;
>>>  	};
>>>  
>>>
>>
>> Sorry, but that's wrong. Despite the *cores* having an level-low output,
>> the GIC only triggers on *level-high*. Yes, there is probably an
>> inverter in between.
> 
> BTW, should I also update the bindings example to get this right?

Definitely. I'm pretty sure I got it wrong too at some point...

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
