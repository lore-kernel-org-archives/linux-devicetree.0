From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 05/18] power: reset: Add AT91 reset driver
Date: Thu, 3 Jul 2014 22:39:08 +0800
Message-ID: <F9547E0F-AB97-47E6-BA09-135EE4E1BC73@jcrosoft.com>
References: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404396906-25194-8-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1404396906-25194-8-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree@vger.kernel.org, dbaryshkov@gmail.com, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas FERRE <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas@free-electrons.com>, Boris Brezillon <boris@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, dwmw2@infradead.org, linux@maxim.org.za, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

NACK


On Jul 3, 2014, at 10:14 PM, Maxime Ripard <maxime.ripard@free-electrons.co=
m> wrote:

> =

> Implement the reset behaviour of the various AT91 SoCS in drivers/power/r=
eset.
> =

> It used to be (and still is) located in arch/arm/mach-at91, and in order =
to
> preserve bisectability is not removed yet, but every board should be conv=
erted
> to use this driver instead.
> =

> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
> drivers/power/reset/Kconfig      |   7 ++
> drivers/power/reset/Makefile     |   1 +
> drivers/power/reset/at91-reset.c | 202 ++++++++++++++++++++++++++++++++++=
+++++
> 3 files changed, 210 insertions(+)
> create mode 100644 drivers/power/reset/at91-reset.c
> =

> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 19d546c5edfa..b3fef01d7cbb 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -14,6 +14,13 @@ config POWER_RESET_AS3722
> 	help
> 	  This driver supports turning off board via a ams AS3722 power-off.
> =

> +config POWER_RESET_AT91_RESET
> +	bool "Atmel AT91 reset driver"
> +	default SOC_AT91SAM9 || SOC_SAMA5
> +	help
> +	  This driver supports restart for Atmel AT91SAM9 and SAMA5
> +	  SoCs
> +
> config POWER_RESET_AXXIA
> 	bool "LSI Axxia reset driver"
> 	depends on ARCH_AXXIA
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index dde2e8bbac53..1599214b91d9 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -1,4 +1,5 @@
> obj-$(CONFIG_POWER_RESET_AS3722) +=3D as3722-poweroff.o
> +obj-$(CONFIG_POWER_RESET_AT91_RESET) +=3D at91-reset.o
> obj-$(CONFIG_POWER_RESET_AXXIA) +=3D axxia-reset.o
> obj-$(CONFIG_POWER_RESET_GPIO) +=3D gpio-poweroff.o
> obj-$(CONFIG_POWER_RESET_MSM) +=3D msm-poweroff.o
> diff --git a/drivers/power/reset/at91-reset.c b/drivers/power/reset/at91-=
reset.c
> new file mode 100644
> index 000000000000..878547410acb
> --- /dev/null
> +++ b/drivers/power/reset/at91-reset.c
> @@ -0,0 +1,202 @@
> +/*
> + * Atmel AT91 SAM9 SoCs reset code
> + *
> + * Copyright (C) 2014 Maxime Ripard
> + *
> + * Maxime Ripard <maxime.ripard@free-electrons.com>

you can not own the copyright as it=92s basically a copy of other people co=
de
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +
> +#include <asm/system_misc.h>
> +
> +#include <mach/at91sam9_ddrsdr.h>
> +#include <mach/at91sam9_sdramc.h>
> +
> +#define AT91_RSTC_CR	0x00		/* Reset Controller Control Register */
> +#define	AT91_RSTC_PROCRST	BIT(0)		/* Processor Reset */
> +#define	AT91_RSTC_PERRST	BIT(2)		/* Peripheral Reset */
> +#define	AT91_RSTC_EXTRST	BIT(3)		/* External Reset */
> +#define	AT91_RSTC_KEY		(0xa5 << 24)	/* KEY Password */
> +
> +#define AT91_RSTC_SR	0x04		/* Reset Controller Status Register */
> +#define	AT91_RSTC_URSTS		BIT(0)		/* User Reset Status */
> +#define	AT91_RSTC_RSTTYP	GENMASK(10, 8)	/* Reset Type */
> +#define	AT91_RSTC_NRSTL		BIT(16)		/* NRST Pin Level */
> +#define	AT91_RSTC_SRCMP		BIT(17)		/* Software Reset Command in Progress =
*/
> +
> +#define AT91_RSTC_MR	0x08		/* Reset Controller Mode Register */
> +#define	AT91_RSTC_URSTEN	BIT(0)		/* User Reset Enable */
> +#define	AT91_RSTC_URSTIEN	BIT(4)		/* User Reset Interrupt Enable */
> +#define	AT91_RSTC_ERSTL		GENMASK(11, 8)	/* External Reset Length */
> +
> +enum reset_type {
> +	RESET_TYPE_GENERAL	=3D 0,
> +	RESET_TYPE_WAKEUP	=3D 1,
> +	RESET_TYPE_WATCHDOG	=3D 2,
> +	RESET_TYPE_SOFTWARE	=3D 3,
> +	RESET_TYPE_USER		=3D 4,
> +};
> +
> +static void __iomem *at91_ramc_base[2], *at91_rstc_base;
> +
> +static void at91sam9_restart(enum reboot_mode mode, const char *cmd)
> +{
> +	asm volatile(
> +		".balign 32\n\t"
> +
> +		"str	%2, [%0, #" __stringify(AT91_SDRAMC_TR) "]\n\t"
> +		"str	%3, [%0, #" __stringify(AT91_SDRAMC_LPR) "]\n\t"
> +		"str	%4, [%1, #" __stringify(AT91_RSTC_CR) "]\n\t"
> +
> +		"b	.\n\t"
> +		:
> +		: "r" (at91_ramc_base[0]),
> +		  "r" (at91_rstc_base),
> +		  "r" (1),
> +		  "r" (AT91_SDRAMC_LPCB_POWER_DOWN),
> +		  "r" (AT91_RSTC_KEY | AT91_RSTC_PERRST | AT91_RSTC_PROCRST));
> +}
> +
> +static void at91sam9g45_restart(enum reboot_mode mode, const char *cmd)
> +{
> +	asm volatile(
> +		"cmp	%1, #0\n\t"
> +		"beq	1f\n\t"
> +
> +		"ldr	r0, [%1]\n\t"
> +		"cmp	r0, #0\n\t"
> +
> +		".balign 32\n\t"
> +
> +		"1:	str	%3, [%0, #" __stringify(AT91_DDRSDRC_RTR) "]\n\t"
> +		"	str	%4, [%0, #" __stringify(AT91_DDRSDRC_RTR) "]\n\t"
> +		"	strne	%3, [%1, #" __stringify(AT91_DDRSDRC_RTR) "]\n\t"
> +		"	strne	%4, [%1, #" __stringify(AT91_DDRSDRC_RTR) "]\n\t"
> +		"	str	%5, [%2, #" __stringify(AT91_RSTC_CR) "]\n\t"
> +
> +		"	b	.\n\t"
> +		:
> +		: "r" (at91_ramc_base[0]),
> +		  "r" (at91_ramc_base[1]),
> +		  "r" (at91_rstc_base),
> +		  "r" (1),
> +		  "r" (AT91_DDRSDRC_LPCB_POWER_DOWN),
> +		  "r" (AT91_RSTC_KEY | AT91_RSTC_PERRST | AT91_RSTC_PROCRST)
> +		: "r0");
> +}
> +
move this to an assembly file more easy to read than a C code

> +static void __init at91_reset_status(struct platform_device *pdev)
> +{
> +	u32 reg =3D readl(at91_rstc_base + AT91_RSTC_SR);
> +	char *reason;
> +
> +	switch ((reg & AT91_RSTC_RSTTYP) >> 8) {
> +	case RESET_TYPE_GENERAL:
> +		reason =3D "general reset";
> +		break;
> +	case RESET_TYPE_WAKEUP:
> +		reason =3D "wakeup";
> +		break;
> +	case RESET_TYPE_WATCHDOG:
> +		reason =3D "watchdog reset";
> +		break;
> +	case RESET_TYPE_SOFTWARE:
> +		reason =3D "software reset";
> +		break;
> +	case RESET_TYPE_USER:
> +		reason =3D "user reset";
> +		break;
> +	default:
> +		reason =3D "unknown reset";
> +		break;
> +	}
> +
> +	pr_info("AT91: Starting after %s\n", reason);
> +}
> +
> +static struct of_device_id at91_ramc_of_match[] =3D {
> +	{ .compatible =3D "atmel,at91sam9260-sdramc", },
> +	{ .compatible =3D "atmel,at91sam9g45-ddramc", },
> +	{ /* sentinel */ }
> +};
> +
> +static struct of_device_id at91_reset_of_match[] =3D {
> +	{ .compatible =3D "atmel,at91sam9260-rstc", .data =3D at91sam9_restart =
},
> +	{ .compatible =3D "atmel,at91sam9g45-rstc", .data =3D at91sam9g45_resta=
rt },
> +	{ /* sentinel */ }
> +};
> +
> +static int at91_reset_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	at91_rstc_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(at91_rstc_base)) {
> +		dev_err(&pdev->dev, "Could not map reset controller address\n");
> +		return PTR_ERR(at91_rstc_base);
> +	}
> +
> +	if (pdev->dev.of_node) {

split in 2 function more easy to ready and less indentation
> +		const struct of_device_id *match;
> +		struct device_node *np;
> +		int idx =3D 0;
> +
> +		for_each_matching_node(np, at91_ramc_of_match) {
> +			at91_ramc_base[idx] =3D of_iomap(np, 0);
> +			if (!at91_ramc_base[idx]) {
> +				dev_err(&pdev->dev, "Could not map ram controller address\n");
> +				return -ENODEV;
> +			}
> +			idx++;
> +		}

and if you can not probe the ram controler it=92s a panic not a -ENODEV

as you have an unstable platform
> +
> +		match =3D of_match_node(at91_reset_of_match, pdev->dev.of_node);
> +		arm_pm_restart =3D match->data;
> +	} else {
> +		const struct platform_device_id *match;
> +		int idx =3D 0;
> +
> +		for (idx =3D 0; idx < 2; idx++) {
> +			res =3D platform_get_resource(pdev, IORESOURCE_MEM, idx + 1 );
> +			at91_ramc_base[idx] =3D devm_ioremap_resource(&pdev->dev, res);
> +			if (IS_ERR(at91_ramc_base[idx])) {
> +				dev_err(&pdev->dev, "Could not map ram controller address\n");
> +				return PTR_ERR(at91_rstc_base);
> +			}
> +		}
> +
> +		match =3D platform_get_device_id(pdev);
> +		arm_pm_restart =3D (void (*)(enum reboot_mode, const char*))
> +			match->driver_data;
> +	}
> +
> +	at91_reset_status(pdev);
> +
> +	return 0;
> +}
> +
> +static struct platform_device_id at91_reset_plat_match[] =3D {
> +	{ "at91-sam9-reset", (unsigned long)at91sam9_restart },
> +	{ "at91-g45-reset", (unsigned long)at91sam9g45_restart },
	    at91-sam9???

	    from the beginning of DT we put the first SoC were the reset was intro=
duce and why do you change the DT binding?


> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver at91_reset_driver =3D {
> +	.probe =3D at91_reset_probe,
> +	.driver =3D {
> +		.name =3D "at91-reset",
> +		.of_match_table =3D at91_reset_of_match,
> +	},
> +	.id_table =3D at91_reset_plat_match,
> +};
> +module_platform_driver(at91_reset_driver);
> -- =

> 2.0.1
> =
