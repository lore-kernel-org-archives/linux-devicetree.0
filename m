From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Date: Mon, 2 Sep 2019 08:23:04 +0200
Message-ID: <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org>
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
 <20190207111734.24171-4-jorge.ramirez-ortiz@linaro.org>
 <20190223165218.GB572@tuxbook-pro>
 <6dc0957d-5806-7643-4454-966015865d38@linaro.org>
 <5d694878.1c69fb81.5f13b.ec4f@mx.google.com>
 <20190830164520.GK26807@tuxbook-pro>
 <5d696ad2.1c69fb81.977ea.39e5@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d696ad2.1c69fb81.977ea.39e5@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh@kernel.org, andy.gross@linaro.org, shawn.guo@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On 8/30/19 20:28, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2019-08-30 09:45:20)
>> On Fri 30 Aug 09:01 PDT 2019, Stephen Boyd wrote:
>>
>>> Quoting Jorge Ramirez (2019-08-29 00:03:48)
>>>> On 2/23/19 17:52, Bjorn Andersson wrote:
>>>>> On Thu 07 Feb 03:17 PST 2019, Jorge Ramirez-Ortiz wrote:
>>>>>> +
>>>>>> +Required child nodes:
>>>>>> +
>>>>>> +- usb connector node as defined in bindings/connector/usb-connector.txt
>>>>>> +  containing the property vbus-supply.
>>>>>> +
>>>>>> +Example:
>>>>>> +
>>>>>> +usb3_phy: usb3-phy@78000 {
>>>>>> +    compatible = "qcom,snps-usb-ssphy";
>>>>>> +    reg = <0x78000 0x400>;
>>>>>> +    #phy-cells = <0>;
>>>>>> +    clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
>>>>>> +             <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
>>>>>> +             <&gcc GCC_USB3_PHY_PIPE_CLK>;
>>>>>> +    clock-names = "ref", "phy", "pipe";
>>>>>> +    resets = <&gcc GCC_USB3_PHY_BCR>,
>>>>>> +             <&gcc GCC_USB3PHY_PHY_BCR>;
>>>>>> +    reset-names = "com", "phy";
>>>>>> +    vdd-supply = <&vreg_l3_1p05>;
>>>>>> +    vdda1p8-supply = <&vreg_l5_1p8>;
>>>>>> +    usb3_c_connector: usb3-c-connector {
>>>
>>> Node name should be 'connector', not usb3-c-connector.
>>>
>>
>> It probably has to be usb-c-connector, because we have a
>> micro-usb-connector on the same board.
> 
> Ok. Or connector@1 and connector@2? Our toplevel node container story is
> sort of sad because we have to play tricks with node names. But in the
> example, just connector I presume? 
> 
>>
>>>>>
>>>>> The USB-C connector is attached both to the HS and SS PHYs, so I think
>>>>> you should represent this external to this node and use of_graph to
>>>>> query it.
>>>>
>>>> but AFAICS we wont be able to retrieve the vbux-supply from an external
>>>> node (that interface does not exist).
>>>>
>>>> rob, do you have a suggestion?
>>>
>>> Shouldn't the vbus supply be in the phy? Or is this a situation where
>>> the phy itself doesn't have the vbus supply going to it because the PMIC
>>> gets in the way and handles the vbus for the connector by having the SoC
>>> communicate with the PMIC about when to turn the vbus on and off, etc?
>>>
>>
>> That's correct, the VBUS comes out of the PMIC and goes directly to the
>> connector.
>>
>> The additional complicating factor here is that the connector is wired
>> to a USB2 phy as well, so we need to wire up detection and vbus control
>> to both of them - but I think this will be fine, if we can only figure
>> out a sane way of getting hold of the vbus-supply.
>>
> 
> Does it really matter to describe this situation though? Maybe it's
> simpler to throw the vbus supply into the phy and control it from the
> phy driver, even if it never really goes there. Or put it into the
> toplevel usb controller?
> 
that would work for me - the connector definition seemed a better way to
explain the connectivity but since we cant retrieve the supply from the
external node is not of much functional use.

but please let me know how to proceed. shall I add the supply back to
the phy?
