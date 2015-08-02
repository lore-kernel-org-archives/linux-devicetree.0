From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: proximity: add support for PulsedLight LIDAR
Date: Sun, 02 Aug 2015 11:45:01 +0200
Message-ID: <55BDE69D.3010708@metafoo.de>
References: <1438401484-22101-1-git-send-email-mranostay@gmail.com> <1438401484-22101-3-git-send-email-mranostay@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438401484-22101-3-git-send-email-mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, marex-ynQEQJNshbs@public.gmane.org, matt-agtwNxEcTQJWk0Htik3J/w@public.gmane.org, pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/01/2015 05:58 AM, Matt Ranostay wrote:
> +static int lidar_read_raw(struct iio_dev *indio_dev,
> +			  struct iio_chan_spec const *chan,
> +			  int *val, int *val2, long mask)
> +{
> +	struct lidar_data *data = iio_priv(indio_dev);
> +	int ret = -EINVAL;
> +
> +	if (iio_buffer_enabled(indio_dev) && mask == IIO_CHAN_INFO_RAW)
> +		return -EBUSY;

For this to work without race conditions you need to hold the
indio_dev->mlock while doing the check and until the conversion is done.

> +
> +	mutex_lock(&data->lock);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		u16 reg;
> +
> +		ret = lidar_get_measurement(data, &reg);
> +		if (!ret) {
> +			*val = reg / 100;
> +			*val2 = (reg % 100) * 10000;
> +			ret = IIO_VAL_INT_PLUS_MICRO;
> +		}
> +		break;
> +	}
