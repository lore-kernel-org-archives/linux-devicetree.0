From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] mfd: tc3589x: detect the precise version
Date: Wed, 16 Oct 2013 10:23:10 +0100
Message-ID: <20131016092310.GD19112@lee--X1>
References: <1381871640-22262-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381871640-22262-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 15 Oct 2013, Linus Walleij wrote:

> Instead of detecting the "tc3589x" and hard-coding the number of
> GPIO pins to 24, encode all the possible subtypes and set the
> number of GPIO pins from the type.
>=20
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/tc3589x.c | 49 +++++++++++++++++++++++++++++++++++++++++=
++++++--
>  1 file changed, 47 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
> index 70f4909f..0eabbb0 100644
> --- a/drivers/mfd/tc3589x.c
> +++ b/drivers/mfd/tc3589x.c
> @@ -16,6 +16,19 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/tc3589x.h>
> =20
> +/**
> + * enum tc3589x_version - indicates the TC3589x version
> + */
> +enum tc3589x_version {
> +	TC3589X_TC35890,
> +	TC3589X_TC35892,
> +	TC3589X_TC35893,
> +	TC3589X_TC35894,
> +	TC3589X_TC35895,
> +	TC3589X_TC35896,
> +	TC3589X_UNKNOWN,
> +};
> +
>  #define TC3589x_CLKMODE_MODCTL_SLEEP		0x0
>  #define TC3589x_CLKMODE_MODCTL_OPERATION	(1 << 0)
> =20
> @@ -361,7 +374,33 @@ static int tc3589x_probe(struct i2c_client *i2c,
>  	tc3589x->i2c =3D i2c;
>  	tc3589x->pdata =3D pdata;
>  	tc3589x->irq_base =3D pdata->irq_base;
> -	tc3589x->num_gpio =3D id->driver_data;
> +
> +	switch (id->driver_data) {
> +	case TC3589X_TC35890:
> +		tc3589x->num_gpio =3D 24;
> +		break;
> +	case TC3589X_TC35892:
> +		tc3589x->num_gpio =3D 24;
> +		break;
> +	case TC3589X_TC35893:
> +		tc3589x->num_gpio =3D 20;
> +		break;
> +	case TC3589X_TC35894:
> +		tc3589x->num_gpio =3D 24;
> +		break;
> +	case TC3589X_TC35895:
> +		tc3589x->num_gpio =3D 20;
> +		break;
> +	case TC3589X_TC35896:
> +		tc3589x->num_gpio =3D 20;
> +		break;
> +	case TC3589X_UNKNOWN:
> +		tc3589x->num_gpio =3D 24;
> +		break;
> +	default:
> +		tc3589x->num_gpio =3D 24;
> +		break;
> +	}
> =20
>  	i2c_set_clientdata(i2c, tc3589x);
> =20
> @@ -432,7 +471,13 @@ static int tc3589x_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(tc3589x_dev_pm_ops, tc3589x_suspend, tc3589=
x_resume);
> =20
>  static const struct i2c_device_id tc3589x_id[] =3D {
> -	{ "tc3589x", 24 },
> +	{ "tc35890", TC3589X_TC35890 },
> +	{ "tc35892", TC3589X_TC35892 },
> +	{ "tc35893", TC3589X_TC35893 },
> +	{ "tc35894", TC3589X_TC35894 },
> +	{ "tc35895", TC3589X_TC35895 },
> +	{ "tc35896", TC3589X_TC35896 },
> +	{ "tc3589x", TC3589X_UNKNOWN },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tc3589x_id);

This is an awful lot of code for what we're trying to achieve. I
propose two alternitives:

  1. I guess that other OSes will need to capture the same
  information, so wouldn't it be prudant to do so via a DT property?
  That way it's just a one or two liner.

Or:

  2. As we're only using .driver_data for num_gpio at this time, just
  place them in tc3589x_id as you have done for tc3589x.

Or, my least favourate alternitive, but still an improvment with
regards to saving code:

  3. Again, as all of this extra code is only used for pulling out
  num_gpio, group the devices by num_gpio:

> +	switch (id->driver_data) {
> +	case TC3589X_TC35893:
> +	case TC3589X_TC35895:
> +	case TC3589X_TC35896:
> +		tc3589x->num_gpio =3D 20;
> +		break;
> +	case TC3589X_TC35890:
> +	case TC3589X_TC35892:
> +	case TC3589X_TC35894:
> +	case TC3589X_UNKNOWN:
> +	default:
> +		tc3589x->num_gpio =3D 24;
> +		break;
> +	}

My personal preference is 1 and 2 in equal measure.

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
