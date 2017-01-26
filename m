From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] drm: zte: add tvenc driver support
Date: Thu, 26 Jan 2017 23:06:55 +0800
Message-ID: <20170126150653.GD5662@dragon>
References: <1484843100-16284-1-git-send-email-shawnguo@kernel.org>
 <1484843100-16284-6-git-send-email-shawnguo@kernel.org>
 <20170123161034.GE19505@trickycodes.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170123161034.GE19505-6JpoNmjd1+aEBhuJAZrboHoUN1GumTyQ7j82oEJ37pA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 23, 2017 at 11:10:34AM -0500, Sean Paul wrote:
> > +static const struct zx_tvenc_mode tvenc_modes[] = {
> > +	{
> > +		.name = "PAL",
> > +		.hdisplay = 720,
> > +		.vdisplay = 576,
> > +		.hfp = 12,
> > +		.hbp = 130,
> > +		.hsw = 2,
> > +		.vfp = 2,
> > +		.vbp = 20,
> > +		.vsw = 2,
> > +		.video_info = 0x00040040,
> > +		.video_res = 0x05a9c760,
> > +		.field1_param = 0x0004d416,
> > +		.field2_param = 0x0009b94f,
> > +		.burst_line_odd1 = 0x0004d406,
> > +		.burst_line_even1 = 0x0009b53e,
> > +		.burst_line_odd2 = 0x0004d805,
> > +		.burst_line_even2 = 0x0009b93f,
> > +		.line_timing_param = 0x06a96fdf,
> > +		.weight_value = 0x00c188a0,
> > +		.blank_black_level = 0x0000fcfc,
> > +		.burst_level = 0x00001595,
> > +		.control_param = 0x00000001,
> > +		.sub_carrier_phase1 = 0x1504c566,
> > +		.phase_line_incr_cvbs = 0xc068db8c,
> 
> I don't suppose you can derive these magic values from the mode?

No, we have no way to derive these register values from the mode
parameters.  The registers contain a lot of hardware specific
configurations which need to be set up differently per PAL or NTSC.

All other comments will be addressed in v2.  Thanks for the review
effort.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
