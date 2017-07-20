From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 03/18] drm/sun4i: Realign Makefile padding and reorder it
Date: Thu, 20 Jul 2017 15:08:01 +0200
Message-ID: <20170720130801.iyhlzu4zhbyso24y@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <fd70853df9e7ee66a20df9d42921f1f6608a2bc9.1499955058.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67HmUpSaoJWS6jKg3JvsPmqMtv30EGdWE50YEPm2cyjcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cechdgqvekr472se"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67HmUpSaoJWS6jKg3JvsPmqMtv30EGdWE50YEPm2cyjcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cechdgqvekr472se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 11:13:53AM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 13, 2017 at 10:12 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Some options were not padded as they should, and the order in the Makef=
ile
> > was chaotic. Fix that.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/Makefile | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Mak=
efile
> > index e29fd3a2ba9c..42871ee7acf6 100644
> > --- a/drivers/gpu/drm/sun4i/Makefile
> > +++ b/drivers/gpu/drm/sun4i/Makefile
> > @@ -1,23 +1,23 @@
> > -sun4i-drm-y +=3D sun4i_drv.o
> > -sun4i-drm-y +=3D sun4i_framebuffer.o
> > +sun4i-backend-y                        +=3D sun4i_backend.o sun4i_laye=
r.o
> >
> > -sun4i-drm-hdmi-y +=3D sun4i_hdmi_enc.o
> > -sun4i-drm-hdmi-y +=3D sun4i_hdmi_ddc_clk.o
> > -sun4i-drm-hdmi-y +=3D sun4i_hdmi_tmds_clk.o
> > +sun4i-drm-y                    +=3D sun4i_drv.o
> > +sun4i-drm-y                    +=3D sun4i_framebuffer.o
>=20
> I don't think this applies on top of Jonathan's HDMI I2C patch
> you already have queued up.
>=20
> Also you might want to leave a comment describe what the
> ordering should be. Otherwise it will still be messed up
> down the road.

Good point, I'll do that, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cechdgqvekr472se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcKsxAAoJEBx+YmzsjxAggp4P/3CuMMHzuE5k4Owo8nAAaXsV
u450pCS/d/X9UoOSfhEH5jPaZ/u6wCyE7vOEdGXh1VKLyGV+7eN3526g06p5Umon
XZpFvmfEMisIS1sW+pBMJUMBdZXnpOrJNA5vIzdL1A4i22TTi5ASg9URw9B1RhUz
cKxtNBmww2zyPxAWfV4HNASophSYdWWtZELN2GnHPs2oWpeB1NIuuuO4llLAJWD6
aBmSwg3pMDGxLG7rq73+DgrSbxlZRNprd16heJuNbPWp302EzlPs3yDjUhKeUDNz
DCNPGK/q+c0ZMtO8i3bJRB9wZx139ES3PjYzkzzcHNvtAFmiITllWA4QiLI0PMci
+XK3+3SdUjWPR+Upaiy7dj0n1M0MooIhxKaMPxy3lmEYXQ2rRgwysptSNAYhEnRX
GO71hx1bm8JvVgsgWWaZCTvQavdTgRQH+u68DzCudHMfzja7MczuR4CMn/Z/M9He
DFW2oOd/9d0+JJlw4Kv/Iq1kajaixxl2hr2VIRXL545kHnpEs6nEibOvTBwEYnNv
C2857s2RwzLKITQHDbZOV5upIXPgDslkyJGe4kp/ATZ7W4055RaxlK96agbTjwgr
UhNkS4WQLQX5mlqKYJIuN5OISs8IgP/ch/OgGfToY3AiYsoj8OvbDzDV0jjVpTab
zrfWzxHkDnjrteURr1rZ
=66RB
-----END PGP SIGNATURE-----

--cechdgqvekr472se--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
