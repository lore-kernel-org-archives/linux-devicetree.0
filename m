Return-Path: <SRS0=X0Lk=MG=verge.net.au=horms@kernel.org>
Date: Mon, 24 Sep 2018 11:07:45 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779{7|8}0: add TPU support
Message-ID: <20180924090744.6nzzzaw5vqiblebs@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <0d1a6380-e5f0-35a2-d421-f3c5bdd04a75@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d1a6380-e5f0-35a2-d421-f3c5bdd04a75@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 22, 2018 at 11:30:09PM +0300, Sergei Shtylyov wrote:
> Describe TPU in the R8A779{7|8}0 device trees.
> 
> Based on the original (and large) patches by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, this looks good but I'd like to see the binding update
before accepting this.

> 
> ---
> This patch is against the 'renesas-devel-20180921-v4.19-rc4' branch of
> Simon Horman's 'renesas.git' repo.
> 
> Changes in version 2:
> - fixed up the size cells in the "regs" properties;
> - fixed up the "#pwm-cells" properties;
> - fixed up the R8A77980's "compatible" property.
> 
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |    8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |    9 +++++++++
>  2 files changed, 17 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -614,6 +614,14 @@
>  			status = "disabled";
>  		};
>  
> +		tpu: pwm@e6e80000 {
> +			compatible = "renesas,tpu-r8a77970", "renesas,tpu";
> +			reg = <0 0xe6e80000 0 0x148>;
> +			clocks = <&cpg CPG_MOD 304>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
>  
>  		vin0: video@e6ef0000 {
>  			compatible = "renesas,vin-r8a77970";
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -666,6 +666,15 @@
>  			status = "disabled";
>  		};
>  
> +		tpu: pwm@e6e80000 {
> +			compatible = "renesas,tpu-r8a77980", "renesas,tpu";
> +			reg = <0 0xe6e80000 0 0x148>;
> +			clocks = <&cpg CPG_MOD 304>;
> +			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		vin0: video@e6ef0000 {
>  			compatible = "renesas,vin-r8a77980";
>  			reg = <0 0xe6ef0000 0 0x1000>;
> 
