From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: da9055: Add DT support for PMIC
Date: Thu, 13 Feb 2014 11:36:43 +0000
Message-ID: <20140213113643.GM32508@lee--X1>
References: <cover.1392286537.git.Adam.Thomson.Opensource@diasemi.com>
 <e11bde69763b77a6b17b851c7d18a892d193411f.1392286537.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e11bde69763b77a6b17b851c7d18a892d193411f.1392286537.git.Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Thomson <adam.thomson-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/mfd/da9055-i2c.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mfd/da9055-i2c.c b/drivers/mfd/da9055-i2c.c
> index 8103e43..d4d4c16 100644
> --- a/drivers/mfd/da9055-i2c.c
> +++ b/drivers/mfd/da9055-i2c.c
> @@ -15,6 +15,8 @@
>  #include <linux/device.h>
>  #include <linux/i2c.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>=20
>  #include <linux/mfd/da9055/core.h>
>=20
> @@ -66,6 +68,11 @@ static struct i2c_device_id da9055_i2c_id[] =3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, da9055_i2c_id);
>=20
> +static const struct of_device_id da9055_of_match[] =3D {
> +       { .compatible =3D "dlg,da9055-pmic", },
> +       { }
> +};
> +
>  static struct i2c_driver da9055_i2c_driver =3D {
>         .probe =3D da9055_i2c_probe,
>         .remove =3D da9055_i2c_remove,
> @@ -73,6 +80,7 @@ static struct i2c_driver da9055_i2c_driver =3D {
>         .driver =3D {
>                 .name =3D "da9055-pmic",
>                 .owner =3D THIS_MODULE,
> +               .of_match_table =3D of_match_ptr(da9055_of_match),
>         },
>  };

Patch looks okay to me, but needs an Ack from the DT guys.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

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
