From: Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>
Subject: Re: [PATCH 2/4] iio: adc: ti-adc128s052: Add adc108s022 ID
Date: Wed, 22 Jul 2015 12:24:54 -0500
Message-ID: <20150722172454.GB18251@deathstar>
References: <1437581064-9733-1-git-send-email-denis@eukrea.com>
 <1437581064-9733-2-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437581064-9733-2-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 22, 2015 at 06:04:22PM +0200, Denis Carikli wrote:

Where is the commit log?

https://www.kernel.org/doc/Documentation/SubmittingPatches

> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iio/adc/Kconfig         | 6 +++---
>  drivers/iio/adc/ti-adc128s052.c | 2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 233d47b..ae92f23 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -313,11 +313,11 @@ config TI_ADC081C
>  	  called ti-adc081c.
>  
>  config TI_ADC128S052
> -	tristate "Texas Instruments ADC128S052/ADC122S021"
> +	tristate "Texas Instruments ADC128S052, ADC122S021 and ADC108S022"
>  	depends on SPI
>  	help
> -	  If you say yes here you get support for Texas Instruments ADC128S052
> -	  and ADC122S021 chips.
> +	  If you say yes here you get support for Texas Instruments ADC128S052,
> +	  ADC122S021 and ADC108S022 chips.
>  
>  	  This driver can also be built as a module. If so, the module will be
>  	  called ti-adc128s052.
> diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
> index 915be6b..8aca0ff 100644
> --- a/drivers/iio/adc/ti-adc128s052.c
> +++ b/drivers/iio/adc/ti-adc128s052.c
> @@ -5,6 +5,7 @@
>   * Datasheets can be found here:
>   * http://www.ti.com/lit/ds/symlink/adc128s052.pdf
>   * http://www.ti.com/lit/ds/symlink/adc122s021.pdf
> + * http://www.ti.com/lit/ds/symlink/adc108s022.pdf
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
> @@ -177,6 +178,7 @@ static int adc128_remove(struct spi_device *spi)
>  static const struct spi_device_id adc128_id[] = {
>  	{ "adc128s052", 0},	/* index into adc128_config */
>  	{ "adc122s021",	1},
> +	{ "adc108s022", 1},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(spi, adc128_id);
> -- 
> 2.4.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
