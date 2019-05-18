From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: ad7606: Add software configuration
Date: Sat, 18 May 2019 11:07:49 +0100
Message-ID: <20190518110749.080c7a04@archlinux>
References: <20190516143208.19294-1-beniamin.bia@analog.com>
        <20190516143208.19294-2-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516143208.19294-2-beniamin.bia@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Beniamin Bia <beniamin.bia@analog.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, biabeniamin@outlook.com
List-Id: devicetree@vger.kernel.org

On Thu, 16 May 2019 17:32:05 +0300
Beniamin Bia <beniamin.bia@analog.com> wrote:

> Because this driver will support multiple configurations for software,
> the software configuration was made generic.
>=20
> Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks

Jonathan

> ---
>  drivers/iio/adc/ad7606.c | 40 +++++++++++++++++++++++++++++++++++++---
>  drivers/iio/adc/ad7606.h |  2 ++
>  2 files changed, 39 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
> index c66ff22f32d2..aba0fd123a51 100644
> --- a/drivers/iio/adc/ad7606.c
> +++ b/drivers/iio/adc/ad7606.c
> @@ -140,7 +140,7 @@ static int ad7606_read_raw(struct iio_dev *indio_dev,
>  			   int *val2,
>  			   long m)
>  {
> -	int ret;
> +	int ret, ch =3D 0;
>  	struct ad7606_state *st =3D iio_priv(indio_dev);
> =20
>  	switch (m) {
> @@ -157,8 +157,10 @@ static int ad7606_read_raw(struct iio_dev *indio_dev,
>  		*val =3D (short)ret;
>  		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_SCALE:
> +		if (st->sw_mode_en)
> +			ch =3D chan->address;
>  		*val =3D 0;
> -		*val2 =3D st->scale_avail[st->range[0]];
> +		*val2 =3D st->scale_avail[st->range[ch]];
>  		return IIO_VAL_INT_PLUS_MICRO;
>  	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>  		*val =3D st->oversampling;
> @@ -233,7 +235,9 @@ static int ad7606_write_raw(struct iio_dev *indio_dev,
>  	case IIO_CHAN_INFO_SCALE:
>  		mutex_lock(&st->lock);
>  		i =3D find_closest(val2, st->scale_avail, st->num_scales);
> -		ret =3D st->write_scale(indio_dev, chan->address, i);
> +		if (st->sw_mode_en)
> +			ch =3D chan->address;
> +		ret =3D st->write_scale(indio_dev, ch, i);
>  		if (ret < 0) {
>  			mutex_unlock(&st->lock);
>  			return ret;
> @@ -616,6 +620,36 @@ int ad7606_probe(struct device *dev, int irq, void _=
_iomem *base_address,
>  	st->write_scale =3D ad7606_write_scale_hw;
>  	st->write_os =3D ad7606_write_os_hw;
> =20
> +	if (st->chip_info->sw_mode_config)
> +		st->sw_mode_en =3D device_property_present(st->dev,
> +							 "adi,sw-mode");
> +
> +	if (st->sw_mode_en) {
> +		/* After reset, in software mode, =C2=B110 V is set by default */
> +		memset32(st->range, 2, ARRAY_SIZE(st->range));
> +		indio_dev->info =3D &ad7606_info_os_and_range;
> +
> +		/*
> +		 * In software mode, the range gpio has no longer its function.
> +		 * Instead, the scale can be configured individually for each
> +		 * channel from the range registers.
> +		 */
> +		if (st->chip_info->write_scale_sw)
> +			st->write_scale =3D st->chip_info->write_scale_sw;
> +
> +		/*
> +		 * In software mode, the oversampling is no longer configured
> +		 * with GPIO pins. Instead, the oversampling can be configured
> +		 * in configuratiion register.
> +		 */
> +		if (st->chip_info->write_os_sw)
> +			st->write_os =3D st->chip_info->write_os_sw;
> +
> +		ret =3D st->chip_info->sw_mode_config(indio_dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	st->trig =3D devm_iio_trigger_alloc(dev, "%s-dev%d",
>  					  indio_dev->name, indio_dev->id);
>  	if (!st->trig)
> diff --git a/drivers/iio/adc/ad7606.h b/drivers/iio/adc/ad7606.h
> index 143c30163df9..d8a509c2c428 100644
> --- a/drivers/iio/adc/ad7606.h
> +++ b/drivers/iio/adc/ad7606.h
> @@ -43,6 +43,7 @@ struct ad7606_chip_info {
>   * @range		voltage range selection, selects which scale to apply
>   * @oversampling	oversampling selection
>   * @base_address	address from where to read data in parallel operation
> + * @sw_mode_en		software mode enabled
>   * @scale_avail		pointer to the array which stores the available scales
>   * @num_scales		number of elements stored in the scale_avail array
>   * @oversampling_avail	pointer to the array which stores the available
> @@ -71,6 +72,7 @@ struct ad7606_state {
>  	unsigned int			range[16];
>  	unsigned int			oversampling;
>  	void __iomem			*base_address;
> +	bool				sw_mode_en;
>  	const unsigned int		*scale_avail;
>  	unsigned int			num_scales;
>  	const unsigned int		*oversampling_avail;
