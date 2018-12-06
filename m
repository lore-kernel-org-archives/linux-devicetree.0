From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm845: Add SD nodes for
 sdm845-mtp
Date: Thu, 6 Dec 2018 15:57:37 -0800
Message-ID: <20181206235737.GH12886@minitux>
References: <20181206184522.118062-1-evgreen@chromium.org>
 <20181206184522.118062-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206184522.118062-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu 06 Dec 10:45 PST 2018, Evan Green wrote:

> Enable support for one of the micro SD slots on the MTP.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes in v2:
>  - Fixed alphabetization of node placement in sdm845-mtp.dtsi (Doug)
>  - Fixed card detect name to match schematics (Doug).
>  - Moved comment about drive strength next to the drive-strength entry
>  (Doug)
>  - Removed drive-strength from card detect input pin (Doug).
>  - Consolidated tlmm nodes in MTP.
> 
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 58 ++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index b3def03581775..cde76da42cbb7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -7,6 +7,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sdm845.dtsi"
>  
> @@ -358,8 +359,16 @@
>  	status = "okay";
>  };
>  
> -&tlmm {
> -	gpio-reserved-ranges = <0 4>, <81 4>;
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_card_det_n>;
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vddpx_2>;
> +
> +	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  };
>  
>  &uart9 {
> @@ -450,3 +459,48 @@
>  		bias-pull-up;
>  	};
>  };
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;
> +
> +	sdc2_clk: sdc2-clk {
> +		pinconf {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +
> +			/*
> +			 * It seems that mmc_test reports errors if drive
> +			 * strength is not 16 on clk, cmd, and data pins.
> +			 */
> +			drive-strength = <16>;
> +		};
> +	};
> +
> +	sdc2_cmd: sdc2-cmd {
> +		pinconf {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +	};
> +
> +	sdc2_data: sdc2-data {
> +		pinconf {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +	};
> +
> +	sd_card_det_n: sd-card-det-n {
> +		pinmux {
> +			pins = "gpio126";
> +			function = "gpio";
> +		};
> +
> +		pinconf {
> +			pins = "gpio126";
> +			bias-pull-up;
> +		};
> +	};
> +};
> -- 
> 2.18.1
> 
