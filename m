From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 2/4] arm64: dts: hisilicon: Add clock nodes for Hi3670 SoC
Date: Thu, 29 Nov 2018 15:21:51 +0000
Message-ID: <5C00040F.4080507@hisilicon.com>
References: <20180921060103.21370-1-manivannan.sadhasivam@linaro.org>
 <20180921060103.21370-3-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921060103.21370-3-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On 2018/9/21 7:01, Manivannan Sadhasivam wrote:
> Add clock nodes for HiSilicon Hi3670 SoC.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to the hisilicon soc dt tree.
Thanks!

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 43 +++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> index c90e6f6a34ec..8a0ee4b08886 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/hi3670-clock.h>
>  
>  / {
>  	compatible = "hisilicon,hi3670";
> @@ -144,6 +145,48 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		crg_ctrl: crg_ctrl@fff35000 {
> +			compatible = "hisilicon,hi3670-crgctrl", "syscon";
> +			reg = <0x0 0xfff35000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pctrl: pctrl@e8a09000 {
> +			compatible = "hisilicon,hi3670-pctrl", "syscon";
> +			reg = <0x0 0xe8a09000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pmuctrl: crg_ctrl@fff34000 {
> +			compatible = "hisilicon,hi3670-pmuctrl", "syscon";
> +			reg = <0x0 0xfff34000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		sctrl: sctrl@fff0a000 {
> +			compatible = "hisilicon,hi3670-sctrl", "syscon";
> +			reg = <0x0 0xfff0a000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		iomcu: iomcu@ffd7e000 {
> +			compatible = "hisilicon,hi3670-iomcu", "syscon";
> +			reg = <0x0 0xffd7e000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		media1_crg: media1_crgctrl@e87ff000 {
> +			compatible = "hisilicon,hi3670-media1-crg", "syscon";
> +			reg = <0x0 0xe87ff000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		media2_crg: media2_crgctrl@e8900000 {
> +			compatible = "hisilicon,hi3670-media2-crg","syscon";
> +			reg = <0x0 0xe8900000 0x0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		uart6_clk: clk_19_2M {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> 
