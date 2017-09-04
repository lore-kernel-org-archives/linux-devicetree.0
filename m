From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v7 10/18] v4l: async: Introduce macros for calling async
 ops callbacks
Date: Mon, 4 Sep 2017 15:50:52 +0200
Message-ID: <96c4a9cf-1231-b6c4-bc2b-a431f4bea7a4@xs4all.nl>
References: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
 <20170903174958.27058-11-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170903174958.27058-11-sakari.ailus@linux.intel.com>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se, robh@kernel.org, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, pavel@ucw.cz, sre@kernel.org
List-Id: devicetree@vger.kernel.org

On 09/03/2017 07:49 PM, Sakari Ailus wrote:
> Add two macros to call async operations callbacks. Besides simplifying
> callbacks, this allows async notifiers to have no ops set, i.e. it can be
> left NULL.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 19 +++++++------------
>  include/media/v4l2-async.h           |  8 ++++++++
>  2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 810f5e0273dc..91d04f00b4e4 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -107,16 +107,13 @@ static int v4l2_async_test_notify(struct v4l2_async_notifier *notifier,
>  {
>  	int ret;
>  
> -	if (notifier->ops->bound) {
> -		ret = notifier->ops->bound(notifier, sd, asd);
> -		if (ret < 0)
> -			return ret;
> -	}
> +	ret = v4l2_async_notifier_call_int_op(notifier, bound, sd, asd);

Hmm, I think this is rather ugly. We only have three ops, so why not make
three macros:

	v4l2_async_notifier_call_bound/unbind/complete?

Much cleaner than _int_op(...bound...).

Regards,

	Hans

> +	if (ret < 0)
> +		return ret;
>  
>  	ret = v4l2_device_register_subdev(notifier->v4l2_dev, sd);
>  	if (ret < 0) {
> -		if (notifier->ops->unbind)
> -			notifier->ops->unbind(notifier, sd, asd);
> +		v4l2_async_notifier_call_void_op(notifier, unbind, sd, asd);
>  		return ret;
>  	}
>  
> @@ -129,7 +126,7 @@ static int v4l2_async_test_notify(struct v4l2_async_notifier *notifier,
>  	list_move(&sd->async_list, &notifier->done);
>  
>  	if (list_empty(&notifier->waiting) && notifier->ops->complete)
> -		return notifier->ops->complete(notifier);
> +		return v4l2_async_notifier_call_int_op(notifier, complete);
>  
>  	return 0;
>  }
> @@ -232,8 +229,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier)
>  		/* If we handled USB devices, we'd have to lock the parent too */
>  		device_release_driver(d);
>  
> -		if (notifier->ops->unbind)
> -			notifier->ops->unbind(notifier, sd, sd->asd);
> +		v4l2_async_notifier_call_void_op(notifier, unbind, sd, sd->asd);
>  
>  		/*
>  		 * Store device at the device cache, in order to call
> @@ -344,8 +340,7 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  
>  	v4l2_async_cleanup(sd);
>  
> -	if (notifier->ops->unbind)
> -		notifier->ops->unbind(notifier, sd, sd->asd);
> +	v4l2_async_notifier_call_void_op(notifier, unbind, sd, sd->asd);
>  
>  	mutex_unlock(&list_lock);
>  }
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 3c48f8b66d12..c3e001e0d1f1 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -95,6 +95,14 @@ struct v4l2_async_notifier_operations {
>  		       struct v4l2_async_subdev *asd);
>  };
>  
> +#define v4l2_async_notifier_call_int_op(n, op, ...)			\
> +	(((n)->ops && (n)->ops->op) ? (n)->ops->op(n, ## __VA_ARGS__) : 0)
> +#define v4l2_async_notifier_call_void_op(n, op, ...)	 \
> +	do {						 \
> +		if ((n)->ops && (n)->ops->op)		 \
> +			(n)->ops->op(n, ## __VA_ARGS__); \
> +	} while (false)
> +
>  /**
>   * struct v4l2_async_notifier - v4l2_device notifier data
>   *
> 
