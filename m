From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Date: Wed, 9 Aug 2017 10:56:22 +0200
Message-ID: <20170809085622.GL2705@verge.net.au>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502196418-31341-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 08, 2017 at 01:46:58PM +0100, Biju Das wrote:
> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
> This patch has been tested against Linux-next tag 20170727 and renesas-dev branch.
> This patch depends on https://www.spinics.net/lists/arm-kernel/msg599220.html

Process comments as per those for
"[PATCH  2/2] ARM: dts: r8a7743: Add I2C DT support".

Patch itself looks good to me.

> 
>  arch/arm/boot/dts/r8a7743.dtsi | 55 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 14222c72..5c2b140 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -25,6 +25,9 @@
>  		i2c3 = &i2c3;
>  		i2c4 = &i2c4;
>  		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
>  	};
>  
>  	cpus {
> @@ -436,6 +439,58 @@
>  			status = "disabled";
>  		};
>  
> +		i2c6: i2c@e60b0000 {
> +			/* doesn't need pinmux */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg = <0 0xe60b0000 0 0x425>;
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 926>;
> +			dmas = <&dmac0 0x77>, <&dmac0 0x78>,
> +			       <&dmac1 0x77>, <&dmac1 0x78>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg CPG_MOD 926>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@e6500000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg = <0 0xe6500000 0 0x425>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 318>;
> +			dmas = <&dmac0 0x61>, <&dmac0 0x62>,
> +			       <&dmac1 0x61>, <&dmac1 0x62>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg 318>;
> +			status = "disabled";
> +		};
> +
> +		i2c8: i2c@e6510000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg = <0 0xe6510000 0 0x425>;
> +			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 323>;
> +			dmas = <&dmac0 0x65>, <&dmac0 0x66>,
> +			       <&dmac1 0x65>, <&dmac1 0x66>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg 323>;
> +			status = "disabled";
> +		};
> +
>  		scifa0: serial@e6c40000 {
>  			compatible = "renesas,scifa-r8a7743",
>  				     "renesas,rcar-gen2-scifa", "renesas,scifa";
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
