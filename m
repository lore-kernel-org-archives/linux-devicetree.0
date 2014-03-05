From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 2/9] mfd: twl4030-madc: Add DT support and convert to
 IIO framework
Date: Wed, 5 Mar 2014 09:40:29 +0800
Message-ID: <20140305014029.GH10579@lee--X1>
References: <1393702365-26429-1-git-send-email-sre@debian.org>
 <1393970751-18157-1-git-send-email-sre@debian.org>
 <1393970751-18157-3-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393970751-18157-3-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> This converts twl4030-madc module to use the Industrial IO ADC
> framework and adds device tree support.
>=20
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/twl4030-madc.c | 126 +++++++++++++++++++++++++++++++++++=
++++++----
>  1 file changed, 116 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/mfd/twl4030-madc.c b/drivers/mfd/twl4030-madc.c
> index 5458561..0479af0 100644
> --- a/drivers/mfd/twl4030-madc.c
> +++ b/drivers/mfd/twl4030-madc.c

<snip>

 @@ -702,28 +766,50 @@ static int twl4030_madc_probe(struct platform_de=
vice *pdev)

> -	madc =3D devm_kzalloc(&pdev->dev, sizeof(*madc), GFP_KERNEL);
> -	if (!madc)
> +
> +	iio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*madc));
> +	if (!iio_dev) {
> +		dev_err(&pdev->dev, "failed allocating iio device\n");
>  		return -ENOMEM;
> +	}
> =20
> +	madc =3D iio_priv(iio_dev);
>  	madc->dev =3D &pdev->dev;
> +	madc->use_second_irq =3D false;

You don't need to do this a) it will be set below and b) it's already
false since you used kzalloc() to zero the region.

<snip>

> -	madc->imr =3D (pdata->irq_line =3D=3D 1) ?
> -	    TWL4030_MADC_IMR1 : TWL4030_MADC_IMR2;
> -	madc->isr =3D (pdata->irq_line =3D=3D 1) ?
> -	    TWL4030_MADC_ISR1 : TWL4030_MADC_ISR2;
> +	if (pdata && pdata->irq_line !=3D 1)
> +		madc->use_second_irq =3D true;
> +	else if (!pdata)
> +		madc->use_second_irq =3D of_property_read_bool(np,
> +				       "ti,system-uses-second-madc-irq");

How about:

	if (pdata)
		madc->use_second_irq =3D (pdata->irq_line !=3D 1);
	else=20
		madc->use_second_irq =3D of_property_read_bool(np,
					"ti,system-uses-second-madc-irq");

<snip>

> +	ret =3D iio_device_register(iio_dev);
> +	if (ret) {
> +		dev_dbg(&pdev->dev, "could not register iio device\n");

This should be a dev_err().

<snip>

> +#ifdef CONFIG_OF
> +static const struct of_device_id twl_madc_of_match[] =3D {
> +	{.compatible =3D "ti,twl4030-madc", },

nit: "{ .compatible"

>  static struct platform_driver twl4030_madc_driver =3D {
>  	.probe =3D twl4030_madc_probe,
>  	.remove =3D twl4030_madc_remove,
>  	.driver =3D {
>  		   .name =3D "twl4030_madc",
>  		   .owner =3D THIS_MODULE,
> +		   .of_match_table =3D of_match_ptr(twl_madc_of_match),
>  		   },

Also fix this please.

>  };
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
