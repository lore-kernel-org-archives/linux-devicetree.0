From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v5 1/2] iio: adc: add driver for Rockchip saradc
Date: Sun, 20 Jul 2014 13:23:55 +0200
Message-ID: <53CBA6CB.501@metafoo.de>
References: <3234956.d4q5ZB3IB8@diego> <2386463.CW7L8vIufx@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2386463.CW7L8vIufx@diego>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?B?ImVkZGllKOiUoeaeqyki?= <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/14/2014 10:43 PM, Heiko St=C3=BCbner wrote:

Looks really good overall.

[...]
> +static int rockchip_saradc_read_raw(struct iio_dev *indio_dev,
> +				    struct iio_chan_spec const *chan,
> +				    int *val, int *val2, long mask)
> +{
> +	struct rockchip_saradc *info =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		mutex_lock(&indio_dev->mlock);
> +
> +		/* 8 clock periods as delay between power up and start cmd */
> +		writel_relaxed(8, info->regs + SARADC_DLY_PU_SOC);
> +

It makes sense to call reinit_completion() here.

> +		/* Select the channel to be used and trigger conversion */
> +		writel(SARADC_CTRL_POWER_CTRL
> +				| (chan->channel & SARADC_CTRL_CHN_MASK)
> +				| SARADC_CTRL_IRQ_ENABLE,
> +		       info->regs + SARADC_CTRL);
> +
> +		if (!wait_for_completion_timeout(&info->completion,
> +						 SARADC_TIMEOUT)) {
> +			writel_relaxed(0, info->regs + SARADC_CTRL);
> +			mutex_unlock(&indio_dev->mlock);
> +			return -ETIMEDOUT;
> +		}
> +
> +		*val =3D info->last_val;
> +		mutex_unlock(&indio_dev->mlock);
> +		return IIO_VAL_INT;
[...]
> +static int rockchip_saradc_probe(struct platform_device *pdev)
> +{
> +	struct rockchip_saradc *info =3D NULL;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct iio_dev *indio_dev =3D NULL;
> +	struct resource	*mem;
> +	int ret;
> +	int irq;
> +	u32 rate;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> +	if (!indio_dev) {
> +		dev_err(&pdev->dev, "failed allocating iio device\n");
> +		return -ENOMEM;
> +	}
> +	info =3D iio_priv(indio_dev);
> +
> +	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	info->regs =3D devm_request_and_ioremap(&pdev->dev, mem);

devm_request_and_ioremap() is deprecated an will be removed in the next=
=20
release[1]. Use devm_ioremap_resource(), note that devm_ioremap_resourc=
e()=20
returns a ERR_PTR instead of NULL on error.

[1] https://lkml.org/lkml/2014/6/11/26

> +	if (!info->regs)
> +		return -ENOMEM;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "no irq resource?\n");
> +		return irq;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, rockchip_saradc_isr,
> +			       0, dev_name(&pdev->dev), info);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed requesting irq %d\n", irq);
> +		return ret;
> +	}
> +
> +	init_completion(&info->completion);

Since the completion is used in the interrupt callback it must be=20
initialized before the interrupt is requested.

> +
[...]
> +	/* use a default of 1MHz for the converter clock */
> +	ret =3D of_property_read_u32(np, "clock-frequency", &rate);
> +	if (ret < 0)
> +		rate =3D 1000000;

Should this really be in the devicetree or shouldn't this be user=20
configurable at runtime?

[...]
