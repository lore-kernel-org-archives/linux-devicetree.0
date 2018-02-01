From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 6/7] dt-bindings: display: msm/dsi: Add compatible for
 14nm DSI PHY
Date: Thu, 1 Feb 2018 10:59:56 +0530
Message-ID: <5c51decc-4450-898a-1170-0258c06ce904@codeaurora.org>
References: <20180117093448.4102-1-architt@codeaurora.org>
 <20180117093448.4102-7-architt@codeaurora.org>
 <20180129171544.st53376xyjep2cfx@rob-hp-laptop>
 <7b0254be-8dcf-f2cf-4911-64f0b5881759@codeaurora.org>
 <CAF6AEGsLrXBUub9Y5r-bTY2OPDksRSDjYpJXYoKxYp3MvHCP2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAF6AEGsLrXBUub9Y5r-bTY2OPDksRSDjYpJXYoKxYp3MvHCP2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lloyd Atkinson <latkinso-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, sibis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 01/31/2018 09:50 PM, Rob Clark wrote:
> On Wed, Jan 31, 2018 at 1:40 AM, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>>
>>
>> On 01/29/2018 10:45 PM, Rob Herring wrote:
>>>
>>> On Wed, Jan 17, 2018 at 03:04:47PM +0530, Archit Taneja wrote:
>>>>
>>>> Add the compatible string for 14nm DSI PHY (used in MSM8996/APQ8096).
>>>>   From 14nm PHY onwards, the "dsi_phy_regulator" reg-name is not required,
>>>> but "dsi_phy_lane" reg-name is. Update the doc to specify the reg-names
>>>> each PHY revision needs.
>>>>
>>>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/display/msm/dsi.txt | 13
>>>> +++++++++++--
>>>>    1 file changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt
>>>> b/Documentation/devicetree/bindings/display/msm/dsi.txt
>>>> index 9c3ad6bbb9f0..26a1796b7145 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>>>> @@ -86,12 +86,19 @@ Required properties:
>>>>      * "qcom,dsi-phy-28nm-lp"
>>>>      * "qcom,dsi-phy-20nm"
>>>>      * "qcom,dsi-phy-28nm-8960"
>>>> -- reg: Physical base address and length of the registers of PLL, PHY and
>>>> PHY
>>>> -  regulator
>>>> +  * "qcom,dsi-phy-14nm"
>>>> +- reg: Physical base address and length of the registers of PLL, PHY.
>>>> Some
>>>> +  revisions require the PHY regulator base address, whereas others
>>>> require the
>>>> +  PHY lane base address. See below for each PHY revision.
>>>>    - reg-names: The names of register regions. The following regions are
>>>> required:
>>>> +  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
>>>>      * "dsi_pll"
>>>>      * "dsi_phy"
>>>>      * "dsi_phy_regulator"
>>>> +  For DSI 14nm PHY:
>>>> +  * "dsi_pll"
>>>> +  * "dsi_phy"
>>>> +  * "dsi_phy_lane"
>>>>    - clock-cells: Must be 1. The DSI PHY block acts as a clock provider,
>>>> creating
>>>>      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
>>>>    - power-domains: Should be <&mmcc MDSS_GDSC>.
>>>> @@ -102,6 +109,8 @@ Required properties:
>>>>    - vddio-supply: phandle to vdd-io regulator device node
>>>>      For 20nm PHY:
>>>>    - vddio-supply: phandle to vdd-io regulator device node
>>>> +- vcca-supply: phandle to vcca regulator device node
>>>
>>>
>>> Did you mean to add this?
>>
>>
>> Yes, I didn't intend it to be a part of this patch, but this supply is
>> indeed needed for the
>> 20nm PHY. I'll move this to a separate patch.
> 
> actually, this looks correct, just formatted counter-intuitively by
> git-format-patch..
> 
> vcca-supply for 20nm was introduced by "dt-bindings: display: msm/dsi:
> Fix the PHY regulator supply props", but when 14nm phy is added in
> this patch, it shows the addition of same line beneath 14nm PHY as an
> addition above the line.
> 
> So I don't think it needs to be split up.

Oh yeah, you're right. I guess this is okay as is, then.

Thanks,
Archit

> 
> BR,
> -R
> 
>> Thanks,
>> Archit
>>
>>
>>>
>>>> +  For 14nm PHY:
>>>>    - vcca-supply: phandle to vcca regulator device node
>>>>      Optional properties:
>>>> --
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>>>> Forum,
>>>> hosted by The Linux Foundation
>>>>
>>
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
>> a Linux Foundation Collaborative Project
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
