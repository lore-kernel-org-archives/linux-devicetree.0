Return-Path: <SRS0=iYly=US=ideasonboard.com=laurent.pinchart@kernel.org>
Date: Wed, 19 Jun 2019 15:38:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add HDMI encoder
 instance
Message-ID: <20190619123856.GA21753@pendragon.ideasonboard.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1560871119-16570-3-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

Thank you for the patch.

On Tue, Jun 18, 2019 at 04:18:38PM +0100, Fabrizio Castro wrote:
> Add the HDMI encoder to the R8A774A1 DT in disabled state.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> This patch depends on:
> https://patchwork.kernel.org/patch/10995149/

Is that the correct one ? I don't see how CAN support is related.

In any case,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index d6dd4b6..a849ca7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -2397,6 +2397,37 @@
>  			};
>  		};
>  
> +		hdmi0: hdmi@fead0000 {
> +			compatible = "renesas,r8a774a1-hdmi",
> +				     "renesas,rcar-gen3-hdmi";
> +			reg = <0 0xfead0000 0 0x10000>;
> +			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 729>,
> +				 <&cpg CPG_CORE R8A774A1_CLK_HDMI>;
> +			clock-names = "iahb", "isfr";
> +			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
> +			resets = <&cpg 729>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					dw_hdmi0_in: endpoint {
> +						remote-endpoint = <&du_out_hdmi0>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +				};
> +				port@2 {
> +					/* HDMI sound */
> +					reg = <2>;
> +				};
> +			};
> +		};
> +
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a774a1";
>  			reg = <0 0xfeb00000 0 0x70000>;
> @@ -2423,6 +2454,7 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_hdmi0: endpoint {
> +						remote-endpoint = <&dw_hdmi0_in>;
>  					};
>  				};
>  				port@2 {

-- 
Regards,

Laurent Pinchart
