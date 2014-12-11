From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 1/3] iio: adc: Cosmic Circuits 10001 ADC driver
Date: Thu, 11 Dec 2014 12:21:36 -0300
Message-ID: <5489B680.1030906@imgtec.com>
References: <1417102762-5123-1-git-send-email-ezequiel.garcia@imgtec.com> <1417102762-5123-2-git-send-email-ezequiel.garcia@imgtec.com> <5488DAAF.1080506@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5488DAAF.1080506-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Phani Movva <Phani.Movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hartmut,

On 12/10/2014 08:43 PM, Hartmut Knaack wrote:
> Ezequiel Garcia schrieb am 27.11.2014 um 16:39:
>> From: Phani Movva <Phani.Movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>
>> This commit adds support for Cosmic Circuits 10001 10-bit ADC device.
> Still some issues left, unfortunately things I pointed out in my last review.

Ouch, sorry about that.

[..]
>> +
>> +#define CC10001_ADC_DATA_MASK		GENMASK(9, 0)
>> +#define CC10001_ADC_NUM_CHANNELS	8
>> +#define CC10001_ADC_CH_MASK		GENMASK(CC10001_ADC_NUM_CHANNELS - 1, 0)
> This is only valid for one of the cases you make (wrong) use of CC10001_ADC_CH_MASK.
> As you seem to use this mask to separate channel selection values (0 - 7) in register
> CC10001_ADC_CONFIG, a GENMASK(2, 0) would be appropriate.
> In case of the indio_dev->channel_mask, you would actually need this 
> GENMASK(CC10001_ADC_NUM_CHANNELS - 1, 0).

Right.

[..]
>> +static int cc10001_adc_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *node = pdev->dev.of_node;
>> +	struct cc10001_adc_device *adc_dev;
>> +	unsigned long adc_clk_rate;
>> +	struct resource *res;
>> +	struct iio_dev *indio_dev;
>> +	int ret;
>> +
>> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc_dev));
>> +	if (indio_dev == NULL)
>> +		return -ENOMEM;
>> +
>> +	adc_dev = iio_priv(indio_dev);
>> +
>> +	adc_dev->channel_map = CC10001_ADC_CH_MASK;
> So, here you need a GENMASK(CC10001_ADC_NUM_CHANNELS - 1, 0).

Right.

>> +	if (!of_property_read_u32(node, "cosmic,reserved-adc-channels", &ret))
>> +		adc_dev->channel_map &= ~ret;
>> +
>> +	adc_dev->reg = devm_regulator_get(&pdev->dev, "vref");
>> +	if (IS_ERR(adc_dev->reg))
>> +		return -EINVAL;
> Preferably pass up the real error code with PTR_ERR(adc_dev->reg).

OK.

Thanks for all your reviews!
-- 
Ezequiel
