From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 08/11] iio: Update iio_channel_get_all and iio_channel_get_all_cb
 API
Date: Sat, 02 Feb 2013 10:14:34 +0000
Message-ID: <510CE70A.60002@kernel.org>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net> <1359668588-13678-9-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-9-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/31/2013 09:43 PM, Guenter Roeck wrote:
> Pass device pointer instead of device name as parameter to iio_channel_get_all
> and iio_channel_get_all_cb. This will enable us to use OF information to
> retrieve consumer channel information.
> 
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Applied with unused 'lists' variable dropped.
> ---
>  drivers/iio/buffer_cb.c         |    4 ++--
>  drivers/iio/inkern.c            |    6 ++++--
>  drivers/staging/iio/iio_hwmon.c |   10 +++++++---
>  include/linux/iio/consumer.h    |    8 ++++----
>  4 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/buffer_cb.c b/drivers/iio/buffer_cb.c
> index 4d40e24..9201022 100644
> --- a/drivers/iio/buffer_cb.c
> +++ b/drivers/iio/buffer_cb.c
> @@ -25,7 +25,7 @@ static struct iio_buffer_access_funcs iio_cb_access = {
>  	.store_to = &iio_buffer_cb_store_to,
>  };
>  
> -struct iio_cb_buffer *iio_channel_get_all_cb(const char *name,
> +struct iio_cb_buffer *iio_channel_get_all_cb(struct device *dev,
>  					     int (*cb)(u8 *data,
>  						       void *private),
>  					     void *private)
> @@ -46,7 +46,7 @@ struct iio_cb_buffer *iio_channel_get_all_cb(const char *name,
>  	cb_buff->buffer.access = &iio_cb_access;
>  	INIT_LIST_HEAD(&cb_buff->buffer.demux_list);
>  
> -	cb_buff->channels = iio_channel_get_all(name);
> +	cb_buff->channels = iio_channel_get_all(dev);
>  	if (IS_ERR(cb_buff->channels)) {
>  		ret = PTR_ERR(cb_buff->channels);
>  		goto error_free_cb_buff;
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index d55e98f..58d0ffe 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -167,16 +167,18 @@ void iio_channel_release(struct iio_channel *channel)
>  }
>  EXPORT_SYMBOL_GPL(iio_channel_release);
>  
> -struct iio_channel *iio_channel_get_all(const char *name)
> +struct iio_channel *iio_channel_get_all(struct device *dev)
>  {
> +	const char *name;
>  	struct iio_channel *chans;
>  	struct iio_map_internal *c = NULL;
>  	int nummaps = 0;
>  	int mapind = 0;
>  	int i, ret;
>  
> -	if (name == NULL)
> +	if (dev == NULL)
>  		return ERR_PTR(-EINVAL);
> +	name = dev_name(dev);
>  
>  	mutex_lock(&iio_map_list_lock);
>  	/* first count the matching maps */
> diff --git a/drivers/staging/iio/iio_hwmon.c b/drivers/staging/iio/iio_hwmon.c
> index 6a5bc5f..a4fce64 100644
> --- a/drivers/staging/iio/iio_hwmon.c
> +++ b/drivers/staging/iio/iio_hwmon.c
> @@ -71,14 +71,18 @@ static int iio_hwmon_probe(struct platform_device *pdev)
>  	int ret, i;
>  	int in_i = 1, temp_i = 1, curr_i = 1;
>  	enum iio_chan_type type;
> +	struct iio_channel *channels;
> +	const __be32 *list;
> +
> +	channels = iio_channel_get_all(dev);
> +	if (IS_ERR(channels))
> +		return PTR_ERR(channels);
>  
>  	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
>  	if (st == NULL)
>  		return -ENOMEM;
>  
> -	st->channels = iio_channel_get_all(dev_name(dev));
> -	if (IS_ERR(st->channels))
> -		return PTR_ERR(st->channels);
> +	st->channels = channels;
>  
>  	/* count how many attributes we have */
>  	while (st->channels[st->num_channels].indio_dev)
> diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
> index 16c35ac..6c44167 100644
> --- a/include/linux/iio/consumer.h
> +++ b/include/linux/iio/consumer.h
> @@ -48,14 +48,14 @@ void iio_channel_release(struct iio_channel *chan);
>  
>  /**
>   * iio_channel_get_all() - get all channels associated with a client
> - * @name:		name of consumer device.
> + * @dev:		Pointer to consumer device.
>   *
>   * Returns an array of iio_channel structures terminated with one with
>   * null iio_dev pointer.
>   * This function is used by fairly generic consumers to get all the
>   * channels registered as having this consumer.
>   */
> -struct iio_channel *iio_channel_get_all(const char *name);
> +struct iio_channel *iio_channel_get_all(struct device *dev);
>  
>  /**
>   * iio_channel_release_all() - reverse iio_channel_get_all
> @@ -66,7 +66,7 @@ void iio_channel_release_all(struct iio_channel *chan);
>  struct iio_cb_buffer;
>  /**
>   * iio_channel_get_all_cb() - register callback for triggered capture
> - * @name:		Name of client device.
> + * @dev:		Pointer to client device.
>   * @cb:			Callback function.
>   * @private:		Private data passed to callback.
>   *
> @@ -74,7 +74,7 @@ struct iio_cb_buffer;
>   * So if the channels requested come from different devices this will
>   * fail.
>   */
> -struct iio_cb_buffer *iio_channel_get_all_cb(const char *name,
> +struct iio_cb_buffer *iio_channel_get_all_cb(struct device *dev,
>  					     int (*cb)(u8 *data,
>  						       void *private),
>  					     void *private);
> 
