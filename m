From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v7 4/5] arm64: dts: actions: Add Clock Management Unit
 for S700
Date: Sat, 21 Jul 2018 00:48:42 +0530
Message-ID: <20180720191842.GA2508@Mani-XPS-13-9360>
References: <20180719090649.12460-1-sravanhome@gmail.com>
 <20180719090649.12460-5-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180719090649.12460-5-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: afaerber@suse.de, sboyd@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 19, 2018 at 11:06:48AM +0200, Saravanan Sekar wrote:
> Add Clock Management Unit for Actions Semi S700 SoC.
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/actions/s700.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
> index 66dd5309f0a2..59d29e4ca404 100644
> --- a/arch/arm64/boot/dts/actions/s700.dtsi
> +++ b/arch/arm64/boot/dts/actions/s700.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/actions,s700-cmu.h>
>  
>  / {
>  	compatible = "actions,s700";
> @@ -87,6 +88,12 @@
>  		#clock-cells = <0>;
>  	};
>  
> +	losc: losc {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		#clock-cells = <0>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -153,6 +160,13 @@
>  			status = "disabled";
>  		};
>  
> +		cmu: clock-controller@e0168000 {
> +			compatible = "actions,s700-cmu";
> +			reg = <0x0 0xe0168000 0x0 0x1000>;
> +			clocks = <&hosc>, <&losc>;
> +			#clock-cells = <1>;
> +		};
> +
>  		sps: power-controller@e01b0100 {
>  			compatible = "actions,s700-sps";
>  			reg = <0x0 0xe01b0100 0x0 0x100>;
> -- 
> 2.14.4
> 
