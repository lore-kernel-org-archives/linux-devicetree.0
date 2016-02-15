From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 10/14] ARM: dts: sun8i-a83t: Add PRCM related clocks and resets
Date: Mon, 15 Feb 2016 17:55:49 +0800
Message-ID: <CAGb2v67Wz1EC4=ffZgYPXHiYenwbcbTypqaC3TcP96G1APiNog@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-11-git-send-email-vishnupatekar0510@gmail.com>
 <CAGb2v67iO-816KaLttWRRPL2f7hpfgJ1--p69tD_oOrewmOjCA@mail.gmail.com>
 <CAEzqOZtsdHC2tCgjC=Bj5q3RFip2Uyni8bFC16u03PRLCra5KA@mail.gmail.com>
 <CAGb2v65cfG=cJ91+9G5uS5XcUh0nx6-7ZnMr7RjSGqXPHjyxpQ@mail.gmail.com> <CAGb2v66L-zKYbA7h56bY3y_Jf8wOzmW_puRc+R8tQmVY6u1DZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAGb2v66L-zKYbA7h56bY3y_Jf8wOzmW_puRc+R8tQmVY6u1DZw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mvea>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 5:34 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> On Sat, Feb 13, 2016 at 12:43 AM, Chen-Yu Tsai <wens@csie.org> wrote:
>> On Sat, Feb 13, 2016 at 12:06 AM, Vishnu Patekar
>> <vishnupatekar0510@gmail.com> wrote:
>>> Hello Wens,
>>>
>>>
>>> On Tue, Feb 2, 2016 at 2:44 PM, Chen-Yu Tsai <wens@csie.org> wrote:
>>>> On Sun, Jan 31, 2016 at 9:21 AM, Vishnu Patekar
>>>> <vishnupatekar0510@gmail.com> wrote:
>>>>> This adds A83T PRCM related clocks, clock resets.
>>>>>
>>>>> As a83t apb0 gates clock support is added earlier, this enables it.
>>>>> Apart from apb0 gates, other added clocks are compatible with
>>>>> earlier sun8i socs.
>>>>>
>>>>> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/sun8i-a83t.dtsi | 44 +++++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 44 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
>>>>> index ac96aa1..5ea20ff 100644
>>>>> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
>>>>> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
>>>>> @@ -268,6 +268,44 @@
>>>>>                                              "mmc2_output",
>>>>>                                              "mmc2_sample";
>>>>>                 };
>>>>> +
>>>>> +               cpus_clk: clk@01f01400 {
>>>>> +                       compatible = "allwinner,sun9i-a80-cpus-clk";
>>>>> +                       reg = <0x01f01400 0x4>;
>>>>> +                       #clock-cells = <0>;
>>>>> +                       clocks = <&osc16Md512>, <&osc24M>, <&pll6>, <&osc16M>;
>>>>> +                       clock-output-names = "cpus";
>>>>> +               };
>>>>> +
>>>>> +               ahb0: ahb0_clk {
>>>>> +                       compatible = "fixed-factor-clock";
>>>>> +                       #clock-cells = <0>;
>>>>> +                       clock-div = <1>;
>>>>> +                       clock-mult = <1>;
>>>>> +                       clocks = <&cpus_clk>;
>>>>> +                       clock-output-names = "ahb0";
>>>>> +               };
>>>>> +
>>>>> +               apb0: clk@01f0140c {
>>>>> +                       compatible = "allwinner,sun8i-a23-apb0-clk";
>>>>
>>>> This is actually wrong, as it is wrong in sun9i-a80.dtsi.
>>>> I've sent a patch series for it.
>>> A83T apb0 is different from A80, and it's same as A23, so this should
>>> be correct.
>>> Please correct me in case I'm missing something.
>>
>> My user manual (v1.5.1) says A83T apb0 dividers (page. 246) are
>> /1, /2, /3, /4, while the A23 is /1, /2, /4, /8.
>
> As Vishnu pointed out on IRC, the A23 driver is wrong. They are in fact,
> both one-based dividers. I'll send a patch to fix this.
       ^^^
       zero-based

And for this patch,

Acked-by: Chen-Yu Tsai <wens@csie.org>

>
> ChenYu
>
>> ChenYu
>>
>>>> Also the drivers for "allwinner,sun9i-a80-cpus-clk" and
>>>> "allwinner,sun9i-a80-apbs-clk"
>>>> are only compiled for CONFIG_MACH_SUN9I. Please add a patch to address this.
>>> Okie.
>>>>
>>>> Regards
>>>> ChenYu
>>>>
>>>>> +                       reg = <0x01f0140c 0x4>;
>>>>> +                       #clock-cells = <0>;
>>>>> +                       clocks = <&ahb0>;
>>>>> +                       clock-output-names = "apb0";
>>>>> +               };
>>>>> +
>>>>> +               apb0_gates: clk@01f01428 {
>>>>> +                       compatible = "allwinner,sun8i-a83t-apb0-gates-clk";
>>>>> +                       reg = <0x01f01428 0x4>;
>>>>> +                       #clock-cells = <1>;
>>>>> +                       clocks = <&apb0>;
>>>>> +                       clock-indices = <0>, <1>,
>>>>> +                                       <2>, <3>,
>>>>> +                                       <4>, <6>, <7>;
>>>>> +                       clock-output-names = "apb0_pio", "apb0_ir",
>>>>> +                                       "apb0_timer", "apb0_rsb",
>>>>> +                                       "apb0_uart", "apb0_i2c0", "apb0_twd";
>>>>> +               };
>>>>>         };
>>>>>
>>>>>         soc {
>>>>> @@ -434,5 +472,11 @@
>>>>>                         #interrupt-cells = <3>;
>>>>>                         interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
>>>>>                 };
>>>>> +
>>>>> +               apb0_reset: reset@01f014b0 {
>>>>> +                       reg = <0x01f014b0 0x4>;
>>>>> +                       compatible = "allwinner,sun6i-a31-clock-reset";
>>>>> +                       #reset-cells = <1>;
>>>>> +               };
>>>>>         };
>>>>>  };
>>>>> --
>>>>> 1.9.1
>>>>>
