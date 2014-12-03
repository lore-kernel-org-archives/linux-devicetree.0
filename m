From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 10/12] ARM: vf610m4: add new machine and SoC for Vybrid on Cortex-M4
Date: Wed, 03 Dec 2014 11:56:29 +0100
Message-ID: <2188062.Vg1qCai6yo@wuerfel>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch> <1417565531-4507-11-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417565531-4507-11-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 03 December 2014 01:12:09 Stefan Agner wrote:
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 89c4b5c..fdebe18 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -459,6 +459,18 @@ config ARCH_FOOTBRIDGE
>  	  Support for systems based on the DC21285 companion chip
>  	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
>  
> +menuconfig ARCH_MXCM4
> +	bool "Freescale Vybrid/i.MX family on Cortex-M4" if !MMU
> +	select ARCH_REQUIRE_GPIOLIB
> +	select ARM_CPU_SUSPEND if PM
> +	select CLKSRC_MMIO
> +	select GENERIC_IRQ_CHIP
> +	select PINCTRL
> +	select PM_OPP if PM
> +	select SOC_BUS
> +	help
> +	  Support for Freescale Vybrid/iMX-based family of processors on Cortex-M4
> +
>  config ARCH_NETX
>  	bool "Hilscher NetX based"
>  	select ARM_VIC

I would really prefer not to see any more standalone machine types,
but rather have ARMv7-M as one of the options for the
multiplatform configuration. In particular, that would let us
do *build* testing on a combined mxcm4/efm32/vexpress kernel,
although that kernel would clearly not be usable anywhere
because of the restrictions of nommu machines.

> +static void __init vf610m4_init_irq(void)
> +{
> +	vf610_mscm_init();
> +	irqchip_init();
> +}

Can you make vf610_mscm_init get called from irqchip and remove this
function?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
