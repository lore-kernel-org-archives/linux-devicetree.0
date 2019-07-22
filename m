From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum
 rate for PLL_MIPI
Date: Mon, 22 Jul 2019 16:08:48 +0530
Message-ID: <CAMty3ZCrj_9Lp15y6bcFErgXaATVjWibV3tO884G31RtVWmuxA@mail.gmail.com>
References: <20190614142406.ybdiqfppo5mc5bgq@flea> <CAMty3ZB45cHx3WeXnywBh2_UA_bTmFs6yBTqLWA1BNf4fQtVvQ@mail.gmail.com>
 <20190625144930.5hegt6bkzqzykjid@flea> <CAMty3ZCmj0Rz7MMhLqihsvLQi+1CHf0fAoJQ4QN65xB-bwxaJw@mail.gmail.com>
 <20190703114933.u3x4ej3v7ocewvif@flea> <CAOf5uw=ZEvMV1hFQE986rNG_ctpReGbjbZzv0m=OzKPdBh57uQ@mail.gmail.com>
 <20190711100100.cty3s6rs3w27low6@flea> <CAOf5uw=3fiMuhcj3kDtCaGNTsxHKRrYb79MXZ+yUZtmf0jU10A@mail.gmail.com>
 <20190720065830.zn3txpyduakywcva@flea> <CAMty3ZDE1xiNgHVLihH378dY5szzkr14V-fwLZdvPs12tY+G1A@mail.gmail.com>
 <20190720093202.6fn6xmhvsgawscnu@flea> <CAMty3ZDpOA1mD77t3RB6hEG7o3+ws8y64m1DU8=3HdZ4zy4AUw@mail.gmail.com>
 <CAOf5uw=5j+8XNv_ZBhY0yrnjjNnaV_w=a4oiV11LoksAfEY7AA@mail.gmail.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBRNE23UQKGQEM64KJCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAOf5uw=5j+8XNv_ZBhY0yrnjjNnaV_w=a4oiV11LoksAfEY7AA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Michael Nazzareno Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 3:55 PM Michael Nazzareno Trimarchi
<michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> Hi Jagan
>
> On Mon, Jul 22, 2019 at 12:21 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> >
> > Hi Maxime,
> >
> > On Sat, Jul 20, 2019 at 3:02 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > >
> > > On Sat, Jul 20, 2019 at 12:46:27PM +0530, Jagan Teki wrote:
> > > > On Sat, Jul 20, 2019 at 12:28 PM Maxime Ripard
> > > > <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > > > >
> > > > > On Thu, Jul 11, 2019 at 07:43:16PM +0200, Michael Nazzareno Trimarchi wrote:
> > > > > > > > tcon-pixel clock is the rate that you want to achive on display side
> > > > > > > > and if you have 4 lanes 32bit or lanes and different bit number that
> > > > > > > > you need to have a clock that is able to put outside bits and speed
> > > > > > > > equal to pixel-clock * bits / lanes. so If you want a pixel-clock of
> > > > > > > > 40 mhz and you have 32bits and 4 lanes you need to have a clock of
> > > > > > > > 40 * 32 / 4 in no-burst mode. I think that this is done but most of
> > > > > > > > the display.
> > > > > > >
> > > > > > > So this is what the issue is then?
> > > > > > >
> > > > > > > This one does make sense, and you should just change the rate in the
> > > > > > > call to clk_set_rate in sun4i_tcon0_mode_set_cpu.
> > > > > > >
> > > > > > > I'm still wondering why that hasn't been brought up in either the
> > > > > > > discussion or the commit log before though.
> > > > > > >
> > > > > > Something like this?
> > > > > >
> > > > > > drivers/gpu/drm/sun4i/sun4i_tcon.c     | 20 +++++++++++---------
> > > > > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 --
> > > > > >  2 files changed, 11 insertions(+), 11 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > index 64c43ee6bd92..42560d5c327c 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > > @@ -263,10 +263,11 @@ static int sun4i_tcon_get_clk_delay(const struct
> > > > > > drm_display_mode *mode,
> > > > > >  }
> > > > > >
> > > > > >  static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
> > > > > > -                                       const struct drm_display_mode *mode)
> > > > > > +                                       const struct drm_display_mode *mode,
> > > > > > +                                       u32 tcon_mul)
> > > > > >  {
> > > > > >         /* Configure the dot clock */
> > > > > > -       clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
> > > > > > +       clk_set_rate(tcon->dclk, mode->crtc_clock * tcon_mul * 1000);
> > > > > >
> > > > > >         /* Set the resolution */
> > > > > >         regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> > > > > > @@ -335,12 +336,13 @@ static void sun4i_tcon0_mode_set_cpu(struct
> > > > > > sun4i_tcon *tcon,
> > > > > >         u8 bpp = mipi_dsi_pixel_format_to_bpp(device->format);
> > > > > >         u8 lanes = device->lanes;
> > > > > >         u32 block_space, start_delay;
> > > > > > -       u32 tcon_div;
> > > > > > +       u32 tcon_div, tcon_mul;
> > > > > >
> > > > > > -       tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
> > > > > > -       tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
> > > > > > +       tcon->dclk_min_div = 4;
> > > > > > +       tcon->dclk_max_div = 127;
> > > > > >
> > > > > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > > > > +       tcon_mul = bpp / lanes;
> > > > > > +       sun4i_tcon0_mode_set_common(tcon, mode, tcon_mul);
> > > > > >
> > > > > >         /* Set dithering if needed */
> > > > > >         sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> > > > > > @@ -366,7 +368,7 @@ static void sun4i_tcon0_mode_set_cpu(struct
> > > > > > sun4i_tcon *tcon,
> > > > > >          */
> > > > > >         regmap_read(tcon->regs, SUN4I_TCON0_DCLK_REG, &tcon_div);
> > > > > >         tcon_div &= GENMASK(6, 0);
> > > > > > -       block_space = mode->htotal * bpp / (tcon_div * lanes);
> > > > > > +       block_space = mode->htotal * tcon_div * tcon_mul;
> > > > > >         block_space -= mode->hdisplay + 40;
> > > > > >
> > > > > >         regmap_write(tcon->regs, SUN4I_TCON0_CPU_TRI0_REG,
> > > > > > @@ -408,7 +410,7 @@ static void sun4i_tcon0_mode_set_lvds(struct
> > > > > > sun4i_tcon *tcon,
> > > > > >
> > > > > >         tcon->dclk_min_div = 7;
> > > > > >         tcon->dclk_max_div = 7;
> > > > > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > > > > +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
> > > > > >
> > > > > >         /* Set dithering if needed */
> > > > > >         sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> > > > > > @@ -487,7 +489,7 @@ static void sun4i_tcon0_mode_set_rgb(struct
> > > > > > sun4i_tcon *tcon,
> > > > > >
> > > > > >         tcon->dclk_min_div = 6;
> > > > > >         tcon->dclk_max_div = 127;
> > > > > > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > > > > > +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
> > > > > >
> > > > > >         /* Set dithering if needed */
> > > > > >         sun4i_tcon0_mode_set_dithering(tcon, connector);
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > > > > b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > > > > index 5c3ad5be0690..a07090579f84 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > > > > @@ -13,8 +13,6 @@
> > > > > >  #include <drm/drm_encoder.h>
> > > > > >  #include <drm/drm_mipi_dsi.h>
> > > > > >
> > > > > > -#define SUN6I_DSI_TCON_DIV     4
> > > > > > -
> > > > > >  struct sun6i_dsi {
> > > > > >         struct drm_connector    connector;
> > > > > >         struct drm_encoder      encoder;
> > > > >
> > > > > I had more something like this in mind:
> > > > > http://code.bulix.org/nlp5a4-803511
> > > >
> > > > Worth to look at it. was it working on your panel? meanwhile I will check it.
> > >
> > > I haven't tested it.
> > >
> > > > We have updated with below change [1], seems working on but is
> > > > actually checking the each divider as before start with 4... till 127.
> > > >
> > > > This new approach, is start looking the best divider from 4.. based on
> > > > the idea vs rounded it will ended up best divider like [2]
> > >
> > > But why?
> > >
> > > I mean, it's not like it's the first time I'm asking this...
> > >
> > > If the issue is what Micheal described, then the divider has nothing
> > > to do with it. We've had that discussion over and over again.
> >
> > This is what Michael is mentioned in above mail
> > "tcon-pixel clock is the rate that you want to achive on display side and
> > if you have 4 lanes 32bit or lanes and different bit number that you need
> > to have a clock that is able to put outside bits and speed equal to
> > pixel-clock * bits / lanes. so If you want a pixel-clock of 40 mhz
> > and you have 32bits and 4 lanes you need to have a clock of
> > 40 * 32 / 4 in no-burst mode. "
> >
> > He is trying to manage the bpp/lanes into dclk_mul (in last mail) and
> > it can multiply with pixel clock which is rate argument in
> > sun4i_dclk_round_rate.
> >
> > The solution I have mentioned in dclk_min, max is bpp/lanes also
> > multiple rate in dotclock sun4i_dclk_round_rate.
> >
> > In both cases the overall pll_rate depends on dividers, the one that I
> > have on this patch is based on BSP and the Michael one is more generic
> > way so-that it can not to touch other functionalities and looping
> > dividers to find the best one.
> >
> > If dclk_min/max is bpp/lanes then dotclock directly using divider 6
> > (assuming 24-bit and 4 lanes) and return the pll_rate and divider 6
> > associated.
> >
> > if dclk_mul is bpp/lanes, on Michael new change, the dividers start
> > with 4 and end with 127 but the constant ideal rate which rate *
> > bpp/lanes but the loop from sun4i_dclk_round_rate computed the divider
> > as 6 only, ie what I'm mentioned on the above mail.
> >
>
> tcon-pixel clock and tcon are mutual connected. The code is done in a way
> that optimal clock need to be search. Now the patch that I propose is more
> connected to the description I gave.

True, ie what I'm trying to say in above mail.  My idea on the above
mail is to give more information on the both the solutions (one on the
this patch and another you mentioned on above mail) are depends on
divider value for computing desired pll_rate.

>
> I need some comment from Maxime, what he prefers or we need to search for
> a different one. I don't had time to check Maxime proposal because I'm working
> on other projects.

I already provide my logs on Maxime change.if you want you can have a look.
