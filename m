From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 3/4] watchdog: add driver for Ricoh RN5T618 watchdog
Date: Thu, 4 Sep 2014 10:25:03 -0700
Message-ID: <20140904172503.GA25404@roeck-us.net>
References: <1409091237-16722-1-git-send-email-b.galvani@gmail.com>
 <1409091237-16722-4-git-send-email-b.galvani@gmail.com>
 <20140904091917.GA1397@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140904091917.GA1397@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 04, 2014 at 10:19:17AM +0100, Lee Jones wrote:
> Wim,
>=20
> Still waiting on a Watchdog Ack, so I can take this set in.
>=20
Wasn't there a more recent version of this patch ?

Thanks,
Guenter

> > This adds a driver for the watchdog timer available in Ricoh RN5T61=
8
> > PMIC. The device supports a programmable expiration time of 1, 8, 3=
2
> > or 128 seconds.
> >=20
> > Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/watchdog/Kconfig       |   11 +++
> >  drivers/watchdog/Makefile      |    1 +
> >  drivers/watchdog/rn5t618_wdt.c |  196 ++++++++++++++++++++++++++++=
++++++++++++
> >  include/linux/mfd/rn5t618.h    |    4 +
> >  4 files changed, 212 insertions(+)
> >  create mode 100644 drivers/watchdog/rn5t618_wdt.c
> >=20
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index f57312f..9eba6af 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -309,6 +309,17 @@ config ORION_WATCHDOG
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called orion_wdt.
> > =20
> > +config RN5T618_WATCHDOG
> > +	tristate "Ricoh RN5T618 watchdog"
> > +	depends on MFD_RN5T618
> > +	select WATCHDOG_CORE
> > +	help
> > +	  If you say yes here you get support for watchdog on the Ricoh
> > +	  RN5T618 PMIC.
> > +
> > +	  This driver can also be built as a module.  If so, the module
> > +	  will be called rn5t618_wdt.
> > +
> >  config SUNXI_WATCHDOG
> >  	tristate "Allwinner SoCs watchdog support"
> >  	depends on ARCH_SUNXI
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index 468c320..0afa343 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -47,6 +47,7 @@ obj-$(CONFIG_IOP_WATCHDOG) +=3D iop_wdt.o
> >  obj-$(CONFIG_DAVINCI_WATCHDOG) +=3D davinci_wdt.o
> >  obj-$(CONFIG_ORION_WATCHDOG) +=3D orion_wdt.o
> >  obj-$(CONFIG_SUNXI_WATCHDOG) +=3D sunxi_wdt.o
> > +obj-$(CONFIG_RN5T618_WATCHDOG) +=3D rn5t618_wdt.o
> >  obj-$(CONFIG_COH901327_WATCHDOG) +=3D coh901327_wdt.o
> >  obj-$(CONFIG_STMP3XXX_RTC_WATCHDOG) +=3D stmp3xxx_rtc_wdt.o
> >  obj-$(CONFIG_NUC900_WATCHDOG) +=3D nuc900_wdt.o
> > diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t=
618_wdt.c
> > new file mode 100644
> > index 0000000..3a76ad7
> > --- /dev/null
> > +++ b/drivers/watchdog/rn5t618_wdt.c
> > @@ -0,0 +1,196 @@
> > +/*
> > + * Watchdog driver for Ricoh RN5T618 PMIC
> > + *
> > + * Copyright (C) 2014 Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * version 2 as published by the Free Software Foundation.
> > + *
> > + * You should have received a copy of the GNU General Public Licen=
se
> > + * along with this program. If not, see <http://www.gnu.org/licens=
es/>.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/mfd/rn5t618.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define DRIVER_NAME "rn5t618-wdt"
> > +
> > +static bool nowayout =3D WATCHDOG_NOWAYOUT;
> > +static unsigned int heartbeat =3D -1;
> > +
> > +module_param(heartbeat, int, 0);
> > +MODULE_PARM_DESC(heartbeat, "Initial watchdog heartbeat in seconds=
");
> > +
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once starte=
d (default=3D"
> > +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +struct rn5t618_wdt {
> > +	struct watchdog_device wdt_dev;
> > +	struct rn5t618 *rn5t618;
> > +};
> > +
> > +/*
> > + * This array encodes the values of WDOGTIM field for the supporte=
d
> > + * watchdog expiration times. If the watchdog is not accessed befo=
re
> > + * the timer expiration, the PMU generates an interrupt and if the=
 CPU
> > + * doesn't clear it within one second the system is restarted.
> > + */
> > +static const struct {
> > +	u8 reg_val;
> > +	int time;
> > +} rn5t618_wdt_map[] =3D {
> > +	{ 0, 1 },
> > +	{ 1, 8 },
> > +	{ 2, 32 },
> > +	{ 3, 128 },
> > +};
> > +
> > +static int rn5t618_wdt_set_timeout(struct watchdog_device *wdt_dev=
,
> > +				   unsigned int timeout)
> > +{
> > +	struct rn5t618_wdt *wdt =3D watchdog_get_drvdata(wdt_dev);
> > +	int ret, i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(rn5t618_wdt_map); i++) {
> > +		if (rn5t618_wdt_map[i].time + 1 >=3D timeout)
> > +			break;
> > +	}
> > +
> > +	if (i =3D=3D ARRAY_SIZE(rn5t618_wdt_map))
> > +		ret =3D -EINVAL;
> > +	else
> > +		ret =3D regmap_update_bits(wdt->rn5t618->regmap, RN5T618_WATCHDO=
G,
> > +					 RN5T618_WATCHDOG_WDOGTIM_M,
> > +					 rn5t618_wdt_map[i].reg_val);
> > +	if (!ret)
> > +		wdt_dev->timeout =3D rn5t618_wdt_map[i].time;
> > +
> > +	return ret;
> > +}
> > +
> > +static int rn5t618_wdt_start(struct watchdog_device *wdt_dev)
> > +{
> > +	struct rn5t618_wdt *wdt =3D watchdog_get_drvdata(wdt_dev);
> > +	int ret;
> > +
> > +	ret =3D rn5t618_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* enable repower-on */
> > +	ret =3D regmap_update_bits(wdt->rn5t618->regmap, RN5T618_REPCNT,
> > +				 RN5T618_REPCNT_REPWRON,
> > +				 RN5T618_REPCNT_REPWRON);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* enable watchdog */
> > +	ret =3D regmap_update_bits(wdt->rn5t618->regmap, RN5T618_WATCHDOG=
,
> > +				 RN5T618_WATCHDOG_WDOGEN,
> > +				 RN5T618_WATCHDOG_WDOGEN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* enable watchdog interrupt */
> > +	return regmap_update_bits(wdt->rn5t618->regmap, RN5T618_PWRIREN,
> > +				  RN5T618_PWRIRQ_IR_WDOG,
> > +				  RN5T618_PWRIRQ_IR_WDOG);
> > +}
> > +
> > +static int rn5t618_wdt_stop(struct watchdog_device *wdt_dev)
> > +{
> > +	struct rn5t618_wdt *wdt =3D watchdog_get_drvdata(wdt_dev);
> > +
> > +	return regmap_update_bits(wdt->rn5t618->regmap, RN5T618_WATCHDOG,
> > +				  RN5T618_WATCHDOG_WDOGEN, 0);
> > +}
> > +
> > +static int rn5t618_wdt_ping(struct watchdog_device *wdt_dev)
> > +{
> > +	struct rn5t618_wdt *wdt =3D watchdog_get_drvdata(wdt_dev);
> > +	unsigned int val;
> > +	int ret;
> > +
> > +	/* The counter is restarted after a R/W access to watchdog regist=
er */
> > +	ret =3D regmap_read(wdt->rn5t618->regmap, RN5T618_WATCHDOG, &val)=
;
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D regmap_write(wdt->rn5t618->regmap, RN5T618_WATCHDOG, val)=
;
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Clear pending watchdog interrupt */
> > +	return regmap_update_bits(wdt->rn5t618->regmap, RN5T618_PWRIRQ,
> > +				  RN5T618_PWRIRQ_IR_WDOG, 0);
> > +}
> > +
> > +static struct watchdog_info rn5t618_wdt_info =3D {
> > +	.options	=3D WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE |
> > +			  WDIOF_KEEPALIVEPING,
> > +	.identity	=3D DRIVER_NAME,
> > +};
> > +
> > +static struct watchdog_ops rn5t618_wdt_ops =3D {
> > +	.owner          =3D THIS_MODULE,
> > +	.start          =3D rn5t618_wdt_start,
> > +	.stop           =3D rn5t618_wdt_stop,
> > +	.ping           =3D rn5t618_wdt_ping,
> > +	.set_timeout    =3D rn5t618_wdt_set_timeout,
> > +};
> > +
> > +static int rn5t618_wdt_probe(struct platform_device *pdev)
> > +{
> > +	struct rn5t618 *rn5t618 =3D dev_get_drvdata(pdev->dev.parent);
> > +	struct rn5t618_wdt *wdt;
> > +	int min_timeout, max_timeout;
> > +
> > +	wdt =3D devm_kzalloc(&pdev->dev, sizeof(struct rn5t618_wdt), GFP_=
KERNEL);
> > +	if (!wdt)
> > +		return -ENOMEM;
> > +
> > +	min_timeout =3D rn5t618_wdt_map[0].time;
> > +	max_timeout =3D rn5t618_wdt_map[ARRAY_SIZE(rn5t618_wdt_map) - 1].=
time;
> > +
> > +	wdt->rn5t618 =3D rn5t618;
> > +	wdt->wdt_dev.info =3D &rn5t618_wdt_info;
> > +	wdt->wdt_dev.ops =3D &rn5t618_wdt_ops;
> > +	wdt->wdt_dev.min_timeout =3D min_timeout;
> > +	wdt->wdt_dev.max_timeout =3D max_timeout;
> > +	wdt->wdt_dev.timeout =3D max_timeout;
> > +	wdt->wdt_dev.parent =3D &pdev->dev;
> > +
> > +	watchdog_set_drvdata(&wdt->wdt_dev, wdt);
> > +	watchdog_init_timeout(&wdt->wdt_dev, heartbeat, &pdev->dev);
> > +	watchdog_set_nowayout(&wdt->wdt_dev, nowayout);
> > +
> > +	return watchdog_register_device(&wdt->wdt_dev);
> > +}
> > +
> > +static int rn5t618_wdt_remove(struct platform_device *pdev)
> > +{
> > +	struct watchdog_device *wdt_dev =3D platform_get_drvdata(pdev);
> > +
> > +	watchdog_unregister_device(wdt_dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver rn5t618_wdt_driver =3D {
> > +	.probe =3D rn5t618_wdt_probe,
> > +	.remove =3D rn5t618_wdt_remove,
> > +	.driver =3D {
> > +		.name	=3D DRIVER_NAME,
> > +	},
> > +};
> > +
> > +module_platform_driver(rn5t618_wdt_driver);
> > +
> > +MODULE_AUTHOR("Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> > +MODULE_DESCRIPTION("RN5T618 watchdog driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t61=
8.h
> > index e3571d1..c72d534 100644
> > --- a/include/linux/mfd/rn5t618.h
> > +++ b/include/linux/mfd/rn5t618.h
> > @@ -202,6 +202,10 @@
> > =20
> >  #define RN5T618_REPCNT_REPWRON		BIT(0)
> >  #define RN5T618_SLPCNT_SWPWROFF		BIT(0)
> > +#define RN5T618_WATCHDOG_WDOGEN		BIT(2)
> > +#define RN5T618_WATCHDOG_WDOGTIM_M	(BIT(0) | BIT(1))
> > +#define RN5T618_WATCHDOG_WDOGTIM_S	0
> > +#define RN5T618_PWRIRQ_IR_WDOG		BIT(6)
> > =20
> >  enum {
> >  	RN5T618_DCDC1,
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watch=
dog" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
