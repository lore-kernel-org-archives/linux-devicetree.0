From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7792: add SDHI support
Date: Mon, 18 Jul 2016 07:58:45 +0900
Message-ID: <20160717225842.GA25133@verge.net.au>
References: <2441635.ESeLhIjWEX@wasted.cogentembedded.com>
 <8030361.FnpbGzHVP8@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8030361.FnpbGzHVP8@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 13, 2016 at 12:11:12AM +0300, Sergei Shtylyov wrote:
> Define the generic R8A7792 part of the SDHI0 device node.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm/boot/dts/r8a7792.dtsi |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7792.dtsi
> @@ -435,6 +435,18 @@
>  			status = "disabled";
>  		};
>  
> +		sdhi0: sd@ee100000 {
> +			compatible = "renesas,sdhi-r8a7792";
> +			reg = <0 0xee100000 0 0x200>;

I do not have the documentation available to check, however, I wonder if
as per 66f47ed0e86d ("ARM: shmobile: r8a7790: tidyup SDHI register size on
DTSI") the register size should be 0x328.

It also looks like register the DTS for the r8a7794 needs updating along
the same lines.

> +			interrupts = <0 165 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
> +			       <&dmac1 0xcd>, <&dmac1 0xce>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			clocks = <&mstp3_clks R8A7792_CLK_SDHI0>;
> +			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
>  		jpu: jpeg-codec@fe980000 {
>  			compatible = "renesas,jpu-r8a7792",
>  				     "renesas,rcar-gen2-jpu";
> 
