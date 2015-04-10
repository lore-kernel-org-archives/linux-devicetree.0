From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v5 09/11] ARM: vf610: enable Cortex-M4 configuration on
 Vybrid SoC
Date: Fri, 10 Apr 2015 19:54:00 +0200
Message-ID: <1428688440.17822.33.camel@x220>
References: <1428609855-27657-1-git-send-email-stefan@agner.ch>
	 <1428609855-27657-10-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428609855-27657-10-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Just two whitespace nits. (Please don't tell anyone, I'm a bit
embarrassed that I even spot them, let alone that I comment on them.)

On Thu, 2015-04-09 at 22:04 +0200, Stefan Agner wrote:
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug

> @@ -629,10 +631,26 @@ config SOC_IMX6SX
>  	help
>  	  This enables support for Freescale i.MX6 SoloX processor.
>  
> +

This second empty line is unneeded.

> +config SOC_LS1021A
> +	bool "Freescale LS1021A support"
> +	select ARM_GIC
> +	select HAVE_ARM_ARCH_TIMER
> +	select PCI_DOMAINS if PCI
> +	select ZONE_DMA if ARM_LPAE
> +

Please drop this empty line.

> +	help
> +	  This enable support for Freescale LS1021A processor.
> +
> +endif
> +
> +comment "Cortex-A/Cortex-M asymmetric multiprocessing platforms"
> +
> +if ARCH_MULTI_V7 || ARM_SINGLE_ARMV7M
> +
>  config SOC_VF610
>  	bool "Vybrid Family VF610 support"
> -	select IRQ_DOMAIN_HIERARCHY
> -	select ARM_GIC
> +	select ARM_GIC if ARCH_MULTI_V7
>  	select PINCTRL_VF610
>  	select PL310_ERRATA_769419 if CACHE_L2X0
>  

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
