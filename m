From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (ltc4151) Make shunt-resistor configurable
Date: Sun, 24 Jul 2016 22:19:00 -0700
Message-ID: <5795A144.2020300@roeck-us.net>
References: <20160724202620.GA30245@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <20160724202620.GA30245@makrotopia.org>
Sender: linux-hwmon-owner@vger.kernel.org
To: Daniel Golle <daniel@makrotopia.org>, linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org, Axel Lin <axel.lin@ingics.com>, =?UTF-8?Q?Per_Dal=c3=a9n?= <per.dalen@appeartv.com>
List-Id: devicetree@vger.kernel.org

On 07/24/2016 01:26 PM, Daniel Golle wrote:
> Allow to specify the resistance of the attached shunt via DT by
> adding the shunt-resistor property. Fall-back to the previous
> default (1 mOhm) if unset.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/hwmon/ltc4151.c | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
> index c86a184..f856e44 100644
> --- a/drivers/hwmon/ltc4151.c
> +++ b/drivers/hwmon/ltc4151.c
> @@ -30,6 +30,8 @@
>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

I don't immediately see why this include file would be necessary.

>   #include <linux/init.h>
>   #include <linux/err.h>
>   #include <linux/slab.h>
> @@ -52,6 +54,7 @@ struct ltc4151_data {
>   	struct mutex update_lock;
>   	bool valid;
>   	unsigned long last_updated; /* in jiffies */
> +	unsigned int shunt; /* in micro ohms */
>
>   	/* Registers */
>   	u8 regs[6];
> @@ -111,9 +114,9 @@ static int ltc4151_get_value(struct ltc4151_data =
*data, u8 reg)
>   	case LTC4151_SENSE_H:
>   		/*
>   		 * 20uV resolution. Convert to current as measured with
> -		 * an 1 mOhm sense resistor, in mA.
> +		 * a given sense resistor, in mA.
>   		 */
> -		val =3D val * 20;
> +		val =3D val * 20 * 1000 / data->shunt;
>   		break;
>   	case LTC4151_VIN_H:
>   		/* 25 mV per increment */
> @@ -176,6 +179,7 @@ static int ltc4151_probe(struct i2c_client *clien=
t,
>   	struct device *dev =3D &client->dev;
>   	struct ltc4151_data *data;
>   	struct device *hwmon_dev;
> +	u32 shunt;
>
>   	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
>   		return -ENODEV;
> @@ -184,6 +188,14 @@ static int ltc4151_probe(struct i2c_client *clie=
nt,
>   	if (!data)
>   		return -ENOMEM;
>
> +#ifdef CONFIG_OF

#ifdef is unnecessary. Worse, it results in

drivers/hwmon/ltc4151.c: In function =91ltc4151_probe=92:
drivers/hwmon/ltc4151.c:182:6: warning: unused variable =91shunt=92

if CONFIG_OF is not defined.

> +	if (!of_property_read_u32(client->dev.of_node, "shunt-resistor", &s=
hunt)
> +		&& shunt > 0 )

checkpatch error

> +		data->shunt =3D shunt;

shunt =3D=3D 0 is silently accepted and replaced with 1000. This is qui=
te unusual.
Any reason ? If not, return -EINVAL might be more appropriate for shunt=
 =3D=3D 0.

> +	else
> +#endif
> +		data->shunt =3D 1000; /* 1 mOhm if not set */
> +
>   	data->client =3D client;
>   	mutex_init(&data->update_lock);
>
> @@ -199,10 +211,20 @@ static const struct i2c_device_id ltc4151_id[] =
=3D {
>   };
>   MODULE_DEVICE_TABLE(i2c, ltc4151_id);
>
> +#ifdef CONFIG_OF

#ifdef is unnecessary.

> +static const struct of_device_id ltc4151_match[] =3D {
> +	{ .compatible =3D "lltc,ltc4151" },

This as well as the property need to be documented.

> +	{},
> +};
> +#endif
> +
>   /* This is the driver that will be inserted */
>   static struct i2c_driver ltc4151_driver =3D {
> +	.class		=3D I2C_CLASS_HWMON,

This is an unrelated change, and appears to be quite pointless,
since the driver does not have a detect function.
Any reason for adding it ? If so, please explain, and submit
as separate patch.

>   	.driver =3D {
>   		.name	=3D "ltc4151",
> +		.owner  =3D THIS_MODULE,

Is this now necessary again ? If so, please explain, and submit
as separate patch.

> +		.of_match_table =3D of_match_ptr(ltc4151_match),
>   	},
>   	.probe		=3D ltc4151_probe,
>   	.id_table	=3D ltc4151_id,
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
