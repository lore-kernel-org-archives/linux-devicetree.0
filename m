From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v5] arm64: dts: sdm845: add video nodes
Date: Mon, 28 Jan 2019 14:02:44 +0530
Message-ID: <4df9ddb2ea57d4d85b407b7d7a934ac2@codeaurora.org>
References: <1548403893-21677-1-git-send-email-mgottam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548403893-21677-1-git-send-email-mgottam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Malathi Gottam <mgottam@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, acourbot@chromium.org, stanimir.varbanov@linaro.org, vgarodia@codeaurora.org, linux-arm-msm-owner@vger.kernel.org, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Malathi,

Bjorn has a patch adding all reserved memory
nodes from version 10 so you can probably drop
the venus_region node from the patch.

https://patchwork.kernel.org/patch/10774869/

On 2019-01-25 13:41, Malathi Gottam wrote:
> This adds video nodes to sdm845 based on the examples
> in the bindings.
> 
> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
> ---
> Changes:
> 	Added video firmware node
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 38 
> ++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b72bdb0..1af68f5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -87,6 +87,11 @@
>  			reg = <0 0x86200000 0 0x2d00000>;
>  			no-map;
>  		};
> +
> +		venus_region: memory@95800000 {
> +			reg = <0x0 0x95800000 0x0 0x500000>;
> +			no-map;
> +		};
>  	};
> 
>  	cpus {
> @@ -1403,5 +1408,38 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		video-codec@aa00000 {
> +			compatible = "qcom,sdm845-venus";
> +			reg = <0x0aa00000 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>;
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
> +			clock-names = "core", "iface", "bus";
> +			iommus = <&apps_smmu 0x10a0 0x8>,
> +				 <&apps_smmu 0x10b0 0x0>;
> +			memory-region = <&venus_region>;
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
> +			video-firmware {
> +				iommus = <&apps_smmu 0x10b2 0x0>;
> +			};
> +		};
>  	};
>  };

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
