From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v7 16/34] [media] add Omnivision OV5640 sensor driver
Date: Thu, 1 Jun 2017 11:26:59 +0300
Message-ID: <20170601082659.GJ1019@valkosipuli.retiisi.org.uk>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
 <1495672189-29164-17-git-send-email-steve_longerbeam@mentor.com>
 <20170531195821.GA16962@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170531195821.GA16962@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel@l
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Wed, May 31, 2017 at 09:58:21PM +0200, Pavel Machek wrote:
> Hi!
> 
> > +/* min/typical/max system clock (xclk) frequencies */
> > +#define OV5640_XCLK_MIN  6000000
> > +#define OV5640_XCLK_MAX 24000000
> > +
> > +/*
> > + * FIXME: there is no subdev API to set the MIPI CSI-2
> > + * virtual channel yet, so this is hardcoded for now.
> > + */
> > +#define OV5640_MIPI_VC	1
> 
> Can the FIXME be fixed?

Yes, but it's quite a bit of work. It makes sense to use a static virtual
channel for now. A patchset which is however incomplete can be found here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=vc>

For what it's worth, all other devices use virtual channel zero for image
data and so should this one.

> 
> > +/*
> > + * image size under 1280 * 960 are SUBSAMPLING
> 
> -> Image
> 
> > + * image size upper 1280 * 960 are SCALING
> 
> above?
> 
> > +/*
> > + * FIXME: all of these register tables are likely filled with
> > + * entries that set the register to their power-on default values,
> > + * and which are otherwise not touched by this driver. Those entries
> > + * should be identified and removed to speed register load time
> > + * over i2c.
> > + */
> 
> load->loading? Can the FIXME be fixed?
> 
> > +	/* Auto/manual exposure */
> > +	ctrls->auto_exp = v4l2_ctrl_new_std_menu(hdl, ops,
> > +						 V4L2_CID_EXPOSURE_AUTO,
> > +						 V4L2_EXPOSURE_MANUAL, 0,
> > +						 V4L2_EXPOSURE_AUTO);
> > +	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops,
> > +					    V4L2_CID_EXPOSURE_ABSOLUTE,
> > +					    0, 65535, 1, 0);
> 
> Is exposure_absolute supposed to be in microseconds...?

Yes. OTOH V4L2_CID_EXPOSURE has no defined unit, so it's a better fit IMO.
Way more drivers appear to be using EXPOSURE than EXPOSURE_ABSOLUTE, too.

Ideally we should have only one control for exposure.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
