From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 18/36] media: Add i.MX media core driver
Date: Fri, 17 Feb 2017 09:34:36 +0100
Message-ID: <1487320476.3107.5.camel@pengutronix.de>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
         <1487211578-11360-19-git-send-email-steve_longerbeam@mentor.com>
         <1487250123.2377.53.camel@pengutronix.de>
         <c22dfd68-a41c-08d2-4b8d-c7ee1884ea31@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c22dfd68-a41c-08d2-4b8d-c7ee1884ea31-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-02-16 at 17:33 -0800, Steve Longerbeam wrote:
> 
> On 02/16/2017 05:02 AM, Philipp Zabel wrote:
> > On Wed, 2017-02-15 at 18:19 -0800, Steve Longerbeam wrote:
> <snip>
> >> +
> >> +- Clean up and move the ov5642 subdev driver to drivers/media/i2c, and
> >> +  create the binding docs for it.
> >
> > This is done already, right?
> 
> 
> I cleaned up ov5640 and moved it to drivers/media/i2c with binding docs,
> but not the ov5642 yet.

Ok, thanks.

> >> +- The Frame Interval Monitor could be exported to v4l2-core for
> >> +  general use.
> >> +
> >> +- The subdev that is the original source of video data (referred to as
> >> +  the "sensor" in the code), is called from various subdevs in the
> >> +  pipeline in order to set/query the video standard ({g|s|enum}_std)
> >> +  and to get/set the original frame interval from the capture interface
> >> +  ([gs]_parm). Instead, the entities that need this info should call its
> >> +  direct neighbor, and the neighbor should propagate the call to its
> >> +  neighbor in turn if necessary.
> >
> > Especially the [gs]_parm fix is necessary to present userspace with the
> > correct frame interval in case of frame skipping in the CSI.
> 
> 
> Right, understood. I've added this to list of fixes for version 5.
> 
> What a pain though! It means propagating every call to g_frame_interval
> upstream until a subdev "that cares" returns ret == 0 or
> ret != -ENOIOCTLCMD. And that goes for any other chained subdev call
> as well.

Not at all. Since the frame interval is a property of the pad, that had
to be propagated downstream by media-ctl along with media bus format,
frame size, and colorimetry earlier.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
