From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v3 4/5] iio: mxs-lradc: add scale_available file to channels
Date: Tue, 23 Jul 2013 10:46:56 +0200
Message-ID: <51EE4300.7070802@metafoo.de>
References: <1374501843-19651-1-git-send-email-hector.palacios@digi.com> <1374501843-19651-5-git-send-email-hector.palacios@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374501843-19651-5-git-send-email-hector.palacios-i7dp0qKlBMg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/22/2013 04:04 PM, Hector Palacios wrote:
[...]
>  
> +static ssize_t mxs_lradc_show_scale_available_ch(struct device *dev,
> +		struct device_attribute *attr,
> +		char *buf,
> +		int ch)
> +{
> +	struct iio_dev *iio = dev_to_iio_dev(dev);
> +	struct mxs_lradc *lradc = iio_priv(iio);
> +	int i, len = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(lradc->scale_avail[ch]); i++)
> +		len += sprintf(buf + len, "%d.%09u ",
> +			       lradc->scale_avail[ch][i].integer,
> +			       lradc->scale_avail[ch][i].nano);
> +
> +	len += sprintf(buf + len, "\n");
> +
> +	return len;
> +}
> +
> +static ssize_t mxs_lradc_show_scale_available(struct device *dev,
> +		struct device_attribute *attr,
> +		char *buf)
> +{
> +	struct iio_dev_attr *iio_attr = to_iio_dev_attr(attr);
> +
> +	return mxs_lradc_show_scale_available_ch(dev, attr, buf,
> +						 iio_attr->address);
> +}
> +
> +#define SHOW_SCALE_AVAILABLE_ATTR(ch)					\
> +static IIO_DEVICE_ATTR(in_voltage##ch##_scale_available, S_IRUGO,	\
> +		       mxs_lradc_show_scale_available, NULL, ch)
> +
> +SHOW_SCALE_AVAILABLE_ATTR(0);
> +SHOW_SCALE_AVAILABLE_ATTR(1);
> +SHOW_SCALE_AVAILABLE_ATTR(2);
> +SHOW_SCALE_AVAILABLE_ATTR(3);
> +SHOW_SCALE_AVAILABLE_ATTR(4);
> +SHOW_SCALE_AVAILABLE_ATTR(5);
> +SHOW_SCALE_AVAILABLE_ATTR(6);
> +SHOW_SCALE_AVAILABLE_ATTR(7);
> +SHOW_SCALE_AVAILABLE_ATTR(8);
> +SHOW_SCALE_AVAILABLE_ATTR(9);
> +SHOW_SCALE_AVAILABLE_ATTR(10);
> +SHOW_SCALE_AVAILABLE_ATTR(11);
> +SHOW_SCALE_AVAILABLE_ATTR(12);
> +SHOW_SCALE_AVAILABLE_ATTR(13);
> +SHOW_SCALE_AVAILABLE_ATTR(14);
> +SHOW_SCALE_AVAILABLE_ATTR(15);
> +
> +static struct attribute *mxs_lradc_attributes[] = {
> +	&iio_dev_attr_in_voltage0_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage1_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage2_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage3_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage4_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage5_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage6_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage7_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage8_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage9_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage10_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage11_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage12_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage13_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage14_scale_available.dev_attr.attr,
> +	&iio_dev_attr_in_voltage15_scale_available.dev_attr.attr,
> +	NULL
> +};

This should really be using the iio_chan_spec_ext_info infrastructure. Bonus
points for factoring out the common code used to calculate and display the
scales.

- Lars
