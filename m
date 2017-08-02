From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [linux-sunxi] [PATCH 07/13] ARM: sun8i: h3: add display engine
 pipeline barebone
Date: Wed, 02 Aug 2017 13:07:55 +0800
Message-ID: <fcbff773f61061bbc0f1d6ffef2a7c35@aosc.io>
References: <20170801131304.7741-1-icenowy@aosc.io>
 <20170801131304.7741-8-icenowy@aosc.io> <1773537.vAqre0jhCE@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1773537.vAqre0jhCE@jernej-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-08-02 12:47，Jernej Škrabec 写道：
> Hi Icenowy,
> 
> Dne torek, 01. avgust 2017 ob 15:12:58 CEST je Icenowy Zheng 
> napisal(a):
>> As we have already the support for the DE2 on Allwinner H3, add the
>> display engine pipeline device tree nodes to its DTSI file.
>> 
>> The H5 pipeline has some differences and will be enabled later.
>> 
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-h3.dtsi | 170
>> ++++++++++++++++++++++++++++++++++++++++ 1 file changed, 170 
>> insertions(+)
>> 
>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
>> b/arch/arm/boot/dts/sun8i-h3.dtsi index b36f9f423c39..75ad7b65a7fc 
>> 100644
>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>> @@ -41,6 +41,8 @@
>>   */
>> 
>>  #include "sunxi-h3-h5.dtsi"
>> +#include <dt-bindings/clock/sun8i-de2.h>
>> +#include <dt-bindings/reset/sun8i-de2.h>
>> 
>>  / {
>>  	cpus {
>> @@ -72,6 +74,174 @@
>>  		};
>>  	};
>> 
>> +	de: display-engine {
>> +		compatible = "allwinner,sun8i-h3-display-engine";
>> +		allwinner,pipelines = <&mixer0>,
>> +				      <&mixer1>;
>> +		status = "disabled";
>> +	};
>> +
>> +	soc {
>> +		display_clocks: clock@1000000 {
>> +			compatible = "allwinner,sun8i-a83t-de2-clk";
>> +			reg = <0x01000000 0x100000>;
>> +			clocks = <&ccu CLK_BUS_DE>,
>> +				 <&ccu CLK_DE>;
>> +			clock-names = "bus",
>> +				      "mod";
>> +			resets = <&ccu RST_BUS_DE>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			assigned-clocks = <&ccu CLK_DE>;
>> +			assigned-clock-parents = <&ccu CLK_PLL_DE>;
>> +			assigned-clock-rates = <432000000>;
>> +		};
> 
> I believe Maxime ask you to use clk_set_rate() in the past:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2017-June/512909.html

Yes, but I think the frequency is still part of our configuration, not 
forced
by the hardware.

If we set it in the driver, why don't we set it to 300MHz?

(In fact for pipelines without TVE we can really use 300MHz for CLK_DE, 
and if
we do not want 4K we can even use lower frequency)

> 
> Regards,
> Jernej
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
