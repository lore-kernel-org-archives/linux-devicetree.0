From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/8] iio: of_iio_channel_get_by_name() returns non-null
 pointers for error legs
Date: Sun, 15 Jun 2014 21:20:17 +0100
Message-ID: <539E0001.60005@kernel.org>
References: <cover.1402484954.git.Adam.Thomson.Opensource@diasemi.com> <0e7c03b0467ae1eace9dafebe6946d01d48e72f2.1402484954.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0e7c03b0467ae1eace9dafebe6946d01d48e72f2.1402484954.git.Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/06/14 12:11, Adam Thomson wrote:
> Currently in the inkern.c code for IIO framework, the function
> of_iio_channel_get_by_name() will return a non-NULL pointer when
> it cannot find a channel using of_iio_channel_get() and when it
> tries to search for 'io-channel-ranges' property and fails. This
> is incorrect behaviour as the function which calls this expects
> a NULL pointer for failure. This patch rectifies the issue.
>
> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Hi Adam,

Good find.  I've only recently sent a pull request for fixes upstream,
so I'll pick this up in a day or so once that has gone.

J
> ---
>   drivers/iio/inkern.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 0cf5f8e..1e8e94d 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -183,7 +183,7 @@ static struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
>   		else if (name && index >= 0) {
>   			pr_err("ERROR: could not get IIO channel %s:%s(%i)\n",
>   				np->full_name, name ? name : "", index);
> -			return chan;
> +			return NULL;
>   		}
>
>   		/*
> @@ -193,8 +193,9 @@ static struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
>   		 */
>   		np = np->parent;
>   		if (np && !of_get_property(np, "io-channel-ranges", NULL))
> -			break;
> +			return NULL;
>   	}
> +
>   	return chan;
>   }
>
> @@ -317,6 +318,7 @@ struct iio_channel *iio_channel_get(struct device *dev,
>   		if (channel != NULL)
>   			return channel;
>   	}
> +
>   	return iio_channel_get_sys(name, channel_name);
>   }
>   EXPORT_SYMBOL_GPL(iio_channel_get);
> --
> 1.9.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
