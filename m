From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd: 88pm800: add device tree support
Date: Mon, 1 Jun 2015 09:38:35 +0100
Message-ID: <20150601083835.GE3329@x1>
References: <1432937962-4537-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1432937962-4537-2-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432937962-4537-2-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 30 May 2015, Vaibhav Hiremath wrote:

> Add DT support to the 88pm800 driver along with below properties
> 	- marvell,88pm800-irq-write-clear :
> 	  Idicates whether interrupt status is cleared by write
>=20
> Also, creates the DT binding text file,
> Documentation/devicetree/bindings/mfd/88pm800.txt
>=20
> Signed-off-by: Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/88pm800.txt | 57 +++++++++++++=
++++++++++
>  drivers/mfd/88pm800.c                             | 39 +++++++++++++=
+++

These should be submitted separately.

>  2 files changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/88pm800.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Docu=
mentation/devicetree/bindings/mfd/88pm800.txt
> new file mode 100644
> index 0000000..094951b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
> @@ -0,0 +1,57 @@
> +* Marvell 88PM800 Power Management IC
> +
> +Required parent device properties:
> +- compatible : "marvell,88pm800"
> +- reg : the I2C slave address for the 88pm800 chip
> +- interrupts : IRQ line for the 88pm800 chip
> +- interrupt-controller: describes the 88pm800 as an interrupt contro=
ller
> +- #interrupt-cells : should be 1.
> +		- The cell is the 88pm800 local IRQ number
> +
> +Optional parent device properties:
> +- marvell,88pm800-irq-write-clr: indicates whether interrupt status =
is cleared by write

Drop the device name.  These bindings should be as generic as possible.

Also describe what the absence of the property means.

> +88pm800 consists of a large and varied group of sub-devices:

3?

> +Device			 Supply Names	 Description
> +------			 ------------	 -----------
> +88pm80x-onkey		:		: On key
> +88pm80x-rtc		:		: RTC
> +88pm80x			:		: Regulators

Surely regulators is 88pm80x-regulator, no?

> +Note: More device list will follow
> +
> +Example:
> +
> +	pmic: 88pm800@30 {
> +		compatible =3D "marvell,88pm800";
> +		reg =3D <0x30>;
> +		interrupts =3D <0 77 0x4>;

Please use the #defines in include/dt-bindings/

> +		interrupt-parent =3D <&gic>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +
> +		marvell,88pm800-irq-write-clr;
> +
> +		regulators {
> +			compatible =3D "marvell,88pm80x-regulator";
> +
> +			buck1a: BUCK1A {
> +				regulator-compatible =3D "88PM800-BUCK1A";
> +				regulator-min-microvolt =3D <600000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +			ldo1: LDO1 {
> +				regulator-compatible =3D "88PM800-LDO1";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};

'\n' here.

> +		rtc {
> +			compatible =3D "marvell,88pm80x-rtc";
> +		};
> +	};
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index 841717a..06ee058 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -27,6 +27,7 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/88pm80x.h>
>  #include <linux/slab.h>
> +#include <linux/of_device.h>
> =20
>  /* Interrupt Registers */
>  #define PM800_INT_STATUS1		(0x05)
> @@ -121,6 +122,11 @@ static const struct i2c_device_id pm80x_id_table=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
> =20
> +static const struct of_device_id pm80x_of_match_table[] =3D {
> +	{ .compatible =3D "marvell,88pm800", },
> +	{},
> +};
> +
>  static struct resource rtc_resources[] =3D {
>  	{
>  	 .name =3D "88pm80x-rtc",
> @@ -133,6 +139,7 @@ static struct resource rtc_resources[] =3D {
>  static struct mfd_cell rtc_devs[] =3D {
>  	{
>  	 .name =3D "88pm80x-rtc",
> +	 .of_compatible =3D "marvell,88pm80x-rtc",
>  	 .num_resources =3D ARRAY_SIZE(rtc_resources),
>  	 .resources =3D &rtc_resources[0],
>  	 .id =3D -1,
> @@ -151,6 +158,7 @@ static struct resource onkey_resources[] =3D {
>  static const struct mfd_cell onkey_devs[] =3D {
>  	{
>  	 .name =3D "88pm80x-onkey",
> +	 .of_compatible =3D "marvell,88pm80x-onkey",
>  	 .num_resources =3D 1,
>  	 .resources =3D &onkey_resources[0],
>  	 .id =3D -1,
> @@ -160,6 +168,7 @@ static const struct mfd_cell onkey_devs[] =3D {
>  static const struct mfd_cell regulator_devs[] =3D {
>  	{
>  	 .name =3D "88pm80x-regulator",
> +	 .of_compatible =3D "marvell,88pm80x-regulator",
>  	 .id =3D -1,
>  	},
>  };
> @@ -538,14 +547,43 @@ out:
>  	return ret;
>  }
> =20
> +static int pm800_probe_dt(struct device_node *np,
> +			 struct device *dev,

Do you even use dev?

> +			 struct pm80x_platform_data *pdata)
> +{
> +	pdata->irq_mode =3D
> +		of_property_read_bool(np, "marvell,88pm800-irq-write-clear");

You write a new function for this?

> +	return 0;
> +}
> +
> +

Superfluous '\n'.

>  static int pm800_probe(struct i2c_client *client,
>  				 const struct i2c_device_id *id)
>  {
>  	int ret =3D 0;
>  	struct pm80x_chip *chip;
>  	struct pm80x_platform_data *pdata =3D dev_get_platdata(&client->dev=
);
> +	struct device_node *node =3D client->dev.of_node;

It's more common to use 'np'.

>  	struct pm80x_subchip *subchip;
> =20
> +	if (!pdata && !node) {
> +		dev_err(&client->dev,
> +			"pm80x requires platform data or of_node\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!pdata) {
> +		pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata) {
> +			dev_err(&client->dev, "failed to allocaate memory\n");
> +			return -ENOMEM;
> +		}
> +		ret =3D pm800_probe_dt(node, &client->dev, pdata);
> +		if (ret)
> +			return ret;
> +	}

All this for a single attribute?  Please simplify.

>  	ret =3D pm80x_init(client);
>  	if (ret) {
>  		dev_err(&client->dev, "pm800_init fail\n");
> @@ -611,6 +649,7 @@ static struct i2c_driver pm800_driver =3D {
>  		.name =3D "88PM800",
>  		.owner =3D THIS_MODULE,
>  		.pm =3D &pm80x_pm_ops,
> +		.of_match_table	=3D pm80x_of_match_table,
>  		},
>  	.probe =3D pm800_probe,
>  	.remove =3D pm800_remove,

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
