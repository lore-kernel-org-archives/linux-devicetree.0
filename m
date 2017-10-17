From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 1/9] drm/panel: simple: add a macro for defining display
 modes in a simpler and less error prone way
Date: Tue, 17 Oct 2017 14:13:37 +0200
Message-ID: <20171017141337.088ba796@karo-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
        <1507721021-28174-2-git-send-email-LW@KARO-electronics.de>
        <20171017120818.GB684@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017120818.GB684@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 17 Oct 2017 14:08:18 +0200 Thierry Reding wrote:
> On Wed, Oct 11, 2017 at 01:23:33PM +0200, Lothar Waßmann wrote:
> > Create a macro that eases the definition of display mode parameters by
> > accecpting the parameters:
> > freq, hactive, hfront-porch, hsynclen, hback-porch,
> > vactive, vfront-porch, vsynclen, vback-porch, vrefresh
> > that can be usually directly taken from an LCD datasheet.
> > 
> > Put the calculations that are now open coded repeating the same
> > parameters multiple times into the macro expansion.
> > 
> > Signed-off-by: Lothar Waßmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 474fa75..dec639d 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -411,6 +411,20 @@ static const struct panel_desc ampire_am_480272h3tmqw_t01h = {
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> >  };
> >  
> > +#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, flgs) { \
> > +	.clock = freq,							\
> > +	.hdisplay = ha,							\
> > +	.hsync_start = (ha) + (hfp),					\
> > +	.hsync_end = (ha) + (hfp) + (hs),				\
> > +	.htotal = (ha) + (hfp) + (hs) + (hbp),				\
> > +	.vdisplay = (va),						\
> > +	.vsync_start = (va) + (vfp),					\
> > +	.vsync_end = (va) + (vfp) + (vs),				\
> > +	.vtotal = (va) + (vfp) + (vs) + (vbp),				\
> > +	.vrefresh = vr,							\
> > +	.flags = flgs,							\
> > +	}
> 
> I don't think this simplifies anything. It's now completely non-obvious
> which parameter is which, so you actually have to go look at the macro
> definition when you add a new mode to make sure you get them right.
> 
In the original code you have to repeat the same parameters (e.g.
vertical front porch (vfp)) in multiple places which is error prone.


Lothar Waßmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
