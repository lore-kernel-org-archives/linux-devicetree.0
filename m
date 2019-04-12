Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56132 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfDLLZX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:25:23 -0400
Date: Fri, 12 Apr 2019 13:25:19 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 04/20] ARM: dts: r8a77470: Add CAN support
Message-ID: <20190412112518.7ugj564x6iisriq2@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-5-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-5-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi Dong-san,

On Thu, Apr 11, 2019 at 04:54:06PM +0900, Cao Van Dong wrote:
> Add can{0|1} nodes to dtsi for CAN support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 7d1fe2f..97c51c5 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -757,6 +757,32 @@
>  			status = "disabled";
>  		};
>  
> +		can0: can@e6e80000 {
> +			compatible = "renesas,can-r8a77470",
> +				     "renesas,rcar-gen2-can";
> +			reg = <0 0xe6e80000 0 0x1000>;
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 916>,
> +				 <&cpg CPG_CORE R8A77470_CLK_RCAN>, <&can_clk>;
> +			clock-names = "clkp1", "clkp2", "can_clk";

This patch makes use of can_clk which does not exist.

I think a good solution to this problem would be to squash the
following patch into this one:

[PATCH v2 13/20] ARM: dts: r8a77470: Add can clocks

> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 916>;
> +			status = "disabled";
> +		};
> +
> +		can1: can@e6e88000 {
> +			compatible = "renesas,can-r8a77470",
> +				     "renesas,rcar-gen2-can";
> +			reg = <0 0xe6e88000 0 0x1000>;
> +			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 915>,
> +				 <&cpg CPG_CORE R8A77470_CLK_RCAN>, <&can_clk>;
> +			clock-names = "clkp1", "clkp2", "can_clk";
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 915>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 
