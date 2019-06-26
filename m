From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V4 1/5] iio: adc: ad7124: Remove input number limitation
Date: Wed, 26 Jun 2019 20:22:34 +0100
Message-ID: <20190626202234.7c4cd0da@archlinux>
References: <20190625081128.22190-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625081128.22190-1-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mircea Caprioru <mircea.caprioru@analog.com>
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 25 Jun 2019 11:11:24 +0300
Mircea Caprioru <mircea.caprioru@analog.com> wrote:

> The driver limits the user to use only 4/8 differential inputs, but this
> device has the option to use pseudo-differential channels. This will
> increase the number of channels to be equal with the number of inputs so 8
> channels for ad7124-4 and 16 for ad7124-8.
> 
> This patch removes the check between channel nodes and num_inputs value.
> 
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
> 
> Changelog v2:
> - nothing changed here
> 
> Changelog v3:
> - nothing changed here
> 
> Changelog v4:
> - nothing changed here
> 
>  drivers/iio/adc/ad7124.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
> index 659ef37d5fe8..810234db9c0d 100644
> --- a/drivers/iio/adc/ad7124.c
> +++ b/drivers/iio/adc/ad7124.c
> @@ -462,13 +462,6 @@ static int ad7124_of_parse_channel_config(struct iio_dev *indio_dev,
>  		if (ret)
>  			goto err;
>  
> -		if (ain[0] >= st->chip_info->num_inputs ||
> -		    ain[1] >= st->chip_info->num_inputs) {
> -			dev_err(indio_dev->dev.parent,
> -				"Input pin number out of range.\n");
> -			ret = -EINVAL;
> -			goto err;
> -		}
>  		st->channel_config[channel].ain = AD7124_CHANNEL_AINP(ain[0]) |
>  						  AD7124_CHANNEL_AINM(ain[1]);
>  		st->channel_config[channel].bipolar =
