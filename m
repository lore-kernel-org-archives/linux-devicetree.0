From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Sat, 11 Mar 2017 00:37:14 +0200
Message-ID: <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
References: <1487211578-11360-15-git-send-email-steve_longerbeam@mentor.com>
 <20170302160257.GK3220@valkosipuli.retiisi.org.uk>
 <20170303230645.GR21222@n2100.armlinux.org.uk>
 <20170304131329.GV3220@valkosipuli.retiisi.org.uk>
 <a7b8e095-a95c-24bd-b1e9-e983f18061c4@xs4all.nl>
 <20170310130733.GU21222@n2100.armlinux.org.uk>
 <c679f755-52a6-3c6f-3d65-277db46676cc@xs4all.nl>
 <20170310140124.GV21222@n2100.armlinux.org.uk>
 <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
 <20170310125342.7f047acf@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170310125342.7f047acf-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree@v
List-Id: devicetree@vger.kernel.org

Hi Mauro (and others),

On Fri, Mar 10, 2017 at 12:53:42PM -0300, Mauro Carvalho Chehab wrote:
> Em Fri, 10 Mar 2017 15:20:48 +0100
> Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> escreveu:
> 
> > 
> > > As I've already mentioned, from talking about this with Mauro, it seems
> > > Mauro is in agreement with permitting the control inheritence... I wish
> > > Mauro would comment for himself, as I can't quote our private discussion
> > > on the subject.  
> > 
> > I can't comment either, not having seen his mail and reasoning.
> 
> The rationale is that we should support the simplest use cases first.
> 
> In the case of the first MC-based driver (and several subsequent
> ones), the simplest use case required MC, as it was meant to suport
> a custom-made sophisticated application that required fine control
> on each component of the pipeline and to allow their advanced
> proprietary AAA userspace-based algorithms to work.

The first MC based driver (omap3isp) supports what the hardware can do, it
does not support applications as such.

Adding support to drivers for different "operation modes" --- this is
essentially what is being asked for --- is not an approach which could serve
either purpose (some functionality with simple interface vs. fully support
what the hardware can do, with interfaces allowing that) adequately in the
short or the long run.

If we are missing pieces in the puzzle --- in this case the missing pieces
in the puzzle are a generic pipeline configuration library and another
library that, with the help of pipeline autoconfiguration would implement
"best effort" service for regular V4L2 on top of the MC + V4L2 subdev + V4L2
--- then these pieces need to be impelemented. The solution is
*not* to attempt to support different types of applications in each driver
separately. That will make writing drivers painful, error prone and is
unlikely ever deliver what either purpose requires.

So let's continue to implement the functionality that the hardware supports.
Making a different choice here is bound to create a lasting conflict between
having to change kernel interface behaviour and the requirement of
supporting new functionality that hasn't been previously thought of, pushing
away SoC vendors from V4L2 ecosystem. This is what we all do want to avoid.

As far as i.MX6 driver goes, it is always possible to implement i.MX6 plugin
for libv4l to perform this. This should be much easier than getting the
automatic pipe configuration library and the rest working, and as it is
custom for i.MX6, the resulting plugin may make informed technical choices
for better functionality. Jacek has been working on such a plugin for
Samsung Exynos hardware, but I don't think he has quite finished it yey.

The original plan was and continues to be sound, it's just that there have
always been too few hands to implement it. :-(

> 
> That's not true, for example, for the UVC driver. There, MC
> is optional, as it should be.

UVC is different. The device simply provides additional information through
MC to the user but MC (or V4L2 sub-device interface) is not used for
controlling the device.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
