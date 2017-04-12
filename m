From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v6 17/39] platform: add video-multiplexer subdevice driver
Date: Wed, 12 Apr 2017 12:09:32 +0300
Message-ID: <20170412090932.GS4192@valkosipuli.retiisi.org.uk>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-18-git-send-email-steve_longerbeam@mentor.com>
 <20170404124732.GD3288@valkosipuli.retiisi.org.uk>
 <e7368555-1644-4e8f-f355-6b07dc020f90@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e7368555-1644-4e8f-f355-6b07dc020f90-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-me
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Tue, Apr 11, 2017 at 05:50:58PM -0700, Steve Longerbeam wrote:
> 
> 
> On 04/04/2017 05:47 AM, Sakari Ailus wrote:
> >Hi Steve, Philipp and Pavel,
> >
> >On Mon, Mar 27, 2017 at 05:40:34PM -0700, Steve Longerbeam wrote:
> >>From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>
> >>This driver can handle SoC internal and external video bus multiplexers,
> >>controlled either by register bit fields or by a GPIO. The subdevice
> >>passes through frame interval and mbus configuration of the active input
> >>to the output side.
> >
> >The MUX framework is already in linux-next. Could you use that instead of
> >adding new driver + bindings that are not compliant with the MUX framework?
> >I don't think it'd be much of a change in terms of code, using the MUX
> >framework appears quite simple.
> 
> I would prefer to wait on this, and get what we have merged now so I can
> unload all these patches first.

The DT bindings will be different for this one and if you were using a MUX,
won't they? And you can't remove support for the existing bindings either,
you have to continue to support them going forward.

> 
> Also this is Philipp's driver, so again I would prefer to get this
> merged as-is and then Philipp can address these issues in a future
> patch. But I will add my comments below...

I bet there will be more issues to handle if you were to do the changes
later than now.

...

> >>+static int vidsw_s_stream(struct v4l2_subdev *sd, int enable)
> >>+{
> >>+	struct vidsw *vidsw = v4l2_subdev_to_vidsw(sd);
> >>+	struct v4l2_subdev *upstream_sd;
> >>+	struct media_pad *pad;
> >>+
> >>+	if (vidsw->active == -1) {
> >>+		dev_err(sd->dev, "Can not start streaming on inactive mux\n");
> >>+		return -EINVAL;
> >>+	}
> >>+
> >>+	pad = media_entity_remote_pad(&sd->entity.pads[vidsw->active]);
> >>+	if (!pad) {
> >>+		dev_err(sd->dev, "Failed to find remote source pad\n");
> >>+		return -ENOLINK;
> >>+	}
> >>+
> >>+	if (!is_media_entity_v4l2_subdev(pad->entity)) {
> >>+		dev_err(sd->dev, "Upstream entity is not a v4l2 subdev\n");
> >>+		return -ENODEV;
> >>+	}
> >>+
> >>+	upstream_sd = media_entity_to_v4l2_subdev(pad->entity);
> >>+
> >>+	return v4l2_subdev_call(upstream_sd, video, s_stream, enable);
> >
> >Now that we'll have more than two drivers involved in the same pipeline it
> >becomes necessary to define the behaviour of s_stream() throughout the
> >pipeline --- i.e. whose responsibility is it to call s_stream() on the
> >sub-devices in the pipeline?
> 
> In the case of imx-media, the capture device calls set stream on the
> whole pipeline in the start_streaming() callback. This subdev call is
> actually a NOOP for imx-media, because the upstream entity has already
> started streaming. Again I think this should be removed. It also
> enforces a stream order that some MC drivers may have a problem with.

What I want to say here is that the order in which the different devices in
the pipeline need to be started may not be known in a driver for a
particular part of the pipeline.

In order to avoid trying to have a single point of decision making, the
s_stream() op implemented in sub-device drivers should serve the purpose.
I'll cc you for the documentation patch.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
