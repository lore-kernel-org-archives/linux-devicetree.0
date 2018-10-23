From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/sun4i: tcon: Support an active-low
 DE signal with RGB interface
Date: Tue, 23 Oct 2018 11:33:10 +0200
Message-ID: <224ec158bf627b4d2f577b1dadf10bd87891e2a7.camel@paulk.fr>
References: <20181010114134.8211-1-contact@paulk.fr>
	 <20181010145736.l6zpohvvd4b5qngr@flea>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-gI9g6LVf0JgHXOGJa04j"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBM6VXPPAKGQELSYFJKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181010145736.l6zpohvvd4b5qngr@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Van den Borre <mark-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Gerry Demaret <gerry-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-gI9g6LVf0JgHXOGJa04j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 10 octobre 2018 =C3=A0 16:57 +0200, Maxime Ripard a =C3=A9crit =
:
> On Wed, Oct 10, 2018 at 01:41:31PM +0200, Paul Kocialkowski wrote:
> > Some panels need an active-low data enable (DE) signal for the RGB
> > interface. This requires flipping a bit in the TCON0 polarity register
> > when setting up the mode for the RGB interface.
> >=20
> > Add a new helper function to match specific bus flags and use it to set
> > the polarity inversion bit for the DE signal when required.
> >=20
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 28 ++++++++++++++++++++++++++--
> >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
> >  2 files changed, 27 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index 3fb084f802e2..d249a462ec09 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -78,6 +78,24 @@ static int sun4i_tcon_get_pixel_depth(const struct d=
rm_encoder *encoder)
> >  	return -EINVAL;
> >  }
> > =20
> > +static bool sun4i_tcon_match_bus_flags(const struct drm_encoder *encod=
er,
> > +				       u32 bus_flags)
> > +{
> > +	struct drm_connector *connector;
> > +	struct drm_display_info *info;
> > +
> > +	connector =3D sun4i_tcon_get_connector(encoder);
> > +	if (!connector)
> > +		return false;
> > +
> > +	info =3D &connector->display_info;
> > +
> > +	if ((info->bus_flags & bus_flags) =3D=3D bus_flags)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int=
 channel,
> >  					  bool enabled)
> >  {
> > @@ -415,6 +433,7 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_=
tcon *tcon,
> >  }
> > =20
> >  static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
> > +				     const struct drm_encoder *encoder,
> >  				     const struct drm_display_mode *mode)
> >  {
> >  	unsigned int bp, hsync, vsync;
> > @@ -474,8 +493,13 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_=
tcon *tcon,
> >  	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> >  		val |=3D SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> > =20
> > +	if (sun4i_tcon_match_bus_flags(encoder, DRM_BUS_FLAG_DE_LOW))
> > +		val |=3D SUN4I_TCON0_IO_POL_DE_NEGATIVE;
> > +
>=20
> There's other flags in use in that function, you should also migrate
> them (ideally by splitting that new function into a separate patch).

Actually, these other flags are not DRM bus flags but DRM mode flags,
which can be accessed directly from the mode pointer passed as
argument. Thus, they don't require a helper.

If you'd like, I could still split this patch into one introducing the
helper and one using it for checking the DE_LOW flag.

What do you think?

Cheers,

Paul

--=20
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=-gI9g6LVf0JgHXOGJa04j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlvO6tYACgkQhP3B6o/u
lQyaww/+LEHGAI0eyS9mXFNnzLafS9wACmtlBIlb9tRWy3aRnIxZgvwChAWG+ljG
MaYnphmP6Yykfru2B2i8VgfpdFU0Eat6wBiacvjXKVhCGaAqCfeQC8YBeW8JwDyS
C39T27GBef3raNT5tD2MxTXwRdUQEXlqsSwy9ClRzzyp8p4Hc772gFhJv2iEEdoW
VQQs4Vb43JyrJaTdHucs+y6E7HeMg0UaB6e6fDpHjeN0vQzjvttwVT5rK6N0FWyX
ajSlFNECBZ++OpOjGXaFMCPAu3zLraev0hXb4fqLfqfu0AfbhxcOJ6QNtY6CkO43
MwS37sqmWuY1bCfB8bSJRzRD1Smii3D47BVk6J/ZH9Xt9jDKc5IV0ZVCeOjFTjmk
2OwT/C2FfDYOnoSDwD/f50UTMnwWx/+3Rv45TyAPAmuK549wD1HD1tA7u3jqLbhT
Kgubq2mqkA0xmuoULb+yvIj2VZgwRgWG2HLfifQu/1N57SqgVIDvZtWm9RWjdCZo
k7jtLN8kkpx5uw5PXao5RiwB8dJwqg9T3e6RqrXsTQr3DVCLHcmC4dC1kZD3bNTQ
nfpqRxh08gZR5x8k4GZ4H834srLFrfXsN3xSBnbvtavYcj4Cr9yNamDUJAj+FGnW
c600E2ireiaHQoXYrB0fcRQdqAJCNiW3KdeykzhE9QKp2yBnenU=
=QD2w
-----END PGP SIGNATURE-----

--=-gI9g6LVf0JgHXOGJa04j--
