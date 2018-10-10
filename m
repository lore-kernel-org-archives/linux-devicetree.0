Return-Path: <SRS0=gqsS=MW=ragnatech.se=niklas.soderlund@kernel.org>
Date: Wed, 10 Oct 2018 12:57:40 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add thermal support
Message-ID: <20181010105740.GC24305@bigcity.dyn.berto.se>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <90451643-6beb-e61f-912c-3adff4c943cb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90451643-6beb-e61f-912c-3adff4c943cb@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

Thanks for your work.

On 2018-10-09 22:37:47 +0300, Sergei Shtylyov wrote:
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

As Simon points out other Gen3 thermal nodes use "tsc:" not "thermal:".

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

Missing status = "okay" or am I missing something?

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

The thermal-zones node uses the Gen2 labels and I think this should be 
updated to be as consistent as possible with other Gen3 users. For extra 
points expand this could be expanded to also include the cooling-maps 
but could also happen in a separate patch if cooling-devices are not yet 
defined :-)

> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |

-- 
Regards,
Niklas S�derlund
