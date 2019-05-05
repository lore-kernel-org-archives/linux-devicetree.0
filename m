Return-Path: <jic23@kernel.org>
Date: Sun, 5 May 2019 15:42:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 3/6] iio: ad7949: Support configuration read-back
Message-ID: <20190505154227.1735b1b2@archlinux>
In-Reply-To: <1556813672-49861-3-git-send-email-adam.michaelis@rockwellcollins.com>
References: <1556813672-49861-1-git-send-email-adam.michaelis@rockwellcollins.com>
	<1556813672-49861-3-git-send-email-adam.michaelis@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de, michael.hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com
List-ID: <devicetree@vger.kernel.org>

On Thu,  2 May 2019 11:14:29 -0500
Adam Michaelis <adam.michaelis@rockwellcollins.com> wrote:

> Adds device tree parameter to set the configuration read-back bit
> in the configuration register to tell the AD7949 to include the value of
> the configuration register at the time the current sample was acquired
> when reading from the part.
> 
> Further work must be done to make read-back information available to
> consumer.

This needs some explanation of why it is useful at all. I'm certainly unclear
on why it would be useful to configure this at boot time.

Code looks fine.

Jonathan

> 
> Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
> ---
> 	V2: Add some defines to reduce use of magic numbers.
> ---
>  drivers/iio/adc/ad7949.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
> index afc1361af5fb..7820e1097787 100644
> --- a/drivers/iio/adc/ad7949.c
> +++ b/drivers/iio/adc/ad7949.c
> @@ -69,6 +69,7 @@ struct ad7949_adc_spec {
>   * @iio_dev: reference to iio structure
>   * @spi: reference to spi structure
>   * @ref_sel: selected reference voltage source
> + * @cfg_readback: whether reads will include configuration data
>   * @resolution: resolution of the chip
>   * @cfg: copy of the configuration register
>   * @current_channel: current channel in use
> @@ -80,6 +81,7 @@ struct ad7949_adc_chip {
>  	struct iio_dev *indio_dev;
>  	struct spi_device *spi;
>  	enum ad7949_ref_sel ref_sel;
> +	bool cfg_readback;
>  	u8 resolution;
>  	u16 cfg;
>  	unsigned int current_channel;
> @@ -283,7 +285,11 @@ static int ad7949_spi_init(struct ad7949_adc_chip *ad7949_adc)
>  			AD7949_CFG_REF_SEL_MASK;
>  	adc_config |= (AD7949_CFG_SEQ_DISABLED << AD7949_CFG_SEQ_SHIFT) &
>  			AD7949_CFG_SEQ_MASK;
> -	adc_config |= AD7949_CFG_READBACK_DIS;
> +
> +	if (ad7949_adc->cfg_readback)
> +		adc_config |= AD7949_CFG_READBACK_EN;
> +	else
> +		adc_config |= AD7949_CFG_READBACK_DIS;
>  
>  	ret = ad7949_spi_write_cfg(ad7949_adc,
>  			adc_config,
> @@ -331,6 +337,10 @@ static int ad7949_spi_probe(struct spi_device *spi)
>  	indio_dev->num_channels = spec->num_channels;
>  	ad7949_adc->resolution = spec->resolution;
>  
> +	ad7949_adc->cfg_readback = of_property_read_bool(
> +			ad7949_adc->indio_dev->dev.of_node,
> +			"adi,cfg-readback");
> +
>  	ret = of_property_read_u32(ad7949_adc->indio_dev->dev.of_node,
>  			"adi,reference-select",
>  			&temp);
