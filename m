From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv4 2/7] mfd: twl4030-madc: Add DT support and convert to IIO
 framework
Date: Thu, 27 Feb 2014 08:23:09 +0000
Message-ID: <20140227082309.GT9195@lee--X1>
References: <1393374270-20079-1-git-send-email-sre@debian.org>
 <1393444990-28140-1-git-send-email-sre@debian.org>
 <1393444990-28140-3-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393444990-28140-3-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Feb 2014, Sebastian Reichel wrote:

> This converts twl4030-madc module to use the Industrial IO ADC
> framework and adds device tree support.
>=20
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/twl4030-madc.c | 127 +++++++++++++++++++++++++++++++++++=
++++++----
>  1 file changed, 118 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/mfd/twl4030-madc.c b/drivers/mfd/twl4030-madc.c
> index 5458561..37cb3ad 100644
> --- a/drivers/mfd/twl4030-madc.c
> +++ b/drivers/mfd/twl4030-madc.c

<snip>

> -	if (!pdata) {
> +	if (!pdata && !np) {
>  		dev_err(&pdev->dev, "platform_data not available\n");

                                     and Device Tree node ...

<snip>

> +	iio_dev->channels =3D twl4030_madc_iio_channels;
> +	iio_dev->num_channels =3D 16;

ARRAY_SIZE()

<snip>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
