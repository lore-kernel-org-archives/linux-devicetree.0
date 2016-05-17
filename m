From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 7/7] dt-bindings: drm/bridge: Update bindings for
 ADV7533
Date: Tue, 17 May 2016 09:13:25 +0530
Message-ID: <573A935D.7010301@codeaurora.org>
References: <1441625800-1858-1-git-send-email-architt@codeaurora.org>
 <1992414.kkmfQUJ8oO@avalon> <5719B942.8070907@codeaurora.org>
 <1987165.vo5BTWVL5e@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1987165.vo5BTWVL5e@avalon>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, xinliang.liu@linaro.orgXinliang Liu <xinliang.liu@linaro.org>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch, treding@nvidia.com, linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org, lars@metafoo.de, amit.kucheria@linaro.org, robdclark@gmail.com, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org



On 05/16/2016 05:31 PM, Laurent Pinchart wrote:
> Hi Archit,
>
> On Friday 22 Apr 2016 11:10:18 Archit Taneja wrote:
>> On 04/22/2016 04:02 AM, Laurent Pinchart wrote:
>>> On Wednesday 09 Mar 2016 16:27:18 Archit Taneja wrote:
>>>> Add description of ADV7533. Add the required and optional properties that
>>>> are specific to it.
>>>>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: Rob Herring <robh@kernel.org>
>>>>
>>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>>>> ---
>>>>
>>>> .../bindings/display/bridge/adi,adv7511.txt        | 25 ++++++++++++-----
>>>> 1 file changed, 20 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>> b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt index
>>>> 96c25ee..420da5a 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>
> [snip]
>
>>>> +- adi,disable-timing-generator: Only for ADV7533. Disables the internal
>>>> timing
>>>> +  generator. The chip will rely on the sync signals in the DSI data
>>>> lanes,
>>>> +  rather than generate its own timings for HDMI output.
>>>
>>> Isn't that something that should be selectable at runtime ?
>>
>> The timing generator can be enabled/disabled at runtime. Although, we
>> don't have a way to tell the driver whether we want to keep it enabled
>> or not.
>>
>> It's a hardware feature that works well on most platforms, but not on
>> all. In particular, it works well on DB410c, but causes issues with
>> the Hikey 96 board. The DSI host on Hikey has different clock sources
>> that generate the display controller's pixel clock and DSI byte clock,
>> whereas the Qualcomm SoC uses the same source. My guess is that the
>> ADV7533's timing generator doesn't like it when the pixel data and
>> clock are out of phase or something.
>>
>> Since it is a hardware feature which needs tweaking, I thought it
>> qualified as a DT property.
>
> The fact that a hardware generator is present is certainly describes the
> hardware, but I'm not sure whether to enable it or not also qualifies as a
> hardware feature.
>
> Are there use cases for using the timing generator conditionally on a given
> board ? As you implement support for disabling it, I assume it's not
> mandatory. What feature(s) do we lose if we keep it disabled ?
>

The spec says it's recommended to use the internal timing generator. In
the case of db410c, I observe an unstable output/flicker for certain
modes if I don't enable it.

In the case of hikey platform, it's the other way round.

Xinliang, could you describe the problems you face when the timing
generator is enabled?

Thanks,
Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
