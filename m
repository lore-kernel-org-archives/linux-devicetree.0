From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: fix the address map for WDT0 and
 WDT1
Date: Fri, 26 Aug 2016 18:49:16 +0800
Message-ID: <57C01EAC.4020501@rock-chips.com>
References: <1472192551-16754-1-git-send-email-zhengxing@rock-chips.com> <607537bf-1c49-d7e0-ead9-8c1e6164e44e@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <607537bf-1c49-d7e0-ead9-8c1e6164e44e-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On 2016年08月26日 17:41, Shawn Lin wrote:
> On 2016/8/26 14:22, Xing Zheng wrote:
>> Dues to incorrect description in the TRM, the WDTs base address
>> should be fixed and swap them like this:
>> WDT0 - 0xff848000
>> WDT1 - 0xff840000
>>
>> And, it is right that only WDT0 can generate global software reset.
>> We will update the TRM to fix it.
>>
>> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>> arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index bc86e8c..f0f52c1 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -1002,9 +1002,9 @@
>> };
>> };
>>
>> - watchdog@ff840000 {
>> + watchdog@ff848000 {
>
> Just a nit, should we mark this explicitly as "watchdog0" ?
> I still need to look up for which wdt you are using.:)
Done.

Thanks.
>
>> compatible = "snps,dw-wdt";
>> - reg = <0x0 0xff840000 0x0 0x100>;
>> + reg = <0x0 0xff848000 0x0 0x100>;
>> clocks = <&cru PCLK_WDT>;
>> interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
>> };
>>
>
>


-- 
- Xing Zheng


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
