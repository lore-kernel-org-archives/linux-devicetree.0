From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv4 2/7] mfd: twl4030-madc: Add DT support and convert to
 IIO framework
Date: Sat, 01 Mar 2014 11:33:33 +0000
Message-ID: <5311C58D.3040006@kernel.org>
References: <1393374270-20079-1-git-send-email-sre@debian.org> <1393444990-28140-1-git-send-email-sre@debian.org> <1393444990-28140-3-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393444990-28140-3-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/02/14 20:03, Sebastian Reichel wrote:
> This converts twl4030-madc module to use the Industrial IO ADC
> framework and adds device tree support.
>
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Mostly fine. I've replicated a few things Lee spotted + one logic bug I think
in handling the platform_data, device tree interaction.


> ---
>   drivers/mfd/twl4030-madc.c | 127 +++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 118 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mfd/twl4030-madc.c b/drivers/mfd/twl4030-madc.c
> index 5458561..37cb3ad 100644
> --- a/drivers/mfd/twl4030-madc.c
> +++ b/drivers/mfd/twl4030-madc.c
> @@ -47,11 +47,14 @@
>   #include <linux/gfp.h>
>   #include <linux/err.h>
>
> +#include <linux/iio/iio.h>
> +
>   /*
>    * struct twl4030_madc_data - a container for madc info
>    * @dev - pointer to device structure for madc
>    * @lock - mutex protecting this data structure
>    * @requests - Array of request struct corresponding to SW1, SW2 and RT
> + * @use_second_irq - IRQ selection (main or co-processor)
>    * @imr - Interrupt mask register of MADC
>    * @isr - Interrupt status register of MADC
>    */
> @@ -59,10 +62,73 @@ struct twl4030_madc_data {
>   	struct device *dev;
>   	struct mutex lock;	/* mutex protecting this data structure */
>   	struct twl4030_madc_request requests[TWL4030_MADC_NUM_METHODS];
> +	bool use_second_irq;
>   	int imr;
>   	int isr;
>   };
>
> +static int twl4030_madc_read(struct iio_dev *iio_dev,
> +			     const struct iio_chan_spec *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct twl4030_madc_data *madc = iio_priv(iio_dev);
> +	struct twl4030_madc_request req;
> +	int ret;
> +
> +	req.method = madc->use_second_irq ? TWL4030_MADC_SW2 : TWL4030_MADC_SW1;
> +
> +	req.channels = BIT(chan->channel);
> +	req.active = false;
> +	req.func_cb = NULL;
> +	req.type = TWL4030_MADC_WAIT;
> +	req.raw = !(mask == IIO_CHAN_INFO_PROCESSED);
> +	req.do_avg = (mask == IIO_CHAN_INFO_AVERAGE_RAW);
> +
> +	ret = twl4030_madc_conversion(&req);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = req.rbuf[chan->channel];
> +
> +	return IIO_VAL_INT;
> +}
> +
> +static const struct iio_info twl4030_madc_iio_info = {
> +	.read_raw = &twl4030_madc_read,
> +	.driver_module = THIS_MODULE,
> +};
> +
> +#define TWL4030_ADC_CHANNEL(_channel, _type, _name, _mask) {	\
> +	.type = _type,					\
> +	.channel = _channel,				\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |  \
> +			      BIT(IIO_CHAN_INFO_AVERAGE_RAW) | \
> +			      _mask,			\
> +	.datasheet_name = _name,			\
> +	.indexed = 1,					\
> +}
A small addition to the ABI docs to include the average case
would be good.  Obviously it should be there already but it isn't
as far as I can see.
> +
> +static const struct iio_chan_spec twl4030_madc_iio_channels[] = {
> +	TWL4030_ADC_CHANNEL(0, IIO_VOLTAGE, "ADCIN0", 0),
> +	TWL4030_ADC_CHANNEL(1, IIO_TEMP, "ADCIN1",
> +		BIT(IIO_CHAN_INFO_PROCESSED)),
> +	TWL4030_ADC_CHANNEL(2, IIO_VOLTAGE, "ADCIN2", 0),
> +	TWL4030_ADC_CHANNEL(3, IIO_VOLTAGE, "ADCIN3", 0),
> +	TWL4030_ADC_CHANNEL(4, IIO_VOLTAGE, "ADCIN4", 0),
> +	TWL4030_ADC_CHANNEL(5, IIO_VOLTAGE, "ADCIN5", 0),
> +	TWL4030_ADC_CHANNEL(6, IIO_VOLTAGE, "ADCIN6", 0),
> +	TWL4030_ADC_CHANNEL(7, IIO_VOLTAGE, "ADCIN7", 0),
> +	TWL4030_ADC_CHANNEL(8, IIO_VOLTAGE, "ADCIN8", 0),
> +	TWL4030_ADC_CHANNEL(9, IIO_VOLTAGE, "ADCIN9", 0),
> +	TWL4030_ADC_CHANNEL(10, IIO_CURRENT, "ADCIN10",
> +		BIT(IIO_CHAN_INFO_PROCESSED)),
> +	TWL4030_ADC_CHANNEL(11, IIO_VOLTAGE, "ADCIN11", 0),
> +	TWL4030_ADC_CHANNEL(12, IIO_VOLTAGE, "ADCIN12", 0),
> +	TWL4030_ADC_CHANNEL(13, IIO_VOLTAGE, "ADCIN13", 0),
> +	TWL4030_ADC_CHANNEL(14, IIO_VOLTAGE, "ADCIN14", 0),
> +	TWL4030_ADC_CHANNEL(15, IIO_VOLTAGE, "ADCIN15", 0),
> +};
> +
>   static struct twl4030_madc_data *twl4030_madc;
>
>   struct twl4030_prescale_divider_ratios {
> @@ -702,28 +768,51 @@ static int twl4030_madc_probe(struct platform_device *pdev)
>   {
>   	struct twl4030_madc_data *madc;
>   	struct twl4030_madc_platform_data *pdata = dev_get_platdata(&pdev->dev);
> +	struct device_node *np = pdev->dev.of_node;
>   	int irq, ret;
>   	u8 regval;
> +	struct iio_dev *iio_dev = NULL;
>
> -	if (!pdata) {
> +	if (!pdata && !np) {
>   		dev_err(&pdev->dev, "platform_data not available\n");
>   		return -EINVAL;
>   	}
> -	madc = devm_kzalloc(&pdev->dev, sizeof(*madc), GFP_KERNEL);
> -	if (!madc)
> +
> +	iio_dev = devm_iio_device_alloc(&pdev->dev,
> +					sizeof(struct twl4030_madc_data));
sizeof(*madc)) is shorter and slightly prefered.

> +	if (!iio_dev) {
> +		dev_err(&pdev->dev, "failed allocating iio device\n");
>   		return -ENOMEM;
> +	}
>
> +	madc = iio_priv(iio_dev);
>   	madc->dev = &pdev->dev;
> +	madc->use_second_irq = false;
> +
> +	iio_dev->name = dev_name(&pdev->dev);
> +	iio_dev->dev.parent = &pdev->dev;
> +	iio_dev->dev.of_node = pdev->dev.of_node;
> +	iio_dev->info = &twl4030_madc_iio_info;
> +	iio_dev->modes = INDIO_DIRECT_MODE;
> +	iio_dev->channels = twl4030_madc_iio_channels;
> +	iio_dev->num_channels = 16;
Preferred to use ARRAY_SIZE(twl4030_madc_iio_channels);
That's obviously right, whereas with an explicity number I had
to go check :(
>
>   	/*
>   	 * Phoenix provides 2 interrupt lines. The first one is connected to
>   	 * the OMAP. The other one can be connected to the other processor such
>   	 * as modem. Hence two separate ISR and IMR registers.
>   	 */
> -	madc->imr = (pdata->irq_line == 1) ?
> -	    TWL4030_MADC_IMR1 : TWL4030_MADC_IMR2;
> -	madc->isr = (pdata->irq_line == 1) ?
> -	    TWL4030_MADC_ISR1 : TWL4030_MADC_ISR2;
> +	if (pdata && pdata->irq_line != 1)
> +		madc->use_second_irq = true;
This logic looks wrong.  If pdata is true, but pdata->irq_line = 0
it will read the of data which might not be there.

> +	else
> +		madc->use_second_irq = of_property_read_bool(np,
> +				       "ti,system-uses-second-madc-irq");
> +
> +	madc->imr = madc->use_second_irq ? TWL4030_MADC_IMR2 :
> +					   TWL4030_MADC_IMR1;
> +	madc->isr = madc->use_second_irq ? TWL4030_MADC_ISR2 :
> +					   TWL4030_MADC_ISR1;
> +
>   	ret = twl4030_madc_set_power(madc, 1);
>   	if (ret < 0)
>   		return ret;
> @@ -768,7 +857,7 @@ static int twl4030_madc_probe(struct platform_device *pdev)
>   		}
>   	}
>
> -	platform_set_drvdata(pdev, madc);
> +	platform_set_drvdata(pdev, iio_dev);
>   	mutex_init(&madc->lock);
>
>   	irq = platform_get_irq(pdev, 0);
> @@ -780,7 +869,15 @@ static int twl4030_madc_probe(struct platform_device *pdev)
>   		goto err_i2c;
>   	}
>   	twl4030_madc = madc;
> +
> +	ret = iio_device_register(iio_dev);
> +	if (ret) {
> +		dev_dbg(&pdev->dev, "could not register iio device\n");
> +		goto err_i2c;
> +	}
> +
>   	return 0;
> +
>   err_i2c:
>   	twl4030_madc_set_current_generator(madc, 0, 0);
>   err_current_generator:
> @@ -790,20 +887,32 @@ err_current_generator:
>
>   static int twl4030_madc_remove(struct platform_device *pdev)
>   {
> -	struct twl4030_madc_data *madc = platform_get_drvdata(pdev);
> +	struct iio_dev *iio_dev = platform_get_drvdata(pdev);
> +	struct twl4030_madc_data *madc = iio_priv(iio_dev);
>
>   	twl4030_madc_set_current_generator(madc, 0, 0);
>   	twl4030_madc_set_power(madc, 0);
>
> +	iio_device_unregister(iio_dev);
> +
>   	return 0;
>   }
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id twl_madc_of_match[] = {
> +	{.compatible = "ti,twl4030-madc", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, twl_madc_of_match);
> +#endif
> +
>   static struct platform_driver twl4030_madc_driver = {
>   	.probe = twl4030_madc_probe,
>   	.remove = twl4030_madc_remove,
>   	.driver = {
>   		   .name = "twl4030_madc",
>   		   .owner = THIS_MODULE,
> +		   .of_match_table = of_match_ptr(twl_madc_of_match),
>   		   },
>   };
>
>
