From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v2 16/26] drm: Add Allwinner A10 Display
 Engine support
Date: Sun, 17 Jan 2016 14:58:39 +0200
Message-ID: <1453035519.13209.1.camel@plaes.org>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1452785109-6172-17-git-send-email-maxime.ripard@free-electrons.com>
	 <1452957104.12419.12.camel@plaes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452957104.12419.12.camel-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2016-01-16 at 17:11 +0200, Priit Laes wrote:
> On Thu, 2016-01-14 at 16:24 +0100, Maxime Ripard wrote:
> > The Allwinner A10 and subsequent SoCs share the same display
> > pipeline, with
> > variations in the number of controllers (1 or 2), or the presence
> > or not of
> > some output (HDMI, TV, VGA) or not.
[...]
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
> > b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
> > new file mode 100644
> > index 000000000000..68072b8cddab
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
> > @@ -0,0 +1,54 @@
> > +/*
> > + * Copyright (C) 2015 Free Electrons
> > + * Copyright (C) 2015 NextThing Co
> > + *
> > + * Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
> > +
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drmP.h>
> > +
> > +#include "sun4i_drv.h"
> > +
> > +static void sun4i_de_output_poll_changed(struct drm_device *drm)
> > +{
> > +	struct sun4i_drv *drv =3D drm->dev_private;
> > +
> > +	if (drv->fbdev)
> > +		drm_fbdev_cma_hotplug_event(drv->fbdev);
> > +}
> > +
> > +static const struct drm_mode_config_funcs
> > sun4i_de_mode_config_funcs
> > =3D {
> > +	.output_poll_changed	=3D
> > sun4i_de_output_poll_changed,
> > +	.atomic_check		=3D drm_atomic_helper_check,
> > +	.atomic_commit		=3D drm_atomic_helper_commit,
> > +	.fb_create		=3D drm_fb_cma_create,
> > +};
> > +
> > +struct drm_fbdev_cma *sun4i_framebuffer_init(struct drm_device
> > *drm)
> > +{
> > +	drm_mode_config_reset(drm);
> > +
> > +	drm->mode_config.max_width =3D 8192;
> > +	drm->mode_config.max_height =3D 8192;
>=C2=A0
> Shouldn't these be 1920 x 1080 as per A10 User manual?

I was wrong here. 8192x8192 it is.

>

P=C3=A4ikest,
Priit Laes :)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
