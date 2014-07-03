From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 12/18] power: reset: Add AT91 poweroff driver
Date: Thu, 3 Jul 2014 22:31:27 +0800
Message-ID: <6296F186-1B0C-4089-928A-4B0950BE847A@jcrosoft.com>
References: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404396906-25194-22-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1404396906-25194-22-git-send-email-maxime.ripard@free-electrons.com>
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


On Jul 3, 2014, at 10:14 PM, Maxime Ripard <maxime.ripard@free-electrons.co=
m> wrote:

> =

> Add a driver to handle the shutdown of the Atmel SoCs. This code used to =
be
> (and still is) in arch/arm/mach-at91. We didn't removed it yet so that we=
 can
> convert all the boards to using this driver, before removing it entirely =
in a
> separate patch.
> =

> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
> drivers/power/reset/Kconfig         |   7 ++
> drivers/power/reset/Makefile        |   1 +
> drivers/power/reset/at91-poweroff.c | 156 +++++++++++++++++++++++++++++++=
+++++
> 3 files changed, 164 insertions(+)
> create mode 100644 drivers/power/reset/at91-poweroff.c
> =

> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index b3fef01d7cbb..f9d53af50ec0 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -14,6 +14,13 @@ config POWER_RESET_AS3722
> 	help
> 	  This driver supports turning off board via a ams AS3722 power-off.
> =

> +config POWER_RESET_AT91_POWEROFF
> +	bool "Atmel AT91 poweroff driver"
> +	default SOC_AT91SAM9 || SOC_SAMA5
> +	help
> +	  This driver supports poweroff for Atmel AT91SAM9 and SAMA5
> +	  SoCs
> +
> config POWER_RESET_AT91_RESET
> 	bool "Atmel AT91 reset driver"
> 	default SOC_AT91SAM9 || SOC_SAMA5
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index 1599214b91d9..8bf941bac3da 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -1,4 +1,5 @@
> obj-$(CONFIG_POWER_RESET_AS3722) +=3D as3722-poweroff.o
> +obj-$(CONFIG_POWER_RESET_AT91_POWEROFF) +=3D at91-poweroff.o
> obj-$(CONFIG_POWER_RESET_AT91_RESET) +=3D at91-reset.o
> obj-$(CONFIG_POWER_RESET_AXXIA) +=3D axxia-reset.o
> obj-$(CONFIG_POWER_RESET_GPIO) +=3D gpio-poweroff.o
> diff --git a/drivers/power/reset/at91-poweroff.c b/drivers/power/reset/at=
91-poweroff.c
> new file mode 100644
> index 000000000000..2f2a69e9bae3
> --- /dev/null
> +++ b/drivers/power/reset/at91-poweroff.c
> @@ -0,0 +1,156 @@
> +/*
> + * Atmel AT91 SAM9 SoCs reset code
> + *
> + * Copyright (C) 2014 Maxime Ripard
> + *
> + * Maxime Ripard <maxime.ripard@free-electrons.com>
> + *

As it=92s mostly a copy of other people work you can not claim the copyright
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +
> +#define AT91_SHDW_CR	0x00		/* Shut Down Control Register */
> +#define	AT91_SHDW_SHDW		BIT(0)			/* Shut Down command */
> +#define	AT91_SHDW_KEY		(0xa5 << 24)		/* KEY Password */
> +
> +#define AT91_SHDW_MR	0x04		/* Shut Down Mode Register */
> +#define	AT91_SHDW_WKMODE0	GENMASK(2, 0)		/* Wake-up 0 Mode Selection */
> +#define	AT91_SHDW_CPTWK0_MAX	0xf			/* Maximum Counter On Wake Up 0 */
> +#define	AT91_SHDW_CPTWK0	(AT91_SHDW_CPTWK0_MAX << 4) /* Counter On Wake =
Up 0 */
> +#define	AT91_SHDW_CPTWK0_(x)	((x) << 4)
> +#define	AT91_SHDW_RTTWKEN	BIT(16)			/* Real Time Timer Wake-up Enable */
> +#define	AT91_SHDW_RTCWKEN	BIT(17)			/* Real Time Clock Wake-up Enable */
> +
> +#define AT91_SHDW_SR	0x08		/* Shut Down Status Register */
> +#define	AT91_SHDW_WAKEUP0	BIT(0)			/* Wake-up 0 Status */
> +#define	AT91_SHDW_RTTWK		BIT(16)			/* Real-time Timer Wake-up */
> +#define	AT91_SHDW_RTCWK		BIT(17)			/* Real-time Clock Wake-up [SAM9RL] */
> +
> +enum wakeup_type {
> +	AT91_SHDW_WKMODE0_NONE		=3D 0,
> +	AT91_SHDW_WKMODE0_HIGH		=3D 1,
> +	AT91_SHDW_WKMODE0_LOW		=3D 2,
> +	AT91_SHDW_WKMODE0_ANYLEVEL	=3D 3,
> +};
> +
> +static const char *shdwc_wakeup_modes[] =3D {
> +	[AT91_SHDW_WKMODE0_NONE]	=3D "none",
> +	[AT91_SHDW_WKMODE0_HIGH]	=3D "high",
> +	[AT91_SHDW_WKMODE0_LOW]		=3D "low",
> +	[AT91_SHDW_WKMODE0_ANYLEVEL]	=3D "any",
> +};
> +
> +static void __iomem *at91_shdwc_base;
> +
> +static void __init at91_wakeup_status(void)
> +{
> +	u32 reg =3D readl(at91_shdwc_base);
> +	char *reason =3D "unknown";
> +
> +	/* Simple power-on, just bail out */
> +	if (!reg)
> +		return;
> +
> +	if (reg & AT91_SHDW_RTTWK)
> +		reason =3D "RTT";
> +	else if (reg & AT91_SHDW_RTCWK)
> +		reason =3D "RTC";
> +
> +	pr_info("AT91: Wake-Up source: %s\n", reason);
> +}
> +
> +static void at91_poweroff(void)
> +{
> +	writel(AT91_SHDW_KEY | AT91_SHDW_SHDW, at91_shdwc_base + AT91_SHDW_CR);
> +}
> +
> +const enum wakeup_type at91_poweroff_get_wakeup_mode(struct device_node =
*np)
> +{
> +	const char *pm;
> +	int err, i;
> +
> +	err =3D of_property_read_string(np, "atmel,wakeup-mode", &pm);
> +	if (err < 0)
> +		return AT91_SHDW_WKMODE0_ANYLEVEL;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(shdwc_wakeup_modes); i++)
> +		if (!strcasecmp(pm, shdwc_wakeup_modes[i]))
> +			return i;
> +
> +	return -ENODEV;
> +}
> +
> +static void at91_poweroff_dt_set_wakeup_mode(struct platform_device *pde=
v)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	enum wakeup_type wakeup_mode;
> +	u32 mode =3D 0, tmp;
> +
> +	wakeup_mode =3D at91_poweroff_get_wakeup_mode(np);
> +	if (wakeup_mode < 0) {
> +		dev_warn(&pdev->dev, "shdwc unknown wakeup mode\n");
> +		return;
> +	}
> +
> +	if (!of_property_read_u32(np, "atmel,wakeup-counter", &tmp)) {
> +		if (tmp > AT91_SHDW_CPTWK0_MAX) {
> +			dev_warn(&pdev->dev,
> +				 "shdwc wakeup counter 0x%x > 0x%x reduce it to 0x%x\n",
> +				 tmp, AT91_SHDW_CPTWK0_MAX, AT91_SHDW_CPTWK0_MAX);
> +			tmp =3D AT91_SHDW_CPTWK0_MAX;
> +		}
> +		mode |=3D AT91_SHDW_CPTWK0_(tmp);
> +	}
> +
> +	if (of_property_read_bool(np, "atmel,wakeup-rtc-timer"))
> +			mode |=3D AT91_SHDW_RTCWKEN;
> +
> +	if (of_property_read_bool(np, "atmel,wakeup-rtt-timer"))
> +			mode |=3D AT91_SHDW_RTTWKEN;
> +
> +	writel(wakeup_mode | mode, at91_shdwc_base + AT91_SHDW_MR);
> +}
> +
> +static int at91_poweroff_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	at91_shdwc_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(at91_shdwc_base)) {
> +		dev_err(&pdev->dev, "Could not map reset controller address\n");
> +		return PTR_ERR(at91_shdwc_base);
> +	}
> +
> +	at91_wakeup_status();
> +
> +	if (pdev->dev.of_node)
> +		at91_poweroff_dt_set_wakeup_mode(pdev);
> +
> +	pm_power_off =3D at91_poweroff;
> +
> +	return 0;
> +}
> +
> +static struct of_device_id at91_poweroff_of_match[] =3D {
> +	{ .compatible =3D "atmel,at91sam9260-shdwc", },
> +	{ .compatible =3D "atmel,at91sam9rl-shdwc", },
> +	{ .compatible =3D "atmel,at91sam9x5-shdwc", },
> +	{ /*sentinel*/ }
> +};
> +
> +static struct platform_driver at91_poweroff_driver =3D {
> +	.probe =3D at91_poweroff_probe,
> +	.driver =3D {
> +		.name =3D "at91-poweroff",
> +		.of_match_table =3D at91_poweroff_of_match,
> +	},
> +};
> +module_platform_driver(at91_poweroff_driver);
> -- =

> 2.0.1
> =
