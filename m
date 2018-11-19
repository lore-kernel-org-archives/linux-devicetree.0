From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2 06/12] drm/sun4i: sun6i_mipi_dsi: Probe
 tcon0 during dsi_bind
Date: Mon, 19 Nov 2018 17:06:32 +0530
Message-ID: <CAMty3ZCsEYFJOQAFTf3FspQWMzD-tiW_njuyCJ950RZ=Y6apEw@mail.gmail.com>
References: <20181116163916.29621-1-jagan@amarulasolutions.com>
 <20181116163916.29621-7-jagan@amarulasolutions.com> <20181119083833.d7ysiv3tenabtrdj@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBTOAZLPQKGQEKUOQRKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181119083833.d7ysiv3tenabtrdj@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, TL Lim <tllim-F7SikzrIcFYdnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 2:08 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Fri, Nov 16, 2018 at 10:09:10PM +0530, Jagan Teki wrote:
> > Probe tcon0 during dsi_bind, so-that the tcon attributes like
> > divider value, clock rate can get whenever it need.
> >
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 7 +++++++
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h | 1 +
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index d60955880c43..66a01061e51d 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -25,6 +25,7 @@
> >  #include <drm/drm_panel.h>
> >
> >  #include "sun4i_drv.h"
> > +#include "sun4i_tcon.h"
> >  #include "sun6i_mipi_dsi.h"
> >
> >  #include <video/mipi_display.h>
> > @@ -1007,6 +1008,7 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> >       struct drm_device *drm = data;
> >       struct sun4i_drv *drv = drm->dev_private;
> >       struct sun6i_dsi *dsi = dev_get_drvdata(dev);
> > +     struct sun4i_tcon *tcon0 = sun4i_get_tcon0(drm);
> >       int ret;
> >
> >       if (!dsi->panel)
> > @@ -1014,6 +1016,11 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> >
> >       dsi->drv = drv;
> >
> > +     if (!tcon0)
> > +             return -EPROBE_DEFER;
>
> You can't fall in that condition. The component framework won't call
> bind unless every components have been probed.

Since tcon0 is already probed is it? if so I can return -EINVAL is it ok?
