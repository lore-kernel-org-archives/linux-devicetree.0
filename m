From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] iio: adc: add IMX7D ADC driver support
Date: Tue, 10 Nov 2015 15:58:14 +0100
Message-ID: <56420606.4070505@metafoo.de>
References: <1447075704-4605-1-git-send-email-haibo.chen@freescale.com> <1447075704-4605-2-git-send-email-haibo.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447075704-4605-2-git-send-email-haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/09/2015 02:28 PM, Haibo Chen wrote:
> Freescale i.MX7D soc contains a new ADC IP. This patch add this ADC
> driver support, and the driver only support ADC software trigger.
> 
> Signed-off-by: Haibo Chen <haibo.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Looks pretty good, a few comments inline.

[...]
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/of_platform.h>
> +#include <linux/err.h>

I don't think you need all of these.

[...]
> +static void imx7d_adc_feature_config(struct imx7d_adc *info)
> +{
> +	info->adc_feature.clk_pre_div = IMX7D_ADC_ANALOG_CLK_PRE_DIV_4;
> +	info->adc_feature.avg_num = IMX7D_ADC_AVERAGE_NUM_32;
> +	info->adc_feature.core_time_unit = 1;
> +	info->adc_feature.average_en = true;

What's the plan for these? Right now they are always initialized to the same
static value.


> +}
[...]
> +static int imx7d_adc_read_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val,
> +			int *val2,
> +			long mask)
> +{
> +	struct imx7d_adc *info = iio_priv(indio_dev);
> +
> +	u32 channel;
> +	long ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		mutex_lock(&indio_dev->mlock);
> +		reinit_completion(&info->completion);
> +
> +		channel = (chan->channel) & 0x0f;
> +		info->channel = channel;
> +		imx7d_adc_channel_set(info);

How about just passing channel directy adc_channel_set() instead of doing it
implicitly through the info struct?

[...]
> +static irqreturn_t imx7d_adc_isr(int irq, void *dev_id)
> +{
> +	struct imx7d_adc *info = (struct imx7d_adc *)dev_id;
> +	int status;
> +
> +	status = readl(info->regs + IMX7D_REG_ADC_INT_STATUS);
> +	if (status & IMX7D_REG_ADC_INT_STATUS_CHANNEL_INT_STATUS) {
> +		info->value = imx7d_adc_read_data(info);
> +		complete(&info->completion);
> +	}
> +	writel(0, info->regs + IMX7D_REG_ADC_INT_STATUS);

Is the hardware really this broken? If the interrupt happens between reading
the status register and clearing it here it will be missed.

> +
> +	return IRQ_HANDLED;

You should only return IRQ_HANDLED if you actually handled are interrupt.

> +}
[...]
> +
> +static int imx7d_adc_probe(struct platform_device *pdev)
> +{
> +	struct imx7d_adc *info;
> +	struct iio_dev *indio_dev;
> +	struct resource *mem;
> +	int irq;
> +	int ret;
> +	u32 channels;
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(struct imx7d_adc));
> +	if (!indio_dev) {
> +		dev_err(&pdev->dev, "Failed allocating iio device\n");
> +		return -ENOMEM;
> +	}
> +
> +	info = iio_priv(indio_dev);
> +	info->dev = &pdev->dev;
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	info->regs = devm_ioremap_resource(&pdev->dev, mem);
> +	if (IS_ERR(info->regs)) {
> +		ret = PTR_ERR(info->regs);
> +		dev_err(&pdev->dev, "failed to remap adc memory: %d\n", ret);
> +		return ret;
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "no irq resource?\n");
> +		return irq;
> +	}
> +
> +	ret = devm_request_irq(info->dev, irq,
> +				imx7d_adc_isr, 0,
> +				dev_name(&pdev->dev), info);

This is too early. Completion is not initialized, clocks are not enabled, etc...

> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed requesting irq, irq = %d\n", irq);
> +		return ret;
> +	}
> +
[...]
> +	ret  = of_property_read_u32(pdev->dev.of_node,

Extra space.

> +					"num-channels", &channels);

What decides how many channels are in use?

> +	if (ret)
> +		channels = ARRAY_SIZE(imx7d_adc_iio_channels);
> +
> +	indio_dev->name = dev_name(&pdev->dev);
> +	indio_dev->dev.parent = &pdev->dev;
> +	indio_dev->dev.of_node = pdev->dev.of_node;
> +	indio_dev->info = &imx7d_adc_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = imx7d_adc_iio_channels;
> +	indio_dev->num_channels = (int)channels;

I don't think you need the case here.

>[...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
