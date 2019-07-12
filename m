From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v3] arm64: dts: sdm845: Add video nodes
Date: Fri, 12 Jul 2019 14:55:48 +0530
Message-ID: <81590b01-e9e7-dbc7-c2c8-0d6093db7ce0@codeaurora.org>
References: <1562069549-25384-1-git-send-email-amasule@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562069549-25384-1-git-send-email-amasule@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aniket Masule <amasule@codeaurora.org>, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org, Malathi Gottam <mgottam@codeaurora.org>
List-Id: devicetree@vger.kernel.org



On 7/2/2019 5:42 PM, Aniket Masule wrote:
> From: Malathi Gottam <mgottam@codeaurora.org>
> 
> This adds video nodes to sdm845 based on the examples
> in the bindings.
> 
> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
> Co-developed-by: Aniket Masule <amasule@codeaurora.org>
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..f3cd94f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1893,6 +1893,36 @@
>   			};
>   		};
>   
> +		video-codec@aa00000 {
> +			compatible = "qcom,sdm845-venus";
> +			reg = <0 0x0aa00000 0 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>;
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
> +			clock-names = "core", "iface", "bus";
> +			iommus = <&apps_smmu 0x10a0 0x8>,
> +				 <&apps_smmu 0x10b0 0x0>;
> +			memory-region = <&venus_mem>;
> +
> +			video-core0 {
> +				compatible = "venus-decoder";
> +				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +				clock-names = "core", "bus";
> +				power-domains = <&videocc VCODEC0_GDSC>;
> +			};
> +
> +			video-core1 {
> +				compatible = "venus-encoder";
> +				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
> +					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
> +				clock-names = "core", "bus";
> +				power-domains = <&videocc VCODEC1_GDSC>;
> +			};
> +		};
> +
>   		videocc: clock-controller@ab00000 {
>   			compatible = "qcom,sdm845-videocc";
>   			reg = <0 0x0ab00000 0 0x10000>;
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
