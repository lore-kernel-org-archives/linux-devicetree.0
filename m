From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 13/13] dt-bindings: msm/hdmi: Add HDMI PHY bindings
Date: Wed, 24 Feb 2016 17:30:27 +0530
Message-ID: <56CD9B5B.10406@ti.com>
References: <1455519206-12939-1-git-send-email-architt@codeaurora.org>
 <1455519206-12939-14-git-send-email-architt@codeaurora.org>
 <20160222025414.GG15973@rob-hp-laptop> <56CAEBE5.7050605@codeaurora.org>
 <CAL_JsqLcJvBUUt0PRg=WwhUyAyfSuxqUf8NMj1s+s4rAS+S3nA@mail.gmail.com>
 <56CC282F.8030700@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56CC282F.8030700@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Archit,

On Tuesday 23 February 2016 03:06 PM, Archit Taneja wrote:
> 
> 
> On 02/23/2016 12:57 AM, Rob Herring wrote:
>> On Mon, Feb 22, 2016 at 5:07 AM, Archit Taneja <architt@codeaurora.org> wrote:
>>>
>>>
>>> On 02/22/2016 08:24 AM, Rob Herring wrote:
>>>>
>>>> On Mon, Feb 15, 2016 at 12:23:26PM +0530, Archit Taneja wrote:
>>>>>
>>>>> Add HDMI PHY bindings. Update the example to use HDMI PHY.
>>>>>
>>>>> Add a missing power-domains property in the HDMI core bindings.
>>>>>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>
>>>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>>>>> ---
>>>>>    .../devicetree/bindings/display/msm/hdmi.txt       | 39
>>>>> +++++++++++++++++++++-
>>>>>    1 file changed, 38 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt
>>>>> b/Documentation/devicetree/bindings/display/msm/hdmi.txt
>>>>> index 379ee2e..4d71910 100644
>>>>> --- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
>>>>> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
>>>>> @@ -11,6 +11,7 @@ Required properties:
>>>>>    - reg: Physical base address and length of the controller's registers
>>>>>    - reg-names: "core_physical"
>>>>>    - interrupts: The interrupt signal from the hdmi block.
>>>>> +- power-domains: Should be <&mmcc MDSS_GDSC>.
>>>>>    - clocks: device clocks
>>>>>      See ../clocks/clock-bindings.txt for details.
>>>>>    - qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
>>>>> @@ -18,6 +19,7 @@ Required properties:
>>>>>    - qcom,hdmi-tx-hpd-gpio: hpd pin
>>>>>    - core-vdda-supply: phandle to supply regulator
>>>>>    - hdmi-mux-supply: phandle to mux regulator
>>>>> +- qcom,hdmi-phy: phandle to HDMI PHY device node
>>>>
>>>>
>>>> Why not use the generic phy binding?
>>>
>>>
>>> You'd asked about this in the first version of this patch. You
>>> probably missed reading my reply. Partially my fault since I
>>> missed out putting the "In-Reply-to" when posting this set. I've
>>> mentioned the reason again here:
>>>
>>> The PHY in the HDMI and DSI blocks can't be implemented using the
>>> common phy framework. The PHY blocks have a PLL sub-block within
>>> them which acts as a pixel clock source for the display processor
>>> block.
>>
>> That sounds like a problem with the common phy framework, not the DT
>> binding. Nothing says you have to use the common phy f/w if you use
>> the phy binding. I say that as the binding maintainer. As a kernel
>> developer, I would say fix the common phy framework to handle this
>> case. However, I don't think anything prevents the phy driver from
>> registering both a phy and a clock.
> 
> Okay. For some reason, I thought it would be wrong to use the same
> common phy bindings but use our own phy driver.
> 
> I will convert the bindings to the generic phy binding.
> 
>>
>>> This dependency causes the need to split the phy power on sequence
>>> into 2 parts (one to enable resources to enable the PLL, and the
>>> other to enable the phy itself), which the phy framework can't
>>> do. That's the main reason not to use it. There are some more
>>> complex use cases for DSI PHY (drive two PHYs with the same
>>> DSI PLL) which the phy framework can't support.
>>
>> Doesn't the phy framework already support the former? It has power on
>> and init calls. Personally, I find the split there ill-defined.
> 
> I always assumed that the init/exit ops were something that you would
> call just once (during probe/remove) and then forget about it. I only

right, the phy ops were intended to be used that way. However because of
different sequence requirements for different controllers, that's not followed
always.
> now noticed that init and power_on are often paired together (as are
> power_off and exit). I went through the common phy framework code in
> more detail, but I realized I would face the following issue:
> 
> I was looking for the sequence:
> 
> 1. enable PHY resources (enables clocks/regulators/pm_runtime_get_sync)

get_sync is invoked by the phy core during phy_init and phy_power_on (it was
done basically to access registers that have to be configured during init and
power on). regulator is enabled during phy_power_on and clocks (opt func
clocks) should be enable during runtime callbacks in the driver (main clock is
enabled as part of get_sync).
> 
> 2. set_rate/enable the PLL clock provided by PHY

If the PHY is the source of clock, then the PHY should also be modeled as clock
provider. (see rockchip-usb PHY)
> 
> 3. enable PHY (configure some PHY registers)

the general configuration of the PHY should go in phy_init (e.g any calibration
settings) and registers to power_on the PHY should go in phy_power_on.

Thanks
Kishon
