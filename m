From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v4 29/36] media: imx: mipi-csi2: enable setting and
 getting of frame rates
Date: Mon, 13 Mar 2017 23:03:50 +0200
Message-ID: <20170313210349.GD10701@valkosipuli.retiisi.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-30-git-send-email-steve_longerbeam@mentor.com>
 <20170220220409.GX16975@valkosipuli.retiisi.org.uk>
 <20170221001332.GS21222@n2100.armlinux.org.uk>
 <25596b21-70de-5e46-f149-f9ce3a86ecb7@gmail.com>
 <1487667023.2331.8.camel@pengutronix.de>
 <20170313131647.GB10701@valkosipuli.retiisi.org.uk>
 <20170313132701.GJ21222@n2100.armlinux.org.uk>
 <1489413301.2288.53.camel@pengutronix.de>
 <27397114-7d77-2353-c526-bddd5f5297d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <27397114-7d77-2353-c526-bddd5f5297d9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Mon, Mar 13, 2017 at 11:06:22AM -0700, Steve Longerbeam wrote:
> 
> 
> On 03/13/2017 06:55 AM, Philipp Zabel wrote:
> >On Mon, 2017-03-13 at 13:27 +0000, Russell King - ARM Linux wrote:
> >>On Mon, Mar 13, 2017 at 03:16:48PM +0200, Sakari Ailus wrote:
> >>>The vast majority of existing drivers do not implement them nor the user
> >>>space expects having to set them. Making that mandatory would break existing
> >>>user space.
> >>>
> >>>In addition, that does not belong to link validation either: link validation
> >>>should only include static properties of the link that are required for
> >>>correct hardware operation. Frame rate is not such property: hardware that
> >>>supports the MC interface generally does not recognise such concept (with
> >>>the exception of some sensors). Additionally, it is dynamic: the frame rate
> >>>can change during streaming, making its validation at streamon time useless.
> >>
> >>So how do we configure the CSI, which can do frame skipping?
> >>
> >>With what you're proposing, it means it's possible to configure the
> >>camera sensor source pad to do 50fps.  Configure the CSI sink pad to
> >>an arbitary value, such as 30fps, and configure the CSI source pad to
> >>15fps.
> >>
> >>What you actually get out of the CSI is 25fps, which bears very little
> >>with the actual values used on the CSI source pad.
> >>
> >>You could say "CSI should ask the camera sensor" - well, that's fine
> >>if it's immediately downstream, but otherwise we'd need to go walking
> >>down the graph to find something that resembles its source - there may
> >>be mux and CSI2 interface subdev blocks in that path.  Or we just accept
> >>that frame rates are completely arbitary and bear no useful meaning what
> >>so ever.
> >
> >Which would include the frame interval returned by VIDIOC_G_PARM on the
> >connected video device, as that gets its information from the CSI output
> >pad's frame interval.
> >
> 
> I'm kinda in the middle on this topic. I agree with Sakari that
> frame rate can fluctuate, but that should only be temporary. If
> the frame rate permanently shifts from what a subdev reports via
> g_frame_interval, then that is a system problem. So I agree with
> Phillip and Russell that a link validation of frame interval still
> makes sense.
> 
> But I also have to agree with Sakari that a subdev that has no
> control over frame rate has no business implementing those ops.
> 
> And then I agree with Russell that for subdevs that do have control
> over frame rate, they would have to walk the graph to find the frame
> rate source.
> 
> So we're stuck in a broken situation: either the subdevs have to walk
> the graph to find the source of frame rate, or s_frame_interval
> would have to be mandatory and validated between pads, same as set_fmt.

It's not broken; what we are missing though is documentation on how to
control devices that can change the frame rate i.e. presumably drop frames
occasionally.

If you're doing something that hasn't been done before, it may be that new
documentation needs to be written to accomodate that use case. As we have an
existing interface (VIDIOC_SUBDEV_[GS]_FRAME_INTERVAL) it does make sense
to use that. What is not possible, though, is to mandate its use in link
validation everywhere.

If you had a hardware limitation that would require that the frame rate is
constant, then we'd need to handle that in link validation for that
particular piece of hardware. But there really is no case for doing that for
everything else.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
