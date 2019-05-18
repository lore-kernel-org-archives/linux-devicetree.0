Return-Path: <jic23@kernel.org>
Date: Sat, 18 May 2019 10:36:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 1/5] iio: ad7949: Fix dummy read cycle placement
Message-ID: <20190518103614.65677bc1@archlinux>
In-Reply-To: <1557759185-167857-1-git-send-email-adam.michaelis@rockwellcollins.com>
References: <1557759185-167857-1-git-send-email-adam.michaelis@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de, michael.hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com
List-ID: <devicetree@vger.kernel.org>

On Mon, 13 May 2019 09:53:01 -0500
Adam Michaelis <adam.michaelis@rockwellcollins.com> wrote:

> The AD7949 requires two conversion cycles following the first
> configuration change, and one extra cycle following any other
> configuration change (including changing the analog channel being
> sampled). Therefore, adding a dummy read cycle when config is changed
> and removing the extra cycle at initial configuration (the first dummy
> cycle is now performed as part of applying the configuration change).
> 
> Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Hi Adam,

Looks good to me.  However, I'd like an Analog review on this series
before it gets applied.

Jonathan

> ---
> 	V2:
> 	- Add some defines to reduce use of magic numbers.
> 	V3:
> 	- Switch back to using a u32 data buffer.
> 	- Add-back the second dummy cycle on initialization.
> 	- Move to first patch in series.
> ---
>  drivers/iio/adc/ad7949.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
> index ac0ffff6c5ae..c7fe27aa2519 100644
> --- a/drivers/iio/adc/ad7949.c
> +++ b/drivers/iio/adc/ad7949.c
> @@ -100,6 +100,23 @@ static int ad7949_spi_write_cfg(struct ad7949_adc_chip *ad7949_adc, u16 val,
>  	 * send a new command to the device
>  	 */
>  	udelay(2);
> +
> +	/*
> +	 * Perform extra read cycle to allow configuration, acquisition,
> +	 * and conversion sequences to complete for new configuration.
> +	 */
> +	ad7949_adc->buffer = 0;
> +
> +	spi_message_init_with_transfers(&msg, tx, 1);
> +
> +	ret = spi_sync(ad7949_adc->spi, &msg);
> +
> +	/*
> +	 * This delay is to avoid a new request before the required time
> +	 * to send a new command to the device.
> +	 */
> +	udelay(2);
> +
>  	return ret;
>  }
>  
> @@ -229,11 +246,10 @@ static int ad7949_spi_init(struct ad7949_adc_chip *ad7949_adc)
>  	ret = ad7949_spi_write_cfg(ad7949_adc, 0x3C79, AD7949_MASK_TOTAL);
>  
>  	/*
> -	 * Do two dummy conversions to apply the first configuration setting.
> +	 * Do a dummy conversion to apply the first configuration setting.
>  	 * Required only after the start up of the device.
>  	 */
>  	ad7949_spi_read_channel(ad7949_adc, &val, ad7949_adc->current_channel);
> -	ad7949_spi_read_channel(ad7949_adc, &val, ad7949_adc->current_channel);
>  
>  	return ret;
>  }
