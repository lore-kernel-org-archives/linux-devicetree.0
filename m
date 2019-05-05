Return-Path: <jic23@kernel.org>
Date: Sun, 5 May 2019 16:08:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 6/6] iio: ad7949: Fix dummy read cycle placement
Message-ID: <20190505160822.6cc6e51f@archlinux>
In-Reply-To: <1556813672-49861-6-git-send-email-adam.michaelis@rockwellcollins.com>
References: <1556813672-49861-1-git-send-email-adam.michaelis@rockwellcollins.com>
	<1556813672-49861-6-git-send-email-adam.michaelis@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de, michael.hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com
List-ID: <devicetree@vger.kernel.org>

On Thu,  2 May 2019 11:14:32 -0500
Adam Michaelis <adam.michaelis@rockwellcollins.com> wrote:

> The AD7949 requires two conversion cycles following any configuration
> change (including changing the analog channel being sampled). Therefore,
> adding a dummy read cycle when config is changed and removing the extra
> cycles at initial configuration.
> 
> Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Could you move the fixes to the start of the series, as this one at least
looks like stable material to me.

Comments inline.

Thanks,

Jonathan

> ---
> 	V2: Add some defines to reduce use of magic numbers.
> ---
>  drivers/iio/adc/ad7949.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
> index cba152151908..5a6fe522c931 100644
> --- a/drivers/iio/adc/ad7949.c
> +++ b/drivers/iio/adc/ad7949.c
> @@ -144,6 +144,25 @@ static int ad7949_spi_write_cfg(struct ad7949_adc_chip *ad7949_adc, u16 val,
>  		 * time to send a new command to the device
>  		 */
>  		udelay(2);
> +
> +		/*
> +		 * Perform extra read cycle to allow configuration, acquisition,
> +		 * and conversion sequences to complete for new configuration.
> +		 */
> +		(void)memset(&tx, 0, sizeof(tx));

Again, drop the (void) as it's meaningless.

> +		(void)memset(ad7949_adc->buffer, 0, AD7949_BUFFER_LEN);
> +
> +		tx.rx_buf = ad7949_adc->buffer;
> +		tx.len = ad7949_message_len(ad7949_adc);
> +
> +		spi_message_init_with_transfers(&msg, &tx, 1);
> +		ret = spi_sync(ad7949_adc->spi, &msg);

spi_read and avoid most of the above.

> +
> +		/*
> +		 * This delay is to avoid a new request before the required time
> +		 * to send a new command to the device.
> +		 */
> +		udelay(2);
>  	}
>  
>  	return ret;
> @@ -276,7 +295,6 @@ static int ad7949_spi_reg_access(struct iio_dev *indio_dev,
>  static int ad7949_spi_init(struct ad7949_adc_chip *ad7949_adc)
>  {
>  	int ret;
> -	int val;
>  	u16 adc_config = 0;
>  
>  	ad7949_adc->current_channel = 0;
> @@ -309,13 +327,6 @@ static int ad7949_spi_init(struct ad7949_adc_chip *ad7949_adc)
>  			adc_config,
>  			AD7949_CFG_MASK_TOTAL);
>  
> -	/*
> -	 * Do two dummy conversions to apply the first configuration setting.
> -	 * Required only after the start up of the device.
> -	 */
> -	ad7949_spi_read_channel(ad7949_adc, &val, ad7949_adc->current_channel);
> -	ad7949_spi_read_channel(ad7949_adc, &val, ad7949_adc->current_channel);
> -
>  	return ret;
>  }
>  
