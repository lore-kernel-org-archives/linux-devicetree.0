From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx7d: move CPU operating points to
 imx7d.dtsi
Date: Tue, 16 Aug 2016 13:50:38 +0800
Message-ID: <20160816055038.GL500@tiger>
References: <20160812001107.17016-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160812001107.17016-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 11, 2016 at 05:11:06PM -0700, Stefan Agner wrote:
> Only i.MX 7Dual SoC supports CPU frequencies of up to 1GHz. The i.MX
> 7Solo can run with up to 800MHz and does so without making use of DVFS
> usually. While the device tree clearly specified a too fast operating
> point for i.MX 7Solo, the kernel did not used it in practise so far
> because the CPUfreq driver does not get loaded on i.MX 7Solo devices
> (since the fsl,imx7s compatible string is not in the list of devices
> making use of the cpufreq-dt driver...).
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Hi Shawn,
> 
> This is based on my earlier patchset:
> ARM: dts: imx7d: move ARM platform peripherals inside soc
> 
> This are kind of fixes too, so if possible I would like to see them
> in v4.8, what do you think?

Patch "ARM: dts: imx7d: move ARM platform peripherals inside soc node"
is not really a fix, and the diffstat looks too dramatic to be a -rc
material, so I queued it as a -next patch, and any patch based on it
will have to go through -next as well.

Applied for -next, thanks.

Shawn

> 
> --
> Stefan
> 
>  arch/arm/boot/dts/imx7d.dtsi | 8 ++++++++
>  arch/arm/boot/dts/imx7s.dtsi | 5 -----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index 3d77d95..d0b199c 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -45,6 +45,14 @@
>  
>  / {
>  	cpus {
> +		cpu0: cpu@0 {
> +			operating-points = <
> +				/* KHz	uV */
> +				996000	1075000
> +				792000	975000
> +			>;
> +		};
> +
>  		cpu1: cpu@1 {
>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index c63591c..5132e2f 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -85,11 +85,6 @@
>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
>  			reg = <0>;
> -			operating-points = <
> -				/* KHz	uV */
> -				996000	1075000
> -				792000	975000
> -			>;
>  			clock-latency = <61036>; /* two CLK32 periods */
>  			clocks = <&clks IMX7D_CLK_ARM>;
>  		};
> -- 
> 2.9.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
