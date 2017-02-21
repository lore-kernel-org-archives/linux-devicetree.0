From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v4 29/36] media: imx: mipi-csi2: enable setting and
 getting of frame rates
Date: Tue, 21 Feb 2017 18:15:19 +0200
Message-ID: <20170221161518.GM16975@valkosipuli.retiisi.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-30-git-send-email-steve_longerbeam@mentor.com>
 <20170220220409.GX16975@valkosipuli.retiisi.org.uk>
 <20170221001332.GS21222@n2100.armlinux.org.uk>
 <20170221123756.GI16975@valkosipuli.retiisi.org.uk>
 <20170221132132.GU21222@n2100.armlinux.org.uk>
 <20170221153834.GL16975@valkosipuli.retiisi.org.uk>
 <20170221160332.GW21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170221160332.GW21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWNGWvitb5QawA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 21, 2017 at 04:03:32PM +0000, Russell King - ARM Linux wrote:
> On Tue, Feb 21, 2017 at 05:38:34PM +0200, Sakari Ailus wrote:
> > Hi Russell,
> > 
> > On Tue, Feb 21, 2017 at 01:21:32PM +0000, Russell King - ARM Linux wrote:
> > > On Tue, Feb 21, 2017 at 02:37:57PM +0200, Sakari Ailus wrote:
> > > > Hi Russell,
> > > > 
> > > > On Tue, Feb 21, 2017 at 12:13:32AM +0000, Russell King - ARM Linux wrote:
> > > > > On Tue, Feb 21, 2017 at 12:04:10AM +0200, Sakari Ailus wrote:
> > > > > > On Wed, Feb 15, 2017 at 06:19:31PM -0800, Steve Longerbeam wrote:
> > > > > > > From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> > > > > > > 
> > > > > > > Setting and getting frame rates is part of the negotiation mechanism
> > > > > > > between subdevs.  The lack of support means that a frame rate at the
> > > > > > > sensor can't be negotiated through the subdev path.
> > > > > > 
> > > > > > Just wondering --- what do you need this for?
> > > > > 
> > > > > The v4l2 documentation contradicts the media-ctl implementation.
> > > > > 
> > > > > While v4l2 documentation says:
> > > > > 
> > > > >   These ioctls are used to get and set the frame interval at specific
> > > > >   subdev pads in the image pipeline. The frame interval only makes sense
> > > > >   for sub-devices that can control the frame period on their own. This
> > > > >   includes, for instance, image sensors and TV tuners. Sub-devices that
> > > > >   don't support frame intervals must not implement these ioctls.
> > > > > 
> > > > > However, when trying to configure the pipeline using media-ctl, eg:
> > > > > 
> > > > > media-ctl -d /dev/media1 --set-v4l2 '"imx219 pixel 0-0010":0[crop:(0,0)/3264x2464]'
> > > > > media-ctl -d /dev/media1 --set-v4l2 '"imx219 0-0010":1[fmt:SRGGB10/3264x2464@1/30]'
> > > > > media-ctl -d /dev/media1 --set-v4l2 '"imx219 0-0010":0[fmt:SRGGB8/816x616@1/30]'
> > > > > media-ctl -d /dev/media1 --set-v4l2 '"imx6-mipi-csi2":1[fmt:SRGGB8/816x616@1/30]'
> > > > > Unable to setup formats: Inappropriate ioctl for device (25)
> > > > > media-ctl -d /dev/media1 --set-v4l2 '"ipu1_csi0_mux":2[fmt:SRGGB8/816x616@1/30]'
> > > > > media-ctl -d /dev/media1 --set-v4l2 '"ipu1_csi0":2[fmt:SRGGB8/816x616@1/30]'
> > > > > 
> > > > > The problem there is that the format setting for the csi2 does not get
> > > > > propagated forward:
> > > > 
> > > > The CSI-2 receivers typically do not implement frame interval IOCTLs as they
> > > > do not control the frame interval. Some sensors or TV tuners typically do,
> > > > so they implement these IOCTLs.
> > > 
> > > No, TV tuners do not.  The frame rate for a TV tuner is set by the
> > > broadcaster, not by the tuner.  The tuner can't change that frame rate.
> > > The tuner may opt to "skip" fields or frames.  That's no different from
> > > what the CSI block in my example below is capable of doing.
> > > 
> > > Treating a tuner differently from the CSI block is inconsistent and
> > > completely wrong.
> > 
> > I agree tuners in that sense are somewhat similar, and they are not treated
> > differently because they are tuners (and not CSI-2 receivers). Neither can
> > control the frame rate of the incoming video stream.
> > 
> > Conceivably a tuner could implement G_FRAME_INTERVAL IOCTL, but based on a
> > quick glance none appears to. Neither do CSI-2 receivers. Only sensor
> > drivers do currently.
> 
> Please look again.  I am being very careful with "CSI" vs "CSI-2" in my
> emails, you are conflating the two.
> 
> In all my emails so far, "CSI" refers to a block of hardware that is
> responsible for receiving an image stream from some kind of source.  It
> contains hardware that supports frame skipping.

Ah, I missed the difference. Thanks for pointing it out.

Still, that does not change how the skipping would work nor how I proposed
it would be configured from the user space.

> 
> "CSI-2" refers to a different block of hardware that is responsible for
> receiving a serially encoded stream from a MIPI-CSI-2 compliant source
> and providing it to the "CSI" block.
> 
> I would have thought my diagram that I drew would have made it clear that
> they were different blocks of hardware, but I guess in this case, the old
> saying "a picture is worth 1000 words" is simply not true.
> 
> > Images are transmitted as series of lines, with each line ending in a
> > horizontal blanking period, and each frame ending with a similar period of
> 
> I'm sorry, are you seriously teaching me to suck rocks?  I am insulted.
> 
> I've been involved in TV and video for many years, I don't need you to
> tell me how video is transmitted.
> 
> Sorry, you've just lost my interest in further discussion.

There's no need to feel insulted; that certainly was not the intention.

I've proposed you a solution, please comment on that.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
