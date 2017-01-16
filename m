From: Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] iio: max5481: Add support for Maxim digital
 potentiometers
Date: Mon, 16 Jan 2017 18:10:26 +0100
Message-ID: <20170116171026.GA1676@x220.localdomain>
References: <20170114212139.GA3418@x220.localdomain>
 <e48d9285-a077-36b3-b904-d9cf95c50a82@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e48d9285-a077-36b3-b904-d9cf95c50a82-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matthew.weber-lFk7bPDcGtkY5TsXZYaR1UEOCMrvLtNR@public.gmane.org, maury.anderson-lFk7bPDcGtkY5TsXZYaR1UEOCMrvLtNR@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Jan 15, 2017 14:27, Jonathan Cameron wrote:
> A few more bits an pieces.
> 
> Thanks,

Thanks for the review!

> Jonathan
> > ---
> > +static int max5481_write_cmd(struct max5481_data *data, u8 cmd, u16 val)
> > +{
> > +	struct spi_device *spi = data->spi;
> > +
> > +	data->msg[0] = cmd;
> > +
> > +	switch (cmd) {
> > +	case MAX5481_WRITE_WIPER:
> > +		data->msg[1] = val >> 2;
> > +		data->msg[2] = (val & 0x3) << 6;
> > +		return spi_write(spi, data->msg, ARRAY_SIZE(data->msg));
> array_size will give you the number of elements in the array. Here that
> is fine, but inconsistent with the use of sizeof(data->msg[0]) below.

Yes, you are right.
Do you think that plain 3 and 1 below will be OK in this case? This is the way
the protocol is defined.
Or maybe ARRAY_SIZE above is OK, but below I will just write 1?

> > +
> > +	case MAX5481_COPY_AB_TO_NV:
> > +	case MAX5481_COPY_NV_TO_AB:
> > +		return spi_write(spi, data->msg, sizeof(data->msg[0]));
> > +
> > +	default:
> > +		return -EIO;
> > +	}
> > +}
> > +
> > (...)
> > +static int max5481_probe(struct spi_device *spi)
> > +{
> > +	struct iio_dev *indio_dev;
> > +	struct max5481_data *data;
> > +	const struct spi_device_id *id = spi_get_device_id(spi);
> > +	int ret;
> > +
> > +	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*data));
> > +	if (!indio_dev)
> > +		return -ENOMEM;
> > +
> > +	dev_set_drvdata(&spi->dev, indio_dev);
> > +	data = iio_priv(indio_dev);
> > +
> > +	data->spi = spi;
> To use the of data you have below this will need different handling,
> specifically the use of of_match_device to get access to the data.
> See something like adc/max1363 for how to do this.

OK thanks!

> > +	data->cfg = &max5481_cfg[id->driver_data];
> > +
> > +	indio_dev->name = id->name;
> > +	indio_dev->dev.parent = &spi->dev;
> > +	indio_dev->modes = INDIO_DIRECT_MODE;
> > +
> > +	/* variant specific configuration */
> > +	indio_dev->info = &max5481_info;
> > +	indio_dev->channels = max5481_channels;
> > +	indio_dev->num_channels = ARRAY_SIZE(max5481_channels);
> > +
> > +	/* restore wiper from NV */
> > +	ret = max5481_write_cmd(data, MAX5481_COPY_NV_TO_AB, 0);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return iio_device_register(indio_dev);
> > +}
> > (...)
> > +MODULE_AUTHOR("Maury Anderson <maury.anderson-lFk7bPDcGtkY5TsXZYaR1UEOCMrvLtNR@public.gmane.org>");
> > +MODULE_DESCRIPTION("max5481 SPI driver");
> > +MODULE_LICENSE("GPL v2");
> > 
> 1

Do you mean:
MODULE_LICENSE("GPL");
?

-- 
Slawomir Stepien
