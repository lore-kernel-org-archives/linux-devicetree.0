From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 09/15] drm/sun4i: Add A83T support
Date: Thu, 7 Dec 2017 11:55:08 +0100
Message-ID: <20171207105508.ps22szj3y5pjwhdd@flea.lan>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
 <0f8137abb37de936db82c1251556ee84fb23c7fe.1512486553.git-series.maxime.ripard@free-electrons.com>
 <1823097.lykhZvJrH4@jernej-laptop>
 <1729482.Mgh5nx8BIs@jernej-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2038213208=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1729482.Mgh5nx8BIs@jernej-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, plaes@plaes.org, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org


--===============2038213208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kpz7c4fuqo3qpg3t"
Content-Disposition: inline


--kpz7c4fuqo3qpg3t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 06, 2017 at 05:37:47PM +0100, Jernej =C5=A0krabec wrote:
> Hi,
>=20
> Dne torek, 05. december 2017 ob 16:42:55 CET je Jernej =C5=A0krabec napis=
al(a):
> > Hi Maxime,
> >=20
> > Dne torek, 05. december 2017 ob 16:10:21 CET je Maxime Ripard napisal(a=
):
> > > Add support for the A83T display pipeline.
> > >=20
> > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/sun4i/sun4i_drv.c   |  1 +
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.c  |  5 +++++
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.c |  9 +++++++++
> > >  3 files changed, 15 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > > b/drivers/gpu/drm/sun4i/sun4i_drv.c index 49215d91c853..6f5e721b545e
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> > > @@ -347,6 +347,7 @@ static const struct of_device_id sun4i_drv_of_tab=
le[]
> > > =3D
> > > { { .compatible =3D "allwinner,sun6i-a31s-display-engine" },
> > >=20
> > >  	{ .compatible =3D "allwinner,sun7i-a20-display-engine" },
> > >  	{ .compatible =3D "allwinner,sun8i-a33-display-engine" },
> > >=20
> > > +	{ .compatible =3D "allwinner,sun8i-a83t-display-engine" },
> > >=20
> > >  	{ .compatible =3D "allwinner,sun8i-v3s-display-engine" },
> > >  	{ }
> > > =20
> > >  };
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index 92f4738101e6..9b757450555f
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > @@ -1132,6 +1132,10 @@ static const struct sun4i_tcon_quirks
> > > sun8i_a33_quirks =3D { .has_lvds_pll		=3D true,
> > >=20
> > >  };
> > >=20
> > > +static const struct sun4i_tcon_quirks sun8i_a83t_lcd_quirks =3D {
> > > +	/* nothing is supported */
> > > +};
> > > +
> > >=20
> > >  static const struct sun4i_tcon_quirks sun8i_v3s_quirks =3D {
> > > =20
> > >  	/* nothing is supported */
> > > =20
> > >  };
> > >=20
> > > @@ -1144,6 +1148,7 @@ const struct of_device_id sun4i_tcon_of_table[]=
 =3D {
> > >=20
> > >  	{ .compatible =3D "allwinner,sun6i-a31s-tcon", .data =3D=20
> &sun6i_a31s_quirks
> > >  	},
> > >=20
> > > { .compatible =3D "allwinner,sun7i-a20-tcon", .data =3D &sun7i_a20_qu=
irks }, {
> > > .compatible =3D "allwinner,sun8i-a33-tcon", .data =3D &sun8i_a33_quir=
ks }, +=09
> {
> > > .compatible =3D "allwinner,sun8i-a83t-tcon-lcd", .data =3D
> > > &sun8i_a83t_lcd_quirks }, { .compatible =3D "allwinner,sun8i-v3s-tcon=
",
> > > .data
> > > =3D &sun8i_v3s_quirks }, { }
> > >=20
> > >  };
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index ff235e3228ce..6829bec4ba68
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > @@ -477,6 +477,11 @@ static int sun8i_mixer_remove(struct platform_de=
vice
> > > *pdev) return 0;
> > >=20
> > >  }
> > >=20
> > > +static const struct sun8i_mixer_cfg sun8i_a83t_mixer_cfg =3D {
> > > +	.vi_num =3D 1,
> > > +	.ui_num =3D 3,
> > > +};
> > > +
> >=20
> > I think you should expand that structure with:
> > .ccsc =3D 0,
> > .scaler_mask =3D 0xf,
> > .mod_rate =3D 150000000,
>=20
> I guess you could set higher clock if CLK_SET_RATE_PARENT flag is set to =
de_clk=20
> in A83T CCU driver. BSP sets it to 500 MHz, which is a bit high...

Actually, I didn't have to change the rate used by default, so it's
not clear what it should be on the A83T.

And yeah, I'd like to avoid setting it at 500MHz without any
particular reason. The A83T draws way to much power already without
making it worse.

I'll add the CCSC and scaler_mask fields.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kpz7c4fuqo3qpg3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlopHggACgkQ0rTAlCFN
r3RK0w//cWYrQKKOkyM9OuBnRy/UTXzMUTPCW84fP77MHIaKOVbdq+0NRN5gm53I
uUtjZNDAxIFBKpXDmzUs3m9y+8dRHNogUOVtcDAAt55sJON313d2ouKAJ1lqZMtK
1A6enuMsiiqTsxB1N4v5Ugsdz6t6AHfLPEUDQHQkir9IYvTJO2S6yDwhilGqf0Vg
Y7Dc1hxQjtM8Vs5s6w/5QoWmBZP/qCPFRMG8niH/oY/sKRt5m6MJacHPIqN9bhsG
LFIoj0SnhsA8QImPOh3OK63AMWnUR2YRneqvD8DXZG7/qkbFFR3+eIc8RAOZ8xK2
YAJkrDZmyQt29lY47kWsREDLcjOViWv5HqTRRJGBOU4MMYUCo3Vw4VWlJhQw+koE
VlxieF2B62lfv+ALDV1causW6O8zFeSCoffAR4bMBb7J/xdJQvCQ4+k8OEfDJN4t
HfjxqJ1saLaPg/sl+SFUCEfr3HBUUKJMkhzsB/kxcI6F6yGjvf2YtWa274PYOH0M
xO8Y6l3eH5z0E7En0UTb3nY4Nz9gzK8ZnMzWSwhEcM/ui5Tt8edEAnefPAiFtFsg
XS3wIO4poRASL6hqyM49qQWjpWHvxo7I1cPXK1VQZri3x5cKvuilbqWXz1t0iq3q
I9pc1NhOj/U+yB4CKU+3XjFzhlNBzr/pPUMKR87/C7T7eaLsYOA=
=rKJj
-----END PGP SIGNATURE-----

--kpz7c4fuqo3qpg3t--

--===============2038213208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2038213208==--
