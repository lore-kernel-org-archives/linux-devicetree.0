From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/7] iio: adc: max1027: Make it optional to use
 interrupts
Date: Sun, 6 Oct 2019 11:18:37 +0100
Message-ID: <20191006111837.33fdfe25@archlinux>
References: <20191003173401.16343-1-miquel.raynal@bootlin.com>
        <20191003173401.16343-3-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003173401.16343-3-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Thu,  3 Oct 2019 19:33:56 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The chip has a 'start conversion' and a 'end of conversion' pair of
> pins. They can be used but this is absolutely not mandatory as regular
> polling of the value is totally fine with the current internal
> clocking setup. Turn the interrupts optional and do not error out if
> they are not inquired in the device tree. This has the effect to
> prevent triggered buffers use though.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Hmm. I haven't looked a this in a great deal of depth but if we support
single channel reads it should be possible to allow the use of a
trigger from elsewhere.  Looks like a fair bit of new code would be needed
to support that though.  So perhaps this is a good first step.

It's a bit annoying that the hardware doesn't provide a EOC bit
anywhere in the registers.  That would have allowed us to be a bit
cleverer.

Anyhow, this looks fine to me.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/max1027.c | 57 +++++++++++++++++++++------------------
>  1 file changed, 31 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/iio/adc/max1027.c b/drivers/iio/adc/max1027.c
> index 6cdfe9ef73fc..823223b77a70 100644
> --- a/drivers/iio/adc/max1027.c
> +++ b/drivers/iio/adc/max1027.c
> @@ -430,35 +430,40 @@ static int max1027_probe(struct spi_device *spi)
>  		return -ENOMEM;
>  	}
>  
> -	ret = devm_iio_triggered_buffer_setup(&spi->dev, indio_dev,
> -					&iio_pollfunc_store_time,
> -					&max1027_trigger_handler, NULL);
> -	if (ret < 0) {
> -		dev_err(&indio_dev->dev, "Failed to setup buffer\n");
> -		return ret;
> -	}

> +	if (spi->irq) {
> +		ret = devm_iio_triggered_buffer_setup(&spi->dev, indio_dev,
> +						      &iio_pollfunc_store_time,
> +						      &max1027_trigger_handler,
> +						      NULL);
> +		if (ret < 0) {
> +			dev_err(&indio_dev->dev, "Failed to setup buffer\n");
> +			return ret;
> +		}
>  
> -	st->trig = devm_iio_trigger_alloc(&spi->dev, "%s-trigger",
> -							indio_dev->name);
> -	if (st->trig == NULL) {
> -		ret = -ENOMEM;
> -		dev_err(&indio_dev->dev, "Failed to allocate iio trigger\n");
> -		return ret;
> -	}
> +		st->trig = devm_iio_trigger_alloc(&spi->dev, "%s-trigger",
> +						  indio_dev->name);
> +		if (st->trig == NULL) {
> +			ret = -ENOMEM;
> +			dev_err(&indio_dev->dev,
> +				"Failed to allocate iio trigger\n");
> +			return ret;
> +		}
>  
> -	st->trig->ops = &max1027_trigger_ops;
> -	st->trig->dev.parent = &spi->dev;
> -	iio_trigger_set_drvdata(st->trig, indio_dev);
> -	iio_trigger_register(st->trig);
> +		st->trig->ops = &max1027_trigger_ops;
> +		st->trig->dev.parent = &spi->dev;
> +		iio_trigger_set_drvdata(st->trig, indio_dev);
> +		iio_trigger_register(st->trig);
>  
> -	ret = devm_request_threaded_irq(&spi->dev, spi->irq,
> -					iio_trigger_generic_data_rdy_poll,
> -					NULL,
> -					IRQF_TRIGGER_FALLING,
> -					spi->dev.driver->name, st->trig);
> -	if (ret < 0) {
> -		dev_err(&indio_dev->dev, "Failed to allocate IRQ.\n");
> -		return ret;
> +		ret = devm_request_threaded_irq(&spi->dev, spi->irq,
> +						iio_trigger_generic_data_rdy_poll,
> +						NULL,
> +						IRQF_TRIGGER_FALLING,
> +						spi->dev.driver->name,
> +						st->trig);
> +		if (ret < 0) {
> +			dev_err(&indio_dev->dev, "Failed to allocate IRQ.\n");
> +			return ret;
> +		}
>  	}
>  
>  	/* Disable averaging */
