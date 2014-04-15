From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] regulator: arizona-ldo1: Move setup processing from
 arizona-core
Date: Tue, 15 Apr 2014 11:12:00 +0100
Message-ID: <20140415101200.GC27091@lee--X1>
References: <1396340845-24060-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1396340845-24060-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396340845-24060-3-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 01 Apr 2014, Charles Keepax wrote:

> It is more idiomatic to process things relating to the regulator in i=
ts
> driver. This patch moves both processing of device tree relating to t=
he
> regulator and checking if the regulator is external from arizona-core
> into the regulator driver.
>=20
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  drivers/mfd/arizona-core.c       |   12 +++---------
>  drivers/regulator/arizona-ldo1.c |   32 ++++++++++++++++++++++++++++=
++++
>  2 files changed, 35 insertions(+), 9 deletions(-)

[...]

> diff --git a/drivers/regulator/arizona-ldo1.c b/drivers/regulator/ari=
zona-ldo1.c
> index b1033d3..211af83 100644
> --- a/drivers/regulator/arizona-ldo1.c
> +++ b/drivers/regulator/arizona-ldo1.c
> @@ -178,6 +178,22 @@ static const struct regulator_init_data arizona_=
ldo1_default =3D {
>  	.num_consumer_supplies =3D 1,
>  };
> =20
> +#ifdef CONFIG_OF
> +static int arizona_ldo1_of_get_pdata(struct arizona *arizona)
> +{
> +	struct arizona_pdata *pdata =3D &arizona->pdata;
> +
> +	arizona_of_get_named_gpio(arizona, "wlf,ldoena", true, &pdata->ldoe=
na);
> +
> +	return 0;
> +}
> +#else
> +static inline int arizona_ldo1_of_get_pdata(struct arizona *arizona)
> +{
> +	return 0;
> +}
> +#endif
> +

I think "if (IS_ENABLED(CONFIG_OF))" is preferred now, but I guess
that's up to Mark.

>  static int arizona_ldo1_probe(struct platform_device *pdev)
>  {
>  	struct arizona *arizona =3D dev_get_drvdata(pdev->dev.parent);
> @@ -186,6 +202,8 @@ static int arizona_ldo1_probe(struct platform_dev=
ice *pdev)
>  	struct arizona_ldo1 *ldo1;
>  	int ret;
> =20
> +	arizona->external_dcvdd =3D false;
> +
>  	ldo1 =3D devm_kzalloc(&pdev->dev, sizeof(*ldo1), GFP_KERNEL);
>  	if (!ldo1)
>  		return -ENOMEM;
> @@ -216,6 +234,13 @@ static int arizona_ldo1_probe(struct platform_de=
vice *pdev)
>  	config.dev =3D arizona->dev;
>  	config.driver_data =3D ldo1;
>  	config.regmap =3D arizona->regmap;
> +
> +	if (!dev_get_platdata(arizona->dev)) {
     =20
Here ^

> +		ret =3D arizona_ldo1_of_get_pdata(arizona);
> +		if (ret < 0)
> +			return ret;
> +	}
> +

=46or the MFD changes:
  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Mark,
  Post acceptance, I'd prefer to create an IB for this patch-set.

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
