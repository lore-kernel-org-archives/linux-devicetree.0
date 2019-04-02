From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v8 01/15] drm/sun4i: dsi: Fix video start delay computation
Date: Tue, 2 Apr 2019 19:04:30 +0530
Message-ID: <CAMty3ZA9x356e1y_aajSpviycnPR8GA0794BCR6dKMRYuw=zOg@mail.gmail.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
 <20190311133637.18334-2-jagan@amarulasolutions.com> <20190311153734.izg44ijwqqh2vpxc@flea>
 <CAMty3ZDDARP02qMJZ9CXeiMv=kghoiUHgEAV9b4q+SrbLss40Q@mail.gmail.com>
 <20190319102520.ldgjtyzrphuib3td@flea> <CAMty3ZC+dTVuc2TWR=cqKNbrZe6j2vnwfXAqg6RbvduvY_63LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZC+dTVuc2TWR=cqKNbrZe6j2vnwfXAqg6RbvduvY_63LA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Thu, Mar 21, 2019 at 8:08 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Tue, Mar 19, 2019 at 3:55 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Mon, Mar 11, 2019 at 09:31:11PM +0530, Jagan Teki wrote:
> > > On Mon, Mar 11, 2019 at 9:07 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
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
>
> >
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
>
> >
> > > > > It produces the desired start delay value as 19 but the correct working
> > > > > value should be 513.
> > > > >
> > > > > So, Fix it by computing proper video start delay.
> > > > >
> > > > > Fixes: 69006ef0ecb1 ("drm/sun4i: dsi: Change the start delay calculation")
> > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
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

Any further comments?
