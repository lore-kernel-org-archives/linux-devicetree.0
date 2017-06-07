From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v7 16/34] [media] add Omnivision OV5640 sensor driver
Date: Wed, 7 Jun 2017 15:31:16 +0300
Message-ID: <20170607123116.GB1019@valkosipuli.retiisi.org.uk>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
 <1495672189-29164-17-git-send-email-steve_longerbeam@mentor.com>
 <20170531195821.GA16962@amd>
 <20170601082659.GJ1019@valkosipuli.retiisi.org.uk>
 <755909bf-d1de-e0f3-1569-0d4b16e26817@gmail.com>
 <20170603195139.GA3062@amd>
 <20170603215709.GU1019@valkosipuli.retiisi.org.uk>
 <d51acbaa-0dc6-ce5c-5442-62c5c24ad6da@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d51acbaa-0dc6-ce5c-5442-62c5c24ad6da-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM9gwCICpdfJQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 03, 2017 at 09:46:36PM -0700, Steve Longerbeam wrote:
> 
> 
> On 06/03/2017 02:57 PM, Sakari Ailus wrote:
> >On Sat, Jun 03, 2017 at 09:51:39PM +0200, Pavel Machek wrote:
> >>Hi!
> >>
> >>>>>>+	/* Auto/manual exposure */
> >>>>>>+	ctrls->auto_exp = v4l2_ctrl_new_std_menu(hdl, ops,
> >>>>>>+						 V4L2_CID_EXPOSURE_AUTO,
> >>>>>>+						 V4L2_EXPOSURE_MANUAL, 0,
> >>>>>>+						 V4L2_EXPOSURE_AUTO);
> >>>>>>+	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops,
> >>>>>>+					    V4L2_CID_EXPOSURE_ABSOLUTE,
> >>>>>>+					    0, 65535, 1, 0);
> >>>>>
> >>>>>Is exposure_absolute supposed to be in microseconds...?
> >>>>
> >>>>Yes.
> >>>
> >>>According to the docs V4L2_CID_EXPOSURE_ABSOLUTE is in 100 usec units.
> >>>
> >>>  OTOH V4L2_CID_EXPOSURE has no defined unit, so it's a better fit IMO.
> >>>>Way more drivers appear to be using EXPOSURE than EXPOSURE_ABSOLUTE, too.
> >>>
> >>>Done, switched to V4L2_CID_EXPOSURE. It's true, this control is not
> >>>taking 100 usec units, so unit-less is better.
> >>
> >>Thanks. If you know the units, it would be of course better to use
> >>right units...
> >
> >Steve: what's the unit in this case? Is it lines or something else?
> 
> Yes, the register interface for exposure takes lines*16.
> 
> Maybe converting from seconds to lines is as simple as
> framerate * height * seconds. But I'm not sure about that.

The smiapp and a few other drivers are using lines. One option could be to
use lines as the unit and have step as 16.

Then the hblank + vblank controls will be needed, too, to enable the user to
at least figure out the conversion to Si units.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
