From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] [media] platform: add video-multiplexer
 subdevice driver
Date: Thu, 04 May 2017 09:07:32 +0200
Message-ID: <1493881652.2381.6.camel@pengutronix.de>
References: <20170502150913.2168-1-p.zabel@pengutronix.de>
         <20170502150913.2168-2-p.zabel@pengutronix.de>
         <20170503192836.GN7456@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170503192836.GN7456-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-05-03 at 22:28 +0300, Sakari Ailus wrote:
> Hi Philipp,
> 
> Thanks for continuing working on this!
> 
> I have some minor comments below...

Thank you for the comments.

[...]
> Could you rebase this on the V4L2 fwnode patchset here, please?
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=v4l2-acpi>
>
> The conversion is rather simple, as shown here:
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=v4l2-acpi&id=679035e11bfdbea146fed5d52fb794b34dc9cea6>

What is the status of this patchset? Will this be merged soon?

[...]
> > +static inline bool is_source_pad(struct video_mux *vmux, unsigned int pad)
> 
> It's a common practice to test pad flags rather than the pad number.
> Although the pad number here implicitly tells this, too, testing pad flags
> is cleaner.
> 
> The matter was discussed in the past and it was decided not to add helper
> functions to the framework for the purpose as testing the flags is trivial.

Ok, I'll drop is_source_pad and check (pad->flags & MEDIA_PAD_FL_SOURCE)
instead in the next version.

[...]
> > +static int video_mux_set_format(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_pad_config *cfg,
> > +			    struct v4l2_subdev_format *sdformat)
> > +{
> > +	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
> > +	struct v4l2_mbus_framefmt *mbusformat;
> > +
> > +	mbusformat = __video_mux_get_pad_format(sd, cfg, sdformat->pad,
> > +					    sdformat->which);
> > +	if (!mbusformat)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&vmux->lock);
> > +
> > +	/* Source pad mirrors active sink pad, no limitations on sink pads */
> > +	if (is_source_pad(vmux, sdformat->pad) && vmux->active >= 0)
> > +		sdformat->format = vmux->format_mbus[vmux->active];
> > +
> > +	mutex_unlock(&vmux->lock);
> > +
> > +	*mbusformat = sdformat->format;
> 
> Shouldn't you do this before releasing the mutex? The assignment won't be
> an atomic operation. Same for get_format; you should take the mutex.

Yes, I'll extend the mutex to cover the mbus formats.

[...]
> > +static struct v4l2_subdev_pad_ops video_mux_pad_ops = {
> > +	.get_fmt = video_mux_get_format,
> > +	.set_fmt = video_mux_set_format,
> > +};
> > +
> > +static struct v4l2_subdev_ops video_mux_subdev_ops = {
> 
> Const for both of the structs?

Will do, thanks.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
