From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 13/13] dt/bindings: drm/msm/hdmi: Add hdmi phy bindings
Date: Mon, 25 Jan 2016 13:10:56 +0530
Message-ID: <56A5D188.7050004@codeaurora.org>
References: <1453360181-31738-1-git-send-email-architt@codeaurora.org>
 <1453360181-31738-14-git-send-email-architt@codeaurora.org>
 <20160121232654.GA5138@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121232654.GA5138@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 1/22/2016 4:56 AM, Rob Herring wrote:
> On Thu, Jan 21, 2016 at 12:39:41PM +0530, Archit Taneja wrote:
>> Add hdmi phy bindings. Update the example to use hdmi phy.
>>
>> Add a missing power-domains property in the hdmi core bindings.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   .../devicetree/bindings/display/msm/hdmi.txt       | 39 +++++++++++++++++++++-
>>   1 file changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
>> index 379ee2e..21590ee 100644
>> --- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
>> @@ -11,6 +11,7 @@ Required properties:
>>   - reg: Physical base address and length of the controller's registers
>>   - reg-names: "core_physical"
>>   - interrupts: The interrupt signal from the hdmi block.
>> +- power-domains: Should be <&mmcc MDSS_GDSC>.
>>   - clocks: device clocks
>>     See ../clocks/clock-bindings.txt for details.
>>   - qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
>> @@ -18,6 +19,7 @@ Required properties:
>>   - qcom,hdmi-tx-hpd-gpio: hpd pin
>>   - core-vdda-supply: phandle to supply regulator
>>   - hdmi-mux-supply: phandle to mux regulator
>> +- qcom,dsi-phy: phandle to HDMI PHY device node
>
> dsi?

Sorry, this is a typo. It should be qcom,hdmi-phy.

>
> Why does this not use the phy binding?

The PHY in the HDMI and DSI blocks can't be implemented using the
common phy framework. The PHY blocks have a PLL sub-block within
them which acts as a pixel clock source for the display processor
block.

This dependency causes the need to split the phy power on sequence
into 2 parts (one to enable resources to enable the PLL, and the
other to enable the phy itself), which the phy framework can't
do. That's the main reason not to use it. There are some more
complex use cases for DSI PHY (drive two PHYs with the same
DSI PLL) which the phy framework can't support.

Thanks,
Archit

>
> Rob
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
