From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 6/6] drm/msm/dsi: Parse DSI lanes via DT
Date: Wed, 24 Feb 2016 10:32:22 +0530
Message-ID: <56CD395E.9050504@codeaurora.org>
References: <1455541259-8967-1-git-send-email-architt@codeaurora.org>
 <1455541259-8967-7-git-send-email-architt@codeaurora.org>
 <20160222025345.GB15973@rob-hp-laptop> <56CAB678.3080505@codeaurora.org>
 <CAL_JsqLVd3vLGO8SCQv=PFXb7yD42U_nKG=fxenc4Fy63yiezw@mail.gmail.com>
 <56CC23CD.5010708@ti.com> <56CC37BB.3060305@codeaurora.org>
 <56CC3E5C.3060101@ti.com> <20160223200446.GA28828@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160223200446.GA28828@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 02/24/2016 01:34 AM, Rob Herring wrote:
> On Tue, Feb 23, 2016 at 01:11:24PM +0200, Tomi Valkeinen wrote:
>>
>>
>> On 23/02/16 12:43, Archit Taneja wrote:
>>>
>>>
>>> On 02/23/2016 02:48 PM, Tomi Valkeinen wrote:
>>>>
>>>> On 22/02/16 22:10, Rob Herring wrote:
>>>>
>>>>>> If we want all DSI host controllers to use a common binding to describe
>>>>>> lanes, we'd need to go with the most flexible one, and the driver
>>>>>> restricts it to the subsets that we support.
>>>>
>>>> True, but I wonder if that's necessary. The lane property for the SoC
>>>> should be read by the SoC specific driver, right? So the DT property can
>>>> be anything. I'm not sure if there's ever a reason for a generic code to
>>>> observe the DSI lane setup.
>>>
>>> Yeah, it is very SoC specific.
>
> Agreed.

Okay. We probably don't need to go with a generic binding, then. I'll
simplify the msm/dsi lane bindings (i.e, drop the clock lanes, and
represent things in lanes instead of pins).

Thanks,
Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
