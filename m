From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7792: add IMR-L[S]X3 clocks
Date: Fri, 30 Jun 2017 12:01:14 +0200
Message-ID: <20170630100114.GG26710@verge.net.au>
References: <20170321194820.477663240@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170321194820.477663240-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 01, 1970 at 03:00:01AM +0300, Sergei Shtylyov wrote:
> Add the IMR-L[S]X3 clocks to the R8A7792 device tree.
> 
> Based on the original patch by Roman Meshkevich
> <roman.meshkevich-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> ---
>  arch/arm/boot/dts/r8a7792.dtsi            |   15 ++++++++++++---
>  include/dt-bindings/clock/r8a7792-clock.h |    7 +++++++
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7792.dtsi
> @@ -927,16 +927,25 @@
>  				     "renesas,cpg-mstp-clocks";
>  			reg = <0 0xe6150990 0 4>, <0 0xe61509a0 0 4>;
>  			clocks = <&zg_clk>, <&zg_clk>, <&zg_clk>, <&zg_clk>,
> -			         <&zg_clk>, <&zg_clk>, <&hp_clk>;
> +				 <&zg_clk>, <&zg_clk>, <&hp_clk>, <&zg_clk>,
> +				 <&zg_clk>, <&zg_clk>, <&zg_clk>, <&zg_clk>,
> +				 <&zg_clk>, <&zg_clk>;
>  			#clock-cells = <1>;
>  			clock-indices = <
>  				R8A7792_CLK_VIN5 R8A7792_CLK_VIN4
>  				R8A7792_CLK_VIN3 R8A7792_CLK_VIN2
>  				R8A7792_CLK_VIN1 R8A7792_CLK_VIN0
> -				R8A7792_CLK_ETHERAVB
> +				R8A7792_CLK_ETHERAVB R8A7792_CLK_IMR_LX3
> +				R8A7792_CLK_IMR_LSX3_1 R8A7792_CLK_IMR_LSX3_0
> +				R8A7792_CLK_IMR_LSX3_5 R8A7792_CLK_IMR_LSX3_4
> +				R8A7792_CLK_IMR_LSX3_3 R8A7792_CLK_IMR_LSX3_2
>  			>;
>  			clock-output-names = "vin5", "vin4", "vin3", "vin2",
> -					     "vin1", "vin0", "etheravb";
> +					     "vin1", "vin0",
> +					     "etheravb", "imr-lx3",
> +					     "imr-lsx3-1", "imr-lsx3-0",
> +					     "imr-lsx3-5", "imr-lsx3-4",
> +					     "imr-lsx3-3", "imr-lsx3-2";
>  		};
>  		mstp9_clks: mstp9_clks@e6150994 {
>  			compatible = "renesas,r8a7792-mstp-clocks",
> Index: renesas/include/dt-bindings/clock/r8a7792-clock.h
> ===================================================================
> --- renesas.orig/include/dt-bindings/clock/r8a7792-clock.h
> +++ renesas/include/dt-bindings/clock/r8a7792-clock.h
> @@ -70,6 +70,13 @@
>  #define R8A7792_CLK_VIN1		10
>  #define R8A7792_CLK_VIN0		11
>  #define R8A7792_CLK_ETHERAVB		12
> +#define R8A7792_CLK_IMR_LX3		21
> +#define R8A7792_CLK_IMR_LSX3_1		22
> +#define R8A7792_CLK_IMR_LSX3_0		23
> +#define R8A7792_CLK_IMR_LSX3_5		25
> +#define R8A7792_CLK_IMR_LSX3_4		26
> +#define R8A7792_CLK_IMR_LSX3_3		27
> +#define R8A7792_CLK_IMR_LSX3_2		28
>  
>  /* MSTP9 */
>  #define R8A7792_CLK_GPIO7		4
> 

I think this patch needs to be split in two, one for each file,
to allow queuing bindings and DT changes in different branches.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
