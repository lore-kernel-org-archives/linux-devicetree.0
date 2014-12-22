From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: r8a7790: add MLB+ clock
Date: Mon, 22 Dec 2014 09:06:12 +0900
Message-ID: <20141222000610.GG29188@verge.net.au>
References: <2277336.BnuIY8UiP8@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2277336.BnuIY8UiP8@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 18, 2014 at 11:41:52PM +0300, Sergei Shtylyov wrote:
> From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> 
> Add MLB+ clock to R8A7790 device tree.
> 
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> [Sergei: rebased, renamed, added changelog]
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against 'renesas-devel-20141218-v3.18' tag of Simon Horman's
> 'renesas.git' repo.

Thanks, I have queued this up.

> 
>  arch/arm/boot/dts/r8a7790.dtsi            |   13 +++++++------
>  include/dt-bindings/clock/r8a7790-clock.h |    1 +
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> Index: renesas/arch/arm/boot/dts/r8a7790.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7790.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7790.dtsi
> @@ -1149,16 +1149,17 @@
>  		mstp8_clks: mstp8_clks@e6150990 {
>  			compatible = "renesas,r8a7790-mstp-clocks", "renesas,cpg-mstp-clocks";
>  			reg = <0 0xe6150990 0 4>, <0 0xe61509a0 0 4>;
> -			clocks = <&zg_clk>, <&zg_clk>, <&zg_clk>, <&zg_clk>, <&p_clk>,
> -				 <&zs_clk>, <&zs_clk>;
> +			clocks = <&hp_clk>, <&zg_clk>, <&zg_clk>, <&zg_clk>,
> +			         <&zg_clk>, <&p_clk>, <&zs_clk>, <&zs_clk>;
>  			#clock-cells = <1>;
>  			clock-indices = <
> -				R8A7790_CLK_VIN3 R8A7790_CLK_VIN2 R8A7790_CLK_VIN1
> -				R8A7790_CLK_VIN0 R8A7790_CLK_ETHER R8A7790_CLK_SATA1
> -				R8A7790_CLK_SATA0
> +				R8A7790_CLK_MLB R8A7790_CLK_VIN3 R8A7790_CLK_VIN2
> +				R8A7790_CLK_VIN1 R8A7790_CLK_VIN0 R8A7790_CLK_ETHER
> +				R8A7790_CLK_SATA1 R8A7790_CLK_SATA0
>  			>;
>  			clock-output-names =
> -				"vin3", "vin2", "vin1", "vin0", "ether", "sata1", "sata0";
> +				"mlb", "vin3", "vin2", "vin1", "vin0", "ether",
> +				"sata1", "sata0";
>  		};
>  		mstp9_clks: mstp9_clks@e6150994 {
>  			compatible = "renesas,r8a7790-mstp-clocks", "renesas,cpg-mstp-clocks";
> Index: renesas/include/dt-bindings/clock/r8a7790-clock.h
> ===================================================================
> --- renesas.orig/include/dt-bindings/clock/r8a7790-clock.h
> +++ renesas/include/dt-bindings/clock/r8a7790-clock.h
> @@ -97,6 +97,7 @@
>  #define R8A7790_CLK_LVDS0		26
>  
>  /* MSTP8 */
> +#define R8A7790_CLK_MLB		2
>  #define R8A7790_CLK_VIN3		8
>  #define R8A7790_CLK_VIN2		9
>  #define R8A7790_CLK_VIN1		10
> 
