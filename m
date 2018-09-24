From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 12/27] drm/sun4i: Add basic support for DE3
Date: Mon, 24 Sep 2018 10:04:49 +0800
Message-ID: <CAGb2v667zERDhWTwhoNykvKEJWU2TXdCfNNtOiTt9Wtv+gfR1w@mail.gmail.com>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
 <20180902072643.4917-13-jernej.skrabec@siol.net> <CAGb2v65tt4S-k=AF2AmjQyEkUydzMimB8TT2Uiqmpf6G8qD1Cw@mail.gmail.com>
 <2453235.vVnySQtb9h@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUMMUHOQKGQEUWCFHAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2453235.vVnySQtb9h@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 24, 2018 at 3:51 AM Jernej =C5=A0krabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t> wrote:
>
> Dne sobota, 22. september 2018 ob 15:19:12 CEST je Chen-Yu Tsai napisal(a=
):
> > On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> wrote:
> > > Display Engine 3 is an upgrade of DE2 with new features like support =
for
> > > 10 bit color formats and support for AFBC.
> > >
> > > Most of DE2 code works with DE3, except some small details.
> > >
> > > Add support for it.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > ---
> > >
> > >  drivers/gpu/drm/sun4i/sun8i_csc.c       | 96 +++++++++++++++++++++++=
--
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.c     | 17 ++++-
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.h     | 21 +++++-
> > >  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  8 ++-
> > >  drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |  1 +
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  8 +++
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |  2 +
> > >  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 34 ++++++++-
> > >  drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 23 ++++++
> > >  9 files changed, 197 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c
> > > b/drivers/gpu/drm/sun4i/sun8i_csc.c index b14925b40ccf..101901ccf2dc
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> > > @@ -34,6 +34,34 @@ static const u32 yvu2rgb[] =3D {
> > >
> > >         0x000004A8, 0x00000000, 0x00000813, 0xFFFBAC4A,
> > >
> > >  };
> > >
> > > +/*
> > > + * DE3 has a bit different CSC units. Factors are in two's complemen=
t
> > > format. + * First three have 17 bits for fractinal part and last two =
2
> > > bits. First + * three values in each line are multiplication factor, =
4th
> > > is difference, + * which is subtracted from the input value before th=
e
> > > multiplication and + * last value is constant, which is added at the =
end.
> > > + *
> > > + * x' =3D c00 * (x + d0) + c01 * (y + d1) + c02 * (z + d2) + const0
> > > + * y' =3D c10 * (x + d0) + c11 * (y + d1) + c12 * (z + d2) + const1
> > > + * z' =3D c20 * (x + d0) + c21 * (y + d1) + c22 * (z + d2) + const2
> > > + *
> > > + * Please note that above formula is true only for Blender CSC. Othe=
r DE3
> > > CSC + * units takes only positive value for difference. From what can=
 be
> > > deducted + * from BSP driver code, those units probably automatically
> > > assume that + * difference has to be subtracted.
> > > + */
> > > +static const u32 yuv2rgb_de3[] =3D {
> > > +       0x0002542a, 0x00000000, 0x0003312a, 0xffffffc0, 0x00000000,
> > > +       0x0002542a, 0xffff376b, 0xfffe5fc3, 0xfffffe00, 0x00000000,
> > > +       0x0002542a, 0x000408d3, 0x00000000, 0xfffffe00, 0x00000000,
> > > +};
> > > +
> > > +static const u32 yvu2rgb_de3[] =3D {
> > > +       0x0002542a, 0x0003312a, 0x00000000, 0xffffffc0, 0x00000000,
> > > +       0x0002542a, 0xfffe5fc3, 0xffff376b, 0xfffffe00, 0x00000000,
> > > +       0x0002542a, 0x00000000, 0x000408d3, 0xfffffe00, 0x00000000,
> > > +};
> > > +
> > >
> > >  static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
> > >
> > >                                        enum sun8i_csc_mode mode)
> > >
> > >  {
> > >
> > > @@ -61,6 +89,38 @@ static void sun8i_csc_set_coefficients(struct regm=
ap
> > > *map, u32 base,>
> > >         }
> > >
> > >  }
> > >
> > > +static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int
> > > layer,
> > > +                                           enum sun8i_csc_mode mode)
> > > +{
> > > +       const u32 *table;
> > > +       int i, j;
> > > +
> > > +       switch (mode) {
> > > +       case SUN8I_CSC_MODE_YUV2RGB:
> > > +               table =3D yuv2rgb_de3;
> > > +               break;
> > > +       case SUN8I_CSC_MODE_YVU2RGB:
> > > +               table =3D yvu2rgb_de3;
> > > +               break;
> > > +       default:
> > > +               DRM_WARN("Wrong CSC mode specified.\n");
> > > +               return;
> > > +       }
> > > +
> > > +       for (i =3D 0; i < 3; i++) {
> > > +               for (j =3D 0; j < 3; j++)
> > > +                       regmap_write(map,
> > > +
> > > SUN8I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, +
> > >                                  layer, i, j), +
> > >           table[i * 5 + j]);
> >
> > Given that the first three values occupy contiguous addresses,
> > you can use regmap_bulk_write() here.
> >
> > > +               regmap_write(map,
> > > +                            SUN8I_MIXER_BLEND_CSC_CONST(DE3_BLD_BASE=
,
> > > +                                                        layer, i),
> > > +                            SUN8I_MIXER_BLEND_CSC_CONST_VAL(table[i =
* 5 +
> > > 3], +                                                            tabl=
e[i
> > > * 5 + 4]));
> > Nit: Using a two-dimension array might make it easier to read.
> >
> > > +       }
> > > +}
> > > +
> > >
> > >  static void sun8i_csc_enable(struct regmap *map, u32 base, bool enab=
le)
> > >  {
> > >
> > >         u32 val;
> > >
> > > @@ -73,21 +133,45 @@ static void sun8i_csc_enable(struct regmap *map,=
 u32
> > > base, bool enable)>
> > >         regmap_update_bits(map, SUN8I_CSC_CTRL(base), SUN8I_CSC_CTRL_=
EN,
> > >         val);
> > >
> > >  }
> > >
> > > +static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, boo=
l
> > > enable) +{
> > > +       u32 val, mask;
> > > +
> > > +       mask =3D SUN8I_MIXER_BLEND_CSC_CTL_EN(layer);
> > > +
> > > +       if (enable)
> > > +               val =3D mask;
> > > +       else
> > > +               val =3D 0;
> > > +
> > > +       regmap_update_bits(map, SUN8I_MIXER_BLEND_CSC_CTL(DE3_BLD_BAS=
E),
> > > +                          mask, val);
> > > +}
> > > +
> > >
> > >  void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int
> > >  layer,
> > >
> > >                                      enum sun8i_csc_mode mode)
> > >
> > >  {
> > >
> > > -       u32 base;
> > > +       if (!mixer->cfg->is_de3) {
> > > +               u32 base;
> >
> > You could rewrite this as
> >
> >     if (mixer->cfg->is_de3) {
> >                sun8i_de3_ccsc_set_coefficients(mixer->engine.regs,
> >                                                layer, mode);
> >                return;
> >     }
> >
> > That way you don't need to change the indentation on the existing lines=
.
> > I suppose this is more of a personal preference. The downside is the co=
ntrol
> > flow is slightly more complicated.
> >
> > > -       base =3D ccsc_base[mixer->cfg->ccsc][layer];
> > > +               base =3D ccsc_base[mixer->cfg->ccsc][layer];
> > >
> > > -       sun8i_csc_set_coefficients(mixer->engine.regs, base, mode);
> > > +               sun8i_csc_set_coefficients(mixer->engine.regs, base,
> > > mode);
> > > +       } else {
> > > +               sun8i_de3_ccsc_set_coefficients(mixer->engine.regs,
> > > +                                               layer, mode);
> > > +       }
> > >
> > >  }
> > >
> > >  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, boo=
l
> > >  enable) {
> > >
> > > -       u32 base;
> > > +       if (!mixer->cfg->is_de3) {
> > > +               u32 base;
> > >
> > > -       base =3D ccsc_base[mixer->cfg->ccsc][layer];
> > > +               base =3D ccsc_base[mixer->cfg->ccsc][layer];
> > >
> > > -       sun8i_csc_enable(mixer->engine.regs, base, enable);
> > > +               sun8i_csc_enable(mixer->engine.regs, base, enable);
> > > +       } else {
> > > +               sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enab=
le);
> > > +       }
> > >
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index 743941a33d88..a9218abf093=
5
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > @@ -460,8 +460,21 @@ static int sun8i_mixer_bind(struct device *dev,
> > > struct device *master,>
> > >         base =3D sun8i_blender_base(mixer);
> > >
> > >         /* Reset the registers */
> > >
> > > -       for (i =3D 0x0; i < 0x20000; i +=3D 4)
> > > -               regmap_write(mixer->engine.regs, i, 0);
> > > +       if (mixer->cfg->is_de3) {
> > > +               for (i =3D 0x0; i < 0x3000; i +=3D 4)
> > > +                       regmap_write(mixer->engine.regs, i, 0);
> > > +               for (i =3D 0x20000; i < 0x40000; i +=3D 4)
> > > +                       regmap_write(mixer->engine.regs, i, 0);
> > > +               for (i =3D 0x70000; i < 0x88000; i +=3D 4)
> > > +                       regmap_write(mixer->engine.regs, i, 0);
> > > +               for (i =3D 0xa0000; i < 0xb0000; i +=3D 4)
> > > +                       regmap_write(mixer->engine.regs, i, 0);
> > > +               for (i =3D 0xd0000; i < 0xe0000; i +=3D 4)
> > > +                       regmap_write(mixer->engine.regs, i, 0);
> >
> > Could you use the macros *_BASE and *_SIZE here? That would make
> > it more obviously what parts you're clearing.
>
> Ok, but where should I define them? In sun8i-mixer.h?

If it's only used here you could put them just above this function.

> >
> > The last offset, 0xd0000, isn't even defined in the DE3 spec.
>
> It is, check chapter 2.3.2, table 2-3.

I must have read something incorrectly. I see it now. Thanks.

ChenYu

> >
> > > +       } else {
> > > +               for (i =3D 0x0; i < 0x20000; i +=3D 4)
> > > +                       regmap_write(mixer->engine.regs, i, 0);
> > > +       }
> > >
> > >         /* Enable the mixer */
> > >         regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > b/drivers/gpu/drm/sun4i/sun8i_mixer.h index 020b0a097c84..4c9a442bbb4=
4
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > @@ -33,6 +33,10 @@
> > >
> > >  #define DE2_CH_BASE                            0x2000
> > >  #define DE2_CH_SIZE                            0x1000
> > >
> > > +#define DE3_BLD_BASE                           0x0800
> > > +#define DE3_CH_BASE                            0x1000
> > > +#define DE3_CH_SIZE                            0x0800
> > > +
> > >
> > >  #define SUN8I_MIXER_BLEND_PIPE_CTL(base)       ((base) + 0)
> > >  #define SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, x) ((base) + 0x4 + 0x10 =
*
> > >  (x))
> > >  #define SUN8I_MIXER_BLEND_ATTR_INSIZE(base, x) ((base) + 0x8 + 0x10 =
*
> > >  (x))
> > >
> > > @@ -47,6 +51,11 @@
> > >
> > >  #define SUN8I_MIXER_BLEND_CK_MAX(base, x)      ((base) + 0xc0 + 0x04=
 *
> > >  (x))
> > >  #define SUN8I_MIXER_BLEND_CK_MIN(base, x)      ((base) + 0xe0 + 0x04=
 *
> > >  (x))
> > >  #define SUN8I_MIXER_BLEND_OUTCTL(base)         ((base) + 0xfc)
> > >
> > > +#define SUN8I_MIXER_BLEND_CSC_CTL(base)                ((base) + 0x1=
00)
> > > +#define SUN8I_MIXER_BLEND_CSC_COEFF(base, layer, x, y) \
> > > +       ((base) + 0x110 + (layer) * 0x30 +  (x) * 0x10 + 4 * (y))
> > > +#define SUN8I_MIXER_BLEND_CSC_CONST(base, layer, i) \
> > > +       ((base) + 0x110 + (layer) * 0x30 +  (i) * 0x10 + 0x0c)
> >
> > Should these have a DE3 prefix?
>
> Ok for all prefix comments.
>
> >
> > >  #define SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK      GENMASK(12, 8)
> > >  #define SUN8I_MIXER_BLEND_PIPE_CTL_EN(pipe)    BIT(8 + pipe)
> > >
> > > @@ -61,6 +70,9 @@
> > >
> > >  #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED    BIT(1)
> > >
> > > +#define SUN8I_MIXER_BLEND_CSC_CTL_EN(ch)       BIT(ch)
> > > +#define SUN8I_MIXER_BLEND_CSC_CONST_VAL(d, c)  (((d) << 16) | ((c) &
> > > 0xffff)) +
> >
> > Same here.
> >
> > >  #define SUN8I_MIXER_FBFMT_ARGB8888     0
> > >  #define SUN8I_MIXER_FBFMT_ABGR8888     1
> > >  #define SUN8I_MIXER_FBFMT_RGBA8888     2
> >
> > [...]
> >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > > b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h index 46f0237c17bb..3d0ad641=
78ea
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > > @@ -30,6 +30,8 @@
> > >
> > >  #define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE                BIT(1=
5)
> > >  #define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET    8
> > >  #define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK      GENMASK(12, 8=
)
> > >
> > > +#define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK      GENMASK(31, 2=
4)
> > > +#define SUN8I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(x)                ((x) =
<<
> > > 24)
> >
> > DE3 prefix?
> >
> > >  struct sun8i_mixer;
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> > > b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c index
> > > 8697afc36023..22e1ed5cd7a4 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> > > @@ -835,7 +835,10 @@ static const u32 bicubic4coefftab32[480] =3D {
> > >
> > >  static inline u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, in=
t
> > >  channel) {
> > >
> > > -       return DE2_VI_SCALER_BASE + DE2_VI_SCALER_SIZE * channel;
> > > +       if (mixer->cfg->is_de3)
> > > +               return DE3_VI_SCALER_BASE + DE3_VI_SCALER_SIZE * chan=
nel;
> > > +       else
> > > +               return DE2_VI_SCALER_BASE + DE2_VI_SCALER_SIZE * chan=
nel;
> > >
> > >  }
> > >
> > >  static int sun8i_vi_scaler_coef_index(unsigned int step)
> > >
> > > @@ -951,6 +954,35 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *m=
ixer,
> > > int layer,>
> > >                 cvphase =3D vphase;
> > >
> > >         }
> > >
> > > +       if (mixer->cfg->is_de3) {
> > > +               u32 val;
> > > +
> > > +               if (format->hsub =3D=3D 1 && format->vsub =3D=3D 1)
> > > +                       val =3D SUN8I_SCALER_VSU_SCALE_MODE_UI;
> > > +               else
> > > +                       val =3D SUN8I_SCALER_VSU_SCALE_MODE_NORMAL;
> > > +
> > > +               regmap_write(mixer->engine.regs,
> > > +                            SUN8I_SCALER_VSU_SCALE_MODE(base), val);
> >
> > The remaining settings seem to be related to the edge detection scaling
> > method. Since you aren't supporting it, are they necessary?
>
> Didn't really tried without them IIRC. I will for next revision.
>
> Best regards,
> Jernej
>
> >
> > > +               regmap_write(mixer->engine.regs,
> > > +                            SUN8I_SCALER_VSU_DIR_THR(base),
> > > +                            SUN8I_SCALER_VSU_SUB_ZERO_DIR_THR(0) |
> > > +                            SUN8I_SCALER_VSU_ZERO_DIR_THR(0) |
> > > +                            SUN8I_SCALER_VSU_HORZ_DIR_THR(0xff) |
> > > +                            SUN8I_SCALER_VSU_VERT_DIR_THR(1));
> > > +               regmap_write(mixer->engine.regs,
> > > +                            SUN8I_SCALER_VSU_EDGE_THR(base),
> > > +                            SUN8I_SCALER_VSU_EDGE_SHIFT(8) |
> > > +                            SUN8I_SCALER_VSU_EDGE_OFFSET(0));
> > > +               regmap_write(mixer->engine.regs,
> > > +                            SUN8I_SCALER_VSU_EDSCL_CTRL(base), 0);
> > > +               regmap_write(mixer->engine.regs,
> > > +                            SUN8I_SCALER_VSU_ANGLE_THR(base),
> > > +                            SUN8I_SCALER_VSU_ANGLE_SHIFT(2) |
> > > +                            SUN8I_SCALER_VSU_ANGLE_OFFSET(0));
> > > +       }
> > > +
> > >
> > >         regmap_write(mixer->engine.regs,
> > >
> > >                      SUN8I_SCALER_VSU_OUTSIZE(base), outsize);
> > >
> > >         regmap_write(mixer->engine.regs,
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
> > > b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h index
> > > cd015405f66d..c322f5652481 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
> > > @@ -15,6 +15,9 @@
> > >
> > >  #define DE2_VI_SCALER_BASE 0x20000
> > >  #define DE2_VI_SCALER_SIZE 0x20000
> > >
> > > +#define DE3_VI_SCALER_BASE 0x20000
> > > +#define DE3_VI_SCALER_SIZE 0x08000
> > > +
> > >
> > >  /* this two macros assumes 16 fractional bits which is standard in D=
RM */
> > >  #define SUN8I_VI_SCALER_SCALE_MIN              1
> > >  #define SUN8I_VI_SCALER_SCALE_MAX              ((1UL << 20) - 1)
> > >
> > > @@ -25,6 +28,11 @@
> > >
> > >  #define SUN8I_VI_SCALER_SIZE(w, h)             (((h) - 1) << 16 | ((=
w) -
> > >  1))
> > >
> > >  #define SUN8I_SCALER_VSU_CTRL(base)            ((base) + 0x0)
> > >
> > > +#define SUN8I_SCALER_VSU_SCALE_MODE(base)      ((base) + 0x10)
> > > +#define SUN8I_SCALER_VSU_DIR_THR(base)         ((base) + 0x20)
> > > +#define SUN8I_SCALER_VSU_EDGE_THR(base)                ((base) + 0x2=
4)
> > > +#define SUN8I_SCALER_VSU_EDSCL_CTRL(base)      ((base) + 0x28)
> > > +#define SUN8I_SCALER_VSU_ANGLE_THR(base)       ((base) + 0x2c)
> >
> > DE3 prefix for the new ones please.
> >
> > >  #define SUN8I_SCALER_VSU_OUTSIZE(base)         ((base) + 0x40)
> > >  #define SUN8I_SCALER_VSU_YINSIZE(base)         ((base) + 0x80)
> > >  #define SUN8I_SCALER_VSU_YHSTEP(base)          ((base) + 0x88)
> > >
> > > @@ -46,6 +54,21 @@
> > >
> > >  #define SUN8I_SCALER_VSU_CTRL_EN               BIT(0)
> > >  #define SUN8I_SCALER_VSU_CTRL_COEFF_RDY                BIT(4)
> > >
> > > +#define SUN8I_SCALER_VSU_SUB_ZERO_DIR_THR(x)   (((x) << 24) & 0xFF)
> > > +#define SUN8I_SCALER_VSU_ZERO_DIR_THR(x)       (((x) << 16) & 0xFF)
> > > +#define SUN8I_SCALER_VSU_HORZ_DIR_THR(x)       (((x) << 8) & 0xFF)
> > > +#define SUN8I_SCALER_VSU_VERT_DIR_THR(x)       ((x) & 0xFF)
> > > +
> > > +#define SUN8I_SCALER_VSU_SCALE_MODE_UI         0
> > > +#define SUN8I_SCALER_VSU_SCALE_MODE_NORMAL     1
> > > +#define SUN8I_SCALER_VSU_SCALE_MODE_ED_SCALE   2
> > > +
> > > +#define SUN8I_SCALER_VSU_EDGE_SHIFT(x)         (((x) << 16) & 0xF)
> > > +#define SUN8I_SCALER_VSU_EDGE_OFFSET(x)                ((x) & 0xFF)
> > > +
> > > +#define SUN8I_SCALER_VSU_ANGLE_SHIFT(x)                (((x) << 16) =
&
> > > 0xF)
> > > +#define SUN8I_SCALER_VSU_ANGLE_OFFSET(x)       ((x) & 0xFF)
> > > +
> >
> > Same here.
> >
> > Regards
> > ChenYu
> >
> > >  void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bo=
ol
> > >  enable); void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int
> > >  layer,
> > >
> > >                            u32 src_w, u32 src_h, u32 dst_w, u32 dst_h=
,
> > >
> > > --
> > > 2.18.0
>
>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
