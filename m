From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: add ARM Mali GPU node for
 RK3399 SoCs
Date: Wed, 12 Jul 2017 17:16:29 +0800
Message-ID: <3c3a2e24-7cb1-dc31-6532-1d6182bdf3ee@gmail.com>
References: <1499840971-20392-1-git-send-email-wxt@rock-chips.com>
 <1499840971-20392-3-git-send-email-wxt@rock-chips.com>
 <4066931.s766IOqHgB@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4066931.s766IOqHgB@phil>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Roger Chen <roger.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, rocky.hao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017年07月12日 15:19, Heiko Stuebner 写道:
> Hi Caesar,
>
> Am Mittwoch, 12. Juli 2017, 14:29:28 CEST schrieb Caesar Wang:
>> Add Mali GPU device tree node for the RK3399 SoCs, with devfreq
>> opp table.
>>
>> RK3399 and RK3399-OP1 SoCs have a different recommendation table with
>> gpu opp. As the ARM's mali driver found on
>> https://developer.arm.com/products/software/mali-drivers/midgard-kernel.
>>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>>   arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi | 33 ++++++++++++++++++++++++
>>   arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi     | 33 ++++++++++++++++++++++++
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi         | 16 ++++++++++++
>>   3 files changed, 82 insertions(+)
> [...]
>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 1cbd7a2..8c6438b 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -1443,6 +1443,22 @@
>>   		status = "disabled";
>>   	};
>>   
>> +	gpu: gpu@ff9a0000 {
>> +		compatible = "arm,rk3399-mali",
>> +			     "arm,malit860",
>> +			     "arm,malit86x",
>> +			     "arm,malit8xx";
> no wildcards and correct compatibles please.
> The binding specifies arm,mali-t860 for your chip and the soc
> specific compatible needs a rockchip vendor, so you need
>
> 	compatible = "rockchip,rk3399-mali", "arm,mali-t860";
>

Okay,  sound resonable.

>> +		reg = <0x0 0xff9a0000 0x0 0x10000>;
>> +		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
>> +			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>;
>> +		interrupt-names = "GPU", "JOB", "MMU";
> interrupt names are job, mmu, gpu in lower case. The out-of-tree driver
> will need to conform to that.

Okay, we need update the ARM's mali driver to follow up.

>> +		clocks = <&cru ACLK_GPU>;
>> +		clock-names = "clk_mali";
> no clock-names property, as midgard malis only have one clock input

Sorry, I seem to be reference for the MAILI's document, not the Linux 
document.

Update these for patches v2.

Thanks your comments.

-Caesar

>
> Heiko
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
