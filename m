From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v3 09/30] iio: adc: Threat A33 as thermal
 sensor and remove non thermal sun4i channel
Date: Thu, 30 Aug 2018 18:40:17 +0200
Message-ID: <20180830164017.n7rcxcy2jj4mijpr@core>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-10-embed3d@gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBB453UDOAKGQEFHZPMWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180830154518.29507-10-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 30, 2018 at 05:44:57PM +0200, Philipp Rossak wrote:
> We want to use this driver mostly as thermal sensor, that still supports
> the adc for the older chips, thus we threat the A33 as thermal sensor.
> We also remove the adc channel without thermal support.

Threat -> treat (in the title and in the message body too)

> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
> index ab474ce86fb6..658a7e3e3370 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -123,23 +123,6 @@ static const struct iio_chan_spec sun4i_gpadc_channels[] = {
>  	},
>  };
>  
> -static const struct iio_chan_spec sun4i_gpadc_channels_no_temp[] = {
> -	SUN4I_GPADC_ADC_CHANNEL(0, "adc_chan0"),
> -	SUN4I_GPADC_ADC_CHANNEL(1, "adc_chan1"),
> -	SUN4I_GPADC_ADC_CHANNEL(2, "adc_chan2"),
> -	SUN4I_GPADC_ADC_CHANNEL(3, "adc_chan3"),
> -};
> -
> -static const struct iio_chan_spec sun8i_a33_gpadc_channels[] = {
> -	{
> -		.type = IIO_TEMP,
> -		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
> -				      BIT(IIO_CHAN_INFO_SCALE) |
> -				      BIT(IIO_CHAN_INFO_OFFSET),
> -		.datasheet_name = "temp_adc",
> -	},
> -};
> -
>  static const struct regmap_config sun4i_gpadc_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
> @@ -444,8 +427,6 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
>  		return -ENODEV;
>  
>  	info->no_irq = true;
> -	indio_dev->num_channels = ARRAY_SIZE(sun8i_a33_gpadc_channels);
> -	indio_dev->channels = sun8i_a33_gpadc_channels;
>  
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	base = devm_ioremap_resource(&pdev->dev, mem);
> -- 
> 2.11.0
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
