From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: sdm845: add video nodes
Date: Fri, 25 Jan 2019 10:32:26 +0200
Message-ID: <323bca85-6dc3-4d28-ec02-69ce57bc6506@linaro.org>
References: <1545292023-5489-1-git-send-email-mgottam@codeaurora.org>
 <0ee6676f-f169-1ea1-506e-16e4097d1c04@linaro.org>
 <CAPBb6MWedPvoFW2jrqhZhNP-41PrEC+G4xnXs=cex1ywnVdm-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPBb6MWedPvoFW2jrqhZhNP-41PrEC+G4xnXs=cex1ywnVdm-w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Malathi Gottam <mgottam@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Vikash Garodia <vgarodia@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Alex,

On 1/25/19 9:46 AM, Alexandre Courbot wrote:
> On Thu, Jan 17, 2019 at 8:58 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Malathi,
>>
>> On 12/20/18 9:47 AM, Malathi Gottam wrote:
>>> This adds video nodes to sdm845 based on the examples
>>> in the bindings.
>>>
>>> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 35 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>
>> Looks good to me:
>>
>> Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> index b72bdb0..ccd2b10 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -87,6 +87,11 @@
>>>                       reg = <0 0x86200000 0 0x2d00000>;
>>>                       no-map;
>>>               };
>>> +
>>> +             venus_region: memory@95800000 {
>>> +                     reg = <0x0 0x95800000 0x0 0x500000>;
>>> +                     no-map;
>>> +             };
>>>       };
>>>
>>>       cpus {
>>> @@ -1403,5 +1408,35 @@
>>>                               status = "disabled";
>>>                       };
>>>               };
>>> +
>>> +             video-codec@aa00000 {
>>> +                     compatible = "qcom,sdm845-venus";
>>> +                     reg = <0x0aa00000 0xff000>;
>>> +                     interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     power-domains = <&videocc VENUS_GDSC>;
>>> +                     clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>>> +                              <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>>> +                              <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
>>> +                     clock-names = "core", "iface", "bus";
>>> +                     iommus = <&apps_smmu 0x10a0 0x8>,
>>> +                              <&apps_smmu 0x10b0 0x0>;
>>> +                     memory-region = <&venus_region>;
>>> +
>>> +                     video-core0 {
>>> +                             compatible = "venus-decoder";
>>> +                             clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
>>> +                                      <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
>>> +                             clock-names = "core", "bus";
>>> +                             power-domains = <&videocc VCODEC0_GDSC>;
>>> +                     };
>>> +
>>> +                     video-core1 {
>>> +                             compatible = "venus-encoder";
>>> +                             clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
>>> +                                      <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
>>> +                             clock-names = "core", "bus";
>>> +                             power-domains = <&videocc VCODEC1_GDSC>;
>>> +                     };
>>> +             };
> 
> This patch lacks the video-firmware node, it should at the very least
> be added before this gets merged.

The firmware node should be added in board dts file, the for example
sdm845-mtp will not populate firmware node because it uses TZ for
firmware loading.


-- 
regards,
Stan
