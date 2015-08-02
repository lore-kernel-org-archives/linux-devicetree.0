From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] iio: adc: ti-adc128s052: Add adc108s022 ID
Date: Sun, 2 Aug 2015 18:01:21 +0100
Message-ID: <55BE4CE1.6060100@kernel.org>
References: <1437581064-9733-1-git-send-email-denis@eukrea.com>
 <1437581064-9733-2-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437581064-9733-2-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Eric_B=c3=a9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/07/15 17:04, Denis Carikli wrote:
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Given this is a 10 bit convertor and the one you are effectively
claiming it is compatible with is a 12 bit convertor, you have
more to do in the driver than this (slightly!).

The issue is in adc128_read_raw which is assuming 12 bits for 
IIO_CHAN_INFO_SCALE.


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
> 
