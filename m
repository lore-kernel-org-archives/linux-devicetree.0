Return-Path: <SRS0=GyMP=OJ=baylibre.com=narmstrong@kernel.org>
Subject: Re: [PATCH v2 0/3] Meson8/Meson8b: introduce a HHI syscon node
From: Neil Armstrong <narmstrong@baylibre.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181030221310.GA22640@bogus>
 <CAFBinCDnB5GiX530eLR5fa6JEZP9GtYDhJq6S7sKMXEtMP5FHQ@mail.gmail.com>
 <CAGb2v65L4Sq1Fxqyffq16Zpamv=WosgvCaXdVYH6ooLLmHW0SQ@mail.gmail.com>
 <5440e173-3bd1-9ce2-ea9e-cc95b909d4a8@baylibre.com>
Message-ID: <4121c572-e30e-60ad-9d35-f323b5119abb@baylibre.com>
Date: Fri, 30 Nov 2018 11:04:40 +0100
MIME-Version: 1.0
In-Reply-To: <5440e173-3bd1-9ce2-ea9e-cc95b909d4a8@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Chen-Yu Tsai <wens@csie.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 08/11/2018 15:42, Neil Armstrong wrote:
> On 01/11/2018 11:20, Chen-Yu Tsai wrote:
>> On Thu, Nov 1, 2018 at 6:10 PM Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>>
>>> Hi Rob,
>>>
>>> On Tue, Oct 30, 2018 at 11:13 PM Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Sun, Oct 28, 2018 at 01:08:56PM +0100, Martin Blumenstingl wrote:
>>>>> The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
>>>>> as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
>>>>> There is a register area called "HHI" which is used for multiple IP
>>>>> blocks of the SoC:
>>>>> - the system clock controller
>>>>> - a few reset lines (there is a separate reset controller, these reset
>>>>>   lines are not part of the other reset controller). this reset
>>>>>   controller is currently implemented in the clock controller driver
>>>>> - a HDMI controller
>>>>
>>>> Does this have it's own clocks, resets or other resources?
> 
> [...]
> 
>>>>>
>>>>> The first three could be implemented with a single node (either in one
>>>>> big driver, or using a MFD driver which would register function-
>>>>> specific drivers).
>>>>> However, the TSC data is a big problem, because the ADC has it's own
>>>>> set of registers but needs to write one bit in the HHI register area.
>>>>
>>>> Generally, that would be solved with a phandle to the HHI and maybe an
>>>> offset cell in the ADC node. I don't see why that's a big problem.
>>> this is what I'm trying to do, see my dt-bindings patch for the SAR
>>> ADC (which is used to read the temperature sensor): [0]
>>> my understanding was that I should go through syscon to avoid double
>>> ioremap() of the same register set (the clock controller and SAR ADC
>>> would have to do it).
>>> which APIs (other than syscon) would you suggest for this case?
>>
>> I would suggest avoiding the syscon API when you have other drivers going
>> through the same register space. You can do a syscon like approach by
>> having the HHI driver register one or multiple regmaps, with appropriate
>> access controls, which other drivers can fetch using dev_get_regmap() (via
>> a phandle to the HHI device). I don't know much about simple-mfd though.
>> If the registers are neatly grouped together by function it would be easier
>> to deal with. Or you could just have one device node with appropriate cell
>> properties and have a big driver register all the functions. That driver
>> would likely live under drivers/soc/.
> 
> Well, it's the role of simple-mfd, when you only have plaform-tied sub drivers,
> and it's over-engineered to write an MFD driver for this.
> 
> At some point, we should move forward with this since it's a "system controller"
> specific mapping, and "syscon" was designed specifically to solve this kind
> of mapping in DT.
> 
> The other SoCs (GX, AXG and G12A) uses this exact DT architecture to solve this
> issue, and we should use this same schema for other Amlogic SoCs even if it's
> not the most perfect way to solve it.

Considering the "syscon" and "simple-mfd" bindings documentation not marked
deprecated, and that the whole Amlogic architecture (and new SoCs support)
is already using this design, I don't see any reason not aligning the
Meson8 & Meson8b clk support on the ARM64 variants scheme.

I do act we will need to avoid syscon for *new* driver and DT designs.

Applied on next/drivers for 4.21

Neil

> 
> Neil
> 
>>
>> ChenYu
>>
>>>
>>> Regards
>>> Martin
>>>
>>>
>>> [0] https://patchwork.kernel.org/patch/10658557/
>>> [1] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_hw.c
>>> [2] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_reg.c
>>> [3] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/include/mach/register.h
> 
