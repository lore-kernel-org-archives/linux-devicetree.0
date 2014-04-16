From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd: bcm590xx: add support for second i2c slave
 address space
Date: Wed, 16 Apr 2014 12:06:03 +0100
Message-ID: <20140416110603.GA19671@lee--X1>
References: <1397501428-8857-1-git-send-email-mporter@linaro.org>
 <1397501428-8857-3-git-send-email-mporter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397501428-8857-3-git-send-email-mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Apr 2014, Matt Porter wrote:

> BCM590xx utilizes a second i2c slave address to access additional

s/i2c/I2C

> register space. Add support for the second address space by
> instantiated a dummy i2c device with the appropriate secondary

s/instantiated/instantiating

> i2c slave address. Expose a second regmap register space so that

s/i2c/I2C

Exposing?

s/regmap/Regmap

> mfd drivers can access this secondary i2c slave address space.

s/mfd/MFD

s/i2c/I2C

> Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/bcm590xx.c       | 60 +++++++++++++++++++++++++++++++++-=
----------
>  include/linux/mfd/bcm590xx.h |  9 ++++---
>  2 files changed, 52 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> index e9a33c7..b710ffa 100644
> --- a/drivers/mfd/bcm590xx.c
> +++ b/drivers/mfd/bcm590xx.c
> @@ -28,39 +28,71 @@ static const struct mfd_cell bcm590xx_devs[] =3D =
{
>  	},
>  };
> =20
> -static const struct regmap_config bcm590xx_regmap_config =3D {
> +static const struct regmap_config bcm590xx_regmap_config_0 =3D {

Not loving _0 and _1 appendages.

Is one of them {primary|master} and the other {secondary|slave}?

>  	.reg_bits	=3D 8,
>  	.val_bits	=3D 8,
> -	.max_register	=3D BCM590XX_MAX_REGISTER,
> +	.max_register	=3D BCM590XX_MAX_REGISTER_0,
>  	.cache_type	=3D REGCACHE_RBTREE,
>  };
> =20
> -static int bcm590xx_i2c_probe(struct i2c_client *i2c,
> +static const struct regmap_config bcm590xx_regmap_config_1 =3D {
> +	.reg_bits	=3D 8,
> +	.val_bits	=3D 8,
> +	.max_register	=3D BCM590XX_MAX_REGISTER_1,
> +	.cache_type	=3D REGCACHE_RBTREE,
> +};
> +
> +static int bcm590xx_i2c_probe(struct i2c_client *addmap0,

Would this be best left as i2c, then naming the other one
i2c_secondary for instance?

addmap{0,1} doesn't quite sit right with me.

REVISIT: Ah, it's address-map, rather than add map. Okay, not as bad
as I first thought, but still, is there a better naming convention you
could use?

>  			      const struct i2c_device_id *id)
>  {
>  	struct bcm590xx *bcm590xx;
>  	int ret;
> =20
> -	bcm590xx =3D devm_kzalloc(&i2c->dev, sizeof(*bcm590xx), GFP_KERNEL)=
;
> +	bcm590xx =3D devm_kzalloc(&addmap0->dev, sizeof(*bcm590xx), GFP_KER=
NEL);
>  	if (!bcm590xx)
>  		return -ENOMEM;
> =20
> -	i2c_set_clientdata(i2c, bcm590xx);
> -	bcm590xx->dev =3D &i2c->dev;
> -	bcm590xx->i2c_client =3D i2c;
> +	i2c_set_clientdata(addmap0, bcm590xx);
> +	bcm590xx->dev =3D &addmap0->dev;
> +	bcm590xx->addmap0 =3D addmap0;
> =20
> -	bcm590xx->regmap =3D devm_regmap_init_i2c(i2c, &bcm590xx_regmap_con=
fig);
> -	if (IS_ERR(bcm590xx->regmap)) {
> -		ret =3D PTR_ERR(bcm590xx->regmap);
> -		dev_err(&i2c->dev, "regmap initialization failed: %d\n", ret);
> +	bcm590xx->regmap0 =3D devm_regmap_init_i2c(addmap0,
> +						 &bcm590xx_regmap_config_0);
> +	if (IS_ERR(bcm590xx->regmap0)) {
> +		ret =3D PTR_ERR(bcm590xx->regmap0);
> +		dev_err(&addmap0->dev, "regmap 0 init failed: %d\n", ret);
>  		return ret;
>  	}
> =20
> -	ret =3D mfd_add_devices(&i2c->dev, -1, bcm590xx_devs,
> +	/* Second I2C slave address is the base address with A(2) asserted =
*/
> +	bcm590xx->addmap1 =3D i2c_new_dummy(addmap0->adapter,
> +					  addmap0->addr | BIT(2));
> +	if (IS_ERR_OR_NULL(bcm590xx->addmap1)) {
> +		dev_err(&addmap0->dev, "failed to add address map 1 device\n");
> +		return -ENODEV;
> +	}
> +	i2c_set_clientdata(bcm590xx->addmap1, bcm590xx);
> +
> +	bcm590xx->regmap1 =3D devm_regmap_init_i2c(bcm590xx->addmap1,
> +						&bcm590xx_regmap_config_1);
> +	if (IS_ERR(bcm590xx->regmap1)) {
> +		ret =3D PTR_ERR(bcm590xx->regmap1);
> +		dev_err(&bcm590xx->addmap1->dev,
> +			"regmap 1 init failed: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret =3D mfd_add_devices(&addmap0->dev, -1, bcm590xx_devs,
>  			      ARRAY_SIZE(bcm590xx_devs), NULL, 0, NULL);
> -	if (ret < 0)
> -		dev_err(&i2c->dev, "failed to add sub-devices: %d\n", ret);
> +	if (ret < 0) {
> +		dev_err(&addmap0->dev, "failed to add sub-devices: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> =20
> +err:
> +	i2c_unregister_device(bcm590xx->addmap1);
>  	return ret;
>  }
> =20
> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590x=
x.h
> index 434df2d..a2723f2 100644
> --- a/include/linux/mfd/bcm590xx.h
> +++ b/include/linux/mfd/bcm590xx.h
> @@ -19,12 +19,15 @@
>  #include <linux/regmap.h>
> =20
>  /* max register address */
> -#define BCM590XX_MAX_REGISTER	0xe7
> +#define BCM590XX_MAX_REGISTER_0	0xe7
> +#define BCM590XX_MAX_REGISTER_1	0xf0
> =20
>  struct bcm590xx {
>  	struct device *dev;
> -	struct i2c_client *i2c_client;
> -	struct regmap *regmap;
> +	struct i2c_client *addmap0;
> +	struct i2c_client *addmap1;
> +	struct regmap *regmap0;
> +	struct regmap *regmap1;
>  	unsigned int id;
>  };
> =20

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
