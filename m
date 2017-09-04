From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v7 07/18] omap3isp: Fix check for our own sub-devices
Date: Mon, 4 Sep 2017 15:28:04 +0200
Message-ID: <f8a4ba8c-f749-26ab-0897-c929b3f23e9f@xs4all.nl>
References: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
 <20170903174958.27058-8-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170903174958.27058-8-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/03/2017 07:49 PM, Sakari Ailus wrote:
> We only want to link sub-devices that were bound to the async notifier the
> isp driver registered but there may be other sub-devices in the
> v4l2_device as well. Check for the correct async notifier.

Just to be sure I understand this correctly: the original code wasn't wrong as such,
but this new test is just more precise.

Right?

	Hans

> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/media/platform/omap3isp/isp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> index a546cf774d40..3b1a9cd0e591 100644
> --- a/drivers/media/platform/omap3isp/isp.c
> +++ b/drivers/media/platform/omap3isp/isp.c
> @@ -2155,7 +2155,7 @@ static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
>  		return ret;
>  
>  	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
> -		if (!sd->asd)
> +		if (sd->notifier != &isp->notifier)
>  			continue;
>  
>  		ret = isp_link_entity(isp, &sd->entity,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
