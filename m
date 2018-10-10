Return-Path: <SRS0=gqsS=MW=ragnatech.se=niklas.soderlund@kernel.org>
Date: Thu, 11 Oct 2018 00:11:42 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77980: add thermal support
Message-ID: <20181010221142.GG24305@bigcity.dyn.berto.se>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <90934111-8cc5-482d-8a78-5ccc1113e42d@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90934111-8cc5-482d-8a78-5ccc1113e42d@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

Thanks for keep working on this patch.

On 2018-10-10 22:18:11 +0300, Sergei Shtylyov wrote:
> Describe THS/CIVM in the R8A77980 device trees.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20181008-v4.19-rc7' tag of Simon
> Horman's 'renesas.git' repo.
> 
> Changes in version 2:
> - renamed the thermal device node label;
> - renamed the thermal zone nodes;
> - added the passive trip point in the 1st thermal zone and the passive and
>   critical trip points in the 2nd thermal zone;
> - changed the "hysteresis" prop in the critical trip point;
> - removed the empty "cooling-maps" node from the 1st thermal zone.
> 
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   53 ++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -330,6 +330,19 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		tsc: thermal@e6198000 {
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

The status property is missing but as you told me in v1 it should not 
matter. I will leave it for Simon to decide if he wants it to keep it 
consistent with other SoC or if we should remove it from the other dtsi 
files. In any case with or without the status property.

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> +		};
> +
>  		intc_ex: interrupt-controller@e61c0000 {
>  			compatible = "renesas,intc-ex-r8a77980", "renesas,irqc";
>  			#interrupt-cells = <2>;
> @@ -1404,6 +1417,46 @@
>  		};
>  	};
>  
> +	thermal-zones {
> +		thermal-sensor-1 {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&tsc 0>;
> +
> +			trips {
> +				sensor1-passive {
> +					temperature = <95000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +				sensor1-critical {
> +					temperature = <120000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		thermal-sensor-2 {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&tsc 1>;
> +
> +			trips {
> +				sensor2-passive {
> +					temperature = <95000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +				sensor2-critical {
> +					temperature = <120000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |

-- 
Regards,
Niklas S�derlund
