From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 10/13] ARM: dts: r8a7792: add IRQC support
Date: Wed, 1 Jun 2016 10:18:13 +0900
Message-ID: <20160601011813.GJ20527@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <3573091.BUvyGW3hVt@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3573091.BUvyGW3hVt@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 01, 2016 at 01:29:05AM +0300, Sergei Shtylyov wrote:
> Describe the IRQC interrupt controller in the R8A7792 device tree.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm/boot/dts/r8a7792.dtsi |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7792.dtsi
> @@ -62,6 +62,19 @@
>  			      IRQ_TYPE_LEVEL_HIGH)>;
>  	};
>  
> +	irqc: interrupt-controller@e61c0000 {

Could you consider using irqc0 as the node name for consistency with the
DT of other R-Car Gen2 SoCs?

What follows looks correct to me.

> +		compatible = "renesas,irqc-r8a7792", "renesas,irqc";
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		reg = <0 0xe61c0000 0 0x200>;
> +		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&mstp4_clks R8A7792_CLK_IRQC>;
> +		power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
> +	};
> +
>  	timer {
>  		compatible = "arm,armv7-timer";
>  		interrupts = <GIC_PPI 13
> 
