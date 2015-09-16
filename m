From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH RFC 1/8] dt-bindings: Document the hi6220 bindings for DRM
 driver
Date: Wed, 16 Sep 2015 14:40:54 +0530
Message-ID: <55F9321E.7090100@codeaurora.org>
References: <1442309834-21420-1-git-send-email-kong.kongxinwei@hisilicon.com>
 <1442309834-21420-2-git-send-email-kong.kongxinwei@hisilicon.com>
 <55F85F54.1020807@kernel.org> <55F9298C.3020009@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55F9298C.3020009@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xinwei Kong <kong.kongxinwei@hisilicon.com>, lars@metafoo.de, treding@nvidia.com
Cc: Rob Herring <robh@kernel.org>, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xinliang.liu@linaro.org, andy.green@linaro.org, qijiwen@hisilicon.com, gongyu@hisilicon.com, haojian.zhuang@linaro.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com, yinshengbao@hisilicon.com, yanhaifeng@hisilicon.com, ml.yang@hisilicon.com, yimin@huawei.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, benjamin.gaignard@linaro.org, xuyiping@hisilicon.com, james.yanglong@hisilicon.com, fangdechun@hisilicon.com, linux-arm-msm@vger.kernel.org, laurent.pinchart@ideasonboard.com, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

Hi,

On 09/16/2015 02:04 PM, Xinwei Kong wrote:
> hi architt
>
> On 2015/9/16 2:11, Rob Herring wrote:
>> On 09/15/2015 04:37 AM, Xinwei Kong wrote:
>>> This adds documentation of device tree bindings for the
>>> Graphics Processing Unit of hi6220 SOC.
>>>
>>> Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
>>> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>>> Signed-off-by: Andy Green <andy.green@linaro.org>
>>> Signed-off-by: Jiwen Qi <qijiwen@hisilicon.com>
>>> Signed-off-by: Yu Gong <gongyu@hisilicon.com>
>>> ---
>>>   .../devicetree/bindings/gpu/hisilicon,hi6220.txt   | 69 ++++++++++++++++++++++
>>>   1 file changed, 69 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/gpu/hisilicon,hi6220.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpu/hisilicon,hi6220.txt b/Documentation/devicetree/bindings/gpu/hisilicon,hi6220.txt
>>> new file mode 100644
>>> index 0000000..173ac63
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpu/hisilicon,hi6220.txt
>>> @@ -0,0 +1,69 @@
>>> + * Hisilicon hi6220 Graphics Processing Unit for HiKey board
>>> +
>>> + ** display-subsystem: Master device for binding DRM sub-components
>>
>> DRM is a Linuxism that doesn't belong in the binding.
>>
>>> +    This master device is parent node and it will be responsible to bind all
>>> +    sub-components devices node.
>>
>> Are these nodes a single block in the h/w? If not, you should describe
>> the connection of sub-nodes with of-graph instead.
>>
>>> +    - Required properties :
>>> +      - compatible: "hisilicon,display-subsystem".
>>> +      - #address-cells, #size-cells: Must be present if the device has sub-nodes.
>>> +      - ranges: to allow probing of subdevices.
>>> +      - dma-coherent: Present if dma operations are coherent.
>>> +
>>> + ** ade: Graphic overlay, Graphic post-processing, display timing control.
>>> +    This device is child node of display-subsystem
>>> +    - Required properties :
>>> +      - compatible: "hisilicon,hi6220-ade".
>>> +      - reg: physical base address of the ADE register and length of memory
>>> +	region.
>>> +      - reg-names: Should contain the reg names "ade_base" and "media_base".
>>> +      - interrupt: The interrupt number to the cpu. Defines the interrupt
>>> +        by ADE.
>>> +      - clocks: The clocks needed by the ADE module.
>>> +      - clock-names: the name of the clocks.
>>> +
>>> + ** dsi: support mipi dsi interface
>>> +    This device is child node of display-subsystem
>>> +    - Required properties :
>>> +      - compatible: "hisilicon,hi6220-dsi".
>>> +      - reg: physical base address of the DSI register and length of memory
>>> +	region.
>>> +      - clocks: The clocks needed by the DSI module.
>>> +      - clock-names: the name of the clocks.
>>> +      -	encoder-slave: phandles to a 'encoder-slave' subnode which DSI connect
>>> +        ADV7533 in order to support hdmi display.
>>
>> What the ADV7533 binding looks like is still being discussed.
>> "encoder-slave" is certainly DRM specific and not how it should be done.
>> Most likely, this needs to use the of-graph ports.
>>
> I dont how to implement the encoder bridge stuff in upstream,
> you think that I will how to handle this part?

You can use of-graph ports to link the dsi output with the adv7533
bridge.

An example of the binding looks like:

Documentation/devicetree/bindings/drm/msm/dsi.txt

The implementation of this on the dsi host side of drm/msm
can be found in dsi_host_parse_dt, in:

drivers/gpu/drm/msm/dsi/dsi_host.c

You can get to know more about of-graph parsing here:

Documentation/devicetree/bindings/graph.txt

I'd started going through the drm/hisil patches. I'll
share more comments there.

Thanks,
Archit

>
> Thank you
> xinwei
>
>> Also, the ADV7533 connection is specific to HiKey. This binding should
>> just generically describe how any bridge or panel is connected.
>>
>> Rob
>>
>> .
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
