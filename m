From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] mfd/axp2xx: extend axp20x to support axp288 pmic
Date: Wed, 10 Sep 2014 10:13:54 +0100
Message-ID: <20140910091354.GL30307@lee--X1>
References: <1410267775-4683-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410267775-4683-3-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410267775-4683-3-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnu>
List-Id: devicetree@vger.kernel.org

On Tue, 09 Sep 2014, Jacob Pan wrote:

> XPower AXP288 is a customized PMIC for Intel Baytrail-CR platforms. S=
imilar
> to AXP202/209, AXP288 comes with USB charger, more LDO and BUCK chann=
els, and
> AD converter. It also provides extended status and interrupt reportin=
g
> capabilities than the devices supported in axp20x.c.
>=20
> In addition to feature extension, this patch also adds ACPI binding f=
or
> enumeration and hooks for ACPI custom operational region handlers.
>=20
> Files and common data structures have been renamed from axp20x to axp=
2xx
> in order to suit the extended scope of devices.
>=20
> This consolidated driver should support more Xpower PMICs in both dev=
ice
> tree and ACPI based platforms.
>=20
> Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/mfd/axp2xx.c       | 426 +++++++++++++++++++++++++++++++++++=
----------
>  include/linux/mfd/axp2xx.h |  57 +++++-
>  2 files changed, 388 insertions(+), 95 deletions(-)
>=20
> diff --git a/drivers/mfd/axp2xx.c b/drivers/mfd/axp2xx.c
> index c534443..4830bbe 100644
> --- a/drivers/mfd/axp2xx.c
> +++ b/drivers/mfd/axp2xx.c
> @@ -1,9 +1,9 @@
>  /*
> - * axp20x.c - MFD core driver for the X-Powers AXP202 and AXP209
> + * axp2xx.c - MFD core driver for the X-Powers AXP202, AXP209, and A=
XP288

Any renaming should be part of the renaming patch.

Please remove the supported devices from the description.

> - * AXP20x comprises an adaptive USB-Compatible PWM charger, 2 BUCK D=
C-DC
> - * converters, 5 LDOs, multiple 12-bit ADCs of voltage, current and =
temperature
> - * as well as 4 configurable GPIOs.
> + * AXP2xx typically comprises an adaptive USB-Compatible PWM charger=
, BUCK DC-DC
> + * converters, LDOs, multiple 12-bit ADCs of voltage, current and te=
mperature
> + * as well as configurable GPIOs.
>   *
>   * Author: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
>   *
> @@ -25,9 +25,14 @@
>  #include <linux/mfd/core.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
> +#include <linux/acpi.h>
> =20
>  #define AXP20X_OFF	0x80
> =20
> +static struct mfd_cell *axp2xx_cells;
> +static int axp2xx_nr_cells;
> +static struct regmap_config *regmap_cfg;

Only use globals if you 'really' have to.

[...]

> +static int axp2xx_match_device(struct axp2xx_dev *axp2xx, struct dev=
ice *dev)
>  {
> -	struct axp20x_dev *axp20x;
> +	const struct acpi_device_id *acpi_id;
>  	const struct of_device_id *of_id;
> -	int ret;
> =20
> -	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNEL);
> -	if (!axp20x)
> -		return -ENOMEM;
> +	of_id =3D of_match_device(axp2xx_of_match, dev);
> +	if (of_id) {
> +		axp2xx->variant =3D (long) of_id->data;
> +		goto found_match;

Place the ACPI stuff in an else instead of using goto.

> +	}
> =20
> -	of_id =3D of_match_device(axp20x_of_match, &i2c->dev);
> -	if (!of_id) {
> -		dev_err(&i2c->dev, "Unable to setup AXP20X data\n");
> +	acpi_id =3D acpi_match_device(dev->driver->acpi_match_table, dev);
> +	if (!acpi_id || !acpi_id->driver_data) {
> +		dev_err(dev, "Unable to setup AXP2XX ACPI data\n");
> +		return -ENODEV;
> +	}
> +	axp2xx->variant =3D (long) acpi_id->driver_data;

I think adding ACPI support should be in its own patch.

[...]

> +static int axp2xx_i2c_probe(struct i2c_client *i2c,
> +			const struct i2c_device_id *id)
> +{
> +	struct axp2xx_dev *axp2xx;
> +	int ret;
> +
> +	axp2xx =3D devm_kzalloc(&i2c->dev, sizeof(*axp2xx), GFP_KERNEL);
> +	if (!axp2xx)
> +		return -ENOMEM;
> +
> +	ret =3D axp2xx_match_device(axp2xx, &i2c->dev);
> +	if (ret)
> +		return ret;

'\n'.

> +	axp2xx->i2c_client =3D i2c;
> +	axp2xx->dev =3D &i2c->dev;
> +	dev_set_drvdata(axp2xx->dev, axp2xx);

I'll do a more thorough review once all of the patches are split up
and grouped nicely.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
