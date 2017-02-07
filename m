From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for sitronix ST7789V panel
Date: Tue, 7 Feb 2017 16:53:34 +0100
Message-ID: <20170207155334.fq4emlhpj4hkhets@lukather>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <8194211279dd2d1b1c2e88a3c17d154c356bbbc7.1486115846.git-series.maxime.ripard@free-electrons.com>
 <20170206132620.GB28955@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sma3bexhp6tcdfe"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170206132620.GB28955-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6sma3bexhp6tcdfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 02:26:20PM +0100, Thierry Reding wrote:
> > +#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> > +#define st7789v_send(ctx, cmd, ...)					\
> > +	st7789v_write_command_data(ctx, cmd, NUMARGS(__VA_ARGS__),	\
> > +				   ##__VA_ARGS__)
>=20
> How is this going to work if any of the arguments happens to not be an
> int? What if you have something like this:
>=20
> 	u8 value =3D 0x2;
>=20
> 	st7789v_write_command_data(ctx, cmd, 0x1, value, 0x3);
>=20
> ? Wouldn't that invalidly read "value" as int and wrongly increment the
> ap by three bytes too many?


Hmmm, it might be. I'll remove it, and take all your other changes
into account.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6sma3bexhp6tcdfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYme16AAoJEBx+YmzsjxAgl4YP/2TjxC/HqAkOlLVPk/p51MWW
AVQ6BnqbR25bykf04hJT4nnwuFRAKnhCJXSjm2ZHEzNFtJ1lYVNEMneFkAEdOWem
4ApZJxirKt5vw3KNhnln/Tu7xYS0TTP91sXwSa83FpTWbfXIdZS0ArSP3vj8WuJs
dUPWKG3UVtiXV+6wDzRFLRds6H79dNJK6q065oE6fthC0sbnmNocPSVVjh1FP6Zi
UDDawTirVN9OMPUfbeMGzCBtwrqIBW3myf9PPzLPzbyBqirjjeLOC77YAIEkGxcD
S2NJTXnrgY/hPT0Z0tUIwkz9NglWoE+PT3OUXCC7rWBQvTwZu+iM//xafDIgGouO
ezGjm7WVwDey2rgL6Cti6+PvaRGcDUz8+nTf7p5m2NCH31xI+Y1nZakC3Dr/A4aj
oC8RZgYvhUzsUmE1ltsgR2PSfl0d3J/afezf4C5k6F+VrUtEGb08pR1wc7Qw/fvs
anGArdLkNKr9T99/5sBl13DpbbgOu18yNMXjDvbjJ/JbyHo5f4Wn3v+suX34hO5w
RxShnBVZ82341baCwJ2l4eGMg6sw0Ev0+mJVOXUkMhRqYAxpyM9pzBHVIt/vvFZg
Zn3Dtejz9sIen3W+otMGGYuPQrMpAayndlSeer4a59+CWbbrQ40wq88Zudr/OopX
qXrjwgPC8wEGIBqQ87dp
=94rl
-----END PGP SIGNATURE-----

--6sma3bexhp6tcdfe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
