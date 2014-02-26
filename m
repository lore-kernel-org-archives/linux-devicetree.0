From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv3 2/7] mfd: twl4030-madc: Add DT support and convert to IIO
 framework
Date: Wed, 26 Feb 2014 09:26:59 +0000
Message-ID: <20140226092659.GI9195@lee--X1>
References: <1393193271-16717-1-git-send-email-sre@debian.org>
 <1393374270-20079-1-git-send-email-sre@debian.org>
 <1393374270-20079-3-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393374270-20079-3-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> This converts twl4030-madc module to use the Industrial IO ADC
> framework and adds device tree support.
>=20
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/twl4030-madc.c | 122 +++++++++++++++++++++++++++++++++++=
+++++++---
>  1 file changed, 115 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/twl4030-madc.c b/drivers/mfd/twl4030-madc.c
> index 5458561..81484ee 100644
> --- a/drivers/mfd/twl4030-madc.c
> +++ b/drivers/mfd/twl4030-madc.c
> @@ -47,6 +47,8 @@
>  #include <linux/gfp.h>
>  #include <linux/err.h>
> =20
> +#include <linux/iio/iio.h>
> +
>  /*
>   * struct twl4030_madc_data - a container for madc info
>   * @dev - pointer to device structure for madc
> @@ -59,10 +61,74 @@ struct twl4030_madc_data {
>  	struct device *dev;
>  	struct mutex lock;	/* mutex protecting this data structure */
>  	struct twl4030_madc_request requests[TWL4030_MADC_NUM_METHODS];
> +	bool use_second_irq;

This should go into the same patch that adds the header doc, or visa
versa.

>  	int imr;
>  	int isr;
>  };
> =20
> +static int twl4030_madc_read(struct iio_dev *iio_dev,
> +			     const struct iio_chan_spec *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct twl4030_madc_data *madc =3D iio_priv(iio_dev);
> +	struct twl4030_madc_request req;
> +	int channel =3D chan->channel;

Does this really add anything you save 6 chars.

<snip>

>  	/*
>  	 * Phoenix provides 2 interrupt lines. The first one is connected t=
o
>  	 * the OMAP. The other one can be connected to the other processor =
such
>  	 * as modem. Hence two separate ISR and IMR registers.
>  	 */
> -	madc->imr =3D (pdata->irq_line =3D=3D 1) ?
> +	if (pdata)
> +		madc->use_second_irq =3D pdata->irq_line !=3D 1;

Unconventional an unclear.

Stick the comparison in the if statement.

> +	else
> +		madc->use_second_irq =3D of_property_read_bool(np,
> +				       "ti,system-uses-second-madc-irq");
> +
> +	madc->imr =3D (madc->use_second_irq =3D=3D 1) ?

madc->imr =3D madc->use_second_irq ? <blah> : <blah>;

>  	    TWL4030_MADC_IMR1 : TWL4030_MADC_IMR2;
> -	madc->isr =3D (pdata->irq_line =3D=3D 1) ?
> +	madc->isr =3D (madc->use_second_irq =3D=3D 1) ?

Same here.

<snip>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
