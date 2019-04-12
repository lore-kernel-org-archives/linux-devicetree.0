Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55894 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfDLLXA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:23:00 -0400
Date: Fri, 12 Apr 2019 13:22:56 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 02/20] ARM: dts: r8a77470: Add MSIOF support
Message-ID: <20190412112256.ghrhnautiij3lbu3@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-3-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-3-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 11, 2019 at 04:54:04PM +0900, Cao Van Dong wrote:
> Add msiof{0|1|2} nodes to dtsi for MSIOF support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 60bd79f..08a0b15 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -20,6 +20,9 @@
>  		i2c2 = &i2c2;
>  		i2c3 = &i2c3;
>  		i2c4 = &i2c4;
> +		spi1 = &msiof0;
> +		spi2 = &msiof1;
> +		spi3 = &msiof2;
>  	};

Please do not add new aliases, we are moving away from this approach.
Otherwise the patch looks good to me.

>  
>  	cpus {
> @@ -636,6 +639,54 @@
>  			status = "disabled";
>  		};
>  
> +		msiof0: spi@e6e20000 {
> +			compatible = "renesas,msiof-r8a77470",
> +				     "renesas,rcar-gen2-msiof";
> +			reg = <0 0xe6e20000 0 0x0064>;
> +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 000>;
> +			dmas = <&dmac0 0x51>, <&dmac0 0x52>,
> +			       <&dmac1 0x51>, <&dmac1 0x52>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			resets = <&cpg 000>;
> +			status = "disabled";
> +		};
> +
> +		msiof1: spi@e6e10000 {
> +			compatible = "renesas,msiof-r8a77470",
> +				     "renesas,rcar-gen2-msiof";
> +			reg = <0 0xe6e10000 0 0x0064>;
> +			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 208>;
> +			dmas = <&dmac0 0x55>, <&dmac0 0x56>,
> +			       <&dmac1 0x55>, <&dmac1 0x56>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			resets = <&cpg 208>;
> +			status = "disabled";
> +		};
> +
> +		msiof2: spi@e6e00000 {
> +			compatible = "renesas,msiof-r8a77470",
> +				     "renesas,rcar-gen2-msiof";
> +			reg = <0 0xe6e00000 0 0x0064>;
> +			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 205>;
> +			dmas = <&dmac0 0x41>, <&dmac0 0x42>,
> +			       <&dmac1 0x41>, <&dmac1 0x42>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			resets = <&cpg 205>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 
