Return-Path: <SRS0=Eida=TI=verge.net.au=horms@kernel.org>
Date: Wed, 8 May 2019 11:44:06 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 08/10] ARM: dts: r7s9210: Add USB Host support
Message-ID: <20190508094405.bpiyjlkmix67l3uz@verge.net.au>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-9-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506234631.113226-9-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, May 06, 2019 at 06:46:29PM -0500, Chris Brandt wrote:
> Add EHCI and OHCI host support for RZ/A2.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s9210.dtsi | 64 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
> index 2eaa5eeba509..1a992e6197c3 100644
> --- a/arch/arm/boot/dts/r7s9210.dtsi
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -322,6 +322,70 @@
>  			status = "disabled";
>  		};
>  
> +		ohci0: usbhcd@e8218000 {
> +			compatible = "generic-ohci";
> +			reg = <0xe8218000 0x100>;
> +			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 61>;
> +			phys = <&usb2_phy0>;
> +			phy-names = "usb";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +		};
> +
> +		ehci0: usbhcd@e8218100 {
> +			compatible = "generic-ehci";
> +			reg = <0xe8218100 0x100>;
> +			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 61>;
> +			phys = <&usb2_phy0>;
> +			phy-names = "usb";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +		};
> +
> +		usb2_phy0: usb-phy@e8218200 {
> +			compatible = "renesas,usb2-phy-r7s9210","renesas,rcar-gen3-usb2-phy";

Hi Chris,

please add a space after ','. Likewise below.

Otherwise this patch looks good to me.

> +			reg = <0xe8218200 0x10>;
> +			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 61>;
> +			power-domains = <&cpg>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		ohci1: usbhcd@e821a000 {
> +			compatible = "generic-ohci";
> +			reg = <0xe821a000 0x100>;
> +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 60>;
> +			phys = <&usb2_phy1>;
> +			phy-names = "usb";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +		};
> +
> +		ehci1: usbhcd@e821a100 {
> +			compatible = "generic-ehci";
> +			reg = <0xe821a100 0x100>;
> +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 60>;
> +			phys = <&usb2_phy1>;
> +			phy-names = "usb";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +		};
> +
> +		usb2_phy1: usb-phy@e821a200 {
> +			compatible = "renesas,usb2-phy-r7s9210","renesas,rcar-gen3-usb2-phy";
> +			reg = <0xe821a200 0x10>;
> +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 60>;
> +			power-domains = <&cpg>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@e8228000 {
>  			compatible = "renesas,sdhi-r7s9210";
>  			reg = <0xe8228000 0x8c0>;
> -- 
> 2.16.1
> 
