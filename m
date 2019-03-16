From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 07/11] staging: iio: ad7780: move regulator to after
 GPIO init
Date: Sat, 16 Mar 2019 18:02:36 +0000
Message-ID: <20190316180236.22a907b2@archlinux>
References: <cover.1552700652.git.renatogeh@gmail.com>
        <c018f41a8f21c0b2b25fe264cb58ba4bd2239505.1552700652.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c018f41a8f21c0b2b25fe264cb58ba4bd2239505.1552700652.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Mar 2019 23:14:59 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> To maintain consistency between ad7780_probe and ad7780_remove orders,
> regulator initialization has been moved to after GPIO initializations.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
Applied,

Thanks,

Jonathan

> ---
>  drivers/staging/iio/adc/ad7780.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
> index 977b381c1260..568c5b4472ff 100644
> --- a/drivers/staging/iio/adc/ad7780.c
> +++ b/drivers/staging/iio/adc/ad7780.c
> @@ -295,16 +295,6 @@ static int ad7780_probe(struct spi_device *spi)
>  
>  	ad_sd_init(&st->sd, indio_dev, spi, &ad7780_sigma_delta_info);
>  
> -	st->reg = devm_regulator_get(&spi->dev, "avdd");
> -	if (IS_ERR(st->reg))
> -		return PTR_ERR(st->reg);
> -
> -	ret = regulator_enable(st->reg);
> -	if (ret) {
> -		dev_err(&spi->dev, "Failed to enable specified AVdd supply\n");
> -		return ret;
> -	}
> -
>  	st->chip_info =
>  		&ad7780_chip_info_tbl[spi_get_device_id(spi)->driver_data];
>  
> @@ -321,6 +311,16 @@ static int ad7780_probe(struct spi_device *spi)
>  	if (ret)
>  		goto error_cleanup_buffer_and_trigger;
>  
> +	st->reg = devm_regulator_get(&spi->dev, "avdd");
> +	if (IS_ERR(st->reg))
> +		return PTR_ERR(st->reg);
> +
> +	ret = regulator_enable(st->reg);
> +	if (ret) {
> +		dev_err(&spi->dev, "Failed to enable specified AVdd supply\n");
> +		return ret;
> +	}
> +
>  	ret = ad_sd_setup_buffer_and_trigger(indio_dev);
>  	if (ret)
>  		goto error_disable_reg;
