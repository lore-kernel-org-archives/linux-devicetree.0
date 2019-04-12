Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57196 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfDLLge (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:36:34 -0400
Date: Fri, 12 Apr 2019 13:36:30 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 08/20] ARM: dts: r8a77470: Add Ether support
Message-ID: <20190412113630.lbfyiwpo2fpcnk45@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-9-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-9-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi Dong-san,

On Thu, Apr 11, 2019 at 04:54:10PM +0900, Cao Van Dong wrote:
> Add ether node to dtsi for Ether support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 9fc9f6a..ae1dba0 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -1099,6 +1099,20 @@
>  			dma-channels = <13>;
>  		};
>  
> +		ether: ethernet@ee700000 {

Nodes should be sorted by 
1. Bus address
2. IP block type

So ethernet@ee700000 should go after sd@ee100000.

Otherwise this patch looks good to me.

> +			compatible = "renesas,ether-r8a77470",
> +				     "renesas,rcar-gen2-ether";
> +			reg = <0 0xee700000 0 0x400>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 813>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 813>;
> +			phy-mode = "rmii";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 
