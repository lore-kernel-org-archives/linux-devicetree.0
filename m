From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 09/12] ARM: efm32: move into multiplatform
Date: Fri, 2 Jan 2015 10:50:23 +0100
Message-ID: <20150102095023.GE28003@pengutronix.de>
References: <1419895935-22966-1-git-send-email-stefan@agner.ch>
 <1419895935-22966-10-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1419895935-22966-10-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, Dec 30, 2014 at 12:32:12AM +0100, Stefan Agner wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>=20
> Since the multiplatform configuration can support no-MMU kernels now,
> there is nothing stopping us from moving the efm32 platform in there
> as well. This introduces a new ARCH_MULTI_V7M CPU architecture select=
ion
> option, since v7-M is incompatible with v7-A, and we can have either
> of the two enabled for multiplatform, but not both at the same time.
>=20
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  arch/arm/Kconfig                 | 35 ++++++++++++++++--------------=
-----
>  arch/arm/configs/efm32_defconfig |  2 ++
>  2 files changed, 18 insertions(+), 19 deletions(-)
>=20
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 95007b9..8fe035b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -314,7 +314,7 @@ config ARCH_MULTIPLATFORM
>  	select COMMON_CLK
>  	select GENERIC_CLOCKEVENTS
>  	select MIGHT_HAVE_PCI
> -	select MULTI_IRQ_HANDLER
> +	select MULTI_IRQ_HANDLER if !ARCH_MULTI_V7M
>  	select SPARSE_IRQ
>  	select USE_OF
> =20
> @@ -400,24 +400,6 @@ config ARCH_EBSA110
>  	  Ethernet interface, two PCMCIA sockets, two serial ports and a
>  	  parallel port.
> =20
> -config ARCH_EFM32
> -	bool "Energy Micro efm32"
> -	depends on !MMU
> -	select ARCH_REQUIRE_GPIOLIB
> -	select ARM_NVIC
> -	select AUTO_ZRELADDR
> -	select CLKSRC_OF
> -	select COMMON_CLK
> -	select CPU_V7M
> -	select GENERIC_CLOCKEVENTS
> -	select NO_DMA
> -	select NO_IOPORT_MAP
> -	select SPARSE_IRQ
> -	select USE_OF
> -	help
> -	  Support for Energy Micro's (now Silicon Labs) efm32 Giant Gecko
> -	  processors.
> -
>  config ARCH_EP93XX
>  	bool "EP93xx-based"
>  	select ARCH_HAS_HOLES_MEMORYMODEL
> @@ -778,6 +760,14 @@ menu "Multiple platform selection"
> =20
>  comment "CPU Core family selection"
> =20
> +config ARCH_MULTI_V7M
> +	bool "ARMv7-M based platforms (Cortex-M)"
> +	depends on !MMU && !(ARCH_MULTI_V4_V5 || ARCH_MULTI_V6_V7)
As ARCH_MULTI_V7M depends on !MMU already ...
> +	select CPU_V7M
> +	select ARM_NVIC
> +	select NO_DMA # for now
> +	select NO_IOPORT_MAP # for now
> +
>  config ARCH_MULTI_V4
>  	bool "ARMv4 based platforms (FA526)"
>  	depends on !ARCH_MULTI_V6_V7 && MMU
> @@ -834,6 +824,13 @@ config ARCH_VIRT
>  	select ARM_PSCI
>  	select HAVE_ARM_ARCH_TIMER
> =20
> +config ARCH_EFM32
> +	bool "Energy Micro efm32" if ARCH_MULTI_V7M
> +	depends on !MMU
=2E.. you don't need to repeat it here.

Other than that you can have my Ack. I didn't test it though and must
have missed the changes mentioned in the commit log.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
