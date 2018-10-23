From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 2/4] drm/panel: simple: Add support for the
 Lemaker BL035 3.5" LCD
Date: Tue, 23 Oct 2018 12:08:17 +0200
Message-ID: <30178c8b263656a9c285e45c78e1908927c99c48.camel@paulk.fr>
References: <20181010114134.8211-1-contact@paulk.fr>
	 <20181010114134.8211-2-contact@paulk.fr>
	 <20181010145850.krwe7wlqkbcpja33@flea>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0SJEQcI45ApnAHSZseZc"
Return-path: <linux-sunxi+bncBC75HK6WUAEBB4HFXPPAKGQEXLYX77Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181010145850.krwe7wlqkbcpja33@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Van den Borre <mark-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Gerry Demaret <gerry-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-0SJEQcI45ApnAHSZseZc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 10 octobre 2018 =C3=A0 16:58 +0200, Maxime Ripard a =C3=A9crit =
:
> On Wed, Oct 10, 2018 at 01:41:32PM +0200, Paul Kocialkowski wrote:
> > This adds support for the 3.5" LCD panel from Lemaker, sold for use wit=
h
> > BananaPi boards. It comes with a 24-bit RGB888 parallel interface and
> > requires an active-low DE signal
> >=20
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index 97964f7f2ace..229080fcf65e 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1461,6 +1461,30 @@ static const struct panel_desc kyo_tcg121xglp =
=3D {
> >  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> >  };
> > =20
> > +static const struct drm_display_mode lemaker_bl035_mode =3D {
> > +	.clock =3D 7000,
> > +	.hdisplay =3D 320,
> > +	.hsync_start =3D 320 + 20,
> > +	.hsync_end =3D 320 + 20 + 30,
> > +	.htotal =3D 320 + 20 + 30 + 38,
> > +	.vdisplay =3D 240,
> > +	.vsync_start =3D 240 + 4,
> > +	.vsync_end =3D 240 + 4 + 3,
> > +	.vtotal =3D 240 + 4 + 3 + 15,
> > +	.vrefresh =3D 60,
> > +};
> > +
> > +static const struct panel_desc lemaker_bl035 =3D {
> > +	.modes =3D &lemaker_bl035_mode,
> > +	.num_modes =3D 1,
> > +	.size =3D {
> > +		.width =3D 70,
> > +		.height =3D 52,
> > +	},
> > +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
> > +	.bus_flags =3D DRM_BUS_FLAG_DE_LOW,
> > +};
> > +
> >  static const struct drm_display_mode lg_lb070wv8_mode =3D {
> >  	.clock =3D 33246,
> >  	.hdisplay =3D 800,
> > @@ -2456,6 +2480,9 @@ static const struct of_device_id platform_of_matc=
h[] =3D {
> >  	}, {
> >  		.compatible =3D "kyo,tcg121xglp",
> >  		.data =3D &kyo_tcg121xglp,
> > +	}, {
> > +		.compatible =3D "lemaker,bl035",
> > +		.data =3D &lemaker_bl035,
>=20
> You should document that new compatible. Also, where is this name
> coming from? Is it the name it's sold under? something you came up
> with?

Oh right, I forgot to document the compatible (and add the new vendor).

The name "BL035" comes from the PCB itself, where it reads "BL035-RGB-
002" under the Lemaker logo. I went for "BL035" to keep it short.

The latter part seems to be the PCB revision. According to the fex
files[0], the timings are the same for all the screens of the same size
(regardless of revision), so that revision probably shouldn't be in the
panel name.

As for the "RGB" part, Lemaker only makes 3.5 and 5 inch LCDs with a
parallel RGB interface and 7 and 10.1 inch LCDs with LVDS, so there is
no ambiguity for now.

Do you think it makes sense to keep that part in the panel name
nevertheless?

[0]: https://github.com/LeMaker/fex_configuration

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

--=-0SJEQcI45ApnAHSZseZc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlvO8xEACgkQhP3B6o/u
lQzpMg/+ML7N+BzGh9M6OgP5btTNUVRScOB+abDsXfuTteTeDD5m433Uc7XH+ExC
PFyqUUrP09BLaunv66N4aGjV8Ltuot0IeWNMUbzlwa1PKtBykPJpNv56W9//0bIX
bynbil2cjzvKXKNT02avdI3ywTSNfYHKmPbmjidmvUlgy6BkyoZoPx4fjS12pkui
OkCq6C/Qd+5zrMVIur03EFLJWeFBxzttd3NXTWjflIVXXNc9THPfp8WGAwKnUX9x
Qg9C6FVtXItrqnlpke2ak8ItWqS2qeXy5/stP/zyF20RiIXW9Dp/D4Dpk6Im3Cz8
bNX5Ky/ztZzTxOcyOUxOaWe3+im832aVWIKo+1AM7bQViyVvr2tixylVghvrTU8p
ms7mkzIIkXDzhowRYVq5bPcpj0wT3HZFU7AnUD1juE6X8TeN3p2H/bYJzam7alzN
8jGu9cL5TiKvaEzTRDJhipTldeJjG/R/CDfJD3WMZKVblBQ4fWpgZYYI2AmB+MPS
Fx9xu7xujaWtWZSMNV95qGn6EbVs1IHJQq+MeyJbm9gi9z1BD+flkUE669KKjUB2
b+mhYmpfSsZuW7eOLLvi8+KteNTxYTOTQ3Eh/QbeBCLfO3LKCxi7UEw16U3xXPSu
E7A3ZAFHxCR36krvF9seuJdvmuWUM8YpQyWnYo824ZcTwpKiaO4=
=7gG0
-----END PGP SIGNATURE-----

--=-0SJEQcI45ApnAHSZseZc--
