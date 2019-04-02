From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v8 01/15] drm/sun4i: dsi: Fix video start
 delay computation
Date: Tue, 2 Apr 2019 16:45:18 +0200
Message-ID: <20190402144518.bevb2vg64mprhtjt@flea>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
 <20190311133637.18334-2-jagan@amarulasolutions.com>
 <20190311153734.izg44ijwqqh2vpxc@flea>
 <CAMty3ZDDARP02qMJZ9CXeiMv=kghoiUHgEAV9b4q+SrbLss40Q@mail.gmail.com>
 <20190319102520.ldgjtyzrphuib3td@flea>
 <CAMty3ZC+dTVuc2TWR=cqKNbrZe6j2vnwfXAqg6RbvduvY_63LA@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="udtxcv6c7reia3ri"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBA7LRXSQKGQE5DEO5YY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZC+dTVuc2TWR=cqKNbrZe6j2vnwfXAqg6RbvduvY_63LA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--udtxcv6c7reia3ri
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Mar 21, 2019 at 08:08:58PM +0530, Jagan Teki wrote:
> On Tue, Mar 19, 2019 at 3:55 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Mon, Mar 11, 2019 at 09:31:11PM +0530, Jagan Teki wrote:
> > > On Mon, Mar 11, 2019 at 9:07 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > > >
> > > > On Mon, Mar 11, 2019 at 07:06:23PM +0530, Jagan Teki wrote:
> > > > > Vertical video start delay is computed by excluding vertical front
> > > > > porch value from total vertical timings.
> > > > >
> > > > > This clearly confirmed from BSP code and here how it computed,
> > > > >
> > > > > (drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> > > > > u32 vfp = panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;
> > > > > => (panel->lcd_vt) - panel->lcd_y - (panel->lcd_vbp)
> > > > > => (timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y)
> > > > >    - panel->lcd_y - (panel->lcd_vbp)
> > > > > => timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y
> > > > >                            - panel->lcd_y - panel->lcd_vbp
> > > > > => timmings->ver_front_porch
> > > > >
> > > > > But the current driver is assuming it can exclude vertical front
> > > > > porch along with vertical sync values from total vertical timings,
> > > > > which resulting wrong start delay indeed wrong picture rendering
> > > > > in the panel.
> > > >
> > > > Same story here: which panel, which datasheet, which "wrong picture
> > > > rendering"?
> > >
> > > It's bananapi,s070wv20-ct16 DSI
>
> 2. as I said before, it is the same panel for both RGB and DSI, and
> ICN6211 bridge is converter for RGB-to-DSI. we don't have any specific
> programming or detailed datasheet from this except BSP DSI panel
> sequence along with BSP panel timings which are similar to RGB one.
>
> 3. wrong picture rendering is something sprightliness followed by
> colors jerks, which I couldn't explain it properly ie reason I
> mentioned some generic term for understanding.

Some generic term doesn't explain anything, it barely makes a
statement.

> > You're answering one out of three questions.
> >
> > > > > Example: timings, where it produces the issue.
> > > > > {
> > > > >       .vdisplay       = 600,
> > > > >       .vsync_start    = 600 + 12,
> > > > >       .vsync_end      = 600 + 12 + 2,
> > > > >       .vtotal         = 600 + 12 + 2 + 21,
> > > > > }
> > > >
> > > > Can you 100% trust those timings?
> > >
> > > ie. reason, I have given the Mainline timings [1]. The above timings
> > > are wrongly mentioned actual timings are from [1]
> >
> > You're still answering partially here. Those timings are working for
> > RGB, you have no proof that we need to make the same adjustments for
> > DSI.
>
> It is RGB to DSI bridge on the same panel, as I explained above and it
> would shared same timings. I can confirm or proved it from BSP panel
> timings which are working. indeed same timings are been in Mainline
> tree, we can trust them atleast.

You're missing the point. If the bridge has a different tolerance
range to DSI timings for example, then you're screwed, even though the
timings work in RGB.

> > > > > It produces the desired start delay value as 19 but the correct working
> > > > > value should be 513.
> > > > >
> > > > > So, Fix it by computing proper video start delay.
> > > > >
> > > > > Fixes: 69006ef0ecb1 ("drm/sun4i: dsi: Change the start delay calculation")
> > > > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > > > ---
> > > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 ++++++++--
> > > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > index 62a508420227..8d6292c0158b 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > @@ -364,8 +364,14 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi *dsi,
> > > > >  static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
> > > > >                                          struct drm_display_mode *mode)
> > > > >  {
> > > > > -     u16 start = clamp(mode->vtotal - mode->vdisplay - 10, 8, 100);
> > > > > -     u16 delay = mode->vtotal - (mode->vsync_end - mode->vdisplay) + start;
> > > > > +     u16 delay = mode->vtotal - (mode->vsync_start - mode->vdisplay);
> > > > > +
> > > > > +     /**
> > > > > +      * BSP comment:
> > > > > +      * put start_delay to tcon. set ready sync early to dramfreq,
> > > > > +      * so set start_delay 1
> > > > > +      */
> > > >
> > > > That doesn't make any sense to me... What does it mean?
> > >
> > > Which is meaning as above stated as "BSP comment" from here[2]
> >
> > It doesn't matter where you took it from. If you cannot explain what
> > happen, putting a random label that doesn't explain anything will not
> > help.
>
> I have no idea or document to refer why this 1 would be added. so I
> used same comment from BSP like many places on sun4i does. w/o this +1
> the delay is computed to 512 which is not working and with this the
> desired delay is 513 which is perfectly working.
>
> If you have any idea on this, please share so-that I can add it in
> comment otherwise.

You're the one with the panel, the issue and apparently a solution,
and the whole problem we're having is because I don't have any idea on
what that issue is precisely, and neither why your solution makes sense.

I'm not sure I'm the best to write a comment in that situation.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--udtxcv6c7reia3ri--
