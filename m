From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 7/7] dt-bindings: drm/bridge: Update bindings for
 ADV7533
Date: Fri, 22 Apr 2016 11:10:18 +0530
Message-ID: <5719B942.8070907@codeaurora.org>
References: <1441625800-1858-1-git-send-email-architt@codeaurora.org>
 <1457521038-5906-1-git-send-email-architt@codeaurora.org>
 <1457521038-5906-8-git-send-email-architt@codeaurora.org>
 <1992414.kkmfQUJ8oO@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1992414.kkmfQUJ8oO@avalon>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch, treding@nvidia.com, linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org, andy.green@linaro.org, lars@metafoo.de, xinliang.liu@linaro.org, amit.kucheria@linaro.org, robdclark@gmail.com, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org



On 04/22/2016 04:02 AM, Laurent Pinchart wrote:
> Hi Archit,
>
> Thank you for the patch.
>
> On Wednesday 09 Mar 2016 16:27:18 Archit Taneja wrote:
>> Add description of ADV7533. Add the required and optional properties that
>> are specific to it.
>>
>> Cc: devicetree@vger.kernel.org
>> Cc: Rob Herring <robh@kernel.org>
>>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>>   .../bindings/display/bridge/adi,adv7511.txt        | 25 ++++++++++++++-----
>>   1 file changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>> b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt index
>> 96c25ee..420da5a 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>> @@ -1,13 +1,19 @@
>> -Analog Device ADV7511(W)/13 HDMI Encoders
>> +Analog Device ADV7511(W)/13/33 HDMI Encoders
>>   -----------------------------------------
>>
>> -The ADV7511, ADV7511W and ADV7513 are HDMI audio and video transmitters
>> +The ADV7511, ADV7511W, ADV7513 and ADV7533 are HDMI audio and video
>> transmitters compatible with HDMI 1.4 and DVI 1.0. They support color space
>> conversion, -S/PDIF, CEC and HDCP.
>> +S/PDIF, CEC and HDCP. ADV7533 supports the DSI interface for input pixels,
>> while +the others support RGB interface.
>>
>>   Required properties:
>>
>> -- compatible: Should be one of "adi,adv7511", "adi,adv7511w" or
>> "adi,adv7513" +- compatible: Should be one of:
>> +		"adi,adv7511"
>> +		"adi,adv7511w"
>> +		"adi,adv7513"
>> +		"adi,adv7533"
>> +
>>   - reg: I2C slave address
>>
>>   The ADV7511 supports a large number of input data formats that differ by
>> their @@ -32,6 +38,11 @@ The following input format properties are required
>> except in "rgb 1x" and - adi,input-justification: The input bit
>> justification ("left", "evenly", "right").
>>
>> +The following properties are required for ADV7533:
>> +
>> +- adi,dsi-lanes: Number of DSI data lanes connected to the DSI host. It
>> should +  be one of 1, 2, 3 or 4.
>
> Does the ADV7533 support data lanes remapping ?

It doesn't support remapping of lanes. There is only one register field
that allows us to select the number of lanes.

>
>>   Optional properties:
>>
>>   - interrupts: Specifier for the ADV7511 interrupt
>> @@ -42,13 +53,17 @@ Optional properties:
>>   - adi,embedded-sync: The input uses synchronization signals embedded in the
>> data stream (similar to BT.656). Defaults to separate H/V synchronization
>> signals.
>> +- adi,disable-timing-generator: Only for ADV7533. Disables the internal
>> timing +  generator. The chip will rely on the sync signals in the DSI data
>> lanes, +  rather than generate its own timings for HDMI output.
>
> Isn't that something that should be selectable at runtime ?

The timing generator can be enabled/disabled at runtime. Although, we
don't have a way to tell the driver whether we want to keep it enabled
or not.

It's a hardware feature that works well on most platforms, but not on
all. In particular, it works well on DB410c, but causes issues with
the Hikey 96 board. The DSI host on Hikey has different clock sources 
that generate the display controller's pixel clock and DSI byte clock,
whereas the Qualcomm SoC uses the same source. My guess is that the
ADV7533's timing generator doesn't like it when the pixel data and
clock are out of phase or something.

Since it is a hardware feature which needs tweaking, I thought it
qualified as a DT property.

>
>>   Required nodes:
>>
>>   The ADV7511 has two video ports. Their connections are modelled using the
>> OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
>>
>> -- Video port 0 for the RGB or YUV input
>> +- Video port 0 for the RGB, YUV or DSI input. In the case of ADV7533, the
>> +  remote endpoint phandle should refer to a valid mipi_dsi_host device
>
> Nitpicking, I would write "reference" instead of "refer to".

I'll fix this in the next revision.

Thanks,
Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
