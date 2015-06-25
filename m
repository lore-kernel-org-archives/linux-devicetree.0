From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v4 2/3] mfd: 88pm800: Set default interrupt clear method
Date: Thu, 25 Jun 2015 11:26:18 +0100
Message-ID: <20150625102618.GC15013@x1>
References: <1435217189-19578-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435217189-19578-3-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1435217189-19578-3-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 25 Jun 2015, Vaibhav Hiremath wrote:

> As per the spec, bit 1 (INT_CLEAR_MODE) of reg addr 0xe
> (page 0) controls the method of clearing interrupt
> status of 88pm800 family of devices;
>=20
>   0: clear on read
>   1: clear on write
>=20
> If pdata is not coming from board file, then set the
> default irq clear method to "irq clear on write"
>=20
> Also, as suggested by "Lee Jones" renaming variable field
> to appropriate name.
>=20
> Signed-off-by: Zhao Ye <zhaoy-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/88pm800.c       | 15 ++++++++++-----
>  include/linux/mfd/88pm80x.h |  6 ++++--
>  2 files changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index 40fd014..e0cd7ad 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -376,7 +376,7 @@ static int device_irq_init_800(struct pm80x_chip =
*chip)
>  {
>  	struct regmap *map =3D chip->regmap;
>  	unsigned long flags =3D IRQF_ONESHOT;
> -	int data, mask, ret =3D -EINVAL;
> +	int irq_clr_mode, mask, ret =3D -EINVAL;
> =20
>  	if (!map || !chip->irq) {
>  		dev_err(chip->dev, "incorrect parameters\n");
> @@ -384,15 +384,16 @@ static int device_irq_init_800(struct pm80x_chi=
p *chip)
>  	}
> =20
>  	/*
> -	 * irq_mode defines the way of clearing interrupt. it's read-clear =
by
> -	 * default.
> +	 * irq_clr_on_wr defines the way of clearing interrupt by
> +	 * read/write(0/1).  It's read-clear by default.
>  	 */
>  	mask =3D
>  	    PM800_WAKEUP2_INV_INT | PM800_WAKEUP2_INT_CLEAR |
>  	    PM800_WAKEUP2_INT_MASK;
> =20
> -	data =3D PM800_WAKEUP2_INT_CLEAR;
> -	ret =3D regmap_update_bits(map, PM800_WAKEUP2, mask, data);
> +	irq_clr_mode =3D (chip->irq_clr_on_wr) ?

Drop the brackets.

> +		PM800_WAKEUP2_INT_WRITE_CLEAR : PM800_WAKEUP2_INT_READ_CLEAR;
> +	ret =3D regmap_update_bits(map, PM800_WAKEUP2, mask, irq_clr_mode);
> =20
>  	if (ret < 0)
>  		goto out;
> @@ -514,6 +515,7 @@ static int device_800_init(struct pm80x_chip *chi=
p,
>  	}
> =20
>  	chip->regmap_irq_chip =3D &pm800_irq_chip;
> +	chip->irq_clr_on_wr =3D pdata->irq_clr_on_wr;

You have protection around pdata everywhere else in the file, I
suggest you supply some here too.

>  	ret =3D device_irq_init_800(chip);
>  	if (ret < 0) {
> @@ -566,6 +568,9 @@ static int pm800_probe(struct i2c_client *client,
>  		pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>  		if (!pdata)
>  			return -ENOMEM;
> +
> +		/* by default, set irq clear method on write */
> +		pdata->irq_clr_on_wr =3D true;

You can save yourself some memory here, by removing this seemingly
pointless allocation and do this above:

        chip->irq_clr_on_wr =3D pdata ? pdata->irq_clr_on_wr : true;

>  	}
> =20
>  	ret =3D pm80x_init(client);
> diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.=
h
> index 97cb283..94b3dcd 100644
> --- a/include/linux/mfd/88pm80x.h
> +++ b/include/linux/mfd/88pm80x.h
> @@ -77,6 +77,8 @@ enum {
>  #define PM800_WAKEUP2		(0x0E)
>  #define PM800_WAKEUP2_INV_INT		(1 << 0)
>  #define PM800_WAKEUP2_INT_CLEAR		(1 << 1)
> +#define PM800_WAKEUP2_INT_READ_CLEAR		(0 << 1)
> +#define PM800_WAKEUP2_INT_WRITE_CLEAR		(1 << 1)
>  #define PM800_WAKEUP2_INT_MASK		(1 << 2)

Use the BIT() macro.

>  #define PM800_POWER_UP_LOG	(0x10)
> @@ -300,7 +302,7 @@ struct pm80x_chip {
>  	struct regmap_irq_chip_data *irq_data;
>  	int type;
>  	int irq;
> -	int irq_mode;
> +	int irq_clr_on_wr;	/* '1': Clear on write, '0': Clear on read*/

Whitespace issue.

Shouldn't this be a bool?

Actually even better, I would define; CLR_ON_WRITE and CLR_ON_READ,
and call the variable irq_clear_method, or something.

Much clearer that way I think.

>  	unsigned long wu_flag;
>  	spinlock_t lock;
>  };
> @@ -315,7 +317,7 @@ struct pm80x_platform_data {
>  	 */
>  	struct regulator_init_data *regulators[PM800_ID_RG_MAX];
>  	unsigned int num_regulators;
> -	int irq_mode;		/* Clear interrupt by read/write(0/1) */
> +	int irq_clr_on_wr;		/* Clear interrupt by read/write(0/1) */
>  	int batt_det;		/* enable/disable */
>  	int (*plat_config)(struct pm80x_chip *chip,
>  				struct pm80x_platform_data *pdata);

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
