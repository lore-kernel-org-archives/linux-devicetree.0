From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: Add attach/detach callbacks
Date: Fri, 21 Jun 2019 11:19:28 +0200
Message-ID: <20190621091928.GA11839@ulmo>
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-4-dbasehore@chromium.org>
 <20190611085722.GX21222@phenom.ffwll.local>
 <CAGAzgsr2sh5B1xi_ztQPN0xoQsZd26DDXwWT_qqJ68XeKReJ_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGAzgsr2sh5B1xi_ztQPN0xoQsZd26DDXwWT_qqJ68XeKReJ_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "dbasehore ." <dbasehore@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, Intel Graphics <intel-gfx@lists.freedesktop.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel>
List-Id: devicetree@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 05:25:47PM -0700, dbasehore . wrote:
> On Tue, Jun 11, 2019 at 1:57 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jun 10, 2019 at 09:03:48PM -0700, Derek Basehore wrote:
> > > This adds the attach/detach callbacks. These are for setting up
> > > internal state for the connector/panel pair that can't be done at
> > > probe (since the connector doesn't exist) and which don't need to be
> > > repeatedly done for every get/modes, prepare, or enable callback.
> > > Values such as the panel orientation, and display size can be filled
> > > in for the connector.
> > >
> > > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_panel.c | 14 ++++++++++++++
> > >  include/drm/drm_panel.h     |  4 ++++
> > >  2 files changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > > index 3b689ce4a51a..72f67678d9d5 100644
> > > --- a/drivers/gpu/drm/drm_panel.c
> > > +++ b/drivers/gpu/drm/drm_panel.c
> > > @@ -104,12 +104,23 @@ EXPORT_SYMBOL(drm_panel_remove);
> > >   */
> > >  int drm_panel_attach(struct drm_panel *panel, struct drm_connector *=
connector)
> > >  {
> > > +     int ret;
> > > +
> > >       if (panel->connector)
> > >               return -EBUSY;
> > >
> > >       panel->connector =3D connector;
> > >       panel->drm =3D connector->dev;
> > >
> > > +     if (panel->funcs->attach) {
> > > +             ret =3D panel->funcs->attach(panel);
> > > +             if (ret < 0) {
> > > +                     panel->connector =3D NULL;
> > > +                     panel->drm =3D NULL;
> > > +                     return ret;
> > > +             }
> > > +     }
> >
> > Why can't we just implement this in the drm helpers for everyone, by e.=
g.
> > storing a dt node in drm_panel? Feels a bit overkill to have these new
> > hooks here.
> >
> > Also, my understanding is that this dt stuff is supposed to be
> > standardized, so this should work.
>=20
> So do you want all of this information added to the drm_panel struct?
> If we do that, we don't necessarily even need the drm helper function.
> We could just copy the values over here in the drm_panel_attach
> function (and clear them in drm_panel_detach).

Yeah, I think we should have all this extra information in the struct
drm_panel. However, I think we need to more carefully split things such
that the DT parsing happens at panel probe time. That way we can catch
errors in DT, or missing entries/resources when we can still do
something about it.

If we start parsing DT and encounter failures, it's going to be very
confusing if that's at panel attach time where code will usually just
assume that everything is already validated and can't fail anymore.

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0MoR0ACgkQ3SOs138+
s6HqSA/+K8hfGyhC4XmLpKlVudKyrd41RyGRD7AunVOl6aE/CaukHevacdCPSUtk
d/jaIe1fC3ImLE/uIZQDQBsBL3JzwrJHo0RVxijTJ7P9X1jrMR1ynK5sOWW0dPxR
Sd87iKVNNu0Rl8CxAYzucxHrr2Up2W6uT02H0Lbxk+idIWKixRrPbUAVCMpFHTyr
MbaVLkRd1sOEqLzetlU7HoUCx3wKgWdQgeRllgTDYgGutEQWnizljTrTglT0IAeQ
U2LAykWBhhM4LBxYoEcdfOnosYQpKrg9suaNHNXknN+KEB5lnt/UbWCi5poLg1P4
vyXMGFN8GwXXRNEKP0hYKGlLTzM19i3g9FRXAzeKv1hxmYhdG6S3dnzX22TG75No
g0mUT2aFCEImAtMtQaCsucDHAnU/+YfmTekla4NxZo2UdOh0GYyKTaZ8OKsaETu+
Hb+l76/ebe16vU+nJUYzKF5i/T+UlplLKLLGF8ivNBDSbWDD4l5Gh+hec2akFAVd
U/CvEE85FyPaUIM9rTztStgICDwaxJNk62apvYouCkIIHOR3QVlgkxvk6DM6O5/c
AjfC0dJqHvnx1HYiD0Sz65SeWArm/ujA1tcNZAFKLtPN2P5CHo6b2P2C1DfclkCw
HBVMLmjbClz3caQjKmTvXk9YSnSSZBejdPW6zptywAik+UBj2r0=
=ph6O
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
