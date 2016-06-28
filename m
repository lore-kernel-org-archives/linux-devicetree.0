From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/5] mfd: add Ricoh RN5T567 PMIC support
Date: Tue, 28 Jun 2016 13:00:17 +0100
Message-ID: <20160628120017.GD24982@dell>
References: <20160628062757.24490-1-stefan@agner.ch>
 <20160628062757.24490-3-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160628062757.24490-3-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org, b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 27 Jun 2016, Stefan Agner wrote:

> The Ricoh RN5T567 is from the same family as the Ricoh RN5T618 is,
> the differences are:
>=20
> + DCDC4
> + Slightly different output voltage/currents
> + 32kHz Output
> - ADC/Charger capabilities
>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/rn5t618.txt | 19 +++++++++----=
----
>  drivers/mfd/Kconfig                               |  7 ++++---
>  drivers/mfd/rn5t618.c                             | 25 +++++++++++++=
+++-------
>  include/linux/mfd/rn5t618.h                       | 12 +++++++++++
>  4 files changed, 45 insertions(+), 18 deletions(-)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/mfd/rn5t618.txt b/Docu=
mentation/devicetree/bindings/mfd/rn5t618.txt
> index 937785a..9e6770b 100644
> --- a/Documentation/devicetree/bindings/mfd/rn5t618.txt
> +++ b/Documentation/devicetree/bindings/mfd/rn5t618.txt
> @@ -1,18 +1,21 @@
> -* Ricoh RN5T618 PMIC
> +* Ricoh RN5T567/RN5T618 PMIC
> =20
> -Ricoh RN5T618 is a power management IC which integrates 3 step-down
> -DCDC converters, 7 low-dropout regulators, a Li-ion battery charger,
> -fuel gauge, ADC, GPIOs and a watchdog timer. It can be controlled
> -through a I2C interface.
> +Ricoh RN5T567/RN5T618 is a power management IC family which integrat=
es
> +3 to 4 step-down DCDC converters, 7 low-dropout regulators, GPIOs an=
d
> +a watchdog timer. The RN5T618 provides additionally a Li-ion battery
> +charger, fuel gauge and an ADC. It can be controlled through an I2C
> +interface.
> =20
>  Required properties:
> - - compatible: should be "ricoh,rn5t618"
> + - compatible: must be one of
> +		"ricoh,rn5t567"
> +		"ricoh,rn5t618"
>   - reg: the I2C slave address of the device
> =20
>  Sub-nodes:
>   - regulators: the node is required if the regulator functionality i=
s
> -   needed. The valid regulator names are: DCDC1, DCDC2, DCDC3, LDO1,
> -   LDO2, LDO3, LDO4, LDO5, LDORTC1 and LDORTC2.
> +   needed. The valid regulator names are: DCDC1, DCDC2, DCDC3, DCDC4
> +   (RN5T567), LDO1, LDO2, LDO3, LDO4, LDO5, LDORTC1 and LDORTC2.
>     The common bindings for each individual regulator can be found in=
:
>     Documentation/devicetree/bindings/regulator/regulator.txt
> =20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 1bcf601..ff031a7 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -852,13 +852,14 @@ config MFD_RK808
>  	  including interrupts, RTC, LDO & DCDC regulators, and onkey.
> =20
>  config MFD_RN5T618
> -	tristate "Ricoh RN5T5618 PMIC"
> +	tristate "Ricoh RN5T567/618 PMIC"
>  	depends on I2C
> +	depends on OF
>  	select MFD_CORE
>  	select REGMAP_I2C
>  	help
> -	  Say yes here to add support for the Ricoh RN5T618 PMIC. This
> -	  driver provides common support for accessing the device,
> +	  Say yes here to add support for the Ricoh RN5T567 or R5T618 PMIC.
> +	  This driver provides common support for accessing the device,
>  	  additional drivers must be enabled in order to use the
>  	  functionality of the device.
> =20
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index 0ad51d7..c86160d 100644
> --- a/drivers/mfd/rn5t618.c
> +++ b/drivers/mfd/rn5t618.c
> @@ -2,6 +2,7 @@
>   * MFD core driver for Ricoh RN5T618 PMIC
>   *
>   * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
> + * Copyright (C) 2016 Toradex AG
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License
> @@ -15,6 +16,7 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/rn5t618.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/regmap.h>
> =20
>  static const struct mfd_cell rn5t618_cells[] =3D {
> @@ -59,17 +61,32 @@ static void rn5t618_power_off(void)
>  			   RN5T618_SLPCNT_SWPWROFF, RN5T618_SLPCNT_SWPWROFF);
>  }
> =20
> +static const struct of_device_id rn5t618_of_match[] =3D {
> +	{ .compatible =3D "ricoh,rn5t567", .data =3D (void *)RN5T567 },
> +	{ .compatible =3D "ricoh,rn5t618", .data =3D (void *)RN5T618 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rn5t618_of_match);
> +
>  static int rn5t618_i2c_probe(struct i2c_client *i2c,
>  			     const struct i2c_device_id *id)
>  {
> +	const struct of_device_id *of_id;
>  	struct rn5t618 *priv;
>  	int ret;
> =20
> +	of_id =3D of_match_device(rn5t618_of_match, &i2c->dev);
> +	if (!of_id) {
> +		dev_err(&i2c->dev, "Failed to find matching DT ID\n");
> +		return -EINVAL;
> +	}
> +
>  	priv =3D devm_kzalloc(&i2c->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> =20
>  	i2c_set_clientdata(i2c, priv);
> +	priv->variant =3D (long)of_id->data;
> =20
>  	priv->regmap =3D devm_regmap_init_i2c(i2c, &rn5t618_regmap_config);
>  	if (IS_ERR(priv->regmap)) {
> @@ -105,12 +122,6 @@ static int rn5t618_i2c_remove(struct i2c_client =
*i2c)
>  	return 0;
>  }
> =20
> -static const struct of_device_id rn5t618_of_match[] =3D {
> -	{ .compatible =3D "ricoh,rn5t618" },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, rn5t618_of_match);
> -
>  static const struct i2c_device_id rn5t618_i2c_id[] =3D {
>  	{ }
>  };
> @@ -129,5 +140,5 @@ static struct i2c_driver rn5t618_i2c_driver =3D {
>  module_i2c_driver(rn5t618_i2c_driver);
> =20
>  MODULE_AUTHOR("Beniamino Galvani <b.galvani@gmail.com>");
> -MODULE_DESCRIPTION("Ricoh RN5T618 MFD driver");
> +MODULE_DESCRIPTION("Ricoh RN5T567/618 MFD driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t618.=
h
> index c72d534..54179c2 100644
> --- a/include/linux/mfd/rn5t618.h
> +++ b/include/linux/mfd/rn5t618.h
> @@ -20,6 +20,7 @@
>  #define RN5T618_OTPVER			0x01
>  #define RN5T618_IODAC			0x02
>  #define RN5T618_VINDAC			0x03
> +#define RN5T618_OUT32KEN		0x05
>  #define RN5T618_CPUCNT			0x06
>  #define RN5T618_PSWR			0x07
>  #define RN5T618_PONHIS			0x09
> @@ -38,6 +39,7 @@
>  #define RN5T618_DC1_SLOT		0x16
>  #define RN5T618_DC2_SLOT		0x17
>  #define RN5T618_DC3_SLOT		0x18
> +#define RN5T618_DC4_SLOT		0x19
>  #define RN5T618_LDO1_SLOT		0x1b
>  #define RN5T618_LDO2_SLOT		0x1c
>  #define RN5T618_LDO3_SLOT		0x1d
> @@ -54,12 +56,16 @@
>  #define RN5T618_DC2CTL2			0x2f
>  #define RN5T618_DC3CTL			0x30
>  #define RN5T618_DC3CTL2			0x31
> +#define RN5T618_DC4CTL			0x32
> +#define RN5T618_DC4CTL2			0x33
>  #define RN5T618_DC1DAC			0x36
>  #define RN5T618_DC2DAC			0x37
>  #define RN5T618_DC3DAC			0x38
> +#define RN5T618_DC4DAC			0x39
>  #define RN5T618_DC1DAC_SLP		0x3b
>  #define RN5T618_DC2DAC_SLP		0x3c
>  #define RN5T618_DC3DAC_SLP		0x3d
> +#define RN5T618_DC4DAC_SLP		0x3e
>  #define RN5T618_DCIREN			0x40
>  #define RN5T618_DCIRQ			0x41
>  #define RN5T618_DCIRMON			0x42
> @@ -221,8 +227,14 @@ enum {
>  	RN5T618_REG_NUM,
>  };
> =20
> +enum {
> +	RN5T567 =3D 0,
> +	RN5T618,
> +};
> +
>  struct rn5t618 {
>  	struct regmap *regmap;
> +	long variant;
>  };
> =20
>  #endif /* __LINUX_MFD_RN5T618_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
