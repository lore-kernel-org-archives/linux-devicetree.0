Return-Path: <SRS0=ioYF=MU=verge.net.au=horms@kernel.org>
Date: Mon, 8 Oct 2018 09:55:27 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add thermal support
Message-ID: <20181008075526.7cygudjvtb4q4d6r@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <51491585-16fb-93b1-bb1a-09e89683f2f0@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51491585-16fb-93b1-bb1a-09e89683f2f0@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Yoshihiro Kaneko <ykaneko0929@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 05, 2018 at 10:25:47PM +0300, Sergei Shtylyov wrote:
> Describe THS/CIVM in the R8A77970 device trees.
> 
> Based on the original (and large) patches by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20181004-v4.19-rc6' tag of Simon
> Horman's 'renesas.git' repo.
> 
> The thermal driver/bindings patches have been posted yesterday...
> 
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -300,6 +300,19 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		thermal: thermal@e6190000 {
> +			compatible = "renesas,thermal-r8a77970";
> +			reg =  <0 0xe6190000 0 0x14

What is the motivation for 0x14, to me 0x10 seems like a more natural size
for the register window.

Otherwise the patch looks good to me.

> +				0 0xe6190100 0 0x38>;
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 522>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 522>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
>  		intc_ex: interrupt-controller@e61c0000 {
>  			compatible = "renesas,intc-ex-r8a77970", "renesas,irqc";
>  			#interrupt-cells = <2>;
> @@ -1033,6 +1046,25 @@
>  		};
>  	};
>  
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&thermal>;
> +
> +			trips {
> +				cpu-crit {
> +					temperature = <120000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +			};
> +		};
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> 
