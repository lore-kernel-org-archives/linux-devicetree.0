Return-Path: <shawnguo@kernel.org>
Date: Tue, 26 Mar 2019 16:23:20 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/5] ARM: dts: imx7s: Add video mux, csi and mipi_csi
Message-ID: <20190326082318.GF12513@dragon>
References: <20190319170003.21261-1-rui.silva@linaro.org>
 <20190319170003.21261-4-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319170003.21261-4-rui.silva@linaro.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 19, 2019 at 05:00:01PM +0000, Rui Miguel Silva wrote:
> Add device tree nodes for csi, video multiplexer and mipi-csi.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  arch/arm/boot/dts/imx7s.dtsi | 70 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 792efcd2caa1..1992e32a9731 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/imx7-reset.h>
>  #include "imx7d-pinfunc.h"
>  
>  / {
> @@ -506,6 +507,29 @@
>  					#mux-control-cells = <0>;
>  					mux-reg-masks = <0x14 0x00000010>;
>  				};
> +
> +				csi_mux {

We prefer to use hyphen in the node name.

> +					compatible = "video-mux";
> +					mux-controls = <&mux 0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						csi_mux_from_mipi_vc0: endpoint {
> +							remote-endpoint = <&mipi_vc0_to_csi_mux>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						csi_mux_to_csi: endpoint {
> +							remote-endpoint = <&csi_from_csi_mux>;
> +						};
> +					};
> +				};
>  			};
>  
>  			ocotp: ocotp-ctrl@30350000 {
> @@ -709,6 +733,23 @@
>  				status = "disabled";
>  			};
>  
> +			csi: csi@30710000 {
> +				compatible = "fsl,imx7-csi";
> +				reg = <0x30710000 0x10000>;
> +				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX7D_CLK_DUMMY>,
> +						<&clks IMX7D_CSI_MCLK_ROOT_CLK>,
> +						<&clks IMX7D_CLK_DUMMY>;

Please make the indent align with the first line.

> +				clock-names = "axi", "mclk", "dcic";
> +				status = "disabled";
> +
> +				port {
> +					csi_from_csi_mux: endpoint {
> +						remote-endpoint = <&csi_mux_to_csi>;
> +					};
> +				};
> +			};
> +
>  			lcdif: lcdif@30730000 {
>  				compatible = "fsl,imx7d-lcdif", "fsl,imx28-lcdif";
>  				reg = <0x30730000 0x10000>;
> @@ -718,6 +759,35 @@
>  				clock-names = "pix", "axi";
>  				status = "disabled";
>  			};
> +
> +			mipi_csi: mipi-csi@30750000 {
> +				compatible = "fsl,imx7-mipi-csi2";
> +				reg = <0x30750000 0x10000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> +					<&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> +					<&clks IMX7D_MIPI_DPHY_ROOT_CLK>;

Ditto

Shawn

> +				clock-names = "pclk", "wrap", "phy";
> +				power-domains = <&pgc_mipi_phy>;
> +				phy-supply = <&reg_1p0d>;
> +				resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> +				reset-names = "mrst";
> +				status = "disabled";
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					mipi_vc0_to_csi_mux: endpoint {
> +						remote-endpoint = <&csi_mux_from_mipi_vc0>;
> +					};
> +				};
> +			};
>  		};
>  
>  		aips3: aips-bus@30800000 {
> -- 
> 2.21.0
> 
