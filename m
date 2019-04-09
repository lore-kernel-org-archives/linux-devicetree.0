Return-Path: <SRS0=ScCE=SL=verge.net.au=horms@kernel.org>
Date: Tue, 9 Apr 2019 13:10:15 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH V3 08/13] ARM: dts: r8a77470: Add USB PHY DT support
Message-ID: <20190409111015.x6t5h3jeslovrrho@verge.net.au>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-9-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554287324-22312-9-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 03, 2019 at 11:28:39AM +0100, Biju Das wrote:
> Define the r8a77470 generic part of the USB PHY device node.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> V2-->V3
>   * Added gen3 usb2 phy nodes
> V1-->V2
>  * New patch
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 56 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 493cf2b..dcd2975 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -325,6 +325,42 @@
>  			status = "disabled";
>  		};
>  
> +		usbphy0: usb-phy@e6590100 {
> +			compatible = "renesas,usb-phy-r8a77470",
> +				     "renesas,rcar-gen2-usb-phy";
> +			reg = <0 0xe6590100 0 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&cpg CPG_MOD 704>;
> +			clock-names = "usbhs";
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 704>;
> +			status = "disabled";
> +
> +			usb0: usb-channel@0 {
> +				reg = <0>;
> +				#phy-cells = <1>;
> +			};
> +		};
> +
> +		usbphy1: usb-phy@e6598100 {
> +			compatible = "renesas,usb-phy-r8a77470",
> +				     "renesas,rcar-gen2-usb-phy";
> +			reg = <0 0xe6598100 0 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&cpg CPG_MOD 706>;
> +			clock-names = "usbhs";
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 706>;
> +			status = "disabled";
> +
> +			usb1: usb-channel@0 {
> +				reg = <0>;
> +				#phy-cells = <1>;
> +			};
> +		};
> +
>  		usb_dmac00: dma-controller@e65a0000 {
>  			compatible = "renesas,r8a77470-usb-dmac",
>  				     "renesas,usb-dmac";
> @@ -588,6 +624,26 @@
>  			status = "disabled";
>  		};
>  
> +		usb2_phy0: usb-phy@ee080200 {
> +			compatible = "renesas,usb2-phy-r8a77470";
> +			reg = <0 0xee080200 0 0x700>;
> +			clocks = <&cpg CPG_MOD 703>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 703>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		usb2_phy1: usb-phy@ee0c0200 {
> +			compatible = "renesas,usb2-phy-r8a77470";
> +			reg = <0 0xee0c0200 0 0x700>;
> +			clocks = <&cpg CPG_MOD 705>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 705>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 
