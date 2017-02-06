From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 13/24] platform: add video-multiplexer subdevice driver
Date: Tue, 07 Feb 2017 00:33:33 +0200
Message-ID: <2038922.a1tReKKdaL@avalon>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com> <2258037.UCXsIYbtGD@avalon> <f6bfb9ec-1ea3-8477-4933-cf655acd3e0f@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f6bfb9ec-1ea3-8477-4933-cf655acd3e0f-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgdev
List-Id: devicetree@vger.kernel.org

Hi Hans,

(CC'ing Sakari)

On Monday 06 Feb 2017 10:50:22 Hans Verkuil wrote:
> On 02/05/2017 04:48 PM, Laurent Pinchart wrote:
> > On Tuesday 24 Jan 2017 18:07:55 Steve Longerbeam wrote:
> >> On 01/24/2017 04:02 AM, Philipp Zabel wrote:
> >>> On Fri, 2017-01-20 at 15:03 +0100, Hans Verkuil wrote:
> >>>>> +
> >>>>> +int vidsw_g_mbus_config(struct v4l2_subdev *sd, struct
> >>>>> v4l2_mbus_config
> >>>>> *cfg)
> >>>>> +{
> >>>>> +	struct vidsw *vidsw = v4l2_subdev_to_vidsw(sd);
> >>>>> +	struct media_pad *pad;
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	if (vidsw->active == -1) {
> >>>>> +		dev_err(sd->dev, "no configuration for inactive 
mux\n");
> >>>>> +		return -EINVAL;
> >>>>> +	}
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * Retrieve media bus configuration from the entity connected 
to the
> >>>>> +	 * active input
> >>>>> +	 */
> >>>>> +	pad = media_entity_remote_pad(&vidsw->pads[vidsw->active]);
> >>>>> +	if (pad) {
> >>>>> +		sd = media_entity_to_v4l2_subdev(pad->entity);
> >>>>> +		ret = v4l2_subdev_call(sd, video, g_mbus_config, cfg);
> >>>>> +		if (ret == -ENOIOCTLCMD)
> >>>>> +			pad = NULL;
> >>>>> +		else if (ret < 0) {
> >>>>> +			dev_err(sd->dev, "failed to get source
> >>>>> configuration\n");
> >>>>> +			return ret;
> >>>>> +		}
> >>>>> +	}
> >>>>> +	if (!pad) {
> >>>>> +		/* Mirror the input side on the output side */
> >>>>> +		cfg->type = vidsw->endpoint[vidsw->active].bus_type;
> >>>>> +		if (cfg->type == V4L2_MBUS_PARALLEL ||
> >>>>> +		    cfg->type == V4L2_MBUS_BT656)
> >>>>> +			cfg->flags = vidsw->endpoint[vidsw-
> >>>>> active].bus.parallel.flags;
> >>>>> +	}
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>> 
> >>>> I am not certain this op is needed at all. In the current kernel this
> >>>> op is only used by soc_camera, pxa_camera and omap3isp (somewhat
> >>>> dubious). Normally this information should come from the device tree
> >>>> and there should be no need for this op.
> >>>> 
> >>>> My (tentative) long-term plan was to get rid of this op.
> >>>> 
> >>>> If you don't need it, then I recommend it is removed.
> >> 
> >> Hi Hans, the imx-media driver was only calling g_mbus_config to the
> >> camera sensor, and it was doing that to determine the sensor's bus type.
> >> This info was already available from parsing a v4l2_of_endpoint from the
> >> sensor node. So it was simple to remove the g_mbus_config calls, and
> >> instead rely on the parsed sensor v4l2_of_endpoint.
> > 
> > That's not a good point.

(mea culpa, s/point/idea/)

> > The imx-media driver must not parse the sensor DT node as it is not aware
> > of what bindings the sensor is compatible with. Information must instead
> > be queried from the sensor subdev at runtime, through the g_mbus_config()
> > operation.
> > 
> > Of course, if you can get the information from the imx-media DT node,
> > that's certainly an option. It's only information provided by the sensor
> > driver that you have no choice but query using a subdev operation.
> 
> Shouldn't this come from the imx-media DT node? BTW, why is omap3isp using
> this?

It all depends on what type of information needs to be retrieved, and whether 
it can change at runtime or is fixed. Adding properties to the imx-media DT 
node is certainly fine as long as those properties describe the i.MX side.

In the omap3isp case, we use the operation to query whether parallel data 
contains embedded sync (BT.656) or uses separate h/v sync signals.

> The reason I am suspicious about this op is that it came from soc-camera and
> predates the DT. The contents of v4l2_mbus_config seems very much like a HW
> description to me, i.e. something that belongs in the DT.

Part of it is possibly outdated, but for buses that support multiple modes of 
operation (such as the parallel bus case described above) we need to make that 
information discoverable at runtime. Maybe this should be considered as 
related to Sakari's efforts to support VC/DT for CSI-2, and supported through 
the API he is working on.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
