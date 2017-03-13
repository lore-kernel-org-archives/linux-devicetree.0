From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 29/36] media: imx: mipi-csi2: enable setting and
 getting of frame rates
Date: Mon, 13 Mar 2017 14:55:01 +0100
Message-ID: <1489413301.2288.53.camel@pengutronix.de>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
         <1487211578-11360-30-git-send-email-steve_longerbeam@mentor.com>
         <20170220220409.GX16975@valkosipuli.retiisi.org.uk>
         <20170221001332.GS21222@n2100.armlinux.org.uk>
         <25596b21-70de-5e46-f149-f9ce3a86ecb7@gmail.com>
         <1487667023.2331.8.camel@pengutronix.de>
         <20170313131647.GB10701@valkosipuli.retiisi.org.uk>
         <20170313132701.GJ21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170313132701.GJ21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-a
List-Id: devicetree@vger.kernel.org

On Mon, 2017-03-13 at 13:27 +0000, Russell King - ARM Linux wrote:
> On Mon, Mar 13, 2017 at 03:16:48PM +0200, Sakari Ailus wrote:
> > The vast majority of existing drivers do not implement them nor the user
> > space expects having to set them. Making that mandatory would break existing
> > user space.
> > 
> > In addition, that does not belong to link validation either: link validation
> > should only include static properties of the link that are required for
> > correct hardware operation. Frame rate is not such property: hardware that
> > supports the MC interface generally does not recognise such concept (with
> > the exception of some sensors). Additionally, it is dynamic: the frame rate
> > can change during streaming, making its validation at streamon time useless.
> 
> So how do we configure the CSI, which can do frame skipping?
> 
> With what you're proposing, it means it's possible to configure the
> camera sensor source pad to do 50fps.  Configure the CSI sink pad to
> an arbitary value, such as 30fps, and configure the CSI source pad to
> 15fps.
> 
> What you actually get out of the CSI is 25fps, which bears very little
> with the actual values used on the CSI source pad.
> 
> You could say "CSI should ask the camera sensor" - well, that's fine
> if it's immediately downstream, but otherwise we'd need to go walking
> down the graph to find something that resembles its source - there may
> be mux and CSI2 interface subdev blocks in that path.  Or we just accept
> that frame rates are completely arbitary and bear no useful meaning what
> so ever.

Which would include the frame interval returned by VIDIOC_G_PARM on the
connected video device, as that gets its information from the CSI output
pad's frame interval.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
