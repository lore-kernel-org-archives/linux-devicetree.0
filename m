From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 06/18] drm/sun4i: tcon: Don't rely on encoders to enable
 the TCON
Date: Thu, 20 Jul 2017 15:20:44 +0200
Message-ID: <20170720132044.sisl3liag3amfvlr@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <e8e204b4b366f609db5b7d848f8cfb88345cd2d7.1499955058.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67LNwLWWJEkw=FKE-kPkVHPK7XZC-OY02A1a94w6E5e1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jbk6umcmopawvdmy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67LNwLWWJEkw=FKE-kPkVHPK7XZC-OY02A1a94w6E5e1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jbk6umcmopawvdmy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Fri, Jul 14, 2017 at 11:40:07AM +0800, Chen-Yu Tsai wrote:
> >  static void sun4i_rgb_encoder_mode_set(struct drm_encoder *encoder,
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index d9791292553e..dc70bc2a42a5 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -14,6 +14,7 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_encoder.h>
> >  #include <drm/drm_modes.h>
> >  #include <drm/drm_of.h>
> >
> > @@ -32,66 +33,62 @@
> >  #include "sun4i_tcon.h"
> >  #include "sunxi_engine.h"
> >
> > -void sun4i_tcon_disable(struct sun4i_tcon *tcon)
> > +static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int=
 channel,
> > +                                         bool enabled)
> >  {
> > -       DRM_DEBUG_DRIVER("Disabling TCON\n");
> > +       struct clk *clk;
> >
> > -       /* Disable the TCON */
> > -       regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
> > -                          SUN4I_TCON_GCTL_TCON_ENABLE, 0);
> > -}
> > -EXPORT_SYMBOL(sun4i_tcon_disable);
> > -
> > -void sun4i_tcon_enable(struct sun4i_tcon *tcon)
> > -{
> > -       DRM_DEBUG_DRIVER("Enabling TCON\n");
> > -
> > -       /* Enable the TCON */
> > -       regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
> > -                          SUN4I_TCON_GCTL_TCON_ENABLE,
> > -                          SUN4I_TCON_GCTL_TCON_ENABLE);
> > -}
> > -EXPORT_SYMBOL(sun4i_tcon_enable);
> > -
> > -void sun4i_tcon_channel_disable(struct sun4i_tcon *tcon, int channel)
> > -{
> > -       DRM_DEBUG_DRIVER("Disabling TCON channel %d\n", channel);
> > -
> > -       /* Disable the TCON's channel */
> > -       if (channel =3D=3D 0) {
> > +       switch (channel) {
> > +       case 0:
> >                 regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
> > -                                  SUN4I_TCON0_CTL_TCON_ENABLE, 0);
> > -               clk_disable_unprepare(tcon->dclk);
> > +                                  SUN4I_TCON0_CTL_TCON_ENABLE,
> > +                                  enabled ? SUN4I_TCON0_CTL_TCON_ENABL=
E : 0);
> > +               clk =3D tcon->dclk;
> > +               break;
> > +       case 1:
> > +               WARN_ON(!tcon->quirks->has_channel_1);
> > +               regmap_update_bits(tcon->regs, SUN4I_TCON1_CTL_REG,
> > +                                  SUN4I_TCON1_CTL_TCON_ENABLE,
> > +                                  enabled ? SUN4I_TCON1_CTL_TCON_ENABL=
E : 0);
> > +               clk =3D tcon->sclk1;
> > +               break;
> > +       default:
> > +               DRM_DEBUG_DRIVER("Unknown channel... doing nothing\n");
> >                 return;
> >         }
> >
> > -       WARN_ON(!tcon->quirks->has_channel_1);
> > -       regmap_update_bits(tcon->regs, SUN4I_TCON1_CTL_REG,
> > -                          SUN4I_TCON1_CTL_TCON_ENABLE, 0);
> > -       clk_disable_unprepare(tcon->sclk1);
> > +       if (enabled)
> > +               clk_prepare_enable(clk);
>=20
> I wonder if it's better to enable the clk before the TCON?

I think I kept the current behaviour, which seemed to work fine with
that regard.

>=20
> > +       else
> > +               clk_disable_unprepare(clk);
> >  }
> > -EXPORT_SYMBOL(sun4i_tcon_channel_disable);
> >
> > -void sun4i_tcon_channel_enable(struct sun4i_tcon *tcon, int channel)
> > +void sun4i_tcon_set_status(struct sun4i_tcon *tcon,
> > +                          struct drm_encoder *encoder,
> > +                          bool enabled)
> >  {
> > -       DRM_DEBUG_DRIVER("Enabling TCON channel %d\n", channel);
> > -
> > -       /* Enable the TCON's channel */
> > -       if (channel =3D=3D 0) {
> > -               regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
> > -                                  SUN4I_TCON0_CTL_TCON_ENABLE,
> > -                                  SUN4I_TCON0_CTL_TCON_ENABLE);
> > -               clk_prepare_enable(tcon->dclk);
> > +       int channel;
> > +
> > +       switch (encoder->encoder_type) {
> > +       case DRM_MODE_ENCODER_NONE:
> > +               channel =3D 0;
> > +               break;
> > +       case DRM_MODE_ENCODER_TMDS:
> > +       case DRM_MODE_ENCODER_TVDAC:
> > +               channel =3D 1;
> > +               break;
> > +       default:
> > +               DRM_DEBUG_DRIVER("Unknown encoder type, doing nothing..=
=2E\n");
>=20
> We could simply add all the possible types, and print a big warning
> if someone does something unexpected. IMHO this is better than having
> the user enable some hidden debug flag to figure why the display isn't
> working properly.

I'm not sure about all types of encoders, but you're right, it should
be a warning.

> >                 return;
> >         }
> >
> > -       WARN_ON(!tcon->quirks->has_channel_1);
> > -       regmap_update_bits(tcon->regs, SUN4I_TCON1_CTL_REG,
> > -                          SUN4I_TCON1_CTL_TCON_ENABLE,
> > -                          SUN4I_TCON1_CTL_TCON_ENABLE);
> > -       clk_prepare_enable(tcon->sclk1);
> > +       sun4i_tcon_channel_set_status(tcon, channel, enabled);
> > +
> > +       regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
> > +                          SUN4I_TCON_GCTL_TCON_ENABLE,
> > +                          enabled ? SUN4I_TCON_GCTL_TCON_ENABLE : 0);
>=20
> The global enable bit should be set first.

ACK


> Also the manual says "When it=E2=80=99s disabled, the module will be rese=
t to
> idle state."
> so you might get away with just disabling the global enable bit and retur=
ning
> directly after disabling the clock?

I'd rather keep an explicit disable, just in case one SoC is broken,
just like the DE is...

> >  }
> > -EXPORT_SYMBOL(sun4i_tcon_channel_enable);
> > +EXPORT_SYMBOL(sun4i_tcon_set_status);
>=20
> The TCON and CRTC code are part of the same module.
> There is no need to export this function.

Ah, right. I'll remove it. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jbk6umcmopawvdmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcK4sAAoJEBx+YmzsjxAgRywQALDe7ZsBSRxKjuBqIULvDsPI
lvS5VqZ6Hzstmdkk87avo+gktIHXx8Z/yfQ796pGn9+oVMILXA/Rmu53dsnPXwkI
66Ea6NAFqPIMv3162nZ1+1+ovdMltRjp+qo6UoXHqt4OUCRxQm5v+M4kHOrvLDkR
rEAO2fqrI86B4TTYLtHSkkyvqdT4QVzTE/bDO/XbhXkb/obdBK+foId2sGpfWZt7
EiFiYi4TF/fXKvbtheeZ6w8yI/XLj2t0hQmIVLlWTqDA/DFKw4bQVTVJbNjXoGLW
HIExPggWfbWpUcDj8Nf2MjcJj3zADtyy5tVgwILQUCVU3IqKWXdV9TULEAhA8loq
jqE5oe/YRzim2yNfjN6dXd3kV1PlqeOsWt7u0e9MkXkyABQDd2cgAUeMV8Bp7qlw
rnUyghrPK5DjiCJP54e0FHANhQSF+KJBN/TZUhky0lf124hFGX34WIWpvumZH5bF
RB2U8NNKZboRe/1rT2Bw1oczvteuO41Zywil/Ss3I1Ua1zt8i1NLr+AENM0K94BN
9BtdB7un1nA9Uf1ZmDVVe/NsKJPZDyvXgXe5b6n39qEXG3uwMGoJEFHh8//9Owo2
mCfVHoCD5YoHMae2XCUHVV+k2KCffTaSfRE89kNsDrCHVIbCbUt7u9wADpihtX8k
bZ/2vDF1XHHQP4JIcpbU
=nCwp
-----END PGP SIGNATURE-----

--jbk6umcmopawvdmy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
