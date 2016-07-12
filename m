From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 7/7] ARM: dts: sun9i: Switch to the AC100 RTC clock
 outputs for osc32k
Date: Tue, 12 Jul 2016 10:02:55 +0800
Message-ID: <CAGb2v66OhH=C5CqB56jN=T4c8TDgyuC=F0689d7=GBhy_rEonA@mail.gmail.com>
References: <1467988422-17934-1-git-send-email-wens@csie.org>
 <1467988422-17934-8-git-send-email-wens@csie.org> <20160711065042.GC4589@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160711065042.GC4589@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-kernel <linux-kernel@vger.kernel.org>, rtc-linux@googlegroups.com, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 11, 2016 at 2:50 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Fri, Jul 08, 2016 at 10:33:42PM +0800, Chen-Yu Tsai wrote:
>> The 32.768 kHz clock inside the A80 SoC is fed from an external source,
>> typically the AC100 RTC module.
>>
>> Make the osc32k placeholder a fixed-factor clock so board dts files can
>> specify its source.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>> Changes since v4: none
>> Changes since v3: none
>> Changes since v2: none
>> Changes since v1: none
>> ---
>>  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 5 +++++
>>  arch/arm/boot/dts/sun9i-a80-optimus.dts     | 5 +++++
>>  arch/arm/boot/dts/sun9i-a80.dtsi            | 9 +++------
>>  3 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>> index cf2f4b72a841..04b014603659 100644
>> --- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>> +++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>> @@ -103,6 +103,11 @@
>>       allwinner,drive = <SUN4I_PINCTRL_40_MA>;
>>  };
>>
>> +&osc32k {
>> +     /* osc32k input is from AC100 */
>> +     clocks = <&ac100_rtc 0>;
>> +};
>> +
>
> I'm guessing that an unresolved dependency when the driver has not
> loaded yet, or is not even compiled ?
>
> How is it working then?

I assume the clk framework will leave it unresolved and unusable.
Also it seems that none of existing clks use it as a parent by
default. I will need to check the remaining unimplemented ones
though.

ChenYu
