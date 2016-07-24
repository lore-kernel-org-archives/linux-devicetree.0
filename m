From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: adc: add ADC12130/ADC12132/ADC12138 ADC driver
Date: Sun, 24 Jul 2016 20:27:01 +0100
Message-ID: <f7a04836-ebfe-4672-50eb-72255fdda5f3@kernel.org>
References: <1469376532-6516-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469376532-6516-1-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24/07/16 17:08, Akinobu Mita wrote:
> This adds Texas Instruments' ADC12130/ADC12132/ADC12138 12-bit plus
> sign ADC driver.  I have tested with the ADC12138.  The ADC12130 and
> ADC12132 are not tested but these are similar to ADC12138 except that
> the mode programming instruction is a bit different.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Hi Akinobu,

I'm out of time this evening and it may be a while before I get
a chance to look at this again.  So one quick comment in case you
respin in the meantime.

Otherwise from a quick read through looks good - but I'll want to
take a closer look before applying it.

Jonathan
...
> +static int adc12138_probe(struct spi_device *spi)
> +{
> +	struct iio_dev *indio_dev;
> +	struct adc12138 *adc;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*adc));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	adc = iio_priv(indio_dev);
> +	adc->spi = spi;
> +	adc->id = spi_get_device_id(spi)->driver_data;
> +	mutex_init(&adc->lock);
> +	init_completion(&adc->complete);
> +
> +	indio_dev->name = spi_get_device_id(spi)->name;
> +	indio_dev->dev.parent = &spi->dev;
> +	indio_dev->info = &adc12138_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	switch (adc->id) {
> +	case adc12130:
> +	case adc12132:
> +		indio_dev->channels = adc12132_channels;
> +		indio_dev->num_channels = ARRAY_SIZE(adc12132_channels);
> +		break;
> +	case adc12138:
> +		indio_dev->channels = adc12138_channels;
> +		indio_dev->num_channels = ARRAY_SIZE(adc12138_channels);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_read_u32(spi->dev.of_node, "acquisition-time",
> +				   &adc->acquisition_time);
> +	if (ret)
> +		adc->acquisition_time = 10;
> +
> +	adc->cclk = devm_clk_get(&spi->dev, NULL);
> +	if (IS_ERR(adc->cclk))
> +		return PTR_ERR(adc->cclk);
> +
> +	adc->vref_p = devm_regulator_get(&spi->dev, "vref-p");
> +	if (IS_ERR(adc->vref_p))
> +		return PTR_ERR(adc->vref_p);
> +
> +	adc->vref_n = devm_regulator_get_optional(&spi->dev, "vref-n");
> +
> +	ret = devm_request_irq(&spi->dev, spi->irq, adc12138_eoc_handler,
> +			       IRQF_TRIGGER_RISING, indio_dev->name, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(adc->cclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = regulator_enable(adc->vref_p);
> +	if (ret)
> +		goto error1;
> +
> +	if (!IS_ERR(adc->vref_n)) {
> +		ret = regulator_enable(adc->vref_n);
> +		if (ret)
> +			goto error2;
> +	}
> +
> +	ret = adc12138_init(adc);
> +	if (ret)
> +		goto error3;
> +
> +	spi_set_drvdata(spi, indio_dev);
> +
> +	ret = iio_triggered_buffer_setup(indio_dev, NULL,
> +					 adc12138_trigger_handler, NULL);
> +	if (ret)
> +		goto error3;
> +
> +	ret = iio_device_register(indio_dev);
> +	if (ret)
> +		goto error4;
> +
> +	return 0;
> +error4:
I'm rather more in favour of error labels that tell you
what needs unwinding as they result in a lot less churn
an extra entry is needed in futre.
> +	iio_triggered_buffer_cleanup(indio_dev);
> +error3:
> +	if (!IS_ERR(adc->vref_n))
> +		regulator_disable(adc->vref_n);
> +error2:
> +	regulator_disable(adc->vref_p);
> +error1:
> +	clk_disable_unprepare(adc->cclk);
> +
> +	return ret;
> +}
> +
..
