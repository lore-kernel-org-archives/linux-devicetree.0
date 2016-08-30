From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly set pclk_pmu_src on
 rk3399
Date: Tue, 30 Aug 2016 08:59:31 +0800
Message-ID: <57C4DA73.5000505@rock-chips.com>
References: <1472494284-11315-1-git-send-email-dianders@chromium.org> <20160829181841.GA8682@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160829181841.GA8682@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>, Douglas Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, zhengxing@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, wxt@rock-chips.com, jay.xu@rock-chips.com, david.wu@rock-chips.com, yamada.masahiro@socionext.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 08/30/2016 02:18 AM, Brian Norris wrote:
> On Mon, Aug 29, 2016 at 11:11:24AM -0700, Doug Anderson wrote:
>> On rk3399 we explicitly set ppll in the device tree to 676000000.  The
>> ppll has one major child, pclk_pmu_src, that is the parent of lots of
>> other clocks.  Right now nobody is setting that clock rate and we're
>> relying on the divider to just happen to be something sane.  Let's be
>> explicit in our request so we're not relying on the firmware.
>>
>> With the current firmware I tested with this patch has no expected
>> impact but it's probably good to do anyway.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 62d450935a57..ffb3faa8c176 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -908,8 +908,8 @@
>>   		reg = <0x0 0xff750000 0x0 0x1000>;
>>   		#clock-cells = <1>;
>>   		#reset-cells = <1>;
>> -		assigned-clocks = <&pmucru PLL_PPLL>;
>> -		assigned-clock-rates = <676000000>;
>> +		assigned-clocks = <&pmucru PLL_PPLL>, <&pmucru PCLK_SRC_PMU>;
>> +		assigned-clock-rates = <676000000>, <112666667>;
>
> I think this makes sense and is a good idea. One alternative would be to
> have the various children actually set a rate that they expect, but
> several of them don't have a separate driver at all, and that would be
> of dubious value anyway I think.

I agree with you. This clk default div is set in the uboot or coreboot.
And if is need to set in kernel ,I hope the freq is 50M(<48285714>).
This freq can meet the performance,and the power consumption is not too 
much.
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
>
>>   	};
>>
>>   	cru: clock-controller@ff760000 {
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>
>
>
