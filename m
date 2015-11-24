From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 2/6] mfd: axp20x: Split the driver into core and i2c bits
Date: Tue, 24 Nov 2015 11:37:03 +0200
Message-ID: <CAHp75VesF5M6nJf6eaBO+Dg6nC3gj=rzL9YnQFAysQ4NFgOMHg@mail.gmail.com>
References: <1448336916-31212-1-git-send-email-wens@csie.org>
	<1448336916-31212-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448336916-31212-3-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 5:48 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> The axp20x driver assumes the device is i2c based. This is not the
> case with later chips, which use a proprietary 2 wire serial bus
> by Allwinner called "Reduced Serial Bus".
>
> This patch follows the example of mfd/wm831x and splits it into
> an interface independent core, and an i2c specific glue layer.
> MFD_AXP20X and the new MFD_AXP20X_I2C are changed to tristate
> symbols, allowing the driver to be built as modules.
>
> Included but unused header files are removed as well.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/mfd/Kconfig        |  14 +++--
>  drivers/mfd/Makefile       |   1 +
>  drivers/mfd/axp20x-i2c.c   | 127 +++++++++++++++++++++++++++++++++++=
++++++++++
>  drivers/mfd/axp20x.c       | 108 +++++------------------------------=
---
>  include/linux/mfd/axp20x.h |  33 +++++++++++-
>  5 files changed, 183 insertions(+), 100 deletions(-)
>  create mode 100644 drivers/mfd/axp20x-i2c.c
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 4d92df6ef9fe..804cd3dcce32 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -91,14 +91,18 @@ config MFD_BCM590XX
>           Support for the BCM590xx PMUs from Broadcom
>
>  config MFD_AXP20X
> -       bool "X-Powers AXP20X"
> +       tristate
>         select MFD_CORE
> -       select REGMAP_I2C
>         select REGMAP_IRQ
> -       depends on I2C=3Dy
> +
> +config MFD_AXP20X_I2C
> +       tristate "X-Powers AXP series PMICs with I2C"
> +       select MFD_AXP20X
> +       select REGMAP_I2C
> +       depends on I2C
>         help
> -         If you say Y here you get support for the X-Powers AXP202, =
AXP209 and
> -         AXP288 power management IC (PMIC).
> +         If you say Y here you get support for the X-Powers AXP seri=
es power
> +         management ICs (PMICs) controlled with I2C.
>           This driver include only the core APIs. You have to select =
individual
>           components like regulators or the PEK (Power Enable Key) un=
der the
>           corresponding menus.
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index a8b76b81b467..a6913007d667 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -107,6 +107,7 @@ obj-$(CONFIG_PMIC_DA9052)   +=3D da9052-core.o
>  obj-$(CONFIG_MFD_DA9052_SPI)   +=3D da9052-spi.o
>  obj-$(CONFIG_MFD_DA9052_I2C)   +=3D da9052-i2c.o
>  obj-$(CONFIG_MFD_AXP20X)       +=3D axp20x.o
> +obj-$(CONFIG_MFD_AXP20X_I2C)   +=3D axp20x-i2c.o
>
>  obj-$(CONFIG_MFD_LP3943)       +=3D lp3943.o
>  obj-$(CONFIG_MFD_LP8788)       +=3D lp8788.o lp8788-irq.o
> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> new file mode 100644
> index 000000000000..75b247af2514
> --- /dev/null
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -0,0 +1,127 @@
> +/*
> + * axp20x-i2c.c - I2C driver for the X-Powers' Power Management ICs
> + *
> + * AXP20x typically comprises an adaptive USB-Compatible PWM charger=
, BUCK DC-DC
> + * converters, LDOs, multiple 12-bit ADCs of voltage, current and te=
mperature
> + * as well as configurable GPIOs.
> + *
> + * This driver supports the I2C variants.
> + *
> + * Author: Carlo Caione <carlo@caione.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mfd/axp20x.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +static const struct of_device_id axp20x_i2c_of_match[] =3D {
> +       { .compatible =3D "x-powers,axp152", .data =3D (void *) AXP15=
2_ID },
> +       { .compatible =3D "x-powers,axp202", .data =3D (void *) AXP20=
2_ID },
> +       { .compatible =3D "x-powers,axp209", .data =3D (void *) AXP20=
9_ID },
> +       { .compatible =3D "x-powers,axp221", .data =3D (void *) AXP22=
1_ID },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
> +
> +/*
> + * This is useless for OF-enabled devices, but it is needed by I2C s=
ubsystem
> + */
> +static const struct i2c_device_id axp20x_i2c_id[] =3D {
> +       { },
> +};
> +MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> +
> +static const struct acpi_device_id axp20x_i2c_acpi_match[] =3D {
> +       {
> +               .id =3D "INT33F4",
> +               .driver_data =3D AXP288_ID,
> +       },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(acpi, axp20x_i2c_acpi_match);
> +
> +static int axp20x_i2c_match_device(struct axp20x_dev *axp20x,
> +                                  struct device *dev)
> +{
> +       const struct acpi_device_id *acpi_id;
> +       const struct of_device_id *of_id;
> +
> +       if (dev->of_node) {

What about

if (=E2=80=A6of_node) {
      const struct of_device_id *id;
=E2=80=A6
} else if ACPI_COMPANION(=E2=80=A6) {
      const struct acpi_device_id *id;
=E2=80=A6
} else {
 return -ENODEV;
}

> +               of_id =3D of_match_device(axp20x_i2c_of_match, dev);
> +               if (!of_id) {
> +                       dev_err(dev, "Unable to match OF ID\n");
> +                       return -ENODEV;
> +               }
> +               axp20x->variant =3D (long) of_id->data;

Extra space after casting.

> +       } else {
> +               acpi_id =3D acpi_match_device(dev->driver->acpi_match=
_table, dev);
> +               if (!acpi_id || !acpi_id->driver_data) {
> +                       dev_err(dev, "Unable to match ACPI ID and dat=
a\n");
> +                       return -ENODEV;
> +               }
> +               axp20x->variant =3D (long) acpi_id->driver_data;

Ditto.

> +       }
> +
> +       return axp20x_match_device(axp20x, dev);
> +}
> +
> +static int axp20x_i2c_probe(struct i2c_client *i2c,
> +                           const struct i2c_device_id *id)
> +{
> +       struct axp20x_dev *axp20x;
> +       int ret;
> +
> +       axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNE=
L);
> +       if (!axp20x)
> +               return -ENOMEM;
> +
> +       ret =3D axp20x_i2c_match_device(axp20x, &i2c->dev);
> +       if (ret)
> +               return ret;
> +
> +       axp20x->dev =3D &i2c->dev;
> +       axp20x->irq =3D i2c->irq;

If you move _match_device() here you will be able to drop away struct
device * parameter.

> +       dev_set_drvdata(axp20x->dev, axp20x);
> +
> +       axp20x->regmap =3D devm_regmap_init_i2c(i2c, axp20x->regmap_c=
fg);
> +       if (IS_ERR(axp20x->regmap)) {
> +               ret =3D PTR_ERR(axp20x->regmap);
> +               dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       return axp20x_device_probe(axp20x);
> +}
> +
> +static int axp20x_i2c_remove(struct i2c_client *i2c)
> +{
> +       struct axp20x_dev *axp20x =3D i2c_get_clientdata(i2c);
> +
> +       return axp20x_device_remove(axp20x);
> +}
> +
> +static struct i2c_driver axp20x_i2c_driver =3D {
> +       .driver =3D {
> +               .name   =3D "axp20x",
> +               .of_match_table =3D of_match_ptr(axp20x_i2c_of_match)=
,
> +               .acpi_match_table =3D ACPI_PTR(axp20x_i2c_acpi_match)=
,
> +       },
> +       .probe          =3D axp20x_i2c_probe,
> +       .remove         =3D axp20x_i2c_remove,
> +       .id_table       =3D axp20x_i2c_id,
> +};
> +
> +module_i2c_driver(axp20x_i2c_driver);
> +
> +MODULE_DESCRIPTION("PMIC MFD I2C driver for AXP20X");
> +MODULE_AUTHOR("Carlo Caione <carlo@caione.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 9842199e2e6c..01f139856bf1 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -5,6 +5,8 @@
>   * converters, LDOs, multiple 12-bit ADCs of voltage, current and te=
mperature
>   * as well as configurable GPIOs.
>   *
> + * This file contains the interface independent core functions.
> + *
>   * Author: Carlo Caione <carlo@caione.org>
>   *
>   * This program is free software; you can redistribute it and/or mod=
ify
> @@ -13,18 +15,14 @@
>   */
>
>  #include <linux/err.h>
> -#include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> -#include <linux/slab.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/mfd/axp20x.h>
>  #include <linux/mfd/core.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
>  #include <linux/acpi.h>
>
>  #define AXP20X_OFF     0x80
> @@ -376,32 +374,6 @@ static const struct regmap_irq axp288_regmap_irq=
s[] =3D {
>         INIT_REGMAP_IRQ(AXP288, BC_USB_CHNG,            5, 1),
>  };
>
> -static const struct of_device_id axp20x_of_match[] =3D {
> -       { .compatible =3D "x-powers,axp152", .data =3D (void *) AXP15=
2_ID },
> -       { .compatible =3D "x-powers,axp202", .data =3D (void *) AXP20=
2_ID },
> -       { .compatible =3D "x-powers,axp209", .data =3D (void *) AXP20=
9_ID },
> -       { .compatible =3D "x-powers,axp221", .data =3D (void *) AXP22=
1_ID },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, axp20x_of_match);
> -
> -/*
> - * This is useless for OF-enabled devices, but it is needed by I2C s=
ubsystem
> - */
> -static const struct i2c_device_id axp20x_i2c_id[] =3D {
> -       { },
> -};
> -MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> -
> -static const struct acpi_device_id axp20x_acpi_match[] =3D {
> -       {
> -               .id =3D "INT33F4",
> -               .driver_data =3D AXP288_ID,
> -       },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(acpi, axp20x_acpi_match);
> -
>  static const struct regmap_irq_chip axp152_regmap_irq_chip =3D {
>         .name                   =3D "axp152_irq_chip",
>         .status_base            =3D AXP152_IRQ1_STATE,
> @@ -606,27 +578,8 @@ static void axp20x_power_off(void)
>                      AXP20X_OFF);
>  }
>
> -static int axp20x_match_device(struct axp20x_dev *axp20x, struct dev=
ice *dev)
> +int axp20x_match_device(struct axp20x_dev *axp20x, struct device *de=
v)
>  {
> -       const struct acpi_device_id *acpi_id;
> -       const struct of_device_id *of_id;
> -
> -       if (dev->of_node) {
> -               of_id =3D of_match_device(axp20x_of_match, dev);
> -               if (!of_id) {
> -                       dev_err(dev, "Unable to match OF ID\n");
> -                       return -ENODEV;
> -               }
> -               axp20x->variant =3D (long) of_id->data;
> -       } else {
> -               acpi_id =3D acpi_match_device(dev->driver->acpi_match=
_table, dev);
> -               if (!acpi_id || !acpi_id->driver_data) {
> -                       dev_err(dev, "Unable to match ACPI ID and dat=
a\n");
> -                       return -ENODEV;
> -               }
> -               axp20x->variant =3D (long) acpi_id->driver_data;
> -       }
> -
>         switch (axp20x->variant) {
>         case AXP152_ID:
>                 axp20x->nr_cells =3D ARRAY_SIZE(axp152_cells);
> @@ -662,38 +615,18 @@ static int axp20x_match_device(struct axp20x_de=
v *axp20x, struct device *dev)
>
>         return 0;
>  }
> +EXPORT_SYMBOL(axp20x_match_device);
>
> -static int axp20x_i2c_probe(struct i2c_client *i2c,
> -                        const struct i2c_device_id *id)
> +int axp20x_device_probe(struct axp20x_dev *axp20x)
>  {
> -       struct axp20x_dev *axp20x;
>         int ret;
>
> -       axp20x =3D devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNE=
L);
> -       if (!axp20x)
> -               return -ENOMEM;
> -
> -       ret =3D axp20x_match_device(axp20x, &i2c->dev);
> -       if (ret)
> -               return ret;
> -
> -       axp20x->i2c_client =3D i2c;
> -       axp20x->dev =3D &i2c->dev;
> -       dev_set_drvdata(axp20x->dev, axp20x);
> -
> -       axp20x->regmap =3D devm_regmap_init_i2c(i2c, axp20x->regmap_c=
fg);
> -       if (IS_ERR(axp20x->regmap)) {
> -               ret =3D PTR_ERR(axp20x->regmap);
> -               dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
> -               return ret;
> -       }
> -
> -       ret =3D regmap_add_irq_chip(axp20x->regmap, i2c->irq,
> +       ret =3D regmap_add_irq_chip(axp20x->regmap, axp20x->irq,
>                                   IRQF_ONESHOT | IRQF_SHARED, -1,
>                                   axp20x->regmap_irq_chip,
>                                   &axp20x->regmap_irqc);
>         if (ret) {
> -               dev_err(&i2c->dev, "failed to add irq chip: %d\n", re=
t);
> +               dev_err(axp20x->dev, "failed to add irq chip: %d\n", =
ret);
>                 return ret;
>         }
>
> @@ -701,8 +634,8 @@ static int axp20x_i2c_probe(struct i2c_client *i2=
c,
>                         axp20x->nr_cells, NULL, 0, NULL);
>
>         if (ret) {
> -               dev_err(&i2c->dev, "failed to add MFD devices: %d\n",=
 ret);
> -               regmap_del_irq_chip(i2c->irq, axp20x->regmap_irqc);
> +               dev_err(axp20x->dev, "failed to add MFD devices: %d\n=
", ret);
> +               regmap_del_irq_chip(axp20x->irq, axp20x->regmap_irqc)=
;
>                 return ret;
>         }
>
> @@ -711,38 +644,25 @@ static int axp20x_i2c_probe(struct i2c_client *=
i2c,
>                 pm_power_off =3D axp20x_power_off;
>         }
>
> -       dev_info(&i2c->dev, "AXP20X driver loaded\n");
> +       dev_info(axp20x->dev, "AXP20X driver loaded\n");
>
>         return 0;
>  }
> +EXPORT_SYMBOL(axp20x_device_probe);
>
> -static int axp20x_i2c_remove(struct i2c_client *i2c)
> +int axp20x_device_remove(struct axp20x_dev *axp20x)
>  {
> -       struct axp20x_dev *axp20x =3D i2c_get_clientdata(i2c);
> -
>         if (axp20x =3D=3D axp20x_pm_power_off) {
>                 axp20x_pm_power_off =3D NULL;
>                 pm_power_off =3D NULL;
>         }
>
>         mfd_remove_devices(axp20x->dev);
> -       regmap_del_irq_chip(axp20x->i2c_client->irq, axp20x->regmap_i=
rqc);
> +       regmap_del_irq_chip(axp20x->irq, axp20x->regmap_irqc);
>
>         return 0;
>  }
> -
> -static struct i2c_driver axp20x_i2c_driver =3D {
> -       .driver =3D {
> -               .name   =3D "axp20x",
> -               .of_match_table =3D of_match_ptr(axp20x_of_match),
> -               .acpi_match_table =3D ACPI_PTR(axp20x_acpi_match),
> -       },
> -       .probe          =3D axp20x_i2c_probe,
> -       .remove         =3D axp20x_i2c_remove,
> -       .id_table       =3D axp20x_i2c_id,
> -};
> -
> -module_i2c_driver(axp20x_i2c_driver);
> +EXPORT_SYMBOL(axp20x_device_remove);
>
>  MODULE_DESCRIPTION("PMIC MFD core driver for AXP20X");
>  MODULE_AUTHOR("Carlo Caione <carlo@caione.org>");
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index b24c771cebd5..908f97f6e2d7 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -396,7 +396,7 @@ enum axp288_irqs {
>
>  struct axp20x_dev {
>         struct device                   *dev;
> -       struct i2c_client               *i2c_client;
> +       int                             irq;
>         struct regmap                   *regmap;
>         struct regmap_irq_chip_data     *regmap_irqc;
>         long                            variant;
> @@ -462,4 +462,35 @@ static inline int axp20x_read_variable_width(str=
uct regmap *regmap,
>         return result;
>  }
>
> +/**
> + * axp20x_match_device(): Setup axp20x variant related fields
> + *
> + * @axp20x: axp20x device to setup (.variant field must be set)
> + * @dev: device associated with this axp20x device
> + *
> + * This lets the axp20x core configure the mfd cells and register ma=
ps
> + * for later use.
> + */
> +int axp20x_match_device(struct axp20x_dev *axp20x, struct device *de=
v);
> +
> +/**
> + * axp20x_device_probe(): Probe a configured axp20x device
> + *
> + * @axp20x: axp20x device to probe (must be configured)
> + *
> + * This function lets the axp20x core register the axp20x mfd device=
s
> + * and irqchip. The axp20x device passed in must be fully configured
> + * with axp20x_match_device, its irq set, and regmap created.
> + */
> +int axp20x_device_probe(struct axp20x_dev *axp20x);
> +
> +/**
> + * axp20x_device_probe(): Remove a axp20x device
> + *
> + * @axp20x: axp20x device to remove
> + *
> + * This tells the axp20x core to remove the associated mfd devices
> + */
> +int axp20x_device_remove(struct axp20x_dev *axp20x);
> +
>  #endif /* __LINUX_MFD_AXP20X_H */
> --
> 2.6.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



--=20
With Best Regards,
Andy Shevchenko
