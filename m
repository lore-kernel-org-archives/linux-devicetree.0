From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv3 3/7] mfd: twl4030-madc: Cleanup driver
Date: Wed, 26 Feb 2014 08:29:22 +0000
Message-ID: <20140226082922.GH9195@lee--X1>
References: <1393193271-16717-1-git-send-email-sre@debian.org>
 <1393374270-20079-1-git-send-email-sre@debian.org>
 <1393374270-20079-4-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393374270-20079-4-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Some style fixes in twl4030-madc driver.
>=20
> Reported-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/twl4030-madc.c       | 108 ++++++++++++++++++-----------=
----------
>  include/linux/i2c/twl4030-madc.h |   2 +-
>  2 files changed, 51 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/mfd/twl4030-madc.c b/drivers/mfd/twl4030-madc.c
> index 81484ee..c23025b 100644
> --- a/drivers/mfd/twl4030-madc.c
> +++ b/drivers/mfd/twl4030-madc.c

>  /*
> - * Return battery temperature
> + * Return battery temperature in degree Celsius

degrees

<snip>

> -	int count =3D 0, count_req =3D 0, i;
> -	u8 reg;
> +	int count =3D 0, i;

Ugly, please declare on separate lines.

>  	for_each_set_bit(i, &channels, TWL4030_MADC_MAX_CHANNELS) {
> -		reg =3D reg_base + 2 * i;

Odd for this to be removed, as you calculate more than once now.

> -		buf[i] =3D twl4030_madc_channel_raw_read(madc, reg);
> +		buf[i] =3D twl4030_madc_channel_raw_read(madc, reg_base + 2 * i);

Better to bracket the math for clarity.

<snip>

> +			dev_err(madc->dev, "Unable to read register 0x%X\n",
> +				reg_base + 2 * i);

Here's the other calculation.

> +	regmask =3D (chan =3D=3D 0) ? TWL4030_BCI_TYPEN : TWL4030_BCI_ITHEN=
;

regmask =3D chan ? TWL4030_BCI_ITHEN : TWL4030_BCI_TYPEN;=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
