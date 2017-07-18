From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: gpu: add a power_model optional
 properties for MALI
Date: Tue, 18 Jul 2017 08:58:50 +0800
Message-ID: <3b464bab-2d72-717c-3aa0-410b1e1bd930@rock-chips.com>
References: <1500279271-15249-1-git-send-email-wxt@rock-chips.com>
 <1500279271-15249-3-git-send-email-wxt@rock-chips.com>
 <20170717200733.nax6jfbvs3rjd7t4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717200733.nax6jfbvs3rjd7t4@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rocky.hao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob,

在 2017年07月18日 04:07, Rob Herring 写道:
> On Mon, Jul 17, 2017 at 04:14:28PM +0800, Caesar Wang wrote:
>> This patch adds the MALI's power-model to set the IPA model to be used
>> for power management.
> What's IPA? India Pale Ale or Intermediate Physical Address?

IPA is intelligent Power Allocator.  (As the ARM introduced on 
https://developer.arm.com/open-source/intelligent-power-allocation)

>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>> Changes in v2: None
>>
>>   Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>> index a461e47..b616e6b 100644
>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
>> @@ -37,6 +37,18 @@ Optional properties:
>>   - operating-points-v2 : Refer to Documentation/devicetree/bindings/power/opp.txt
>>     for details.
>>   
>> +- power_model : Sets power model parameters. Note that this model was designed for the Juno
>> +	        platform, and may not be suitable for other platforms. A structure containing :
>> +	- compatible: Should be arm,mali-simple-power-model
>> +	- dynamic-coefficient: Coefficient, in pW/(Hz V^2), which is multiplied
>> +	  by v^2*f to calculate the dynamic power consumption.
>> +	- static-coefficient: Coefficient, in uW/V^3, which is multiplied by
>> +	  v^3 to calculate the static power consumption.
>> +	- ts: An array containing coefficients for the temperature scaling
>> +	  factor. This is used to scale the static power by a factor of
>> +	  tsf/1000000, where tsf = ts[3]*T^3 + ts[2]*T^2 + ts[1]*T + ts[0],
>> +	  and T = temperature in degrees.
>> +	- thermal-zone: A string identifying the thermal zone used for the GPU
> This can all easily be implied by the compatible string. I'm not
> inclined to accept something Mali specific here.

Isn't  arm,mali-midgard.txt document suit for Mali specific? :-)

>
> This looks *very* precise, but I'd be surprised if these values are any
> more than magic values (at least the dynamic coef) adjusted until the
> desired power/performance requirements are achieved. To put it another
> way, why don't we have similar values for CPUs?

These value was calculated by running full GPU process.

CPU had the similar value for dtsi.

Say: arch/arm64/boot/dts/rockchip/rk3399.dtsi
         cpu_b0: cpu@100 {
             ...
             dynamic-power-coefficient = <436>;
             ...
         };

-Caesar

>
> Rob
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
