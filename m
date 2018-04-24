Return-Path: <SRS0=akpW=HN=verge.net.au=horms@kernel.org>
Date: Tue, 24 Apr 2018 09:08:01 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH  3/4] ARM: dts: r8a77470: Add SCIF support
Message-ID: <20180424070801.5g6t2ahoe6lszjw4@verge.net.au>
References: <1524238029-55315-1-git-send-email-biju.das@bp.renesas.com>
 <1524238029-55315-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524238029-55315-4-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 20, 2018 at 04:27:08PM +0100, Biju Das wrote:
> Describe SCIF ports in the R8A77470 device tree.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 69 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 2f89f33..39549f2 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -190,19 +190,84 @@
>  			dma-channels = <15>;
>  		};
>  
> +		scif0: serial@e6e60000 {
> +			compatible = "renesas,scif-r8a77470",
> +				     "renesas,rcar-gen2-scif", "renesas,scif";
> +			reg = <0 0xe6e60000 0 0x40>;
> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 721>,
> +				 <&cpg CPG_CORE 5>, <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 721>;
> +			status = "disabled";
> +		};
> +
>  		scif1: serial@e6e68000 {
>  			compatible = "renesas,scif-r8a77470",
>  				     "renesas,rcar-gen2-scif", "renesas,scif";
>  			reg = <0 0xe6e68000 0 0x40>;
>  			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&cpg CPG_MOD 720>,
> -				 <&cpg CPG_CORE 6>, <&scif_clk>;
> +			clocks = <&cpg CPG_MOD 720>,
> +				 <&cpg CPG_CORE 5>, <&scif_clk>;

I am a little unclear why the CPG clock is changed from 6 (ZS?) to 5 (ZX?).
Could you clarify this for me?

>  			clock-names = "fck", "brg_int", "scif_clk";
>  			power-domains = <&sysc 32>;
>  			resets = <&cpg 720>;
>  			status = "disabled";
>  		};
>  
> +		scif2: serial@e6e58000 {
> +			compatible = "renesas,scif-r8a77470",
> +				     "renesas,rcar-gen2-scif", "renesas,scif";
> +			reg = <0 0xe6e58000 0 0x40>;
> +			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 719>,
> +				 <&cpg CPG_CORE 5>, <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 719>;
> +			status = "disabled";
> +		};
> +
> +		scif3: serial@e6ea8000 {
> +			compatible = "renesas,scif-r8a77470",
> +				     "renesas,rcar-gen2-scif", "renesas,scif";
> +			reg = <0 0xe6ea8000 0 0x40>;
> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 718>,
> +				 <&cpg CPG_CORE 5>, <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 718>;
> +			status = "disabled";
> +		};
> +
> +		scif4: serial@e6ee0000 {
> +			compatible = "renesas,scif-r8a77470",
> +				     "renesas,rcar-gen2-scif", "renesas,scif";
> +			reg = <0 0xe6ee0000 0 0x40>;
> +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 715>,
> +				 <&cpg CPG_CORE 5>, <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 715>;
> +			status = "disabled";
> +		};
> +
> +		scif5: serial@e6ee8000 {
> +			compatible = "renesas,scif-r8a77470",
> +				     "renesas,rcar-gen2-scif", "renesas,scif";
> +			reg = <0 0xe6ee8000 0 0x40>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 714>,
> +				 <&cpg CPG_CORE 5>, <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 714>;
> +			status = "disabled";
> +		};
> +
>  		gic: interrupt-controller@f1001000 {
>  			compatible = "arm,gic-400";
>  			#interrupt-cells = <3>;
> -- 
> 2.7.4
> 
