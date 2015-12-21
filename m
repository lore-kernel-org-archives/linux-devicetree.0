From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: imx: select HAVE_ARM_ARCH_TIMER if selected
 i.MX7D
Date: Mon, 21 Dec 2015 14:48:38 +0800
Message-ID: <20151221064614.GE4703@tiger>
References: <1449789132-18976-1-git-send-email-Frank.Li@freescale.com>
 <1449789132-18976-2-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449789132-18976-2-git-send-email-Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 07:12:11AM +0800, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> From: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> i.MX7D Supported ARCH Timer.
> 
> Signed-off-by: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/mach-imx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 0ac180f..061dea4 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -563,6 +563,7 @@ config SOC_IMX7D
>  	select ARM_GIC
>  	select HAVE_IMX_ANATOP
>  	select HAVE_IMX_MMDC
> +	select HAVE_ARM_ARCH_TIMER

Please sort these selections alphabetically.

Shawn

>  	help
>  		This enables support for Freescale i.MX7 Dual processor.
>  
> -- 
> 2.5.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
