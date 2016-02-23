From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 6/6] drm/msm/dsi: Parse DSI lanes via DT
Date: Tue, 23 Feb 2016 16:13:07 +0530
Message-ID: <56CC37BB.3060305@codeaurora.org>
References: <1455541259-8967-1-git-send-email-architt@codeaurora.org>
 <1455541259-8967-7-git-send-email-architt@codeaurora.org>
 <20160222025345.GB15973@rob-hp-laptop> <56CAB678.3080505@codeaurora.org>
 <CAL_JsqLVd3vLGO8SCQv=PFXb7yD42U_nKG=fxenc4Fy63yiezw@mail.gmail.com>
 <56CC23CD.5010708@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56CC23CD.5010708@ti.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 02/23/2016 02:48 PM, Tomi Valkeinen wrote:
>
> On 22/02/16 22:10, Rob Herring wrote:
>
>>> If we want all DSI host controllers to use a common binding to describe
>>> lanes, we'd need to go with the most flexible one, and the driver
>>> restricts it to the subsets that we support.
>
> True, but I wonder if that's necessary. The lane property for the SoC
> should be read by the SoC specific driver, right? So the DT property can
> be anything. I'm not sure if there's ever a reason for a generic code to
> observe the DSI lane setup.

Yeah, it is very SoC specific.

The only place where it might matter is if a panel/bridge ever needs to
know what pins implement what lanes on the platform. A common binding
there might help us keep the panel driver generic. Although, this need
itself is a bit hypothetical.

>
> That said, if we do have a common binding, it's perhaps easier for
> people to understand the setups for different SoCs.
>
>>>>> +    a limited number of physical to logical mappings possible:
>>>>> +
>>>>> +     "0123": Logic 0->Phys 0; Logic 1->Phys 1; Logic 2->Phys 2; Logic
>>>>> 3->Phys 3;
>>>>> +     "3012": Logic 3->Phys 0; Logic 0->Phys 1; Logic 1->Phys 2; Logic
>>>>> 2->Phys 3;
>>>>> +     "2301": Logic 2->Phys 0; Logic 3->Phys 1; Logic 0->Phys 2; Logic
>>>>> 1->Phys 3;
>>>>> +     "1230": Logic 1->Phys 0; Logic 2->Phys 1; Logic 3->Phys 2; Logic
>>>>> 0->Phys 3;
>>>>> +     "0321": Logic 0->Phys 0; Logic 3->Phys 1; Logic 2->Phys 2; Logic
>>>>> 1->Phys 3;
>>>>> +     "1032": Logic 1->Phys 0; Logic 0->Phys 1; Logic 3->Phys 2; Logic
>>>>> 2->Phys 3;
>>>>> +     "2103": Logic 2->Phys 0; Logic 1->Phys 1; Logic 0->Phys 2; Logic
>>>>> 3->Phys 3;
>>>>> +     "3210": Logic 3->Phys 0; Logic 2->Phys 1; Logic 1->Phys 2; Logic
>>>>> 0->Phys 3;
>>>>> +
>>>>> +     Here, a "3012" mapping will be represented by:
>>>>> +     lanes = <0 1 8 9 2 3 4 5 6 7>;
>>>>
>>>>
>>>> I'm lost here. What does 8 mean for example. The index represents?
>>>
>>>
>>> The numbers here describe the logical lanes. I.e, the way in which the
>>> DSI controller pushes out data to the PHY. The ordering is as follows:
>
> If I read you right, I think that's vice versa. At least the OMAP
> version. The OMAP doc says:
>
> "- lanes: list of pin numbers for the DSI lanes: CLK+, CLK-, DATA0+,
> DATA0-, DATA1+, DATA1-, ..."
>
> This means that the first value in the array is the pin number for CLK+.
> In other words, CLK+ wire going to the panel/encoder is connected to pin
> number X.
>
> What the pin number means is SoC specific. CLK+ could be connected to,
> say, SoC pin number 123, and then you'd enter 123 as the first value. On
> OMAP we use DSI block specific pin numbers, so they start at 0.

You're right. I have it the other way round. Yours describes the
hardware better. I'll change to yours if we decide to have a common
binding.

>
>> Okay, so the confusing part is the description is all about lanes
>> (0-3) but the binding (index and value) is all about pin/signal
>> numbers. Either simplify the binding to be lanes or describe the
>> binding in terms of pins.
>
> Perhaps "lane-pins" or something would be more descriptive. If we want
> to make the description common, I could change the OMAP implementation
> to accept the new property name too.
>
> But, I'm not sure if a common description helps much. Any thoughts?

If having a common binding doesn't bring any benefit, then a common
description doesn't help much. I could then move to a simpler binding
too.

Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
