From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 13/24] platform: add video-multiplexer subdevice driver
Date: Sun, 05 Feb 2017 17:48:46 +0200
Message-ID: <2258037.UCXsIYbtGD@avalon>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com> <1485259368.3600.126.camel@pengutronix.de> <651d7b40-e87d-05ce-ae4d-256b0c1b28f7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <651d7b40-e87d-05ce-ae4d-256b0c1b28f7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel@driv
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Tuesday 24 Jan 2017 18:07:55 Steve Longerbeam wrote:
> On 01/24/2017 04:02 AM, Philipp Zabel wrote:
> > On Fri, 2017-01-20 at 15:03 +0100, Hans Verkuil wrote:
> >>> +
> >>> +int vidsw_g_mbus_config(struct v4l2_subdev *sd, struct v4l2_mbus_config
> >>> *cfg)
> >>> +{
> >>> +	struct vidsw *vidsw = v4l2_subdev_to_vidsw(sd);
> >>> +	struct media_pad *pad;
> >>> +	int ret;
> >>> +
> >>> +	if (vidsw->active == -1) {
> >>> +		dev_err(sd->dev, "no configuration for inactive mux\n");
> >>> +		return -EINVAL;
> >>> +	}
> >>> +
> >>> +	/*
> >>> +	 * Retrieve media bus configuration from the entity connected to the
> >>> +	 * active input
> >>> +	 */
> >>> +	pad = media_entity_remote_pad(&vidsw->pads[vidsw->active]);
> >>> +	if (pad) {
> >>> +		sd = media_entity_to_v4l2_subdev(pad->entity);
> >>> +		ret = v4l2_subdev_call(sd, video, g_mbus_config, cfg);
> >>> +		if (ret == -ENOIOCTLCMD)
> >>> +			pad = NULL;
> >>> +		else if (ret < 0) {
> >>> +			dev_err(sd->dev, "failed to get source 
configuration\n");
> >>> +			return ret;
> >>> +		}
> >>> +	}
> >>> +	if (!pad) {
> >>> +		/* Mirror the input side on the output side */
> >>> +		cfg->type = vidsw->endpoint[vidsw->active].bus_type;
> >>> +		if (cfg->type == V4L2_MBUS_PARALLEL ||
> >>> +		    cfg->type == V4L2_MBUS_BT656)
> >>> +			cfg->flags = vidsw->endpoint[vidsw-
>active].bus.parallel.flags;
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}
> >> 
> >> I am not certain this op is needed at all. In the current kernel this op
> >> is only used by soc_camera, pxa_camera and omap3isp (somewhat dubious).
> >> Normally this information should come from the device tree and there
> >> should be no need for this op.
> >> 
> >> My (tentative) long-term plan was to get rid of this op.
> >> 
> >> If you don't need it, then I recommend it is removed.
> 
> Hi Hans, the imx-media driver was only calling g_mbus_config to the camera
> sensor, and it was doing that to determine the sensor's bus type. This info
> was already available from parsing a v4l2_of_endpoint from the sensor node.
> So it was simple to remove the g_mbus_config calls, and instead rely on the
> parsed sensor v4l2_of_endpoint.

That's not a good point. The imx-media driver must not parse the sensor DT 
node as it is not aware of what bindings the sensor is compatible with. 
Information must instead be queried from the sensor subdev at runtime, through 
the g_mbus_config() operation.

Of course, if you can get the information from the imx-media DT node, that's 
certainly an option. It's only information provided by the sensor driver that 
you have no choice but query using a subdev operation.

> > We currently use this to make the CSI capture interface understand
> > whether its source from the MIPI CSI-2 or from the parallel bus. That is
> > probably something that should be fixed, but I'm not quite sure how.
> > 
> > The Synopsys DesignWare MIPI CSI-2 reciever turns the incoming MIPI
> > CSI-2 signal into a 32-bit parallel pixel bus plus some signals for the
> > MIPI specific metadata (virtual channel, data type).
> > 
> > Then the CSI2IPU gasket turns this input bus into four separate parallel
> > 16-bit pixel buses plus an 8-bit "mct_di" bus for each of them, that
> > carries the MIPI metadata. The incoming data is split into the four
> > outputs according to the MIPI virtual channel.
> > 
> > Two of these 16-bit + 8-bit parallel buses are routed through a
> > multiplexer before finally arriving at the CSI on the other side.
> > 
> > We need to configure the CSI to either use or ignore the data from the
> > 8-bit mct_di bus depending on whether the source of the mux is
> > configured to the MIPI CSI-2 receiver / CSI2IPU gasket, or to a parallel
> > input.
> 
> Philipp, from my experience, the CSI_MIPI_DI register (configured
> by ipu_csi_set_mipi_datatype()) can only be given a virtual channel 0,
> otherwise no data is received from the MIPI CSI-2 sensor, regardless
> of the virtual channel the sensor is transmitting over.
> 
> So it seems the info on the 8-bit mct_di buses generated by the CSI2IPU
> gasket are ignored by the CSI's, at least the virtual channel number is
> ignored.
> 
> For example, if the sensor is transmitting on vc 1, the gasket routes
> the sensor data to the parallel bus to CSI1. But if CSI_MIPI_DI on CSI1
> is written with vc 1, no data is received.
> 
> Steve
> 
> > Currently we let g_mbus_config pretend that even the internal 32-bit +
> > metadata and 16-bit + 8-bit metadata parallel buses are of type
> > V4L2_MBUS_CSI so that the CSI can ask the mux, which propagates to the
> > CSI-2 receiver, if connected.
> > 
> > Without g_mbus_config we'd need to get that information from somewhere
> > else. One possibility would be to extend MEDIA_BUS formats to describe
> > these "parallelized MIPI data" buses separately.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
