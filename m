From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v3 5/5] arm: qcom: dts: Enable NAND node on IPQ8064 AP148
 platform
Date: Mon, 3 Aug 2015 14:35:14 -0500
Message-ID: <20150803193514.GA19772@qualcomm.com>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-6-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438578498-32254-6-git-send-email-architt@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com, computersforpeace@gmail.com, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 03, 2015 at 10:38:18AM +0530, Archit Taneja wrote:
> Enable the NAND controller node on the AP148 platform. Provide pinmux
> information.
> 
> Cc: devicetree@vger.kernel.org
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> index 7f9ea50..2e88eff 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> +++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> @@ -30,6 +30,28 @@
>  					bias-none;
>  				};
>  			};
> +			nand_pins: nand_pins {
> +				mux {
> +					pins = "gpio34", "gpio35", "gpio36",
> +					       "gpio37", "gpio38", "gpio39",
> +					       "gpio40", "gpio41", "gpio42",
> +					       "gpio43", "gpio44", "gpio45",
> +					       "gpio46", "gpio47";
> +					function = "nand";
> +					drive-strength = <10>;
> +					bias-disable;
> +				};
> +				pullups {
> +					pins = "gpio39";
> +					bias-pull-up;
> +				};
> +				hold {
> +					pins = "gpio40", "gpio41", "gpio42",
> +					       "gpio43", "gpio44", "gpio45",
> +					       "gpio46", "gpio47";
> +					bias-bus-hold;

Maybe split out the bias-disable into a separate set and remove that property
from the mux.

> +				};
> +			};
>  		};
>  
>  		gsbi@16300000 {
> @@ -93,5 +115,19 @@
>  		sata@29000000 {
>  			status = "ok";
>  		};
> +
> +		nand@1ac00000 {
> +			status = "ok";
> +
> +			pinctrl-0 = <&nand_pins>;
> +			pinctrl-names = "default";
> +
> +			nand-ecc-strength = <4>;
> +			nand-bus-width = <8>;
> +		};
>  	};
>  };
> +
> +&adm_dma {
> +	status = "ok";
> +};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
