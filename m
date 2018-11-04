From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 01/10] drm/sun4i: sun6i_mipi_dsi: Compute
 burst mode loop N1 instruction delay
Date: Sun, 4 Nov 2018 22:15:12 +0530
Message-ID: <CAMty3ZBGR9bgoN2cidcFMhCTinOcGP11332CgCvi_UhvQBOQjw@mail.gmail.com>
References: <20181103100900.30313-1-jagan@amarulasolutions.com>
 <20181103100900.30313-2-jagan@amarulasolutions.com> <8365df14-3397-b395-48eb-3070da3b65fc@orpaltech.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBJOE7TPAKGQEFD2HKZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <8365df14-3397-b395-48eb-3070da3b65fc-RHPENKW2UW+1Z/+hSey0Gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Sergey Suloev <ssuloev-RHPENKW2UW+1Z/+hSey0Gg@public.gmane.org>
Cc: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, TL Lim <tllim-F7SikzrIcFYdnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 3, 2018 at 8:53 PM Sergey Suloev <ssuloev-RHPENKW2UW+1Z/+hSey0Gg@public.gmane.org> wrote:
>
> Hi, Jagan,
>
> On 11/3/18 1:08 PM, Jagan Teki wrote:
> > Loop N1 instruction delay for burst mode lcd panel are
> > computed as per BSP code.
> >
> > Reference code is available in BSP
> > (in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> > dsi_dev[sel]->dsi_inst_loop_num.bits.loop_n1=
> > (panel->lcd_ht-panel->lcd_x)*(150)/(panel->lcd_dclk_freq*8) - 50;
> > => (((mode->htotal - mode->hdisplay) * 150) / ((mode->clock / 1000) * 8)) - 50;
> >
> > So use the similar computation for loop N1 delay.
> >
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> >   drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 86430efd9054..da152c21ec62 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -394,7 +394,14 @@ static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
> >   static void sun6i_dsi_setup_inst_loop(struct sun6i_dsi *dsi,
> >                                     struct drm_display_mode *mode)
> >   {
> > -     u16 delay = 50 - 1;
> > +     struct mipi_dsi_device *device = dsi->device;
> > +     u16 delay;
> > +
> > +     if (device->mode_flags == MIPI_DSI_MODE_VIDEO_BURST)
> > +             delay = (((mode->htotal - mode->hdisplay) * 150) /
> > +                     ((mode->clock / 1000) * 8)) - 50;
> > +     else
> > +             delay = 50 - 1;
> >
> >       regmap_write(dsi->regs, SUN6I_DSI_INST_LOOP_NUM_REG(0),
> >                    SUN6I_DSI_INST_LOOP_NUM_N0(50 - 1) |
>
>
> is this patch series comes in addition to the previous MIPI DSI series
> or in its stead?

Yes, all changes were added on top of previous MIPI DSI series(ie what
I mentioned in cover-letter) since it require clock patches from
previous version.
