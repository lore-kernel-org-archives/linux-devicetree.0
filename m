From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: adc: hi-843x: Holt HI-8435/8436/8437 descrete
 ADC
Date: Wed, 03 Jun 2015 09:05:57 +0200
Message-ID: <1433315157.2361.100.camel@x220>
References: <1433161073-21967-1-git-send-email-vladimir.barinov@cogentembedded.com>
	 <1433161211-22034-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433161211-22034-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Just a nit, that I spotted while scanning for other issues.

On Mon, 2015-06-01 at 15:20 +0300, Vladimir Barinov wrote:
> --- /dev/null
> +++ b/drivers/iio/adc/hi-843x.c

> +ssize_t hi843x_debounce_soft_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	[...]
> +}
>+
>+[...]
>+
> +ssize_t hi843x_threshold_socval_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf, size_t len)
> +{
> +	[...]
> +}

It seems all these *_show and *_store functions should be made static,
right?

> +static IIO_DEVICE_ATTR(debounce_soft, S_IRUGO | S_IWUSR,
> +	hi843x_debounce_soft_show, hi843x_debounce_soft_store, 0);
> +static IIO_DEVICE_ATTR(debounce_soft_delay, S_IRUGO | S_IWUSR,
> +	hi843x_debounce_soft_delay_show, hi843x_debounce_soft_delay_store, 0);
> +static IIO_DEVICE_ATTR(sensing_mode, S_IRUGO | S_IWUSR,
> +	hi843x_sensing_mode_show, hi843x_sensing_mode_store, 0);
> +static IIO_DEVICE_ATTR(test_enable, S_IRUGO | S_IWUSR,
> +	hi843x_test_enable_show, hi843x_test_enable_store, 0);
> +static IIO_DEVICE_ATTR(test_mode, S_IRUGO | S_IWUSR,
> +	hi843x_test_mode_show, hi843x_test_mode_store, 0);
> +static IIO_DEVICE_ATTR(threshold_gohys, S_IRUGO | S_IWUSR,
> +	hi843x_threshold_gohys_show, hi843x_threshold_gohys_store, 0);
> +static IIO_DEVICE_ATTR(threshold_gocval, S_IRUGO | S_IWUSR,
> +	hi843x_threshold_gocval_show, hi843x_threshold_gocval_store, 0);
> +static IIO_DEVICE_ATTR(threshold_sohys, S_IRUGO | S_IWUSR,
> +	hi843x_threshold_sohys_show, hi843x_threshold_sohys_store, 0);
> +static IIO_DEVICE_ATTR(threshold_socval, S_IRUGO | S_IWUSR,
> +	hi843x_threshold_socval_show, hi843x_threshold_socval_store, 0);

Thanks,


Paul Bolle
