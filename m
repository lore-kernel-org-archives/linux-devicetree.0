From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: r7s72100: Enable L2 cache
Date: Mon, 6 Feb 2017 09:25:26 +0100
Message-ID: <20170206082525.GB13441@verge.net.au>
References: <20170202212000.10768-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170202212000.10768-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 02, 2017 at 04:20:00PM -0500, Chris Brandt wrote:
> This enables the 128KB L2 cache in the RZ/A1 (R7S72100).
> 
> The 'Write full line of zeros mode' of this Cortex-A9 cannot be used
> because the sideband signals between the CA9 and PL310 are not connected.
> Since there is no option to disable this feature in the cache-l2x0 driver,
> our only option is to specify a secure write function which will then cause
> the cache-l2x0 driver to not enable this feature.
> 
> If you do not override a l2c_write_sec function which causes the line of
> zeros mode to be enabled, then the system will crash pretty quickly after
> the L2C is enabled.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Hi Chris,

is it possible to apply the .dtsi and .c portions of this change separately
and still get sane behaviour at each step?

If so I would like to request that this patch be split into two patches,
one for .c and one for .dtsi. This will allow me to apply the patches to
separate branches which will in turn make it easier for me to get the
change accepted.

> ---
>  arch/arm/boot/dts/r7s72100.dtsi         |  9 +++++++++
>  arch/arm/mach-shmobile/setup-r7s72100.c | 21 +++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index 74e684f..08aaaff 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -177,6 +177,7 @@
>  			compatible = "arm,cortex-a9";
>  			reg = <0>;
>  			clock-frequency = <400000000>;
> +			next-level-cache = <&L2>;
>  		};
>  	};
>  
> @@ -368,6 +369,14 @@
>  			<0xe8202000 0x1000>;
>  	};
>  
> +	L2: cache-controller@3ffff000 {
> +		compatible = "arm,pl310-cache";
> +		reg = <0x3ffff000 0x1000>;
> +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		cache-unified;
> +		cache-level = <2>;
> +	};
> +
>  	i2c0: i2c@fcfee000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> diff --git a/arch/arm/mach-shmobile/setup-r7s72100.c b/arch/arm/mach-shmobile/setup-r7s72100.c
> index d46639f..655deba 100644
> --- a/arch/arm/mach-shmobile/setup-r7s72100.c
> +++ b/arch/arm/mach-shmobile/setup-r7s72100.c
> @@ -15,6 +15,7 @@
>   */
>  
>  #include <linux/kernel.h>
> +#include <linux/io.h>
>  
>  #include <asm/mach/arch.h>
>  
> @@ -25,7 +26,27 @@ static const char *const r7s72100_boards_compat_dt[] __initconst = {
>  	NULL,
>  };
>  
> +/*
> + * The 'Write full line of zeros mode' of this Cortex-A9 cannot be used because
> + * the sideband signals between the CA9 and PL310 are not connected. Since there
> + * is no option to disable this feature in the cache-l2x0 driver, our only
> + * option is to specify a secure write function which will then cause the
> + * cache-l2x0 driver to not enable this feature.
> + */
> +static void r7s72100_l2c_write_sec(unsigned long val, unsigned int reg)
> +{
> +	static void __iomem *base;
> +
> +	if (!base)
> +		base = ioremap_nocache(0x3ffff000, SZ_4K);
> +
> +	writel_relaxed(val, base + reg);
> +}
> +
>  DT_MACHINE_START(R7S72100_DT, "Generic R7S72100 (Flattened Device Tree)")
> +	.l2c_aux_val    = 0,
> +	.l2c_aux_mask   = ~0,
> +	.l2c_write_sec	= r7s72100_l2c_write_sec,
>  	.init_early	= shmobile_init_delay,
>  	.init_late	= shmobile_init_late,
>  	.dt_compat	= r7s72100_boards_compat_dt,
> -- 
> 2.10.1
> 
> 
