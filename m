From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mfd/axp20x: extend axp20x to support axp288 pmic
Date: Wed, 17 Sep 2014 22:39:26 -0700
Message-ID: <20140918053926.GC8740@lee--X1>
References: <1410912715-25903-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410912715-25903-2-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410912715-25903-2-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnu>
List-Id: devicetree@vger.kernel.org

On Tue, 16 Sep 2014, Jacob Pan wrote:

> X-Powers AXP288 is a customized PMIC for Intel Baytrail-CR platforms.=
 Similar
> to AXP202/209, AXP288 comes with USB charger, more LDO and BUCK chann=
els, and
> AD converters. It also provides extended status and interrupt reporti=
ng
> capabilities than the devices currently supported in axp20x.c.
>=20
> In addition to feature extension, this patch also adds ACPI binding f=
or
> enumeration.
>=20
> This consolidated driver should support more X-Powers' PMICs in both =
device
> tree and ACPI enumerated platforms.
>=20
> Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/mfd/Kconfig        |   3 +-
>  drivers/mfd/axp20x.c       | 353 +++++++++++++++++++++++++++++++++++=
++--------
>  include/linux/mfd/axp20x.h |  58 ++++++++
>  3 files changed, 354 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index de5abf2..c183edb 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -74,7 +74,8 @@ config MFD_AXP20X
>  	select REGMAP_IRQ
>  	depends on I2C=3Dy
>  	help
> -	  If you say Y here you get support for the X-Powers AXP202 and AXP=
209.
> +	  If you say Y here you get support for the X-Powers AXP202, AXP209=
 and
> +	  AXP288 power management IC (PMIC).
>  	  This driver include only the core APIs. You have to select indivi=
dual
>  	  components like regulators or the PEK (Power Enable Key) under th=
e
>  	  corresponding menus.

[...]

> -static const struct regmap_config axp20x_regmap_config =3D {

[...]

> +static struct regmap_config axp20x_regmap_config =3D {

Why have you removed const status?

>  	.reg_bits	=3D 8,
>  	.val_bits	=3D 8,
>  	.wr_table	=3D &axp20x_writeable_table,
> @@ -70,47 +129,96 @@ static const struct regmap_config axp20x_regmap_=
config =3D {
>  	.cache_type	=3D REGCACHE_RBTREE,
>  };
> =20
> -#define AXP20X_IRQ(_irq, _off, _mask) \
> -	[AXP20X_IRQ_##_irq] =3D { .reg_offset =3D (_off), .mask =3D BIT(_ma=
sk) }
> +static struct regmap_config axp288_regmap_config =3D {

const?

> +	.reg_bits	=3D 8,
> +	.val_bits	=3D 8,
> +	.wr_table	=3D &axp288_writeable_table,
> +	.volatile_table	=3D &axp288_volatile_table,
> +	.max_register	=3D AXP288_FG_TUNE5,
> +	.cache_type	=3D REGCACHE_RBTREE,
> +};

[...]

> -static const struct regmap_irq_chip axp20x_regmap_irq_chip =3D {
> +static struct acpi_device_id axp20x_acpi_match[] =3D {
> +	{
> +		.id =3D "INT33F4",
> +		.driver_data =3D (kernel_ulong_t)AXP288_ID,

Why do you need to cast this?

> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, axp20x_acpi_match);
> +
> +/* common irq chip attributes only */
> +static struct regmap_irq_chip axp20x_regmap_irq_chip =3D {
>  	.name			=3D "axp20x_irq_chip",
>  	.status_base		=3D AXP20X_IRQ1_STATE,
>  	.ack_base		=3D AXP20X_IRQ1_STATE,
>  	.mask_base		=3D AXP20X_IRQ1_EN,
> -	.num_regs		=3D 5,
> -	.irqs			=3D axp20x_regmap_irqs,
> -	.num_irqs		=3D ARRAY_SIZE(axp20x_regmap_irqs),
>  	.mask_invert		=3D true,
>  	.init_ack_masked	=3D true,
>  };
> @@ -161,36 +276,155 @@ static struct mfd_cell axp20x_cells[] =3D {
>  	},
>  };

[...]

> +static int axp20x_match_device(struct axp20x_dev *axp20x, struct dev=
ice *dev)
> +{
> +	const struct acpi_device_id *acpi_id;
> +	const struct of_device_id *of_id;
> +
> +	of_id =3D of_match_device(axp20x_of_match, dev);
> +	if (of_id)
> +		axp20x->variant =3D (long) of_id->data;
> +	else {
> +		acpi_id =3D acpi_match_device(dev->driver->acpi_match_table, dev);
> +		if (!acpi_id || !acpi_id->driver_data) {
> +			dev_err(dev, "Unable to determine ID\n");
> +			return -ENODEV;
> +		}
> +		axp20x->variant =3D (long) acpi_id->driver_data;
> +	}

We can do better error handling here and give the user a better sense
of what happened if anything were to go wrong.  Do:

if (dev->of_node)
  of_id =3D of_match_device()
  if (!of_id)
    error()
  variant =3D of_id->data;
else
  acpi_id =3D acpi_match_device()
  if (!acpi_id)
    error()
  variant =3D acpi_id->driver_data;

> +	switch (axp20x->variant) {
> +	case AXP202_ID:
> +	case AXP209_ID:
> +		axp20x->nr_cells =3D ARRAY_SIZE(axp20x_cells);
> +		axp20x->cells =3D axp20x_cells;
> +		axp20x->regmap_cfg =3D &axp20x_regmap_config;
> +		axp20x_regmap_irq_chip.num_regs	=3D 5;
> +		axp20x_regmap_irq_chip.irqs =3D axp20x_regmap_irqs;
> +		axp20x_regmap_irq_chip.num_irqs	=3D
> +			ARRAY_SIZE(axp20x_regmap_irqs);
> +		break;
> +	case AXP288_ID:
> +		axp20x->cells =3D axp288_cells;
> +		axp20x->nr_cells =3D ARRAY_SIZE(axp288_cells);
> +		axp20x->regmap_cfg =3D &axp288_regmap_config;
> +		axp20x_regmap_irq_chip.irqs =3D axp288_regmap_irqs;
> +		axp20x_regmap_irq_chip.num_irqs	=3D
> +			ARRAY_SIZE(axp288_regmap_irqs);
> +		axp20x_regmap_irq_chip.num_regs	=3D 6;
> +		break;
> +	default:
> +		dev_err(dev, "unsupported AXP20X ID %lu\n", axp20x->variant);
> +		return -ENODEV;

-EINVAL might be better here.

> +	}
> +	dev_info(dev, "AXP20x variant %s found\n",
> +		axp20x_model_names[axp20x->variant]);
> +
> +	return 0;
> +}
> +
>  static int axp20x_i2c_probe(struct i2c_client *i2c,
> -			 const struct i2c_device_id *id)
> +			const struct i2c_device_id *id)

Sneaky. ;)

>  {
>  	struct axp20x_dev *axp20x;
> -	const struct of_device_id *of_id;
>  	int ret;
> =20
>  	axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNEL);
>  	if (!axp20x)
>  		return -ENOMEM;
> =20
> -	of_id =3D of_match_device(axp20x_of_match, &i2c->dev);
> -	if (!of_id) {
> -		dev_err(&i2c->dev, "Unable to setup AXP20X data\n");
> -		return -ENODEV;
> -	}
> -	axp20x->variant =3D (long) of_id->data;
> +	ret =3D axp20x_match_device(axp20x, &i2c->dev);
> +	if (ret)
> +		return ret;
> =20
>  	axp20x->i2c_client =3D i2c;
>  	axp20x->dev =3D &i2c->dev;
>  	dev_set_drvdata(axp20x->dev, axp20x);
> =20
> -	axp20x->regmap =3D devm_regmap_init_i2c(i2c, &axp20x_regmap_config)=
;
> +	axp20x->regmap =3D devm_regmap_init_i2c(i2c, axp20x->regmap_cfg);
>  	if (IS_ERR(axp20x->regmap)) {
>  		ret =3D PTR_ERR(axp20x->regmap);
>  		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> @@ -206,8 +440,8 @@ static int axp20x_i2c_probe(struct i2c_client *i2=
c,
>  		return ret;
>  	}
> =20
> -	ret =3D mfd_add_devices(axp20x->dev, -1, axp20x_cells,
> -			      ARRAY_SIZE(axp20x_cells), NULL, 0, NULL);
> +	ret =3D mfd_add_devices(axp20x->dev, -1, axp20x->cells,
> +			axp20x->nr_cells, NULL, 0, NULL);
> =20
>  	if (ret) {
>  		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);

[...]

> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index d0e31a2..ffc69e2 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h

[...]

>  struct axp20x_dev {
>  	struct device			*dev;
>  	struct i2c_client		*i2c_client;
>  	struct regmap			*regmap;
>  	struct regmap_irq_chip_data	*regmap_irqc;
>  	long				variant;
> +	int                             nr_cells;
> +	struct mfd_cell                 *cells;
> +	struct regmap_config            *regmap_cfg;

const?

>  };
> =20
>  #endif /* __LINUX_MFD_AXP20X_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
