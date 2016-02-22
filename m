From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] drm/msm/dsi: Parse DSI lanes via DT
Date: Mon, 22 Feb 2016 14:10:52 -0600
Message-ID: <CAL_JsqLVd3vLGO8SCQv=PFXb7yD42U_nKG=fxenc4Fy63yiezw@mail.gmail.com>
References: <1455541259-8967-1-git-send-email-architt@codeaurora.org>
 <1455541259-8967-7-git-send-email-architt@codeaurora.org> <20160222025345.GB15973@rob-hp-laptop>
 <56CAB678.3080505@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56CAB678.3080505@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2016 at 1:19 AM, Archit Taneja <architt@codeaurora.org> wrote:
>
>
> On 02/22/2016 08:23 AM, Rob Herring wrote:
>>
>> On Mon, Feb 15, 2016 at 06:30:59PM +0530, Archit Taneja wrote:
>>>
>>> The DSI driver is currently unaware of how the DSI clock and data pins
>>> are mapped to the logical lanes provided by the DSI controller.
>>>
>>> Use the generic 'lanes' DT binding provided for DSI lanes (used for DSI
>>> in bindings/display/ti/ti,omap4-dss.txt) to get the desired mapping.
>>>
>>> The MSM DSI controller is restricted in terms of what all mappings
>>> it can support. The lane polarity is fixed for all the lanes, the clock
>>> lanes are fixed, and the data lanes can be swapped among each other only
>>> for a few combinations. Apply these restrictions when we parse the DT
>>> data.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>>
>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>>> ---
>>>   .../devicetree/bindings/display/msm/dsi.txt        |  26 +++-
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c                 | 146
>>> ++++++++++++++++++---
>>>   2 files changed, 149 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> b/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> index e7423be..f0d8b6f 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> @@ -44,9 +44,28 @@ Optional properties:
>>>   - pinctrl-names: the pin control state names; should contain "default"
>>>   - pinctrl-0: the default pinctrl state (active)
>>>   - pinctrl-n: the "sleep" pinctrl state
>>> -- port: DSI controller output port. This contains one endpoint subnode,
>>> with its
>>> -  remote-endpoint set to the phandle of the connected panel's endpoint.
>>> -  See Documentation/devicetree/bindings/graph.txt for device graph info.
>>> +- port: DSI controller output port, containing one endpoint subnode.
>>> +
>>> +  DSI Endpoint properties:
>>> +  - remote-endpoint: set to phandle of the connected panel's endpoint.
>>> +    See Documentation/devicetree/bindings/graph.txt for device graph
>>> info.
>>> +  - lanes: list of pin numbers for the DSI lanes: CLKp, CLKn, DATA0p,
>>> DATA0n,
>>> +    DATA1p, DATA1n, ...
>>> +    This provides a physical to logical mapping of the DSI lanes. The
>>> CLKp and
>>> +    CLKn pins have to be mapped to pins 0 and 1. For data lanes, there
>>> are only
>>
>>
>> Then why describe the clk pins?
>
>
> I was trying to use a DT binding that is already used for DSI hosts in
> TI SoCs.
>
> SoCs give different flexibility over how we map the physical lines with
> the actual data/clock lanes in the DSI controller. From what I know,
> this flexibility varies. For example, TI SoCs lets us move clock lanes
> too, and swap polarities.
>
> If we want all DSI host controllers to use a common binding to describe
> lanes, we'd need to go with the most flexible one, and the driver
> restricts it to the subsets that we support.
>
>>
>>> +    a limited number of physical to logical mappings possible:
>>> +
>>> +     "0123": Logic 0->Phys 0; Logic 1->Phys 1; Logic 2->Phys 2; Logic
>>> 3->Phys 3;
>>> +     "3012": Logic 3->Phys 0; Logic 0->Phys 1; Logic 1->Phys 2; Logic
>>> 2->Phys 3;
>>> +     "2301": Logic 2->Phys 0; Logic 3->Phys 1; Logic 0->Phys 2; Logic
>>> 1->Phys 3;
>>> +     "1230": Logic 1->Phys 0; Logic 2->Phys 1; Logic 3->Phys 2; Logic
>>> 0->Phys 3;
>>> +     "0321": Logic 0->Phys 0; Logic 3->Phys 1; Logic 2->Phys 2; Logic
>>> 1->Phys 3;
>>> +     "1032": Logic 1->Phys 0; Logic 0->Phys 1; Logic 3->Phys 2; Logic
>>> 2->Phys 3;
>>> +     "2103": Logic 2->Phys 0; Logic 1->Phys 1; Logic 0->Phys 2; Logic
>>> 3->Phys 3;
>>> +     "3210": Logic 3->Phys 0; Logic 2->Phys 1; Logic 1->Phys 2; Logic
>>> 0->Phys 3;
>>> +
>>> +     Here, a "3012" mapping will be represented by:
>>> +     lanes = <0 1 8 9 2 3 4 5 6 7>;
>>
>>
>> I'm lost here. What does 8 mean for example. The index represents?
>
>
> The numbers here describe the logical lanes. I.e, the way in which the
> DSI controller pushes out data to the PHY. The ordering is as follows:
>
> 0 - CLKp
> 1 - CLKn
> 2 - DATA0p
> 3 - DATA0n
> 4 - DATA1p
> 5 - DATA1n
> 6 - DATA2p
> 7 - DATA2n
> 8 - DATA3p
> 9 - DATA3n
>
> The indices corresponding to these values represent the actual
> physical pins. The index 0 will always represent the pin CLKp,
> index 8 will always represent the physical pin DATA3p. This is
> something we would want to keep fixed across all SoCs.
>
> The configuration in the example would provide the following
> mapping:
>
> L: CLKp CLKn DATA3p DATA3n ATA0p DATA0n DATA1p DATA1n DATA2p DATA2n
>
> P: CLKp CLKn DATA0p DATA0n DATA1p DATA1n DATA2p DATA2n DATA3p DATA3n
>
> L represents the logical lanes, and P represents the physical lanes.
> L is what we provide in the DT property, and P are what the indices
> represent. Here, the 3rd logical lane is mapped on to the 0th
> physical data lane. The 0th logical lane to the 1st physical data
> lane and so on.

Okay, so the confusing part is the description is all about lanes
(0-3) but the binding (index and value) is all about pin/signal
numbers. Either simplify the binding to be lanes or describe the
binding in terms of pins.

Rob
