From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 29/36] media: imx: mipi-csi2: enable setting and
 getting of frame rates
Date: Tue, 21 Feb 2017 09:50:23 +0100
Message-ID: <1487667023.2331.8.camel@pengutronix.de>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
         <1487211578-11360-30-git-send-email-steve_longerbeam@mentor.com>
         <20170220220409.GX16975@valkosipuli.retiisi.org.uk>
         <20170221001332.GS21222@n2100.armlinux.org.uk>
         <25596b21-70de-5e46-f149-f9ce3a86ecb7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <25596b21-70de-5e46-f149-f9ce3a86ecb7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-02-20 at 16:18 -0800, Steve Longerbeam wrote:
> 
> On 02/20/2017 04:13 PM, Russell King - ARM Linux wrote:
> > On Tue, Feb 21, 2017 at 12:04:10AM +0200, Sakari Ailus wrote:
> >> On Wed, Feb 15, 2017 at 06:19:31PM -0800, Steve Longerbeam wrote:
> >>> From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> >>>
> >>> Setting and getting frame rates is part of the negotiation mechanism
> >>> between subdevs.  The lack of support means that a frame rate at the
> >>> sensor can't be negotiated through the subdev path.
> >>
> >> Just wondering --- what do you need this for?
> >
> > The v4l2 documentation contradicts the media-ctl implementation.
> >
> > While v4l2 documentation says:
> >
> >   These ioctls are used to get and set the frame interval at specific
> >   subdev pads in the image pipeline. The frame interval only makes sense
> >   for sub-devices that can control the frame period on their own. This
> >   includes, for instance, image sensors and TV tuners. Sub-devices that
> >   don't support frame intervals must not implement these ioctls.
> >
> > However, when trying to configure the pipeline using media-ctl, eg:
> >
> > media-ctl -d /dev/media1 --set-v4l2 '"imx219 pixel 0-0010":0[crop:(0,0)/3264x2464]'
> > media-ctl -d /dev/media1 --set-v4l2 '"imx219 0-0010":1[fmt:SRGGB10/3264x2464@1/30]'
> > media-ctl -d /dev/media1 --set-v4l2 '"imx219 0-0010":0[fmt:SRGGB8/816x616@1/30]'
> > media-ctl -d /dev/media1 --set-v4l2 '"imx6-mipi-csi2":1[fmt:SRGGB8/816x616@1/30]'
> > Unable to setup formats: Inappropriate ioctl for device (25)
> > media-ctl -d /dev/media1 --set-v4l2 '"ipu1_csi0_mux":2[fmt:SRGGB8/816x616@1/30]'
> > media-ctl -d /dev/media1 --set-v4l2 '"ipu1_csi0":2[fmt:SRGGB8/816x616@1/30]'
> >
> > The problem there is that the format setting for the csi2 does not get
> > propagated forward:
> >
> > $ strace media-ctl -d /dev/media1 --set-v4l2 '"imx6-mipi-csi2":1[fmt:SRGGB8/816x616@1/30]'
> > ...
> > open("/dev/v4l-subdev16", O_RDWR)       = 3
> > ioctl(3, VIDIOC_SUBDEV_S_FMT, 0xbec16244) = 0
> > ioctl(3, VIDIOC_SUBDEV_S_FRAME_INTERVAL, 0xbec162a4) = -1 ENOTTY (Inappropriate
> > ioctl for device)
> > fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(136, 2), ...}) = 0
> > write(1, "Unable to setup formats: Inappro"..., 61) = 61
> > Unable to setup formats: Inappropriate ioctl for device (25)
> > close(3)                                = 0
> > exit_group(1)                           = ?
> > +++ exited with 1 +++
> >
> > because media-ctl exits as soon as it encouters the error while trying
> > to set the frame rate.
> >
> > This makes implementing setup of the media pipeline in shell scripts
> > unnecessarily difficult - as you need to then know whether an entity
> > is likely not to support the VIDIOC_SUBDEV_S_FRAME_INTERVAL call,
> > and either avoid specifying a frame rate:
> >
> > $ strace media-ctl -d /dev/media1 --set-v4l2 '"imx6-mipi-csi2":1[fmt:SRGGB8/816x616]'
> > ...
> > open("/dev/v4l-subdev16", O_RDWR)       = 3
> > ioctl(3, VIDIOC_SUBDEV_S_FMT, 0xbeb1a254) = 0
> > open("/dev/v4l-subdev0", O_RDWR)        = 4
> > ioctl(4, VIDIOC_SUBDEV_S_FMT, 0xbeb1a254) = 0
> > close(4)                                = 0
> > close(3)                                = 0
> > exit_group(0)                           = ?
> > +++ exited with 0 +++
> >
> > or manually setting the format on the sink.
> >
> > Allowing the S_FRAME_INTERVAL call seems to me to be more in keeping
> > with the negotiation mechanism that is implemented in subdevs, and
> > IMHO should be implemented inside the kernel as a pad operation along
> > with the format negotiation, especially so as frame skipping is
> > defined as scaling, in just the same way as the frame size is also
> > scaling:
> >
> >        -  ``MEDIA_ENT_F_PROC_VIDEO_SCALER``
> >
> >        -  Video scaler. An entity capable of video scaling must have
> >           at least one sink pad and one source pad, and scale the
> >           video frame(s) received on its sink pad(s) to a different
> >           resolution output on its source pad(s). The range of
> >           supported scaling ratios is entity-specific and can differ
> >           between the horizontal and vertical directions (in particular
> >           scaling can be supported in one direction only). Binning and
> >           skipping are considered as scaling.
> >
> > Although, this is vague, as it doesn't define what it means by "skipping",
> > whether that's skipping pixels (iow, sub-sampling) or whether that's
> > frame skipping.

I'd interpret this as meaning pixel skipping, not frame skipping.

> > Then there's the issue where, if you have this setup:
> >
> >  camera --> csi2 receiver --> csi --> capture
> >
> > and the "csi" subdev can skip frames, you need to know (a) at the CSI
> > sink pad what the frame rate is of the source (b) what the desired
> > source pad frame rate is, so you can configure the frame skipping.
> > So, does the csi subdev have to walk back through the media graph
> > looking for the frame rate?  Does the capture device have to walk back
> > through the media graph looking for some subdev to tell it what the
> > frame rate is - the capture device certainly can't go straight to the
> > sensor to get an answer to that question, because that bypasses the
> > effect of the CSI frame skipping (which will lower the frame rate.)
> >
> > IMHO, frame rate is just another format property, just like the
> > resolution and data format itself, and v4l2 should be treating it no
> > differently.
> >
> 
> I agree, frame rate, if indicated/specified by both sides of a link,
> should match. So maybe this should be part of v4l2 link validation.
> 
> This might be a good time to propose the following patch.

I agree with Steve and Russell. I don't see why the (nominal) frame
interval should be handled differently than resolution, data format, and
colorspace information. I think it should just be propagated in the same
way, and there is no reason to have two connected pads set to a
different interval. That would make implementing the g/s_frame_interval
subdev calls mandatory.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
