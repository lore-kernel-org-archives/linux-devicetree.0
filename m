Return-Path: <SRS0=wLft=MW=verge.net.au=horms@kernel.org>
Date: Wed, 10 Oct 2018 10:36:46 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add thermal support
Message-ID: <20181010083645.sugql3zp4ttj2fll@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <90451643-6beb-e61f-912c-3adff4c943cb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90451643-6beb-e61f-912c-3adff4c943cb@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

[+ Niklas]

On Tue, Oct 09, 2018 at 10:37:47PM +0300, Sergei Shtylyov wrote:
> Describe THS/CIVM in the R8A77980 device trees.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20181008-v4.19-rc7' tag of Simon
> Horman's 'renesas.git' repo.
> 
> The thermal driver/bindings patches have been just posted...
> 
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   38 ++++++++++++++++++++++++++++++

Thanks Sergei, one minor nit from me below.

Niklas, I'd value your review of this patch.

>  1 file changed, 38 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -330,6 +330,19 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		thermal: thermal@e6198000 {

"tsc:" would be consistent with other R-Car Gen 3 dtsi that
describe this device.

> +			compatible = "renesas,r8a77980-thermal";
> +			reg = <0 0xe6198000 0 0x100>,
> +			      <0 0xe61a0000 0 0x100>;
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 522>;
> +			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> +			resets = <&cpg 522>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		intc_ex: interrupt-controller@e61c0000 {
>  			compatible = "renesas,intc-ex-r8a77980", "renesas,irqc";
>  			#interrupt-cells = <2>;
> @@ -1404,6 +1417,31 @@
>  		};
>  	};
>  
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&thermal 0>;
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
> +
> +		sensor2-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&thermal 1>;
> +		};
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> 
