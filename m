From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 04/12] drm/sun4i: sun6i_mipi_dsi:
 Simplify drq set to support all modes
Date: Tue, 20 Nov 2018 15:32:29 +0100
Message-ID: <20181120143229.ncx3hk2manc7hnwl@flea>
References: <20181116163916.29621-1-jagan@amarulasolutions.com>
 <20181116163916.29621-5-jagan@amarulasolutions.com>
 <20181119083243.4njj2p2sy2xf2zyf@flea>
 <CAMty3ZAKL2fZqwLwd_WiQpzz+cOETMR7ES7HQsBo3PsAvjM+6A@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uo3r5ydwcsdb7jg4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7VV2DPQKGQEHZL2PYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZAKL2fZqwLwd_WiQpzz+cOETMR7ES7HQsBo3PsAvjM+6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, TL Lim <tllim-F7SikzrIcFYdnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uo3r5ydwcsdb7jg4
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Nov 19, 2018 at 04:52:17PM +0530, Jagan Teki wrote:
> On Mon, Nov 19, 2018 at 2:02 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Fri, Nov 16, 2018 at 10:09:08PM +0530, Jagan Teki wrote:
> > > Allwinner MIPI DSI DRQ set value can be varied with respective
> > > video modes.
> > > - burst mode the set value is always 0
> > > - video modes whose front porch greater than 20, the set value
> > >   can be computed based front porch and bpp.
> > > - video modes whose front porch is not greater than 20, the set value
> > >   is simply 0
> > >
> > > This patch simplifies existing drq set value code by grouping
> > > into sun6i_dsi_get_drq and support all video modes.
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 38 ++++++++++++++++----------
> > >  1 file changed, 23 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > index efd08bfd0cb8..d60955880c43 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > @@ -363,6 +363,26 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
> > >                    SUN6I_DSI_INST_JUMP_CFG_NUM(1));
> > >  };
> > >
> > > +static int sun6i_dsi_get_drq(struct sun6i_dsi *dsi,
> > > +                           struct drm_display_mode *mode)
> > > +{
> > > +     struct mipi_dsi_device *device = dsi->device;
> > > +     int drq = 0;
> >
> > So, here, you declaring a variable called drq, set to 0.
> >
> > > +     if (device->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> > > +             return drq;
> >
> > That you return here. You could just return 0, to be clearer.
> >
> > > +     if ((mode->hsync_start - mode->hdisplay) > 20) {
> > > +             /* Maaaaaagic */
> > > +             u16 drq = (mode->hsync_start - mode->hdisplay) - 20;
> >
> > You re-declare a variable with the same name here, but a different
> > type....
> >
> > > +             drq *= mipi_dsi_pixel_format_to_bpp(device->format);
> > > +             drq /= 32;
> > > +     }
> > > +
> > > +     return drq;
> >
> > And then return the first one? How is that even working?
> 
> Will fix this.

I don't want you to only fix this, I also want you to contribute code
that is A) useful, B) tested.

> > >  static u16 sun6i_dsi_get_timings_vblk(struct sun6i_dsi *dsi,
> > >                                     struct drm_display_mode *mode, u16 hblk)
> > >  {
> > > @@ -478,21 +498,9 @@ static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
> > >  static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
> > >                                 struct drm_display_mode *mode)
> > >  {
> > > -     struct mipi_dsi_device *device = dsi->device;
> > > -     u32 val = 0;
> > > -
> > > -     if ((mode->hsync_start - mode->hdisplay) > 20) {
> > > -             /* Maaaaaagic */
> > > -             u16 drq = (mode->hsync_start - mode->hdisplay) - 20;
> > > -
> > > -             drq *= mipi_dsi_pixel_format_to_bpp(device->format);
> > > -             drq /= 32;
> > > -
> > > -             val = (SUN6I_DSI_TCON_DRQ_ENABLE_MODE |
> > > -                    SUN6I_DSI_TCON_DRQ_SET(drq));
> > > -     }
> > > -
> > > -     regmap_write(dsi->regs, SUN6I_DSI_TCON_DRQ_REG, val);
> > > +     regmap_write(dsi->regs, SUN6I_DSI_TCON_DRQ_REG,
> > > +                  SUN6I_DSI_TCON_DRQ_ENABLE_MODE |
> > > +                  SUN6I_DSI_TCON_DRQ_SET(sun6i_dsi_get_drq(dsi, mode)));
> >
> > On top of that, you now enable the DRQ stuff all the time, while it
> 
> Earlier the val value is ENABLE_MODE ORed with drq value. for the
> condition drq is computed in if block otherwise the val is 0.
> So as I explained in commit message the drq value is 0
> - for video modes whose front porch is not greater than 20 and
> - for burst mode the val
> 
> ie reason I mode it common.

The previous code was enabling it if the front porch was larger than
20 only. You enable it all the time now, and you never explain why.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--uo3r5ydwcsdb7jg4--
