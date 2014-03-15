From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCHv3 9/9] iio: inkern: add iio_read_channel_average_raw
Date: Sat, 15 Mar 2014 15:42:25 +0000
Message-ID: <532474E1.1090904@kernel.org>
References: <1394472329-15485-1-git-send-email-sre@debian.org> <1394472329-15485-10-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394472329-15485-10-git-send-email-sre@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@debian.org>, Sebastian Reichel <sre@ring0.de>, Marek Belisko <marek@goldelico.com>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/03/14 17:25, Sebastian Reichel wrote:
> Add iio_read_channel_average_raw to support reading
> averaged raw values in consumer drivers.
>
> Signed-off-by: Sebastian Reichel <sre@debian.org>
As this one also stands fine on it's own and isn't actually used
by the rest of the patch set - applied to the togreg branch of iio.git
This will get pushed out initially as 'testing' for the autobuilders
to play.

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
