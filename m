From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 2/4] drm/msm/hdmi: Clean up HDMI gpio DT bindings
Date: Tue, 13 Sep 2016 18:45:58 +0530
Message-ID: <57D7FC0E.6030209@codeaurora.org>
References: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
 <1472737015-29382-1-git-send-email-architt@codeaurora.org>
 <1472737015-29382-3-git-send-email-architt@codeaurora.org>
 <20160912131914.GA15499@rob-hp-laptop> <57D7A6CD.60803@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <57D7A6CD.60803@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, robdclark@gmail.com
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, john.stultz@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/13/2016 12:42 PM, Archit Taneja wrote:
>
>
> On 9/12/2016 6:49 PM, Rob Herring wrote:
>> On Thu, Sep 01, 2016 at 07:06:52PM +0530, Archit Taneja wrote:
>>> Make the following changes in the HDMI gpio bindings:
>>>
>>> - Use "-gpios" as the suffix for all the gpio names
>>> - Move all the gpios to optional, since there are platforms that use
>>> none
>>>    of them.
>>> - The HPD gpio is a standard one, remove the "qcom,hdmi-tx-" prefix from
>>>    it.
>>> - Add a missing lpm gpio used on some platforms.
>>>
>>> Make the necessary changes in the driver to incorporate these changes.
>>>
>>> There hasn't been any upstream DT that uses the HDMI bindings, so it's
>>> okay to change and move around these properties.
>>>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>>> ---
>>> v2:
>>> - Keep "qcom,hdmi-tx-" suffix for all gpios except for hpd.
>>> - Use "-gpios" suffix instead of "-gpio".
>>> - Move all the gpios to optional properties.
>>>
>>>   .../devicetree/bindings/display/msm/hdmi.txt        | 11 ++++++-----
>>>   drivers/gpu/drm/msm/hdmi/hdmi.c                     | 21
>>> +++++++++++++++++++--
>>>   2 files changed, 25 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt
>>> b/Documentation/devicetree/bindings/display/msm/hdmi.txt
>>> index ce84459..f1a83ab 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
>>> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
>>> @@ -13,17 +13,18 @@ Required properties:
>>>   - interrupts: The interrupt signal from the hdmi block.
>>>   - clocks: device clocks
>>>     See ../clocks/clock-bindings.txt for details.
>>> -- qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
>>> -- qcom,hdmi-tx-ddc-data-gpio: ddc data pin
>>> -- qcom,hdmi-tx-hpd-gpio: hpd pin
>>>   - core-vdda-supply: phandle to supply regulator
>>>   - hdmi-mux-supply: phandle to mux regulator
>>>   - phys: the phandle for the HDMI PHY device
>>>   - phy-names: the name of the corresponding PHY device
>>>
>>>   Optional properties:
>>> -- qcom,hdmi-tx-mux-en-gpio: hdmi mux enable pin
>>> -- qcom,hdmi-tx-mux-sel-gpio: hdmi mux select pin
>>> +- qcom,hdmi-tx-ddc-clk-gpios: ddc clk pin
>>> +- qcom,hdmi-tx-ddc-data-gpios: ddc data pin
>>
>> Sorry, for raising another point, but couldn't you use the i2c-gpio
>> binding for these instead?
>
> I'm not entirely sure what these are used for either, they predate the
> APQ8064 SoC. They are certainly not bit-banged to implement i2c, since
> the driver just sets them to a high during driver initialization, and
> we have our dedicated i2c controller anyway.
>

I just checked some old qualcomm kernels. It looks like they were
passed as gpios just so that the pins could be configured(function,
pull up/down, strength etc) using gpiolib api. I guess these
kernels predated pinctrl drivers.

I will post a new revision of the patch with these removed.

Thanks,
Archit

> Rob,
>
> Are you aware why we have these for older SoCs?
>
> Thanks,
> Archit
>
>>
>>> +- hpd-gpios: hpd pin
>>> +- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
>>> +- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
>>> +- qcom,hdmi-tx-mux-lpm-gpios: hdmi mux lpm pin
>>>   - power-domains: reference to the power domain(s), if available.
>>>   - pinctrl-names: the pin control state names; should contain "default"
>>>   - pinctrl-0: the default pinctrl state (active)
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
