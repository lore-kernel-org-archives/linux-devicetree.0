From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 11/27] drm/sun4i: Rework DE2 register defines
Date: Mon, 24 Sep 2018 10:01:21 +0800
Message-ID: <CAGb2v67cW=6q04oO4RiUqEHvhzK9W0Bg_49arO73GugVd5NUbA@mail.gmail.com>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
 <20180902072643.4917-12-jernej.skrabec@siol.net> <CAGb2v67jweJ5OdSzKhj302OLbz7DacKmSGMKS536uquzKGZtAQ@mail.gmail.com>
 <2037444.yZ41eTID0S@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBB74KUHOQKGQE47XVWNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2037444.yZ41eTID0S@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 24, 2018 at 4:02 AM Jernej =C5=A0krabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t> wrote:
>
> Dne sobota, 22. september 2018 ob 14:32:30 CEST je Chen-Yu Tsai napisal(a=
):
> > Hi,
> >
> > On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> wrote:
> > > Most, if not all, registers found in DE2 still exists in DE3. However=
,
> > > units are on different base addresses.
> > >
> > > To prepare for addition of DE3 support, registers macros are reworked=
 so
> > > they take base address as parameter.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > [rebased]
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >
> > This patch mostly checks out. But see below.
> >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > b/drivers/gpu/drm/sun4i/sun8i_mixer.h index 406c42e752d7..020b0a097c8=
4
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > @@ -29,20 +29,24 @@
> > >
> > >  #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE                BIT(0)
> > >
> > > -#define SUN8I_MIXER_BLEND_PIPE_CTL             0x1000
> > > -#define SUN8I_MIXER_BLEND_ATTR_FCOLOR(x)       (0x1004 + 0x10 * (x) =
+
> > > 0x0)
> > > -#define SUN8I_MIXER_BLEND_ATTR_INSIZE(x)       (0x1004 + 0x10 * (x) =
+
> > > 0x4)
> > > -#define SUN8I_MIXER_BLEND_ATTR_COORD(x)                (0x1004 + 0x1=
0 *
> > > (x) + 0x8) -#define SUN8I_MIXER_BLEND_ROUTE                        0x=
1080
> > > -#define SUN8I_MIXER_BLEND_PREMULTIPLY          0x1084
> > > -#define SUN8I_MIXER_BLEND_BKCOLOR              0x1088
> > > -#define SUN8I_MIXER_BLEND_OUTSIZE              0x108c
> > > -#define SUN8I_MIXER_BLEND_MODE(x)              (0x1090 + 0x04 * (x))
> > > -#define SUN8I_MIXER_BLEND_CK_CTL               0x10b0
> > > -#define SUN8I_MIXER_BLEND_CK_CFG               0x10b4
> > > -#define SUN8I_MIXER_BLEND_CK_MAX(x)            (0x10c0 + 0x04 * (x))
> > > -#define SUN8I_MIXER_BLEND_CK_MIN(x)            (0x10e0 + 0x04 * (x))
> > > -#define SUN8I_MIXER_BLEND_OUTCTL               0x10fc
> > > +#define DE2_BLD_BASE                           0x1000
> > > +#define DE2_CH_BASE                            0x2000
> > > +#define DE2_CH_SIZE                            0x1000
> > > +
> > > +#define SUN8I_MIXER_BLEND_PIPE_CTL(base)       ((base) + 0)
> > > +#define SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, x) ((base) + 0x4 + 0x10 =
*
> > > (x))
> > > +#define SUN8I_MIXER_BLEND_ATTR_INSIZE(base, x) ((base) + 0x8 + 0x10 =
*
> > > (x))
> > > +#define SUN8I_MIXER_BLEND_ATTR_COORD(base, x)  ((base) + 0xC + 0x10 =
*
> > > (x))
> >
> > Nit: Use lowercase for '0xC' to be consistent.
> >
> > > +#define SUN8I_MIXER_BLEND_ROUTE(base)          ((base) + 0x80)
> > > +#define SUN8I_MIXER_BLEND_PREMULTIPLY(base)    ((base) + 0x84)
> > > +#define SUN8I_MIXER_BLEND_BKCOLOR(base)                ((base) + 0x8=
8)
> > > +#define SUN8I_MIXER_BLEND_OUTSIZE(base)                ((base) + 0x8=
c)
> > > +#define SUN8I_MIXER_BLEND_MODE(base, x)                ((base) + 0x9=
0 +
> > > 0x04 * (x)) +#define SUN8I_MIXER_BLEND_CK_CTL(base)         ((base) +
> > > 0xb0)
> > > +#define SUN8I_MIXER_BLEND_CK_CFG(base)         ((base) + 0xb4)
> > > +#define SUN8I_MIXER_BLEND_CK_MAX(base, x)      ((base) + 0xc0 + 0x04=
 *
> > > (x)) +#define SUN8I_MIXER_BLEND_CK_MIN(base, x)      ((base) + 0xe0 +
> > > 0x04 * (x)) +#define SUN8I_MIXER_BLEND_OUTCTL(base)         ((base) +
> > > 0xfc)
> > >
> > >  #define SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK      GENMASK(12, 8)
> > >  #define SUN8I_MIXER_BLEND_PIPE_CTL_EN(pipe)    BIT(8 + pipe)
> >
> > [...]
> >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> > > b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c index
> > > 6bb2aa164c8e..c68eab8a748f 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> > > @@ -10,6 +10,7 @@
> > >
> > >   */
> > >
> > >  #include "sun8i_ui_scaler.h"
> > >
> > > +#include "sun8i_vi_scaler.h"
> > >
> > >  static const u32 lan2coefftab16[240] =3D {
> > >
> > >         0x00004000, 0x00033ffe, 0x00063efc, 0x000a3bfb,
> > >
> > > @@ -88,6 +89,14 @@ static const u32 lan2coefftab16[240] =3D {
> > >
> > >         0x0b1c1603, 0x0d1c1502, 0x0e1d1401, 0x0f1d1301,
> > >
> > >  };
> > >
> > > +static inline u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, in=
t
> > > channel)
> > I recently saw a review comment stating one should not inline functions
> > unless they are defined in header files. Otherwise the decision should
> > be left up to the compiler.
> >
> > > +{
> > > +       int vi_num =3D mixer->cfg->vi_num;
> > > +
> > > +       return DE2_VI_SCALER_BASE + DE2_VI_SCALER_SIZE * vi_num +
> > > +              DE2_UI_SCALER_SIZE * (channel - vi_num);
> > > +}
> > > +
> > >
> > >  static int sun8i_ui_scaler_coef_index(unsigned int step)
> > >  {
> > >
> > >         unsigned int scale, int_part, float_part;
> >
> > [...]
> >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> > > b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c index
> > > d3f1acb234b7..8697afc36023 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> > > @@ -833,6 +833,11 @@ static const u32 bicubic4coefftab32[480] =3D {
> > >
> > >         0x1012110d, 0x1012110d, 0x1013110c, 0x1013110c,
> > >
> > >  };
> > >
> > > +static inline u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, in=
t
> > > channel) +{
> > > +       return DE2_VI_SCALER_BASE + DE2_VI_SCALER_SIZE * channel;
> > > +}
> > > +
> >
> > This one as well.
> >
> > >  static int sun8i_vi_scaler_coef_index(unsigned int step)
> > >  {
> > >
> > >         unsigned int scale, int_part, float_part;
> > >
> > > @@ -857,7 +862,7 @@ static int sun8i_vi_scaler_coef_index(unsigned in=
t
> > > step)>
> > >         }
> > >
> > >  }
> > >
> > > -static void sun8i_vi_scaler_set_coeff(struct regmap *map, int layer,
> > > +static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
> > >
> > >                                       u32 hstep, u32 vstep,
> > >                                       const struct drm_format_info
> > >                                       *format)
> >
> > This is the only instance where a function's "layer" parameter was chan=
ged
> > to "base". It would be nice if it were consistent.
>
> Why not? Caller already have base address calculated, so it poses no over=
head.
> Additionally, sun8i_vi_scaler_set_coeff() doesn't have struct sun8i_mixer
> *mixer parameter, which would allow calculating base address based on lay=
er
> id. So, you can chose between existing variant or adding additional param=
eter
> for no real reason.

Thanks for the explanation. Yeah, then the current patch makes sense.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
