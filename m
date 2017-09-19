From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v13 02/25] v4l: async: Remove re-probing support
Date: Tue, 19 Sep 2017 12:21:58 +0300
Message-ID: <1891349.nWXO9QHRQ8@avalon>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com> <20170915141724.23124-3-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915141724.23124-3-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

(CC'ing Mike Turquette)

Thank you for the patch.

On Friday, 15 September 2017 17:17:01 EEST Sakari Ailus wrote:
> Remove V4L2 async re-probing support. The re-probing support has been
> there to support cases where the sub-devices require resources provided by
> the main driver's hardware to function, such as clocks.
> 
> Reprobing has allowed unbinding and again binding the main driver without
> explicilty unbinding the sub-device drivers. This is certainly not a
> common need, and the responsibility will be the user's going forward.
> 
> An alternative could have been to introduce notifier specific locks.
> Considering the complexity of the re-probing and that it isn't really a
> solution to a problem but a workaround, remove re-probing instead.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

As stated before we need a plan to fix the issue that reprobind was supposed 
to address.

To my knowledge the only intended user of the reprobind code was the OMAP3 ISP 
when it provides a clock to the sensor. I've briefly discussed this with Mike 
last week, and he believed we could handle the issue by "un-orphaning" the 
orphaned clock when the OMAP3 ISP is reprobed. Mike, have you had time to 
check whether that would be feasible without too much effort and/or pain ?

In the meantime, for this patch,

Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
>  drivers/media/v4l2-core/v4l2-async.c | 54 --------------------------------
>  1 file changed, 54 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c
> b/drivers/media/v4l2-core/v4l2-async.c index d741a8e0fdac..e109d9da4653
> 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -198,78 +198,24 @@ EXPORT_SYMBOL(v4l2_async_notifier_register);
>  void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier)
>  {
>  	struct v4l2_subdev *sd, *tmp;
> -	unsigned int notif_n_subdev = notifier->num_subdevs;
> -	unsigned int n_subdev = min(notif_n_subdev, V4L2_MAX_SUBDEVS);
> -	struct device **dev;
> -	int i = 0;
> 
>  	if (!notifier->v4l2_dev)
>  		return;
> 
> -	dev = kvmalloc_array(n_subdev, sizeof(*dev), GFP_KERNEL);
> -	if (!dev) {
> -		dev_err(notifier->v4l2_dev->dev,
> -			"Failed to allocate device cache!\n");
> -	}
> -
>  	mutex_lock(&list_lock);
> 
>  	list_del(&notifier->list);
> 
>  	list_for_each_entry_safe(sd, tmp, &notifier->done, async_list) {
> -		struct device *d;
> -
> -		d = get_device(sd->dev);
> -
>  		v4l2_async_cleanup(sd);
> 
> -		/* If we handled USB devices, we'd have to lock the parent too */
> -		device_release_driver(d);
> -
>  		if (notifier->unbind)
>  			notifier->unbind(notifier, sd, sd->asd);
> -
> -		/*
> -		 * Store device at the device cache, in order to call
> -		 * put_device() on the final step
> -		 */
> -		if (dev)
> -			dev[i++] = d;
> -		else
> -			put_device(d);
>  	}
> 
>  	mutex_unlock(&list_lock);
> 
> -	/*
> -	 * Call device_attach() to reprobe devices
> -	 *
> -	 * NOTE: If dev allocation fails, i is 0, and the whole loop won't be
> -	 * executed.
> -	 */
> -	while (i--) {
> -		struct device *d = dev[i];
> -
> -		if (d && device_attach(d) < 0) {
> -			const char *name = "(none)";
> -			int lock = device_trylock(d);
> -
> -			if (lock && d->driver)
> -				name = d->driver->name;
> -			dev_err(d, "Failed to re-probe to %s\n", name);
> -			if (lock)
> -				device_unlock(d);
> -		}
> -		put_device(d);
> -	}
> -	kvfree(dev);
> -
>  	notifier->v4l2_dev = NULL;
> -
> -	/*
> -	 * Don't care about the waiting list, it is initialised and populated
> -	 * upon notifier registration.
> -	 */
>  }
>  EXPORT_SYMBOL(v4l2_async_notifier_unregister);


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
