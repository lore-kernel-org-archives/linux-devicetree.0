Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57762 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbfDLLlV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:41:21 -0400
Date: Fri, 12 Apr 2019 13:41:16 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 09/20] ARM: dts: r8a77470: Add VSP support
Message-ID: <20190412114116.xmjmi53k5lsfu3vq@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-10-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-10-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 11, 2019 at 04:54:11PM +0900, Cao Van Dong wrote:
> Add vsp nodes to dtsi for VSP support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index ae1dba0..2540bca 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -1113,6 +1113,24 @@
>  			status = "disabled";
>  		};
>  
> +		vsp@fe928000 {
> +			compatible = "renesas,vsp1";
> +			reg = <0 0xfe928000 0 0x8000>;
> +			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 131>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 131>;
> +		};
> +
> +		vsp@fe930000 {
> +			compatible = "renesas,vsp1";
> +			reg = <0 0xfe930000 0 0x8000>;
> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 128>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 128>;
> +		};
> +

Nodes should be sorted by
1. Bus address
2. IP block tupe

So the above vsp nodes should go after sd@ee100000.

Otherwise this patch looks good to me.

>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 
