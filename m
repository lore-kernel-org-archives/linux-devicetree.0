From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v7 10/13] ARM: efm32: use ARM_SINGLE_ARMV7M
Date: Tue, 19 May 2015 14:14:32 +0200
Message-ID: <20150519121432.GE24769@pengutronix.de>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch>
 <1431769465-26867-11-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431769465-26867-11-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: shawn.guo@linaro.org, kernel@pengutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linux@arm.linux.org.uk, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, May 16, 2015 at 11:44:22AM +0200, Stefan Agner wrote:
> Use the new config symbol ARM_SINGLE_ARMV7M which groups config
> symbols used by modern ARMv7-M platforms. It also support multiple
> ARMv7-M platforms in one kernel image. However, this only works if
> the combined platforms share the same (main) memory layout.
>=20
> Also use generic debug/uncompress.h for all ARMv7-M platforms.
>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I don't have anything in the queu that would conflict with this patch,
so merge it whereever you, Russell and Arnd see fit.

Best regards
Uwe
> ---
>  arch/arm/Kconfig                 | 28 ++++++++++------------------
>  arch/arm/Kconfig.debug           |  2 +-
>  arch/arm/configs/efm32_defconfig |  1 +
>  3 files changed, 12 insertions(+), 19 deletions(-)
>=20
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 2361efc..d1c035d 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -411,24 +411,6 @@ config ARCH_EBSA110
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
> @@ -963,6 +945,16 @@ source "arch/arm/mach-w90x900/Kconfig"
> =20
>  source "arch/arm/mach-zynq/Kconfig"
> =20
> +# ARMv7-M architecture
> +config ARCH_EFM32
> +	bool "Energy Micro efm32"
> +	depends on ARM_SINGLE_ARMV7M
> +	select ARCH_REQUIRE_GPIOLIB
> +	select AUTO_ZRELADDR
> +	help
> +	  Support for Energy Micro's (now Silicon Labs) efm32 Giant Gecko
> +	  processors.
> +
>  # Definitions to make life easier
>  config ARCH_ACORN
>  	bool
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index e4441de..5d63c56 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -1561,7 +1561,7 @@ config DEBUG_UNCOMPRESS
>  config UNCOMPRESS_INCLUDE
>  	string
>  	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
> -					PLAT_SAMSUNG || ARCH_EFM32 || \
> +					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M || \
>  					ARCH_SHMOBILE_LEGACY
>  	default "mach/uncompress.h"
> =20
> diff --git a/arch/arm/configs/efm32_defconfig b/arch/arm/configs/efm3=
2_defconfig
> index c4c17e3..e969f78 100644
> --- a/arch/arm/configs/efm32_defconfig
> +++ b/arch/arm/configs/efm32_defconfig
> @@ -16,6 +16,7 @@ CONFIG_EMBEDDED=3Dy
>  # CONFIG_IOSCHED_DEADLINE is not set
>  # CONFIG_IOSCHED_CFQ is not set
>  # CONFIG_MMU is not set
> +CONFIG_ARM_SINGLE_ARMV7M=3Dy
>  CONFIG_ARCH_EFM32=3Dy
>  CONFIG_SET_MEM_PARAM=3Dy
>  CONFIG_DRAM_BASE=3D0x88000000
> --=20
> 2.4.1
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
