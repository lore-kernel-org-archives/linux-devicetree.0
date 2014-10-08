From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: cygnus: Initial support for Broadcom Cygnus SoC
Date: Wed, 08 Oct 2014 09:54:04 +0200
Message-ID: <4255803.4lcNtQPo2T@wuerfel>
References: <1412746025-11998-2-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412746025-11998-2-git-send-email-sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 07 October 2014 22:27:00 Scott Branden wrote:
> From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>=20
> Adds initial support for the Cygnus SoC based on Broadcom=E2=80=99s i=
Proc series.
>=20
> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Desmond Liu <desmondl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: JD (Jiandong) Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Tested-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/mach-bcm/Kconfig      |   31 ++++++++
>  arch/arm/mach-bcm/Makefile     |    3 +
>  arch/arm/mach-bcm/bcm_cygnus.c |  166 ++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 200 insertions(+)
>  create mode 100644 arch/arm/mach-bcm/bcm_cygnus.c
>=20
> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index fc93800..2dd3f78 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -5,6 +5,37 @@ menuconfig ARCH_BCM
> =20
>  if ARCH_BCM
> =20
> +config ARCH_BCM_IPROC
> +	bool "Broadcom ARMv7 iProc boards" if ARCH_MULTI_V7
> +	select ARM_GIC
> +	select CACHE_L2X0
> +	select HAVE_ARM_TWD if LOCAL_TIMERS
> +	select HAVE_CLK
> +	select CLKSRC_OF
> +	select CLKSRC_MMIO
> +	select GENERIC_CLOCKEVENTS
> +	select ARM_GLOBAL_TIMER
> +	select ARCH_REQUIRE_GPIOLIB
> +	select ARM_AMBA
> +	select PINCTRL
> +	select DEBUG_UART_8250

A lot of these are implied by ARCH_MULTI_V7, just drop them here.

Some others like DEBUG_UART_8250 should remain user-selectable, if
the platform works without them.

> +	help
> +	  This enables support for systems based on Broadcom IPROC architec=
ted SoCs.
> +	  The IPROC complex contains one or more ARM CPUs along with common
> +	  core periperals. Application specific SoCs are created by adding =
a
> +	  uArchitecture containing peripherals outside of the IPROC complex=
=2E
> +	  Currently supported SoCs are Cygnus.
> +
> +menu "iProc SoC based Machine types"
> +	depends on ARCH_BCM_IPROC
> +
> +	config ARCH_BCM_CYGNUS
> +		bool "Support Broadcom Cygnus board"
> +		select USB_ARCH_HAS_EHCI if USB_SUPPORT
> +		help
> +		  Support for Broadcom Cygnus SoC.
> +endmenu

I don't think you need per-board config options. The main option
above should be enough.

> +
> +#define CRMU_MAIL_BOX1      0x03024028
> +#define CRMU_SOFT_RESET_CMD 0xFFFFFFFF

Never hardcode physical register locations in source. This should come
from DT, and get moved into a regular 'reset' device driver.

You probably want to use drivers/power/reset/syscon-reboot.c

> +/* CRU_RESET register */
> +static void * __iomem crmu_mail_box1_reg;
> +
> +#ifdef CONFIG_NEON
> +
> +#define CRU_BASE                  0x1800e000
> +#define CRU_SIZE                  0x34
> +#define CRU_CONTROL_OFFSET        0x0
> +#define CRU_PWRDWN_EN_OFFSET      0x4
> +#define CRU_PWRDWN_STATUS_OFFSET  0x8
> +#define CRU_NEON0_HW_RESET  6
> +#define CRU_CLAMP_ON_NEON0  20
> +#define CRU_PWRONIN_NEON0   21
> +#define CRU_PWRONOUT_NEON0  21
> +#define CRU_PWROKIN_NEON0   22
> +#define CRU_PWROKOUT_NEON0  22
> +#define CRU_STATUS_DELAY_NS 500
> +#define CRU_MAX_RETRY_COUNT 10
> +#define CRU_RETRY_INTVL_US  1
> +
> +/* Power up the NEON/VFPv3 block. */
> +static void bcm_cygnus_powerup_neon(void)
> +{
> +	void * __iomem cru_base =3D ioremap(CRU_BASE, CRU_SIZE);
> +	u32 reg, i;

Same thing here: this should really use the device node for CRU.

Can you describe what the CRU is? Is this specific to NEON or is
it some general-purpose power management unit?

> +static void __init bcm_cygnus_init(void)
> +{
> +	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> +
> +	l2x0_of_init(0, ~0UL);

The l2x0_of_init can be removed now, just move the arguments into the
respective fields of the machine descriptor.

> +	crmu_mail_box1_reg =3D ioremap(CRMU_MAIL_BOX1, SZ_4);
> +	WARN_ON(!crmu_mail_box1_reg);
> +
> +#ifdef CONFIG_NEON
> +	bcm_cygnus_powerup_neon();
> +#endif
> +}

In general, try to avoid #ifdef, use

	if (IS_ENABLED(CONFIG_NEON))
		bcm_cygnus_powerup_neon();

instead.

> +
> +static const char const *bcm_cygnus_dt_compat[] =3D {
> +	"brcm,cygnus",
> +	NULL,
> +};
> +
> +DT_MACHINE_START(BCM_CYGNUS_DT, "Broadcom Cygnus SoC")
> +	.init_machine =3D bcm_cygnus_init,
> +	.map_io =3D debug_ll_io_init,
> +	.dt_compat =3D bcm_cygnus_dt_compat,
> +	.restart   =3D bcm_cygnus_restart
> +MACHINE_END

The map_io pointer is unnecessary, and the restart pointer should get
set by the reset driver. I hope we can find a way to avoid the=20
bcm_cygnus_init callback as well.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
