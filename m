From: Michael Nazzareno Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum
 rate for PLL_MIPI
Date: Sat, 20 Jul 2019 09:20:21 +0200
Message-ID: <CAOf5uwn=H3vRQbqMkg7tR4g8BHzdxpXfvjud22F95PQ+7CfQhQ@mail.gmail.com>
References: <20190605064933.6bmskkxzzgn35xz7@flea> <CAMty3ZCCP=oCqm5=49BsjwoxdDETgBfU_5g8fQ=bz=iWApV0tw@mail.gmail.com>
 <20190614142406.ybdiqfppo5mc5bgq@flea> <CAMty3ZB45cHx3WeXnywBh2_UA_bTmFs6yBTqLWA1BNf4fQtVvQ@mail.gmail.com>
 <20190625144930.5hegt6bkzqzykjid@flea> <CAMty3ZCmj0Rz7MMhLqihsvLQi+1CHf0fAoJQ4QN65xB-bwxaJw@mail.gmail.com>
 <20190703114933.u3x4ej3v7ocewvif@flea> <CAOf5uw=ZEvMV1hFQE986rNG_ctpReGbjbZzv0m=OzKPdBh57uQ@mail.gmail.com>
 <20190711100100.cty3s6rs3w27low6@flea> <CAOf5uw=3fiMuhcj3kDtCaGNTsxHKRrYb79MXZ+yUZtmf0jU10A@mail.gmail.com>
 <20190720065830.zn3txpyduakywcva@flea>
Reply-To: michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="000000000000c5270e058e17ad9a"
Return-path: <linux-sunxi+bncBCXK73FY3AFRBQ4BZPUQKGQEWZDSJ3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190720065830.zn3txpyduakywcva@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--000000000000c5270e058e17ad9a
Content-Type: text/plain; charset="UTF-8"

Hi


On Sat., 20 Jul. 2019, 8:58 am Maxime Ripard, <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
wrote:

> On Thu, Jul 11, 2019 at 07:43:16PM +0200, Michael Nazzareno Trimarchi
> wrote:
> > > > tcon-pixel clock is the rate that you want to achive on display side
> > > > and if you have 4 lanes 32bit or lanes and different bit number that
> > > > you need to have a clock that is able to put outside bits and speed
> > > > equal to pixel-clock * bits / lanes. so If you want a pixel-clock of
> > > > 40 mhz and you have 32bits and 4 lanes you need to have a clock of
> > > > 40 * 32 / 4 in no-burst mode. I think that this is done but most of
> > > > the display.
> > >
> > > So this is what the issue is then?
> > >
> > > This one does make sense, and you should just change the rate in the
> > > call to clk_set_rate in sun4i_tcon0_mode_set_cpu.
> > >
> > > I'm still wondering why that hasn't been brought up in either the
> > > discussion or the commit log before though.
> > >
> > Something like this?
> >
> > drivers/gpu/drm/sun4i/sun4i_tcon.c     | 20 +++++++++++---------
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 --
> >  2 files changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > index 64c43ee6bd92..42560d5c327c 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -263,10 +263,11 @@ static int sun4i_tcon_get_clk_delay(const struct
> > drm_display_mode *mode,
> >  }
> >
> >  static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
> > -                                       const struct drm_display_mode
> *mode)
> > +                                       const struct drm_display_mode
> *mode,
> > +                                       u32 tcon_mul)
> >  {
> >         /* Configure the dot clock */
> > -       clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
> > +       clk_set_rate(tcon->dclk, mode->crtc_clock * tcon_mul * 1000);
> >
> >         /* Set the resolution */
> >         regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> > @@ -335,12 +336,13 @@ static void sun4i_tcon0_mode_set_cpu(struct
> > sun4i_tcon *tcon,
> >         u8 bpp = mipi_dsi_pixel_format_to_bpp(device->format);
> >         u8 lanes = device->lanes;
> >         u32 block_space, start_delay;
> > -       u32 tcon_div;
> > +       u32 tcon_div, tcon_mul;
> >
> > -       tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
> > -       tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
> > +       tcon->dclk_min_div = 4;
> > +       tcon->dclk_max_div = 127;
> >
> > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > +       tcon_mul = bpp / lanes;
> > +       sun4i_tcon0_mode_set_common(tcon, mode, tcon_mul);
> >
> >         /* Set dithering if needed */
> >         sun4i_tcon0_mode_set_dithering(tcon,
> sun4i_tcon_get_connector(encoder));
> > @@ -366,7 +368,7 @@ static void sun4i_tcon0_mode_set_cpu(struct
> > sun4i_tcon *tcon,
> >          */
> >         regmap_read(tcon->regs, SUN4I_TCON0_DCLK_REG, &tcon_div);
> >         tcon_div &= GENMASK(6, 0);
> > -       block_space = mode->htotal * bpp / (tcon_div * lanes);
> > +       block_space = mode->htotal * tcon_div * tcon_mul;
> >         block_space -= mode->hdisplay + 40;
> >
> >         regmap_write(tcon->regs, SUN4I_TCON0_CPU_TRI0_REG,
> > @@ -408,7 +410,7 @@ static void sun4i_tcon0_mode_set_lvds(struct
> > sun4i_tcon *tcon,
> >
> >         tcon->dclk_min_div = 7;
> >         tcon->dclk_max_div = 7;
> > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
> >
> >         /* Set dithering if needed */
> >         sun4i_tcon0_mode_set_dithering(tcon,
> sun4i_tcon_get_connector(encoder));
> > @@ -487,7 +489,7 @@ static void sun4i_tcon0_mode_set_rgb(struct
> > sun4i_tcon *tcon,
> >
> >         tcon->dclk_min_div = 6;
> >         tcon->dclk_max_div = 127;
> > -       sun4i_tcon0_mode_set_common(tcon, mode);
> > +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
> >
> >         /* Set dithering if needed */
> >         sun4i_tcon0_mode_set_dithering(tcon, connector);
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > index 5c3ad5be0690..a07090579f84 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > @@ -13,8 +13,6 @@
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_mipi_dsi.h>
> >
> > -#define SUN6I_DSI_TCON_DIV     4
> > -
> >  struct sun6i_dsi {
> >         struct drm_connector    connector;
> >         struct drm_encoder      encoder;
>
> I had more something like this in mind:
> http://code.bulix.org/nlp5a4-803511


I sent another patch to jagan and I'm fully agree that the proper change
need to show the reason and not change constraints as we discuss

We are on same line

Thank you

>
>
>
>
>
> You really don't need to change the divider range (or this is another
> issue that the one you mentionned).
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/CAOf5uwn%3DH3vRQbqMkg7tR4g8BHzdxpXfvjud22F95PQ%2B7CfQhQ%40mail.gmail.com.

--000000000000c5270e058e17ad9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi</div><div dir=3D"auto"><br><br><div class=3D"gmai=
l_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Sat., 20 Jul=
. 2019, 8:58 am Maxime Ripard, &lt;<a href=3D"mailto:maxime.ripard@bootlin.=
com">maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On Thu, Jul 11, 2019 at 07:43:16PM +0200, Michael Nazzareno Trim=
archi wrote:<br>
&gt; &gt; &gt; tcon-pixel clock is the rate that you want to achive on disp=
lay side<br>
&gt; &gt; &gt; and if you have 4 lanes 32bit or lanes and different bit num=
ber that<br>
&gt; &gt; &gt; you need to have a clock that is able to put outside bits an=
d speed<br>
&gt; &gt; &gt; equal to pixel-clock * bits / lanes. so If you want a pixel-=
clock of<br>
&gt; &gt; &gt; 40 mhz and you have 32bits and 4 lanes you need to have a cl=
ock of<br>
&gt; &gt; &gt; 40 * 32 / 4 in no-burst mode. I think that this is done but =
most of<br>
&gt; &gt; &gt; the display.<br>
&gt; &gt;<br>
&gt; &gt; So this is what the issue is then?<br>
&gt; &gt;<br>
&gt; &gt; This one does make sense, and you should just change the rate in =
the<br>
&gt; &gt; call to clk_set_rate in sun4i_tcon0_mode_set_cpu.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m still wondering why that hasn&#39;t been brought up in ei=
ther the<br>
&gt; &gt; discussion or the commit log before though.<br>
&gt; &gt;<br>
&gt; Something like this?<br>
&gt;<br>
&gt; drivers/gpu/drm/sun4i/sun4i_tcon.c=C2=A0 =C2=A0 =C2=A0| 20 +++++++++++=
---------<br>
&gt;=C2=A0 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |=C2=A0 2 --<br>
&gt;=C2=A0 2 files changed, 11 insertions(+), 11 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c<br>
&gt; b/drivers/gpu/drm/sun4i/sun4i_tcon.c<br>
&gt; index 64c43ee6bd92..42560d5c327c 100644<br>
&gt; --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c<br>
&gt; +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c<br>
&gt; @@ -263,10 +263,11 @@ static int sun4i_tcon_get_clk_delay(const struct=
<br>
&gt; drm_display_mode *mode,<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const=
 struct drm_display_mode *mode)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const=
 struct drm_display_mode *mode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 t=
con_mul)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Configure the dot clock */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_set_rate(tcon-&gt;dclk, mode-&gt;crtc_=
clock * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_set_rate(tcon-&gt;dclk, mode-&gt;crtc_=
clock * tcon_mul * 1000);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the resolution */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(tcon-&gt;regs, SUN4I_TCO=
N0_BASIC0_REG,<br>
&gt; @@ -335,12 +336,13 @@ static void sun4i_tcon0_mode_set_cpu(struct<br>
&gt; sun4i_tcon *tcon,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 bpp =3D mipi_dsi_pixel_format_to_b=
pp(device-&gt;format);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 lanes =3D device-&gt;lanes;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 block_space, start_delay;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tcon_div;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tcon_div, tcon_mul;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tcon-&gt;dclk_min_div =3D SUN6I_DSI_TCON_D=
IV;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tcon-&gt;dclk_max_div =3D SUN6I_DSI_TCON_D=
IV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tcon-&gt;dclk_min_div =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tcon-&gt;dclk_max_div =3D 127;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_common(tcon, mode);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tcon_mul =3D bpp / lanes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_common(tcon, mode, tc=
on_mul);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set dithering if needed */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_dithering(tcon, =
sun4i_tcon_get_connector(encoder));<br>
&gt; @@ -366,7 +368,7 @@ static void sun4i_tcon0_mode_set_cpu(struct<br>
&gt; sun4i_tcon *tcon,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(tcon-&gt;regs, SUN4I_TCON=
0_DCLK_REG, &amp;tcon_div);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcon_div &amp;=3D GENMASK(6, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0block_space =3D mode-&gt;htotal * bpp / (t=
con_div * lanes);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block_space =3D mode-&gt;htotal * tcon_div=
 * tcon_mul;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_space -=3D mode-&gt;hdisplay + =
40;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(tcon-&gt;regs, SUN4I_TCO=
N0_CPU_TRI0_REG,<br>
&gt; @@ -408,7 +410,7 @@ static void sun4i_tcon0_mode_set_lvds(struct<br>
&gt; sun4i_tcon *tcon,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcon-&gt;dclk_min_div =3D 7;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcon-&gt;dclk_max_div =3D 7;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_common(tcon, mode);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_common(tcon, mode, 1)=
;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set dithering if needed */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_dithering(tcon, =
sun4i_tcon_get_connector(encoder));<br>
&gt; @@ -487,7 +489,7 @@ static void sun4i_tcon0_mode_set_rgb(struct<br>
&gt; sun4i_tcon *tcon,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcon-&gt;dclk_min_div =3D 6;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcon-&gt;dclk_max_div =3D 127;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_common(tcon, mode);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_common(tcon, mode, 1)=
;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set dithering if needed */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sun4i_tcon0_mode_set_dithering(tcon, =
connector);<br>
&gt; diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h<br>
&gt; b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h<br>
&gt; index 5c3ad5be0690..a07090579f84 100644<br>
&gt; --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h<br>
&gt; +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h<br>
&gt; @@ -13,8 +13,6 @@<br>
&gt;=C2=A0 #include &lt;drm/drm_encoder.h&gt;<br>
&gt;=C2=A0 #include &lt;drm/drm_mipi_dsi.h&gt;<br>
&gt;<br>
&gt; -#define SUN6I_DSI_TCON_DIV=C2=A0 =C2=A0 =C2=A04<br>
&gt; -<br>
&gt;=C2=A0 struct sun6i_dsi {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector=C2=A0 =C2=A0 con=
nector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_encoder=C2=A0 =C2=A0 =C2=
=A0 encoder;<br>
<br>
I had more something like this in mind:<br>
<a href=3D"http://code.bulix.org/nlp5a4-803511" rel=3D"noreferrer noreferre=
r" target=3D"_blank">http://code.bulix.org/nlp5a4-803511</a></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I sent another patc=
h to jagan and I&#39;m fully agree that the proper change need to show the =
reason and not change constraints as we discuss</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">We are on same line</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Thank you</div><div dir=3D"auto"><div class=3D"gmail_qu=
ote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br><br><br><br>
You really don&#39;t need to change the divider range (or this is another<b=
r>
issue that the one you mentionned).<br>
<br>
Maxime<br>
<br>
--<br>
Maxime Ripard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
To view this discussion on the web, visit <a href=3D"https://groups.google.=
com/d/msgid/linux-sunxi/CAOf5uwn%3DH3vRQbqMkg7tR4g8BHzdxpXfvjud22F95PQ%2B7C=
fQhQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://group=
s.google.com/d/msgid/linux-sunxi/CAOf5uwn%3DH3vRQbqMkg7tR4g8BHzdxpXfvjud22F=
95PQ%2B7CfQhQ%40mail.gmail.com</a>.<br />

--000000000000c5270e058e17ad9a--
