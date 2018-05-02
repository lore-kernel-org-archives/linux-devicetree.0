From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] Re: [PATCH 02/21] arm64: dts: allwinner: a64: Add DE2 CCU
Date: Wed, 02 May 2018 19:55:25 +0800
Message-ID: <918A5AB7-E83F-40BD-9C4C-772230F798CF@aosc.io>
References: <20180430114058.5061-1-jagan@amarulasolutions.com> <20180430114058.5061-3-jagan@amarulasolutions.com> <20180502113250.5i2eyzv237t5oyl6@flea> <DF02AB5F-D4A5-4198-B455-FEE880CF83CE@aosc.io> <CAD6G_RQ3HmHBjwcUoCCth5TwVy5ygx_KwRmRjrkpwoOpvy7vvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD6G_RQ3HmHBjwcUoCCth5TwVy5ygx_KwRmRjrkpwoOpvy7vvQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Jagan Teki <jagannadh.teki@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Maxime Ripard <maxime.ripard@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



于 2018年5月2日 GMT+08:00 下午7:50:19, Jagan Teki <jagannadh.teki@gmail.com> 写到:
>On Wed, May 2, 2018 at 5:04 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
>>
>>
>> 于 2018年5月2日 GMT+08:00 下午7:32:50, Maxime Ripard
><maxime.ripard@bootlin.com> 写到:
>>>On Mon, Apr 30, 2018 at 05:10:39PM +0530, Jagan Teki wrote:
>>>> DE2 in A64 has clock control unit and behavior is
>>>> same like H3/H5, so reuse the same in A64.
>>>>
>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>> ---
>>>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 15 +++++++++++++++
>>>>  1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> index 1b2ef28c42bd..67b80bbe5bf5 100644
>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>> @@ -43,9 +43,11 @@
>>>>   */
>>>>
>>>>  #include <dt-bindings/clock/sun50i-a64-ccu.h>
>>>> +#include <dt-bindings/clock/sun8i-de2.h>
>>>>  #include <dt-bindings/clock/sun8i-r-ccu.h>
>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>  #include <dt-bindings/reset/sun50i-a64-ccu.h>
>>>> +#include <dt-bindings/reset/sun8i-de2.h>
>>>>
>>>>  / {
>>>>      interrupt-parent = <&gic>;
>>>> @@ -168,6 +170,19 @@
>>>>              #size-cells = <1>;
>>>>              ranges;
>>>>
>>>> +            display_clocks: clock@1000000 {
>>>> +                    compatible = "allwinner,sun50i-a64-de2-clk",
>>>> +                                 "allwinner,sun50i-h5-de2-clk";
>>>
>>>The A64 was released before the H5, so that should be the other way
>>>around.
>>>
>>>> +                    reg = <0x01000000 0x100000>;
>>>> +                    clocks = <&ccu CLK_DE>,
>>>> +                             <&ccu CLK_BUS_DE>;
>>>> +                    clock-names = "mod",
>>>> +                                  "bus";
>>>> +                    resets = <&ccu RST_BUS_DE>;
>>>> +                    #clock-cells = <1>;
>>>> +                    #reset-cells = <1>;
>>>> +            };
>>>> +
>>>
>>>So it turns out we don't need the SRAM to access the CCU driver?
>>
>> As now U-Boot claims SRAM, people may forget thus :-(
>
>I've sent few mails about how we represent de2 with sram_c [1] but
>none response after. Can I get further inputs so-that we can include
>sram_c in proper manner.

Please wait for the SRAMC driver sent by Chen-Yu (and commited
by me) and the DE2 bus driver pending for the SRAMC part.

>
>[1] https://patchwork.kernel.org/patch/10289737/
>
>Jagan.
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
