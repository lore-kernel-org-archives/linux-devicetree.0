From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 9/9] iio: inkern: add iio_read_channel_average_raw
Date: Sat, 15 Mar 2014 15:30:24 +0000
Message-ID: <53247210.3070307@kernel.org>
References: <1393702365-26429-1-git-send-email-sre@debian.org> <1393970751-18157-1-git-send-email-sre@debian.org> <1393970751-18157-10-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393970751-18157-10-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/03/14 22:05, Sebastian Reichel wrote:
> Add iio_read_channel_average_raw to support reading
> averaged raw values in consumer drivers.
>
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Sometimes these wrappers seem a little bit silly. There
might be a case for automating them somewhat via some
macros, but for now this is fine.

Docs should in theory probably be with the implementation,
but that's wrong throughout consumer.h so this isn't the time
to change it!

Jonathan
> ---
>   drivers/iio/inkern.c         | 18 ++++++++++++++++++
>   include/linux/iio/consumer.h | 13 +++++++++++++
>   2 files changed, 31 insertions(+)
>
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 0cf5f8e..adeba5a 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -443,6 +443,24 @@ err_unlock:
>   }
>   EXPORT_SYMBOL_GPL(iio_read_channel_raw);
>
> +int iio_read_channel_average_raw(struct iio_channel *chan, int *val)
> +{
> +	int ret;
> +
> +	mutex_lock(&chan->indio_dev->info_exist_lock);
> +	if (chan->indio_dev->info == NULL) {
> +		ret = -ENODEV;
> +		goto err_unlock;
> +	}
> +
> +	ret = iio_channel_read(chan, val, NULL, IIO_CHAN_INFO_AVERAGE_RAW);
> +err_unlock:
> +	mutex_unlock(&chan->indio_dev->info_exist_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(iio_read_channel_average_raw);
> +
>   static int iio_convert_raw_to_processed_unlocked(struct iio_channel *chan,
>   	int raw, int *processed, unsigned int scale)
>   {
> diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
> index 2752b1f..651f9a0 100644
> --- a/include/linux/iio/consumer.h
> +++ b/include/linux/iio/consumer.h
> @@ -123,6 +123,19 @@ int iio_read_channel_raw(struct iio_channel *chan,
>   			 int *val);
>
Ah, my bad habits propogate onwards.  The docs should be with the implementation.
Oh well, at somepoint I'll clean all remaining cases of this up.
>   /**
> + * iio_read_channel_average_raw() - read from a given channel
> + * @chan:		The channel being queried.
> + * @val:		Value read back.
> + *
> + * Note raw reads from iio channels are in adc counts and hence
> + * scale will need to be applied if standard units required.
> + *
> + * In opposit to the normal iio_read_channel_raw this function
> + * returns the average of multiple reads.
> + */
> +int iio_read_channel_average_raw(struct iio_channel *chan, int *val);
> +
> +/**
>    * iio_read_channel_processed() - read processed value from a given channel
>    * @chan:		The channel being queried.
>    * @val:		Value read back.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
