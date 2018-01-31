From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 08/16] iio: adc: sun4i-gpadc-iio: rework: add
 interrupt support
Date: Wed, 31 Jan 2018 20:07:18 +0100
Message-ID: <20180131190718.ustqzwdxzw7mqe52@qschulz>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-9-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ael4ufwqprwhbxoy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180128232919.12639-9-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ael4ufwqprwhbxoy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Mon, Jan 29, 2018 at 12:29:11AM +0100, Philipp Rossak wrote:
> This patch rewors the driver to support interrupts for the thermal part
> of the sensor.
>=20
> This is only available for the newer sensor (currently H3 and A83T).
> The interrupt will be trigerd on data available and triggers the update
> for the thermal sensors. All newer sensors have different amount of
> sensors and different interrupts for each device the reset of the
> interrupts need to be done different
>=20
> For the newer sensors is the autosuspend disabled.
>=20
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Jonathan  Cameron <jonathan.cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 60 +++++++++++++++++++++++++++++++++=
++----
>  include/linux/mfd/sun4i-gpadc.h   |  2 ++
>  2 files changed, 56 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gp=
adc-iio.c
> index 74eeb5cd5218..b7b5451226b0 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -71,11 +71,14 @@ struct gpadc_data {
>  	unsigned int	temp_data[MAX_SENSOR_COUNT];
>  	int		(*sample_start)(struct sun4i_gpadc_iio *info);
>  	int		(*sample_end)(struct sun4i_gpadc_iio *info);
> +	u32		irq_clear_map;
> +	u32		irq_control_map;

I would say to use a regmap_irq_chip for controlling IRQs.

>  	bool		has_bus_clk;
>  	bool		has_bus_rst;
>  	bool		has_mod_clk;
>  	int		sensor_count;
>  	bool		supports_nvmem;
> +	bool		support_irq;
>  };
> =20
>  static const struct gpadc_data sun4i_gpadc_data =3D {
> @@ -90,6 +93,7 @@ static const struct gpadc_data sun4i_gpadc_data =3D {
>  	.sample_end =3D sun4i_gpadc_sample_end,
>  	.sensor_count =3D 1,
>  	.supports_nvmem =3D false,
> +	.support_irq =3D false,

False is the default, no need to set support_irq.

[...]

>  struct sun4i_gpadc_iio {
> @@ -332,6 +339,11 @@ static int sun4i_gpadc_temp_read(struct iio_dev *ind=
io_dev, int *val,
>  		return 0;
>  	}
> =20
> +	if (info->data->support_irq) {
> +		regmap_read(info->regmap, info->data->temp_data[sensor], val);
> +		return 0;
> +	}
> +

Maybe you could define a new thermal_zone_of_device_ops for these new
thermal sensors? That way, you don't even need the boolean support_irq.

>  	return sun4i_gpadc_read(indio_dev, 0, val, info->temp_data_irq);
>  }
> =20
> @@ -429,6 +441,17 @@ static irqreturn_t sun4i_gpadc_fifo_data_irq_handler=
(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
> =20
> +static irqreturn_t sunxi_irq_thread(int irq, void *data)

I think we're trying to avoid sunxi mentions but rather using the name
of the first IP (in term of product release, not support) using this
function.

> +{
> +	struct sun4i_gpadc_iio *info =3D data;
> +
> +	regmap_write(info->regmap, SUN8I_H3_THS_STAT, info->data->irq_clear_map=
);
> +

Will be handled by regmap_irq_chip.
[...]
> -	info->no_irq =3D true;
> +	if (info->data->support_irq) {
> +		/* only the new versions of ths support right now irqs */
> +		irq =3D platform_get_irq(pdev, 0);
> +		if (irq < 0) {
> +			dev_err(&pdev->dev, "failed to get IRQ: %d\n", irq);
> +			return irq;
> +		}
> +
> +		ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +				sunxi_irq_thread, IRQF_ONESHOT,
> +				dev_name(&pdev->dev), info);
> +		if (ret)
> +			return ret;
> +
> +	} else
> +		info->no_irq =3D true;
> +

That's a bit funny to have two booleans named no_irq and support_irq :)

>  	indio_dev->num_channels =3D ARRAY_SIZE(sun8i_a33_gpadc_channels);
>  	indio_dev->channels =3D sun8i_a33_gpadc_channels;
> =20
> @@ -789,11 +829,13 @@ static int sun4i_gpadc_probe(struct platform_device=
 *pdev)
>  	if (ret)
>  		return ret;
> =20
> -	pm_runtime_set_autosuspend_delay(&pdev->dev,
> -					 SUN4I_GPADC_AUTOSUSPEND_DELAY);
> -	pm_runtime_use_autosuspend(&pdev->dev);
> -	pm_runtime_set_suspended(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	if (!info->data->support_irq) {
> +		pm_runtime_set_autosuspend_delay(&pdev->dev,
> +						 SUN4I_GPADC_AUTOSUSPEND_DELAY);
> +		pm_runtime_use_autosuspend(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_enable(&pdev->dev);
> +	}

Why would you not want your IP to do runtime PM?

Quentin

--ael4ufwqprwhbxoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJachPjAAoJEIS4mnU+4PGjqA4P/ivU9fvKgSV51MN3iFIzFJIw
d4lR+Yc5edBejRFtCdkV8Jmmth3F9PmxTEQaEGQcFPrbFQhS6SIziqiMI9XvCDHt
D61htCtWBJRmkpIuo+QbvkWvX/Hj7gBPPmkD4onmgvwH0bE3Nj3oYjT7J/7JtATq
A2mkC9CtkJFMvs7eucgnUcnELumHp/YlwGnwFgrJM3AabI1db2hCZWb8KKgopUW7
E7IJ3SD1zok8DZx5BDldIgQh0U22prsGZwEjwj45wzF20p6I2wzTNNYrh6oSPQgp
oACU9c2s//zUf4Dgt0fT1lcOd8Rj3Bf+2QHySubwLm1KqeKnvGAbStzjzmHjx2Xm
LsMLVENr32XIhoIwFtJyLE2xsYqQtMkM3yeqECcH85lh1TZHhnBv2EE8185b1pXX
wNE42P1eki/7EKjrcdKwsgo+14LcbsG//VlikBHl/7baRSKFZwZdpwrarrLUtpxK
iY+i85EMI0aOxJEpJUg+H0jDOGzHw4LpP9nB6wClKEfrJniVJNa/sZHP6IPpY6RZ
CdDpMlSSXCVnBSiYiPoY/NIr/vyfJjMHqUDSHQKv9mxSsQW++XJYQgyQvdlOQ9AZ
akAxYlnOeUWX4VUvL9bs+LT8raV6kxsseRPWX6M/LyHsZ6uyeqen11RttiJTUqFm
ajzPjaOBhc6jJN64riEP
=fIxw
-----END PGP SIGNATURE-----

--ael4ufwqprwhbxoy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
