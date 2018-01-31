From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: display: msm/dsi: Add compatible for
 14nm DSI PHY
Date: Wed, 31 Jan 2018 11:20:04 -0500
Message-ID: <CAF6AEGsLrXBUub9Y5r-bTY2OPDksRSDjYpJXYoKxYp3MvHCP2w@mail.gmail.com>
References: <20180117093448.4102-1-architt@codeaurora.org> <20180117093448.4102-7-architt@codeaurora.org>
 <20180129171544.st53376xyjep2cfx@rob-hp-laptop> <7b0254be-8dcf-f2cf-4911-64f0b5881759@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <7b0254be-8dcf-f2cf-4911-64f0b5881759@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Lloyd Atkinson <latkinso@codeaurora.org>, sibis@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 1:40 AM, Archit Taneja <architt@codeaurora.org> wrote:
>
>
> On 01/29/2018 10:45 PM, Rob Herring wrote:
>>
>> On Wed, Jan 17, 2018 at 03:04:47PM +0530, Archit Taneja wrote:
>>>
>>> Add the compatible string for 14nm DSI PHY (used in MSM8996/APQ8096).
>>>  From 14nm PHY onwards, the "dsi_phy_regulator" reg-name is not required,
>>> but "dsi_phy_lane" reg-name is. Update the doc to specify the reg-names
>>> each PHY revision needs.
>>>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/dsi.txt | 13
>>> +++++++++++--
>>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> b/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> index 9c3ad6bbb9f0..26a1796b7145 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> @@ -86,12 +86,19 @@ Required properties:
>>>     * "qcom,dsi-phy-28nm-lp"
>>>     * "qcom,dsi-phy-20nm"
>>>     * "qcom,dsi-phy-28nm-8960"
>>> -- reg: Physical base address and length of the registers of PLL, PHY and
>>> PHY
>>> -  regulator
>>> +  * "qcom,dsi-phy-14nm"
>>> +- reg: Physical base address and length of the registers of PLL, PHY.
>>> Some
>>> +  revisions require the PHY regulator base address, whereas others
>>> require the
>>> +  PHY lane base address. See below for each PHY revision.
>>>   - reg-names: The names of register regions. The following regions are
>>> required:
>>> +  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
>>>     * "dsi_pll"
>>>     * "dsi_phy"
>>>     * "dsi_phy_regulator"
>>> +  For DSI 14nm PHY:
>>> +  * "dsi_pll"
>>> +  * "dsi_phy"
>>> +  * "dsi_phy_lane"
>>>   - clock-cells: Must be 1. The DSI PHY block acts as a clock provider,
>>> creating
>>>     2 clocks: A byte clock (index 0), and a pixel clock (index 1).
>>>   - power-domains: Should be <&mmcc MDSS_GDSC>.
>>> @@ -102,6 +109,8 @@ Required properties:
>>>   - vddio-supply: phandle to vdd-io regulator device node
>>>     For 20nm PHY:
>>>   - vddio-supply: phandle to vdd-io regulator device node
>>> +- vcca-supply: phandle to vcca regulator device node
>>
>>
>> Did you mean to add this?
>
>
> Yes, I didn't intend it to be a part of this patch, but this supply is
> indeed needed for the
> 20nm PHY. I'll move this to a separate patch.

actually, this looks correct, just formatted counter-intuitively by
git-format-patch..

vcca-supply for 20nm was introduced by "dt-bindings: display: msm/dsi:
Fix the PHY regulator supply props", but when 14nm phy is added in
this patch, it shows the addition of same line beneath 14nm PHY as an
addition above the line.

So I don't think it needs to be split up.

BR,
-R

> Thanks,
> Archit
>
>
>>
>>> +  For 14nm PHY:
>>>   - vcca-supply: phandle to vcca regulator device node
>>>     Optional properties:
>>> --
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>>> Forum,
>>> hosted by The Linux Foundation
>>>
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
