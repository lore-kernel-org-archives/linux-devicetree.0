From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/9] doc: DT: venus: binding document for Qualcomm
 video driver
Date: Wed, 22 Feb 2017 08:17:19 -0600
Message-ID: <CAL_JsqJ0+YEcw1-DgWpHgdDe4zfppNnpLt6XY=CGnMYwu8ALhw@mail.gmail.com>
References: <1486473024-21705-1-git-send-email-stanimir.varbanov@linaro.org>
 <1486473024-21705-3-git-send-email-stanimir.varbanov@linaro.org>
 <20170222000952.w6bg4bhvbklgkcnx@rob-hp-laptop> <88584dd3-165f-2393-433e-95c288a8f473@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <88584dd3-165f-2393-433e-95c288a8f473-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 3:25 AM, Stanimir Varbanov
<stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Rob,
>
> On 02/22/2017 02:09 AM, Rob Herring wrote:
>> On Tue, Feb 07, 2017 at 03:10:17PM +0200, Stanimir Varbanov wrote:
>>> Add binding document for Venus video encoder/decoder driver
>>>
>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>> Changes since previous v5:
>>>  * dropped rproc phandle (remoteproc is not used anymore)
>>>  * added subnodes paragraph with descrition of three subnodes:
>>>     - video-decoder and video-encoder - describes decoder (core0) and
>>>     encoder (core1) power-domains and clocks (applicable for msm8996
>>>     Venus core).
>>>     - video-firmware - needed to get reserved memory region where the
>>>     firmware is stored.
>>>
>>>  .../devicetree/bindings/media/qcom,venus.txt       | 112 +++++++++++++++++++++
>>>  1 file changed, 112 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus.txt b/Documentation/devicetree/bindings/media/qcom,venus.txt
>>> new file mode 100644
>>> index 000000000000..4427af3ca5a5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,venus.txt
>>> @@ -0,0 +1,112 @@
>>
>> [...]
>>
>>> +* Subnodes
>>> +The Venus node must contain three subnodes representing video-decoder,
>>> +video-encoder and video-firmware.
>>
>> [...]
>>
>>> +The video-firmware subnode should contain:
>>> +
>>> +- memory-region:
>>> +    Usage: required
>>> +    Value type: <phandle>
>>> +    Definition: reference to the reserved-memory for the memory region
>>> +
>>> +* An Example
>>> +    video-codec@1d00000 {
>>> +            compatible = "qcom,msm8916-venus";
>>> +            reg = <0x01d00000 0xff000>;
>>> +            interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>>> +            clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
>>> +                     <&gcc GCC_VENUS0_AHB_CLK>,
>>> +                     <&gcc GCC_VENUS0_AXI_CLK>;
>>> +            clock-names = "core", "iface", "bus";
>>> +            power-domains = <&gcc VENUS_GDSC>;
>>> +            iommus = <&apps_iommu 5>;
>>> +
>>> +            video-decoder {
>>> +                    compatible = "venus-decoder";
>>> +                    clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
>>> +                    clock-names = "core";
>>> +                    power-domains = <&mmcc VENUS_CORE0_GDSC>;
>>> +            };
>>> +
>>> +            video-encoder {
>>> +                    compatible = "venus-encoder";
>>> +                    clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
>>> +                    clock-names = "core";
>>> +                    power-domains = <&mmcc VENUS_CORE1_GDSC>;
>>> +            };
>>> +
>>> +            video-firmware {
>>> +                    memory-region = <&venus_mem>;
>>
>> Why does this need to be a sub node?
>
> Because firmware reserved memory region must have separate struct
> device, otherwise allocating video buffers (and map them through iommu)
> for video-codec will fail because dma_alloc_coherent trying to allocate
> from per-device coherent area.

Why can't the struct device be the video-codec device? Looking at the
code, I don't see why you need the 2nd struct device.

In any case, this is letting the driver design the binding which is
wrong. From a binding perspective, there's no reason to have this
node.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
