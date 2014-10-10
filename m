From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V4 1/7] ARM: cygnus: Initial support for Broadcom Cygnus SoC
Date: Fri, 10 Oct 2014 11:50:24 +0200
Message-ID: <6682352.2KHnNYBAnS@wuerfel>
References: <1412894671-5921-2-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412894671-5921-2-git-send-email-sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 09 October 2014 15:44:25 Scott Branden wrote:
> From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>=20
> Adds initial support for the Cygnus SoC based on Broadcom=E2=80=99s i=
Proc series.
> Move ARCH_BCM_5301x under the ARCH_BCM_IPROC architecture.
>=20
> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Desmond Liu <desmondl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: JD (Jiandong) Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Tested-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

No signoff from the Author?

> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index b11ad54..85363de 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -1051,7 +1051,7 @@ config DEBUG_UART_PL01X
> =20
>  # Compatibility options for 8250
>  config DEBUG_UART_8250
> -	def_bool ARCH_DOVE || ARCH_EBSA110 || \
> +	def_bool ARCH_BCM_IPROC || ARCH_DOVE || ARCH_EBSA110 || \
>  		(FOOTBRIDGE && !DEBUG_DC21285_PORT) || \
>  		ARCH_GEMINI || ARCH_IOP13XX || ARCH_IOP32X || \
>  		ARCH_IOP33X || ARCH_IXP4XX || \

As I mentioned before, this is the wrong option. Please use
DEBUG_LL_UART_8250 like all the modern platforms do.

> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index fc93800..b2b6752 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -5,6 +5,53 @@ menuconfig ARCH_BCM
> =20
>  if ARCH_BCM
> =20
> +menu "iProc SoC based Machine types"
> +	config ARCH_BCM_IPROC
> +		bool "Broadcom ARMv7 iProc boards" if ARCH_MULTI_V7
> +		depends on ARCH_BCM_CYGNUS || ARCH_BCM_5301X

Please make this a silent option by dropping the text after 'bool',
and the 'depends on' line.

> +		select ARM_GIC
> +		select CACHE_L2X0
> +		select HAVE_ARM_SCU if SMP
> +		select HAVE_ARM_TWD if SMP
> +		select ARM_GLOBAL_TIMER
> +
> +		select CLKSRC_MMIO
> +		select ARCH_REQUIRE_GPIOLIB
> +		select ARM_AMBA
> +		select PINCTRL

> +
> +static const char const *bcm_cygnus_dt_compat[] =3D {
> +	"brcm,cygnus",
> +	NULL,
> +};
> +
> +DT_MACHINE_START(BCM_CYGNUS_DT, "Broadcom Cygnus SoC")
> +	.l2c_aux_val	=3D 0,
> +	.l2c_aux_mask	=3D ~0,
> +	.dt_compat =3D bcm_cygnus_dt_compat,
> +MACHINE_END
>=20

This looks good now.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
