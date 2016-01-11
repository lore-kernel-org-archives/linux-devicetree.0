From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/9] mfd: axp20x: Remove second struct
 device * parameter for axp20x_match_device()
Date: Mon, 11 Jan 2016 09:25:13 +0000
Message-ID: <20160111092513.GK14104@x1>
References: <1450283538-25067-1-git-send-email-wens@csie.org>
 <1450283538-25067-3-git-send-email-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBB7HJZW2AKGQE2W5ZOAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450283538-25067-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-9oqZluOz41k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 17 Dec 2015, Chen-Yu Tsai wrote:

> The first argument passed to axp20x_match_device(), struct axp20x_dev *,
> already contains a pointer to the device. By rearranging some code,
> moving the assignment of the pointer before axp20x_match_device() is
> called, we can eliminate the second parameter.
>=20
> Suggested-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/mfd/axp20x.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 9842199e2e6c..685a78614f83 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -606,8 +606,9 @@ static void axp20x_power_off(void)
>  		     AXP20X_OFF);
>  }
> =20
> -static int axp20x_match_device(struct axp20x_dev *axp20x, struct device =
*dev)
> +static int axp20x_match_device(struct axp20x_dev *axp20x)
>  {
> +	struct device *dev =3D axp20x->dev;
>  	const struct acpi_device_id *acpi_id;
>  	const struct of_device_id *of_id;
> =20
> @@ -673,14 +674,14 @@ static int axp20x_i2c_probe(struct i2c_client *i2c,
>  	if (!axp20x)
>  		return -ENOMEM;
> =20
> -	ret =3D axp20x_match_device(axp20x, &i2c->dev);
> -	if (ret)
> -		return ret;
> -
>  	axp20x->i2c_client =3D i2c;
>  	axp20x->dev =3D &i2c->dev;
>  	dev_set_drvdata(axp20x->dev, axp20x);
> =20
> +	ret =3D axp20x_match_device(axp20x);
> +	if (ret)
> +		return ret;
> +
>  	axp20x->regmap =3D devm_regmap_init_i2c(i2c, axp20x->regmap_cfg);
>  	if (IS_ERR(axp20x->regmap)) {
>  		ret =3D PTR_ERR(axp20x->regmap);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
