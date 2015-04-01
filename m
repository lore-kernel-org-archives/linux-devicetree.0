From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: Add SPMI PMIC Arbiter node for MSM8916
Date: Wed, 1 Apr 2015 14:58:53 -0500
Message-ID: <FE0C1CC3-BEF6-4C5E-85E8-507CAAF8A8A9@codeaurora.org>
References: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org> <1427900715-26273-5-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427900715-26273-5-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Apr 1, 2015, at 10:05 AM, Ivan T. Ivanov <ivan.ivanov@linaro.org> wrote:

> Add SPMI PMIC Arbiter configuration nodes for MSM8916.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> ---
> arch/arm64/boot/dts/qcom/msm8916.dtsi | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index f212b83..02a4916 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -192,5 +192,23 @@
> 				status = "disabled";
> 			};
> 		};
> +
> +		spmi_bus: spmi@200f000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x200f000 0x1000>,
> +				<0x2400000 0x400000>,
> +				<0x2c00000 0x400000>,
> +				<0x3800000 0x200000>,
> +				<0x200a000 0x2100>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts = <0 190 0>;


please cleanup level/edge cell values to use defines

> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +		};
> 	};
> };
> --
> 1.9.1
> 

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
