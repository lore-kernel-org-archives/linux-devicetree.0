Return-Path: <SRS0=smIv=OZ=verge.net.au=horms@kernel.org>
Date: Sun, 16 Dec 2018 21:18:01 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 01/17] arm64: dts: renesas: r8a774c0: Add SDHI nodes
Message-ID: <20181216201801.g3ucm7sverkgtza5@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 14, 2018 at 09:37:24AM +0000, Fabrizio Castro wrote:
> Add SDHI nodes to the DT of the r8a774c0 SoC.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 83db7c7..96a71e3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -603,6 +603,42 @@
>  			status = "disabled";
>  		};
>  
> +		sdhi0: sd@ee100000 {
> +			compatible = "renesas,sdhi-r8a774c0",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee100000 0 0x2000>;
> +			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 314>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 314>;
> +			status = "disabled";
> +		};
> +
> +		sdhi1: sd@ee120000 {
> +			compatible = "renesas,sdhi-r8a774c0",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee120000 0 0x2000>;
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 313>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 313>;
> +			status = "disabled";
> +		};
> +
> +		sdhi3: sd@ee160000 {
> +			compatible = "renesas,sdhi-r8a774c0",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee160000 0 0x2000>;
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 311>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 311>;
> +			status = "disabled";
> +		};
> +
>  		gic: interrupt-controller@f1010000 {
>  			compatible = "arm,gic-400";
>  			#interrupt-cells = <3>;
> -- 
> 2.7.4
> 
