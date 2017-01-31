From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Tue, 31 Jan 2017 15:43:22 -0800
Message-ID: <3a673cba-bbf6-5611-5857-4605797bf049@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <20170131004510.GQ27312@n2100.armlinux.org.uk>
 <951c1a08-c0f2-4333-b4bf-410de8dd863f@gmail.com>
 <20170131110027.GU27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170131110027.GU27312-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, robert.jarzmik-GANU6spQydw@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sudipm.m
List-Id: devicetree@vger.kernel.org



On 01/31/2017 03:00 AM, Russell King - ARM Linux wrote:
> On Mon, Jan 30, 2017 at 05:22:01PM -0800, Steve Longerbeam wrote:
>> I'm also having trouble finding a datasheet for it, but from what
>> I've read, it has a MIPI CSI-2 interface. It should work fine as long
>> as it presents a single source pad, registers asynchronously, and
>> sets its entity function to MEDIA_ENT_F_CAM_SENSOR.
> Yes, it is MIPI CSI-2, and yes it has a single source pad, registers
> asynchronously, but that's about as far as it goes.
>
> The structure is a camera sensor followed by some processing.  So just
> like the smiapp code, I've ended up with multiple subdevs describing
> each stage of the sensors pipeline.
>
> Just like smiapp, the camera sensor block (which is the very far end
> of the pipeline) is marked with MEDIA_ENT_F_CAM_SENSOR.  However, in
> front of that is the binner, which just like smiapp gets a separate
> entity.  It's this entity which is connected to the mipi-csi2 subdev.

wow, ok got it.

So the sensor pipeline and binner, and the OF graph connecting
them, are described in the device tree I presume.

The OF graph AFAIK, has no information about which ports are sinks
and which are sources, so of_parse_subdev() tries to determine that
based on the compatible string of the device node. So ATM
of_parse_subdev() assumes there is nothing but the imx6-mipi-csi2,
video-multiplexer, and camera sensors upstream from the CSI ports
in the OF graph.

I realize that's not a robust solution, and is the reason for the
"no sensor attached" below.

Is there any way to determine from the OF graph the data-direction
of a port (whether it is a sink or a source)? If so it will make
of_parse_subdev() much more robust.

Steve

>
> Unlike smiapp, which does not set an entity function, I set my binner
> entity as MEDIA_ENT_F_PROC_VIDEO_SCALER on the basis that that is
> what V4L2 documentation recommend:
>
>      -  ..  row 27
>
>         ..  _MEDIA-ENT-F-PROC-VIDEO-SCALER:
>
>         -  ``MEDIA_ENT_F_PROC_VIDEO_SCALER``
>
>         -  Video scaler. An entity capable of video scaling must have
>            at least one sink pad and one source pad, and scale the
>            video frame(s) received on its sink pad(s) to a different
>            resolution output on its source pad(s). The range of
>            supported scaling ratios is entity-specific and can differ
>            between the horizontal and vertical directions (in particular
>            scaling can be supported in one direction only). Binning and
>            skipping are considered as scaling.
>
> This causes attempts to configure the ipu1_csi0 interface to fail:
>
> media-ctl -v -d /dev/media1 --set-v4l2 '"ipu1_csi0":1[fmt:SGBRG8/512x512@1/30]'
> Opening media device /dev/media1
> Enumerating entities
> Found 29 entities
> Enumerating pads and links
> Setting up format SGBRG8 512x512 on pad ipu1_csi0/1
> Unable to set format: No such device (-19)
> Unable to setup formats: No such device (19)
>
> and in the kernel log:
>
> ipu1_csi0: no sensor attached
>
> And yes, I already know that my next problem is going to be that the bayer
> formats are not supported in your driver (just like Philipp's driver) but
> adding them should not be difficult... but only once this issue is resolved.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
