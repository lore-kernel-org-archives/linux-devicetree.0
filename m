Return-Path: <SRS0=Z+zc=OI=verge.net.au=horms@kernel.org>
Date: Thu, 29 Nov 2018 13:49:19 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 7/7] ARM: dts: r8a7744: Add SMP support
Message-ID: <20181129124915.almc5pimbglpyzcy@verge.net.au>
References: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com>
 <1542878075-61314-8-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542878075-61314-8-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 22, 2018 at 09:14:35AM +0000, Biju Das wrote:
> Add DT node for the Advanced Power Management Unit (APMU), add the
> second CPU core, and use "renesas,apmu" as "enable-method".
> 
> Also add cpu1 phandle node to the PMU interrupt-affinity property.

Hi Biju,

Could you comment on how well this has been tested with respect
to CPU hotplug and suspend to RAM?

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a7744.dtsi | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
> index 046ed94..79e75e7 100644
> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -49,6 +49,7 @@
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		enable-method = "renesas,apmu";
>  
>  		cpu0: cpu@0 {
>  			device_type = "cpu";
> @@ -69,6 +70,25 @@
>  					   < 375000 1000000>;
>  		};
>  
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a15";
> +			reg = <1>;
> +			clock-frequency = <1500000000>;
> +			clocks = <&cpg CPG_CORE R8A7744_CLK_Z>;
> +			clock-latency = <300000>; /* 300 us */
> +			power-domains = <&sysc R8A7744_PD_CA15_CPU1>;
> +			next-level-cache = <&L2_CA15>;
> +
> +			/* kHz - uV - OPPs unknown yet */
> +			operating-points = <1500000 1000000>,
> +					   <1312500 1000000>,
> +					   <1125000 1000000>,
> +					   < 937500 1000000>,
> +					   < 750000 1000000>,
> +					   < 375000 1000000>;
> +		};
> +
>  		L2_CA15: cache-controller-0 {
>  			compatible = "cache";
>  			cache-unified;
> @@ -96,7 +116,7 @@
>  		compatible = "arm,cortex-a15-pmu";
>  		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>  				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-affinity = <&cpu0>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>;
>  	};
>  
>  	/* External SCIF clock */
> @@ -250,6 +270,12 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		apmu@e6152000 {
> +			compatible = "renesas,r8a7744-apmu", "renesas,apmu";
> +			reg = <0 0xe6152000 0 0x188>;
> +			cpus = <&cpu0 &cpu1>;
> +		};
> +
>  		rst: reset-controller@e6160000 {
>  			compatible = "renesas,r8a7744-rst";
>  			reg = <0 0xe6160000 0 0x100>;
> -- 
> 2.7.4
> 
