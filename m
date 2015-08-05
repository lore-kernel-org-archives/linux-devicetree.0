From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drivers: watchdog: add a driver to support
 SAMA5D4 watchdog timer
Date: Wed, 5 Aug 2015 12:40:30 +0200
Message-ID: <20150805124030.6e73b975@ipc1.ka-ro>
References: <1438765043-11030-1-git-send-email-wenyou.yang@atmel.com>
	<1438765043-11030-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438765043-11030-2-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

> From SAMA5D4, the watchdog timer is upgrated with a new feature,
> which is describled as in the datasheet, "WDT_MR can be written
> until a LOCKMR command is issued in WDT_CR".
> That is to say, as long as the bootstrap and u-boot don't issue
> a LOCKMR command, WDT_MR can be written more than once in the driver.
>=20
> So the SAMA5D4 watchdog driver's implementation is different from
> the at91sam9260 watchdog driver implemented in file at91sam9_wdt.c.
> The user application open the device file to enable the watchdog time=
r
> hardware, and close to disable it, and set the watchdog timer timeout
> by seting WDV and WDD fields of WDT_MR register, and ping the watchdo=
g
> by issuing WDRSTT command to WDT_CR register with hard-coded key.
>=20
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/watchdog/Kconfig            |    9 ++
>  drivers/watchdog/Makefile           |    1 +
>  drivers/watchdog/at91_sama5d4_wdt.c |  279 +++++++++++++++++++++++++=
++++++++++
>  drivers/watchdog/at91sam9_wdt.h     |    2 +
>  4 files changed, 291 insertions(+)
>  create mode 100644 drivers/watchdog/at91_sama5d4_wdt.c
>=20
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index e5e7c55..4ce8346 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -152,6 +152,15 @@ config ARM_SP805_WATCHDOG
>  	  ARM Primecell SP805 Watchdog timer. This will reboot your system =
when
>  	  the timeout is reached.
> =20
> +config AT91_SAMA5D4_WATCHDOG
> +	tristate "Atmel SAMA5D4 Watchdog Timer"
> +	depends on ARCH_AT91
> +	select WATCHDOG_CORE
> +	help
> +	  Atmel SAMA5D4 watchdog timer is embedded into SAMA5D4 chips.
> +	  Its Watchdog Timer Mode Register can be written more than once.
> +	  This will reboot your system when the timeout is reached.
> +
>  config AT91RM9200_WATCHDOG
>  	tristate "AT91RM9200 watchdog"
>  	depends on SOC_AT91RM9200 && MFD_SYSCON
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 5c19294..c57569c 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_USBPCWATCHDOG) +=3D pcwd_usb.o
> =20
>  # ARM Architecture
>  obj-$(CONFIG_ARM_SP805_WATCHDOG) +=3D sp805_wdt.o
> +obj-$(CONFIG_AT91_SAMA5D4_WATCHDOG) +=3D at91_sama5d4_wdt.o
consistency? Other AT91 entries don't have an '_' between 'AT91' and
the remainder of the Kconfig name.

>  obj-$(CONFIG_AT91RM9200_WATCHDOG) +=3D at91rm9200_wdt.o
>  obj-$(CONFIG_AT91SAM9X_WATCHDOG) +=3D at91sam9_wdt.o
[...]
> +static irqreturn_t atmel_wdt_irq_handler(int irq, void *dev_id)
> +{
> +	struct atmel_wdt *wdt =3D platform_get_drvdata(dev_id);
> +
> +	if (wdt_read(wdt, AT91_WDT_SR)) {
> +		pr_crit("Atmel Watchdog Software Reset\n");
> +		emergency_restart();
> +		pr_crit("Reboot didn't ?????\n");
>
Reboot didn't what? 'succeed' perhaps?

> +static const struct of_device_id atmel_wdt_of_match[] =3D {
> +	{ .compatible =3D "atmel,sama5d4-wdt", },
> +	{ },
The empty initializer must always be the last element of the array, so
there is no point in having a trailing ',' (whose purpose is to
facilitate adding more entries after the last one).
Without the comma there will be a compile error if (e.g. due to a
badly resolved merge conflict) an additional entry would be added after
the stop marker. With the comma after the stop marker any trailing
entries would silently be ignored.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
