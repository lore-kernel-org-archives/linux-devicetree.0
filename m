From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 7/7] drm/tinydrm: Add support for Multi-Inno MI0283QT
 display
Date: Mon, 6 Feb 2017 09:25:52 +0100
Message-ID: <20170206082552.GB27607@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-8-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170131160319.9695-8-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 05:03:19PM +0100, Noralf Tr=C3=B8nnes wrote:
> Add driver to support the Multi-Inno MI0283QT display panel.
> It has an ILI9341 MIPI DBI compatible display controller.

So what exactly does this entail? What if we ever see a second panel
that has one of these controllers? Would it end up duplicating a lot
of the code from this driver?

Or would we be able to reuse the driver by just adding a different
compatible string and parameterizing some more?

> Signed-off-by: Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
> ---
>  MAINTAINERS                        |   6 +
>  drivers/gpu/drm/tinydrm/Kconfig    |   8 ++
>  drivers/gpu/drm/tinydrm/Makefile   |   3 +
>  drivers/gpu/drm/tinydrm/mi0283qt.c | 279 +++++++++++++++++++++++++++++++=
++++++
>  include/drm/tinydrm/ili9341.h      |  54 +++++++
>  5 files changed, 350 insertions(+)
>  create mode 100644 drivers/gpu/drm/tinydrm/mi0283qt.c
>  create mode 100644 include/drm/tinydrm/ili9341.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d935135..5c4666b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4278,6 +4278,12 @@ S:	Supported
>  F:	drivers/gpu/drm/mediatek/
>  F:	Documentation/devicetree/bindings/display/mediatek/
> =20
> +DRM DRIVER FOR MI0283QT
> +M:	Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
> +S:	Maintained
> +F:	drivers/gpu/drm/tinydrm/mi0283qt.c
> +F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
> +
>  DRM DRIVER FOR MSM ADRENO GPU
>  M:	Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  L:	linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> diff --git a/drivers/gpu/drm/tinydrm/Kconfig b/drivers/gpu/drm/tinydrm/Kc=
onfig
> index 128d2f3..d3161fd 100644
> --- a/drivers/gpu/drm/tinydrm/Kconfig
> +++ b/drivers/gpu/drm/tinydrm/Kconfig
> @@ -9,3 +9,11 @@ menuconfig DRM_TINYDRM
> =20
>  config TINYDRM_MIPI_DBI
>  	tristate
> +
> +config TINYDRM_MI0283QT
> +	tristate "DRM support for MI0283QT"
> +	depends on DRM_TINYDRM && SPI
> +	select TINYDRM_MIPI_DBI
> +	help
> +	  DRM driver for the Multi-Inno MI0283QT display panel
> +	  If M is selected the module will be called mi0283qt.
> diff --git a/drivers/gpu/drm/tinydrm/Makefile b/drivers/gpu/drm/tinydrm/M=
akefile
> index fe5d4c6..7a3604c 100644
> --- a/drivers/gpu/drm/tinydrm/Makefile
> +++ b/drivers/gpu/drm/tinydrm/Makefile
> @@ -2,3 +2,6 @@ obj-$(CONFIG_DRM_TINYDRM)		+=3D core/
> =20
>  # Controllers
>  obj-$(CONFIG_TINYDRM_MIPI_DBI)		+=3D mipi-dbi.o
> +
> +# Displays
> +obj-$(CONFIG_TINYDRM_MI0283QT)		+=3D mi0283qt.o
> diff --git a/drivers/gpu/drm/tinydrm/mi0283qt.c b/drivers/gpu/drm/tinydrm=
/mi0283qt.c
> new file mode 100644
> index 0000000..b29fe86
> --- /dev/null
> +++ b/drivers/gpu/drm/tinydrm/mi0283qt.c
> @@ -0,0 +1,279 @@
> +/*
> + * DRM driver for Multi-Inno MI0283QT panels
> + *
> + * Copyright 2016 Noralf Tr=C3=B8nnes
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <drm/tinydrm/ili9341.h>
> +#include <drm/tinydrm/mipi-dbi.h>
> +#include <drm/tinydrm/tinydrm-helpers.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +#include <video/mipi_display.h>

The ordering of includes is somewhat weird here. Usually the grouping is
such that we have linux/*, drm/* and video/*

> +
> +static int mi0283qt_init(struct mipi_dbi *mipi)
> +{
> +	struct tinydrm_device *tdev =3D &mipi->tinydrm;
> +	struct device *dev =3D tdev->drm->dev;
> +	u8 addr_mode;
> +	int ret;
> +
> +	DRM_DEBUG_KMS("\n");
> +
> +	ret =3D regulator_enable(mipi->regulator);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable regulator %d\n", ret);

Nit: I find error messages such as these confusing because it is
sometimes ambiguous what the number is supposed to mean. I think the
error message becomes much clearer when it reads:

	Failed to enable regulator: %d

> +		return ret;
> +	}
> +
> +	/* Avoid flicker by skipping setup if the bootloader has done it */
> +	if (mipi_dbi_display_is_on(mipi))
> +		return 0;
> +
> +	mipi_dbi_hw_reset(mipi);
> +	ret =3D mipi_dbi_command(mipi, MIPI_DCS_SOFT_RESET);
> +	if (ret) {
> +		dev_err(dev, "Error sending command %d\n", ret);

This is a case where I think it can be confusing. The number could be
mistaken for the command that failed to be sent. Adding a separator can
help reduce that ambiguity.

> +		regulator_disable(mipi->regulator);
> +		return ret;
> +	}
> +
> +	msleep(20);
> +
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_DISPLAY_OFF);
> +
> +	mipi_dbi_command(mipi, ILI9341_PWCTRLB, 0x00, 0x83, 0x30);
> +	mipi_dbi_command(mipi, ILI9341_PWRSEQ, 0x64, 0x03, 0x12, 0x81);
> +	mipi_dbi_command(mipi, ILI9341_DTCTRLA, 0x85, 0x01, 0x79);
> +	mipi_dbi_command(mipi, ILI9341_PWCTRLA, 0x39, 0x2c, 0x00, 0x34, 0x02);
> +	mipi_dbi_command(mipi, ILI9341_PUMPCTRL, 0x20);
> +	mipi_dbi_command(mipi, ILI9341_DTCTRLB, 0x00, 0x00);
> +
> +	/* Power Control */
> +	mipi_dbi_command(mipi, ILI9341_PWCTRL1, 0x26);
> +	mipi_dbi_command(mipi, ILI9341_PWCTRL2, 0x11);
> +	/* VCOM */
> +	mipi_dbi_command(mipi, ILI9341_VMCTRL1, 0x35, 0x3e);
> +	mipi_dbi_command(mipi, ILI9341_VMCTRL2, 0xbe);
> +
> +	/* Memory Access Control */
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);

MIPI_DCS_PIXEL_FMT_16BIT?

> +	switch (mipi->rotation) {
> +	default:
> +		addr_mode =3D ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
> +			    ILI9341_MADCTL_MX;
> +		break;
> +	case 90:
> +		addr_mode =3D ILI9341_MADCTL_MY;
> +		break;
> +	case 180:
> +		addr_mode =3D ILI9341_MADCTL_MV;
> +		break;
> +	case 270:
> +		addr_mode =3D ILI9341_MADCTL_MX;
> +		break;
> +	}
> +	addr_mode |=3D ILI9341_MADCTL_BGR;
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);

Would it be possible to add defines corresponding to the definition in
MIPI DCS? Looks like they are equivalent.

> +
> +	/* Frame Rate */
> +	mipi_dbi_command(mipi, ILI9341_FRMCTR1, 0x00, 0x1b);

Should this be parameterized refresh rate of the mode?

That said, is there a publicly available datasheet for this display?
There's a lot of magic values here that aren't trivial to decode. It
seems as if some documentation must exist, otherwise you wouldn't be
using such nice register names.

Don't get me wrong, this is already a lot better than most other
panel drivers that I've seen.

> +
> +	/* Gamma */
> +	mipi_dbi_command(mipi, ILI9341_EN3GAM, 0x08);
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_GAMMA_CURVE, 0x01);
> +	mipi_dbi_command(mipi, ILI9341_PGAMCTRL,
> +		       0x1f, 0x1a, 0x18, 0x0a, 0x0f, 0x06, 0x45, 0x87,
> +		       0x32, 0x0a, 0x07, 0x02, 0x07, 0x05, 0x00);
> +	mipi_dbi_command(mipi, ILI9341_NGAMCTRL,
> +		       0x00, 0x25, 0x27, 0x05, 0x10, 0x09, 0x3a, 0x78,
> +		       0x4d, 0x05, 0x18, 0x0d, 0x38, 0x3a, 0x1f);
> +
> +	/* DDRAM */
> +	mipi_dbi_command(mipi, ILI9341_ETMOD, 0x07);
> +
> +	/* Display */
> +	mipi_dbi_command(mipi, ILI9341_DISCTRL, 0x0a, 0x82, 0x27, 0x00);
> +	mipi_dbi_command(mipi, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(100);
> +
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_DISPLAY_ON);
> +	msleep(100);
> +
> +	return 0;
> +}
> +
> +static void mi0283qt_fini(void *data)
> +{
> +	struct mipi_dbi *mipi =3D data;
> +
> +	DRM_DEBUG_KMS("\n");
> +	regulator_disable(mipi->regulator);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs mi0283qt_pipe_funcs =
=3D {
> +	.enable =3D mipi_dbi_pipe_enable,
> +	.disable =3D mipi_dbi_pipe_disable,
> +	.update =3D tinydrm_display_pipe_update,
> +	.prepare_fb =3D tinydrm_display_pipe_prepare_fb,
> +};
> +
> +static const struct drm_display_mode mi0283qt_mode =3D {
> +	TINYDRM_MODE(320, 240, 58, 43),
> +};
> +
> +static struct drm_driver mi0283qt_driver =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
> +				  DRIVER_ATOMIC,
> +	TINYDRM_GEM_DRIVER_OPS,
> +	.lastclose		=3D tinydrm_lastclose,
> +	.debugfs_init		=3D mipi_dbi_debugfs_init,
> +	.name			=3D "mi0283qt",
> +	.desc			=3D "Multi-Inno MI0283QT",
> +	.date			=3D "20160614",
> +	.major			=3D 1,
> +	.minor			=3D 0,
> +};
> +
> +static const struct of_device_id mi0283qt_of_match[] =3D {
> +	{ .compatible =3D "multi-inno,mi0283qt" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mi0283qt_of_match);
> +
> +static const struct spi_device_id mi0283qt_id[] =3D {
> +	{ "mi0283qt", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(spi, mi0283qt_id);

Do we actually still need this? Will these devices ever be instantiated
=66rom non-OF code?

> +
> +static int mi0283qt_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct tinydrm_device *tdev;
> +	struct mipi_dbi *mipi;
> +	struct gpio_desc *dc;
> +	u32 rotation =3D 0;
> +	int ret;
> +
> +	mipi =3D devm_kzalloc(dev, sizeof(*mipi), GFP_KERNEL);
> +	if (!mipi)
> +		return -ENOMEM;
> +
> +	mipi->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(mipi->reset)) {
> +		dev_err(dev, "Failed to get gpio 'reset'\n");
> +		return PTR_ERR(mipi->reset);
> +	}
> +
> +	dc =3D devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(dc)) {
> +		dev_err(dev, "Failed to get gpio 'dc'\n");
> +		return PTR_ERR(dc);
> +	}
> +
> +	mipi->regulator =3D devm_regulator_get(dev, "power");
> +	if (IS_ERR(mipi->regulator))
> +		return PTR_ERR(mipi->regulator);
> +
> +	mipi->backlight =3D tinydrm_of_find_backlight(dev);
> +	if (IS_ERR(mipi->backlight))
> +		return PTR_ERR(mipi->backlight);
> +
> +	device_property_read_u32(dev, "rotation", &rotation);
> +
> +	ret =3D mipi_dbi_spi_init(spi, mipi, dc, &mi0283qt_pipe_funcs,
> +				&mi0283qt_driver, &mi0283qt_mode, rotation);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mi0283qt_init(mipi);
> +	if (ret)
> +		return ret;
> +
> +	/* use devres to fini after drm unregister (drv->remove is before) */
> +	ret =3D devm_add_action(dev, mi0283qt_fini, mipi);
> +	if (ret) {
> +		mi0283qt_fini(mipi);
> +		return ret;
> +	}

This is somewhat asymmetric. I understand that you can't simply do this
in ->remove() here because of devm_tinydrm_register(), but wouldn't it
be somewhat simpler to add an explicit callback somewhere that is called
at exactly the right time? I think it'll be fairly confusing down the
road to have every driver use devm_add_action() explicitly to clean up.
TinyDRM should have that built-in, in my opinion.

> +
> +	tdev =3D &mipi->tinydrm;
> +
> +	ret =3D devm_tinydrm_register(tdev);
> +	if (ret)
> +		return ret;
> +
> +	spi_set_drvdata(spi, mipi);
> +
> +	DRM_DEBUG_DRIVER("Initialized %s:%s @%uMHz on minor %d\n",
> +			 tdev->drm->driver->name, dev_name(dev),
> +			 spi->max_speed_hz / 1000000,
> +			 tdev->drm->primary->index);
> +
> +	return 0;
> +}
> +
> +static void mi0283qt_shutdown(struct spi_device *spi)
> +{
> +	struct mipi_dbi *mipi =3D spi_get_drvdata(spi);
> +
> +	tinydrm_shutdown(&mipi->tinydrm);
> +}
> +
> +static int __maybe_unused mi0283qt_pm_suspend(struct device *dev)
> +{
> +	struct mipi_dbi *mipi =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D tinydrm_suspend(&mipi->tinydrm);
> +	if (ret)
> +		return ret;
> +
> +	mi0283qt_fini(mipi);

This looks slightly weird from a naming perspective. My first instinct
was that this was a bug because it's cleaning up a device on suspend
(_fini is usually a suffix for destructor-like functions). Then I
realized that mi0283qt_fini() was really only disabling a regulator,
so it's obviously fine to call it here. Might be worth choosing a less
confusing name here.

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mi0283qt_pm_resume(struct device *dev)
> +{
> +	struct mipi_dbi *mipi =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D mi0283qt_init(mipi);
> +	if (ret)
> +		return ret;

Similar here. I probably would've chose something like mi0283qt_enable()
and mi0283qt_disable() for these. But feel free to leave this as is if
you prefer your bikeshed colored this way.

> +
> +	return tinydrm_resume(&mipi->tinydrm);
> +}
> +
> +static const struct dev_pm_ops mi0283qt_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(mi0283qt_pm_suspend, mi0283qt_pm_resume)
> +};
> +
> +static struct spi_driver mi0283qt_spi_driver =3D {
> +	.driver =3D {
> +		.name =3D "mi0283qt",
> +		.owner =3D THIS_MODULE,
> +		.of_match_table =3D mi0283qt_of_match,
> +		.pm =3D &mi0283qt_pm_ops,
> +	},
> +	.id_table =3D mi0283qt_id,
> +	.probe =3D mi0283qt_probe,
> +	.shutdown =3D mi0283qt_shutdown,
> +};
> +module_spi_driver(mi0283qt_spi_driver);
> +
> +MODULE_DESCRIPTION("Multi-Inno MI0283QT DRM driver");
> +MODULE_AUTHOR("Noralf Tr=C3=B8nnes");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/tinydrm/ili9341.h b/include/drm/tinydrm/ili9341.h
> new file mode 100644
> index 0000000..807a09f
> --- /dev/null
> +++ b/include/drm/tinydrm/ili9341.h
> @@ -0,0 +1,54 @@
> +/*
> + * ILI9341 LCD controller
> + *
> + * Copyright 2016 Noralf Tr=C3=B8nnes
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __LINUX_ILI9341_H
> +#define __LINUX_ILI9341_H
> +
> +#define ILI9341_FRMCTR1    0xb1
> +#define ILI9341_FRMCTR2    0xb2
> +#define ILI9341_FRMCTR3    0xb3
> +#define ILI9341_INVTR      0xb4
> +#define ILI9341_PRCTR      0xb5
> +#define ILI9341_DISCTRL    0xb6
> +#define ILI9341_ETMOD      0xb7
> +
> +#define ILI9341_PWCTRL1    0xc0
> +#define ILI9341_PWCTRL2    0xc1
> +#define ILI9341_VMCTRL1    0xc5
> +#define ILI9341_VMCTRL2    0xc7
> +#define ILI9341_PWCTRLA    0xcb
> +#define ILI9341_PWCTRLB    0xcf
> +
> +#define ILI9341_RDID1      0xda
> +#define ILI9341_RDID2      0xdb
> +#define ILI9341_RDID3      0xdc
> +#define ILI9341_RDID4      0xd3
> +
> +#define ILI9341_PGAMCTRL   0xe0
> +#define ILI9341_NGAMCTRL   0xe1
> +#define ILI9341_DGAMCTRL1  0xe2
> +#define ILI9341_DGAMCTRL2  0xe3
> +#define ILI9341_DTCTRLA    0xe8
> +#define ILI9341_DTCTRLB    0xea
> +#define ILI9341_PWRSEQ     0xed
> +
> +#define ILI9341_EN3GAM     0xf2
> +#define ILI9341_IFCTRL     0xf6
> +#define ILI9341_PUMPCTRL   0xf7
> +
> +#define ILI9341_MADCTL_MH  BIT(2)
> +#define ILI9341_MADCTL_BGR BIT(3)
> +#define ILI9341_MADCTL_ML  BIT(4)
> +#define ILI9341_MADCTL_MV  BIT(5)
> +#define ILI9341_MADCTL_MX  BIT(6)
> +#define ILI9341_MADCTL_MY  BIT(7)
> +
> +#endif /* __LINUX_ILI9341_H */

Wouldn't it be possible to inline these into the source file? Or if you
think anyone will ever reuse these for a different panel driver, maybe
put it alongside the source file. Doesn't look like something that needs
to be in include/drm.

Thierry

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYMw4ACgkQ3SOs138+
s6FH5xAAqa1EZuH8ACX17XtQFxPgXv8IHQ7z2XX9fD5aZ2kdOsmw1XJY8rmQQvom
7nuqnzeKeC3WeKc4dyFS/euN8XRjQ7suiHfB5QZN3Vdpy3ONf7UBG9Q0qh1/poKs
/ZaE/ULSvkgt1jaSXOItbOmYwvIi5rN4M6l48NdaUxKXh+pMeWbsSOKyvnwYVN44
QO+8Y85DD6ZgLwQg3EOqGAgZBmJhjTc5cl1eCUQ9zN57krDOxjLOZth2y0LbM7fF
vPHjhzCwmi22ixAVzrwL/Vmt+Q9FRIMDgDPxioKDrIgoV0EiXgiAgz4UpZuDSFFZ
M0uItQZOjqKlZDptwhyz5JFIFGMlRkXJLVvmVMYGRUSq9Qe/f0r1oPrdznx8LhJM
LcxIc6ouF5DM5+9SnZcbycgnSuTwxHZ6OQdSjM1dhzXUp/ZuqlPmUN7qef2gtMJS
nh5l0BKOnB8rMpaRYpDYY99Us0X49Q5BxR5ZISmZYNbrVezUu7kShq0fYIil9khH
NF6ajnFsC9/QH4Qbsll74Ez8/ysR5Ibgi+wAMPp9piEMyELB0hxkF6wFopKX2R77
LTYii0eeOKDLg2GPs+KZJHFlnJugEKn/RVJ0Mryq5vnl/vV5IhfsZCC4xmd/9oxx
Uxa+RrlDxYAki5EgUb50lf+A6iIgEzlojIl0PlXNjJHlBWaTDgY=
=he6h
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
