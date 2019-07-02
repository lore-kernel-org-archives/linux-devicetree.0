From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: sdm845: Add video nodes
Date: Tue, 2 Jul 2019 11:34:37 +0530
Message-ID: <a0a10c45-b366-a30e-6162-efcc7a435085@codeaurora.org>
References: <1561620334-17642-1-git-send-email-amasule@codeaurora.org>
 <1561620334-17642-2-git-send-email-amasule@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561620334-17642-2-git-send-email-amasule@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aniket Masule <amasule@codeaurora.org>, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Malathi Gottam <mgottam@codeaurora.org>
List-Id: devicetree@vger.kernel.org



On 6/27/2019 12:55 PM, Aniket Masule wrote:
> From: Malathi Gottam <mgottam@codeaurora.org>
> 
> This adds video nodes to sdm845 based on the examples
> in the bindings.
> 
> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
> Co-developed-by: Aniket Masule <amasule@codeaurora.org>
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..94813a9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1893,6 +1893,36 @@
>   			};
>   		};
>   
> +		video-codec@aa00000 {
> +			compatible = "qcom,sdm845-venus";
> +			reg = <0x0aa00000 0xff000>;

this should be
	reg = <0 0x0aa00000 0 0xff000>;

> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>;
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
> +			clock-names = "core", "iface", "bus";
> +			iommus = <&apps_smmu 0x10a0 0x8>,
> +				 <&apps_smmu 0x10b0 0x0>;
> +			memory-region = <&venus_region>;

this is venus_mem and not venus_region.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
